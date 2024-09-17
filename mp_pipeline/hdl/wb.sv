module wb
import rv32i_types::*;
(
    input   logic           clk,
    input   logic           rst,

    input   logic   [31:0]  dmem_rdata,
    input   logic           dmem_resp,

    input   mem_wb_stage_reg_t mem_wb_reg,
    input   logic           freeze,

    output  logic   [31:0]  rd_v,
    output  logic           commit,
    output  logic   [63:0]  order,
    output  logic    [4:0]   rd_s,
    output  logic            regf_we,
    output  logic   [31:0]  mem_rdata
 );

logic   [31:0] rd_tmp;

assign rd_s = mem_wb_reg.rd_s;
assign regf_we = mem_wb_reg.regf_we;

always_comb begin
    mem_rdata = 'x;
    if(mem_wb_reg.opcode == op_b_load) begin
        unique case (mem_wb_reg.funct3)
            lb : mem_rdata = {{24{dmem_rdata[7 +8 *mem_wb_reg.unconst_addr[1:0]]}}, dmem_rdata[8 *mem_wb_reg.unconst_addr[1:0] +: 8 ]};
            lbu: mem_rdata = {{24{1'b0}}                                        , dmem_rdata[8 *mem_wb_reg.unconst_addr[1:0] +: 8 ]};
            lh : mem_rdata = {{16{dmem_rdata[15+16*mem_wb_reg.unconst_addr[1]  ]}}, dmem_rdata[16*mem_wb_reg.unconst_addr[1]   +: 16]};
            lhu: mem_rdata = {{16{1'b0}}                                        , dmem_rdata[16*mem_wb_reg.unconst_addr[1]   +: 16]};
            lw : mem_rdata = dmem_rdata;
            default : mem_rdata = 'x;
        endcase
    end
end



always_comb begin                                               //choose rdv based on dmemresp
    unique case (dmem_resp)
        1'b0:    rd_v = mem_wb_reg.alu_result;
        1'b1:    rd_v = mem_rdata;
        default  rd_v = '0;
    endcase
end

// always_comb begin
//     unique case (mem_wb_reg.mem_wmask[0])
//         1'b0    :   rd_v = rd_tmp;
//         1'b1    :   rd_v = '0;
//     endcase
// end

always_comb begin 
    if(mem_wb_reg.valid && !freeze) begin
        commit = 1'b1;
    end
    else begin
        commit = 1'b0;
    end  
end



always_ff @(posedge clk) begin 
    if(rst) begin
        order <= '0;
    end
    else if (commit ) begin
        order <= order + 'd1;
    end
    else begin
        order <= order;
    end
end
endmodule   :   wb