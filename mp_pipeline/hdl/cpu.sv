module cpu
import rv32i_types::*;
(
    input   logic           clk,
    input   logic           rst,

    output  logic   [31:0]  imem_addr,
    output  logic   [3:0]   imem_rmask,
    input   logic   [31:0]  imem_rdata,
    input   logic           imem_resp,

    output  logic   [31:0]  dmem_addr,
    output  logic   [3:0]   dmem_rmask,
    output  logic   [3:0]   dmem_wmask,
    input   logic   [31:0]  dmem_rdata,
    output  logic   [31:0]  dmem_wdata,
    input   logic           dmem_resp
);
// logic   [31:0]   final_rs1_v, final_rs2_v;
logic           freeze;
logic           rs1_stall, rs2_stall;
logic           stall;

logic   [31:0]  mem_rdata;
logic   [31:0]  br_addr;
logic           br_en;
logic           commit;
logic   [63:0]  order;

// logic   [31:0]  dmem_rdata_reg;
// logic           dmem_resp_reg;

logic   [31:0]  imem_rdata_reg;
logic           imem_resp_reg;

logic           wb_regf_we;
logic   [4:0]   wb_rd_s;
logic   [31:0]  wb_rd_v;

if_id_stage_reg_t if_id_reg, if_id_reg_next;
id_ex_stage_reg_t id_ex_reg, id_ex_reg_next, delay_id_ex_reg;
ex_mem_stage_reg_t ex_mem_reg, ex_mem_reg_next;
mem_wb_stage_reg_t mem_wb_reg, mem_wb_reg_next, delay_mem_wb_reg;


logic   freeze_delay, freeze_delay2;
always_ff @( posedge clk ) begin 
    freeze_delay    <= freeze;
    freeze_delay2   <= freeze_delay;
end


always_ff @( posedge clk ) begin 
    if (rst) begin
        if_id_reg.valid <= '1;
        // if_id_reg.valid <= '0;
        if_id_reg.pc <= 32'h60000000;
        // if_id_reg <= '0;
        id_ex_reg <= '0;
        ex_mem_reg <= '0;
        mem_wb_reg <= '0;
    end 
    else if (freeze) begin
        if_id_reg <= if_id_reg;
        id_ex_reg <= id_ex_reg;
        ex_mem_reg <= ex_mem_reg;
        mem_wb_reg <= mem_wb_reg;
    end
    else if (br_en) begin
        if_id_reg  <=  '0;
        id_ex_reg  <=  '0;
        ex_mem_reg <=  '0; 
        mem_wb_reg <= mem_wb_reg_next;
    end
    else if (stall) begin
        if_id_reg <= if_id_reg_next;
        id_ex_reg <= '0;
        ex_mem_reg <= ex_mem_reg_next;
        mem_wb_reg <= mem_wb_reg_next;
    end
    // else if (freeze) begin
    //     if_id_reg <= if_id_reg;
    //     id_ex_reg <= id_ex_reg;
    //     ex_mem_reg <= ex_mem_reg;
    //     mem_wb_reg <= mem_wb_reg;
    // end
    else begin
        if_id_reg <= if_id_reg_next;
        id_ex_reg <= id_ex_reg_next;
        ex_mem_reg <= ex_mem_reg_next;
        mem_wb_reg <= mem_wb_reg_next;
    end
end




// fetch fetch(                                                   //first
//     .imem_addr(imem_addr),
//     .imem_rmask(imem_rmask),
//     .if_id_reg_next(if_id_reg_next),
//     .*
// );
fetch1 fetch(                                                     //changed version
    // .if_id_imem_addr(if_id_reg.pc),
    .imem_resp(imem_resp),
    .br_en(br_en),
    .br(br_addr),
    .imem_addr(imem_addr),  
    .imem_rmask(imem_rmask),
    .if_id_reg_next(if_id_reg_next),
    .freeze(freeze),
    .*
);

// im reg
// always_ff @( posedge clk ) begin 
//     imem_rdata_reg <= imem_rdata;
//     imem_resp_reg  <= imem_resp;
// end

// decode decode(
//     .load_ir(imem_resp_reg),
//     .in(imem_rdata_reg),
//     .wb_regf_we(wb_regf_we),
//     .wb_rd_s(wb_rd_s),
//     .wb_rd_v(wb_rd_v),
//     .if_id_reg(if_id_reg),
//     .id_ex_reg_next(id_ex_reg_next),
//     .*
// );
decode1 decode(
    .load_ir(imem_resp),
    .in(imem_rdata),
    .wb_regf_we(wb_regf_we),
    .wb_rd_s(wb_rd_s),
    .wb_rd_v(wb_rd_v),
    .if_id_reg(if_id_reg),
    .id_ex_reg_next(id_ex_reg_next),
    .br_en(br_en),
    .*
);

exec execute(
    .wb_rd_v(wb_rd_v),
    .mem_wb_reg(mem_wb_reg),
    .ex_mem_reg(ex_mem_reg),
    .id_ex_reg(id_ex_reg),
    .ex_mem_reg_next(ex_mem_reg_next),
    .mem_br_en(br_en),
    .*
);

memory mem(
    .ex_mem_reg(ex_mem_reg),
    .wb_rd_v(wb_rd_v),
    .d_mem_addr(dmem_addr),
    .d_w_data(dmem_wdata),
    .d_mem_wmask(dmem_wmask),
    .d_mem_rmask(dmem_rmask),
    .br_addr(br_addr),
    .br_en(br_en),
    .mem_wb_reg_next(mem_wb_reg_next),
    .*
);

// always_ff @( posedge clk ) begin 
//     dmem_rdata_reg <= dmem_rdata;
//     dmem_resp_reg  <= dmem_resp;
// end

wb write_back(
    .dmem_rdata(dmem_rdata),
    .dmem_resp(dmem_resp),
    .mem_wb_reg(mem_wb_reg),
    .rd_v(wb_rd_v),
    .commit(commit),
    .order(order),
    .rd_s(wb_rd_s),
    .regf_we(wb_regf_we),
    .mem_rdata(mem_rdata),
    .*
);

 // stall instantiate
stall stall1(
    .de_inst(id_ex_reg_next.inst),
    .ex_opcode(ex_mem_reg_next.opcode),
    .de_opcode(id_ex_reg_next.opcode),
    .ex_rds(ex_mem_reg_next.rd_s),
    .de_rs1_s(id_ex_reg_next.rs1_s),
    .de_rs2_s(id_ex_reg_next.rs2_s),
    .ex_valid(ex_mem_reg_next.valid),
    .ex_inst(ex_mem_reg_next.inst),
    // .de_inst(id_ex_reg_next.inst),
    .stall(stall),
    .rs1_stall(rs1_stall),
    .rs2_stall(rs2_stall),
    .*
);


logic dmem_resp_delay;
always_ff @( posedge clk ) begin 
    delay_mem_wb_reg <= mem_wb_reg;
    delay_id_ex_reg  <= id_ex_reg;
    dmem_resp_delay <= dmem_resp;
end

mem_stall memstall(
    .wb_valid(mem_wb_reg.valid),
    .wb_inst(mem_wb_reg.inst),
    .wb_opcode(mem_wb_reg.opcode),
    .dmem_resp(dmem_resp),
    .de_valid(id_ex_reg.valid),
    .imem_resp(imem_resp),
    .freeze(freeze),
    .*
);



endmodule : cpu
