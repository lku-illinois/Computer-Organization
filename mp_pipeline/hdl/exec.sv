module exec
import rv32i_types::*;
(   
    input logic   [31:0]     wb_rd_v,
    input mem_wb_stage_reg_t mem_wb_reg,
    input ex_mem_stage_reg_t ex_mem_reg,
    input id_ex_stage_reg_t id_ex_reg,
    input logic              mem_br_en,
    
    output ex_mem_stage_reg_t ex_mem_reg_next
    
);
 
    // logic   [31:0] mem_wdata;
    //  logic  [31:0] mem_add;    
    logic   [31:0]  mux_out, mux_out2;
    logic   [31:0]  a1, a2, b1, b2;
    logic           a_sel, b_sel;
    logic   [31:0]  forw_rs1, forw_rs2;
    logic           forw_rs1_sel, forw_rs2_sel;

    forward forward(
        .cur_rs1_s(id_ex_reg.rs1_s),
        .cur_rs2_s(id_ex_reg.rs2_s),
        .ex_mem_rd_s(ex_mem_reg.rd_s),
        .mem_wb_rd_s(mem_wb_reg.rd_s),
        .ex_mem_alu_result(ex_mem_reg.alu_result),
        .mem_wb_mux_out(wb_rd_v),
        .opcode(id_ex_reg.opcode),
        .ex_mem_regf_we(ex_mem_reg.regf_we),
        .mem_wb_regf_we(mem_wb_reg.regf_we),
        .ex_mem_inst(ex_mem_reg.inst),
        .mem_wb_inst(mem_wb_reg.inst),
        .cur_inst(id_ex_reg.inst),
        .ex_mem_valid(ex_mem_reg.valid),
        .mem_wb_valid(mem_wb_reg.valid),
        // .cur_funct3(id_ex_reg.funct3),
        .forwardA(a2),
        .forwardB(b2),
        .forwardA_sel(a_sel),
        .forwardB_sel(b_sel),
        .forw_rs1(forw_rs1),
        .forw_rs2(forw_rs2),
        .forw_rs1_sel(forw_rs1_sel),
        .forw_rs2_sel(forw_rs2_sel),
        .*
    );

    // mux1, choose rs2 or imm
    always_comb begin
        unique case (id_ex_reg.alusrc)
            1'b0:       b1 = id_ex_reg.rs2_v;
            1'b1:       b1 = id_ex_reg.imm;
            default:    b1 = id_ex_reg.rs2_v;
        endcase
    end
    //forarding for b
    always_comb begin
        unique case (b_sel)
            1'b0:       mux_out = b1;       //rs2 or imm
            1'b1:       mux_out = b2;       //forwarding
            default:    mux_out = b1;       
        endcase
    end

    //mux2 choose rs1 or pc or zero
    always_comb begin
        unique case (id_ex_reg.a_src)
            2'b00:       a1 = id_ex_reg.rs1_v;
            2'b10:       a1 = '0;
            2'b01:       a1 = id_ex_reg.pc;
            default:     a1 = id_ex_reg.rs1_v;
        endcase
    end
    //forwarding for a
    always_comb begin
        unique case (a_sel)
            1'b0:       mux_out2 = a1;       //rs1, pc or zero
            1'b1:       mux_out2 = a2;       //forwarding
            default:    mux_out2 = a1;       
        endcase
    end

    // choose if load store / branch / other (add,sub....)
    logic   [2:0]   alu;

    always_comb begin
        unique case (id_ex_reg.aluop)
            3'b000:  alu = alu_add;
            3'b001:  alu = alu_sub;
            3'b010:  alu = id_ex_reg.funct3;
            3'b100:  alu = alu_sra;
            3'b101:  alu = alu_srl;
            default: alu = 'x;
        endcase
    end



    //after selecting funct3, do the computation
    logic          [31:0] f, f2, f_out, f_tmp;                      //alu result
    logic          [31:0] a,b, aout, bout;
    logic signed   [31:0] as;
    logic signed   [31:0] bs;
    logic unsigned [31:0] au;
    logic unsigned [31:0] bu;

    assign a  = mux_out2;
    assign b  = mux_out;
    assign as =   signed'(a);
    assign bs =   signed'(b);
    assign au = unsigned'(a);
    assign bu = unsigned'(b);

    // alu
    always_comb begin
        unique case (alu)
            alu_add: f = au +   bu;
            alu_sll: f = au <<  bu[4:0];
            // alu_sra: f = unsigned'(as >>> bu[3:0]);
            alu_sra: f = unsigned' (as >>> bu[4:0]);
            alu_sub: f = au -   bu;
            alu_xor: f = au ^   bu;
            // alu_srl: f = au >>  bu[3:0];
            alu_srl: f = au >>  bu[4:0];
            alu_or:  f = au |   bu;
            alu_and: f = au &   bu;
            default: f = 'x;
        endcase
    end

    // comparison
    logic           br_en, br_en_out;


    always_comb begin
        unique case (id_ex_reg.cmpop)
            beq:  br_en = (au == bu);
            bne:  br_en = (au != bu);
            blt:  br_en = (as <  bs);
            bge:  br_en = (as >=  bs);
            bltu: br_en = (au <  bu);
            bgeu: br_en = (au >=  bu);
            default: br_en = 1'b0;
        endcase
    end

    always_comb  begin
        br_en_out = 1'b0;
        unique case (id_ex_reg.br_en_sel)
            2'b00    :   br_en_out = 1'b0;      
            2'b01    :   br_en_out = 1'b1;       //jal jalr inst
            2'b10   :   br_en_out = br_en;       //br inst
            default :   br_en_out = 1'b0;
        endcase
    end

    always_comb begin 
        unique case (id_ex_reg.funct3)
            slt  :  f2 = {31'd0, br_en};
            sltu :  f2 = {31'd0, br_en};
            default: f2 = 'x;
        endcase
    end


    //choose between alu or comp
    always_comb begin 
        unique case (id_ex_reg.f_src)
            1'b0: f_tmp = f2;                       //comparison
            1'b1: f_tmp = f;                        //alu
            default: f_tmp = '0;
        endcase
    end

    always_comb begin 
        unique case (id_ex_reg.br_en_sel)
            2'b01    :  f_out = id_ex_reg.pc + 32'd4;                
            default: f_out = f_tmp;
        endcase
    end



    //handle forwarding output rs1_v rs2_v
    always_comb begin 
        unique case (forw_rs1_sel)
            1'b0    :   aout = id_ex_reg.rs1_v;
            1'b1    :   aout = forw_rs1;
            default :   aout = id_ex_reg.rs1_v;
        endcase
    end

    always_comb begin 
        unique case (forw_rs2_sel)
            1'b0    :   bout = id_ex_reg.rs2_v;
            1'b1    :   bout = forw_rs2;
            default :   bout = id_ex_reg.rs2_v;
        endcase
    end



    //branch address
    logic          [31:0] br_a, br_b, br_addr, br_tmp;

    always_comb begin
        unique case (id_ex_reg.br_sel)
            1'b0    :   br_a = id_ex_reg.pc;          //br Jal
            1'b1    :   br_a = aout;                  //rs1_v accounting for forwarding (Jalr)
            default :   br_a = id_ex_reg.pc;
        endcase
    end

    assign br_b = id_ex_reg.br_imm;
    assign br_tmp = br_a + br_b;

    always_comb begin
        if(id_ex_reg.opcode == op_b_jalr) begin
            br_addr = {br_tmp[31:1], 1'b0};
        end
        else begin
            br_addr = br_tmp;
        end
    end


    logic   [31:0] mem_wdata;
    logic   [31:0]  mem_add;
    assign mem_add = aout + id_ex_reg.imm;

    always_comb begin
        mem_wdata = '0;
        if (id_ex_reg.opcode == op_b_store) begin
            unique case (id_ex_reg.funct3)
                    sb: mem_wdata[8 *mem_add[1:0] +: 8 ] = bout[7 :0];
                    sh: mem_wdata[16*mem_add[1]   +: 16] = bout[15:0];
                    sw: mem_wdata = bout;
                    default: mem_wdata = '0;
            endcase
        end
        else begin
            mem_wdata = '0;
        end
    end

    logic flag;

    always_comb begin
        ex_mem_reg_next.mem_addr = mem_add;
        ex_mem_reg_next.inst = id_ex_reg.inst;
        ex_mem_reg_next.alu_result = f_out;
        ex_mem_reg_next.pc = id_ex_reg.pc;
        ex_mem_reg_next.pc_next = id_ex_reg.pc + 32'd4;

        if (mem_br_en)begin
            flag = '0;
            ex_mem_reg_next.valid = '0;
        end
        else begin
            flag = '1;
            ex_mem_reg_next.valid = id_ex_reg.valid;
        end
        // ex_mem_reg_next.valid = id_ex_reg.valid;

        ex_mem_reg_next.rd_s = id_ex_reg.rd_s;

        // ex_mem_reg_next.rs1_v = id_ex_reg.rs1_v;
        // ex_mem_reg_next.rs2_v = id_ex_reg.rs2_v;
        ex_mem_reg_next.rs1_v = aout;
        ex_mem_reg_next.rs2_v = bout;


        ex_mem_reg_next.mem_wmask = id_ex_reg.mem_wmask;
        ex_mem_reg_next.mem_rmask = id_ex_reg.mem_rmask;
        // ex_mem_reg_next.mem_wmask = mem_wmask;
        // ex_mem_reg_next.mem_rmask = mem_rmask;


        // ex_mem_reg_next.MemtoReg = id_ex_reg.MemtoReg;
        ex_mem_reg_next.rs1_s = id_ex_reg.rs1_s;
        ex_mem_reg_next.rs2_s = id_ex_reg.rs2_s;
        ex_mem_reg_next.regf_we = id_ex_reg.regf_we;
        ex_mem_reg_next.opcode = id_ex_reg.opcode;
        ex_mem_reg_next.br_addr = br_addr;
        ex_mem_reg_next.br_en_out = br_en_out;
        ex_mem_reg_next.mem_wdata = mem_wdata[31:0];
        // ex_mem_reg_next.mem_wdata = bout;
        ex_mem_reg_next.funct3 = id_ex_reg.funct3;
    end

endmodule   :   exec