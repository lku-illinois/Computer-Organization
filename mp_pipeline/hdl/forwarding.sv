module forward
import rv32i_types::*;
(
    input    logic   [4:0]   cur_rs1_s,
    input    logic   [4:0]   cur_rs2_s,
    input    logic   [4:0]   ex_mem_rd_s,
    input    logic   [4:0]   mem_wb_rd_s,
    input    logic   [31:0]  ex_mem_alu_result,
    input    logic   [31:0]  mem_wb_mux_out,                //rd_v
    input    logic   [6:0]   opcode,                        //from id_ex
    input    logic           ex_mem_regf_we,  
    input    logic           mem_wb_regf_we,   
    input    logic   [31:0]  ex_mem_inst,
    input    logic   [31:0]  mem_wb_inst,
    input    logic   [31:0]  cur_inst,
    
    input    logic           ex_mem_valid,
    input    logic           mem_wb_valid,

    // input    logic    [2:0]  cur_funct3,

    output    logic   [31:0]  forwardA,
    output    logic   [31:0]  forwardB,
    output    logic           forwardA_sel,
    output    logic           forwardB_sel,

    output    logic   [31:0]  forw_rs1,
    output    logic   [31:0]  forw_rs2,
    output    logic           forw_rs1_sel,
    output    logic           forw_rs2_sel
);
    logic reg1, reg2;

    //check if rs1 and rs2 have a possibility of conflict
    always_comb begin 
        if (ex_mem_regf_we || mem_wb_regf_we) begin        //need to determine if the previous two inst will write memory
            if ((ex_mem_inst != 32'h13) || (mem_wb_inst != 32'h13)) begin             //previous two inst are not nop
                unique case (opcode)
                    op_b_lui   :  begin                         //only imm
                        reg1 = '0;
                        reg2 = '0;
                    end
                    op_b_auipc :  begin                         //only imm
                        reg1 = '0;
                        reg2 = '0;
                    end 
                    op_b_jal   :  begin                         //only imm
                        reg1 = '0;
                        reg2 = '0;
                    end
                    op_b_jalr  :  begin                         //rd <= rs1 + imm
                        reg1 = '1;
                        reg2 = '0;
                    end 
                    op_b_br    :  begin                         //br_en  =  rs2 cmp rs1
                        reg1 = '1;
                        reg2 = '1;
                    end                               
                    op_b_load  :  begin                         //mem_addr = rs1 + imm
                        reg1 = '1;
                        reg2 = '0;
                    end
                    op_b_store :  begin                         //mem_addr = rs1 + imm       (need new rs1)   
                        reg1 = '1;                              //d_mem[mem_addr] <= rs2     (need new rs2)
                        reg2 = '1;
                    end
                    op_b_imm   :  begin                         //rd <= rs1 + imm                   
                        reg1 = '1;
                        reg2 = '0;
                    end
                    op_b_reg     :  begin                         //rd <= rs1 + rs2                  
                        reg1 = '1;
                        reg2 = '1;
                    end 
                    default     : begin
                        reg1 = '0;
                        reg2 = '0;
                    end       
                endcase
            end
            else begin
                reg1 = '0;
                reg2 = '0;
            end
        end
        else begin
            reg1 = '0;
            reg2 = '0;
        end
    end


    logic   rs1_flag1, rs1_flag2;
    logic   rs2_flag1, rs2_flag2;

    always_comb begin 
        if(reg1) begin              //if rs1 might conflict
            if((cur_inst != 32'h13)&& (cur_rs1_s != 5'b00000)) begin
                if ((cur_rs1_s == ex_mem_rd_s) && ex_mem_valid && ex_mem_regf_we) begin             //check ex_mem reg 1st
                    forwardA = ex_mem_alu_result;
                    forwardA_sel = 1'b1;
                    rs1_flag1 = 1'b1;
                end
                else if ((cur_rs1_s == mem_wb_rd_s) && mem_wb_valid && mem_wb_regf_we) begin        //check mem_wb reg 2nd
                    forwardA = mem_wb_mux_out;
                    forwardA_sel = 1'b1;
                    rs1_flag2 = 1'b1;
                end
                else begin
                    forwardA = '0;
                    forwardA_sel = 1'b0;
                    rs1_flag1 = 1'b0;
                    rs1_flag2 = 1'b0;
                end
            end
            else begin
                forwardA = '0;
                forwardA_sel = 1'b0;
                rs1_flag1 = 1'b0;
                rs1_flag2 = 1'b0;
            end
        end
        else begin
            forwardA = '0;
            forwardA_sel = 1'b0;
            rs1_flag1 = 1'b0;
            rs1_flag2 = 1'b0;
        end
    end
    
    always_comb begin 
        if (reg2) begin
            if((cur_inst != 32'h13)&& (cur_rs2_s != 5'b00000)) begin
                if ((cur_rs2_s == ex_mem_rd_s) && ex_mem_valid && ex_mem_regf_we) begin
                    forwardB = ex_mem_alu_result;
                    forwardB_sel = 1'b1;
                    rs2_flag1 = 1'b1;
                end
                else if ((cur_rs2_s == mem_wb_rd_s) && mem_wb_valid && mem_wb_regf_we) begin
                    forwardB = mem_wb_mux_out;
                    forwardB_sel = 1'b1;
                    rs2_flag2 = 1'b1;
                end
                else begin
                    forwardB = '0;
                    forwardB_sel = 1'b0;
                    rs2_flag1 = 1'b0;
                    rs2_flag2 = 1'b0;
                end
            end
            else begin
                forwardB = '0;
                forwardB_sel = 1'b0;
                rs2_flag1 = 1'b0;
                rs2_flag2 = 1'b0;
            end
        end
        else begin
            forwardB = '0;
            forwardB_sel = 1'b0;
            rs2_flag1 = 1'b0;
            rs2_flag2 = 1'b0;
        end
    end

    
    logic forw_rs1_flag1, forw_rs1_flag2;
    logic forw_rs2_flag1, forw_rs2_flag2;
    always_comb begin 
                     //if rs1 might conflict   
        if (ex_mem_regf_we || mem_wb_regf_we) begin          
            if((cur_inst != 32'h13) && (cur_rs1_s != 5'b00000)) begin
                if ((cur_rs1_s == ex_mem_rd_s) && ex_mem_valid && ex_mem_regf_we) begin             //check ex_mem reg 1st
                    forw_rs1 = ex_mem_alu_result;
                    forw_rs1_sel = 1'b1;
                    forw_rs1_flag1 = 1'b1;
                    forw_rs1_flag2 = 1'b0;
                end
                else if ((cur_rs1_s == mem_wb_rd_s) && mem_wb_valid && mem_wb_regf_we) begin        //check mem_wb reg 2nd
                    forw_rs1 = mem_wb_mux_out;
                    forw_rs1_sel = 1'b1;
                    forw_rs1_flag1 = 1'b0;
                    forw_rs1_flag2 = 1'b1;
                end
                else begin
                    forw_rs1 = '0;
                    forw_rs1_sel = 1'b0;
                    forw_rs1_flag1 = 1'b0;
                    forw_rs1_flag2 = 1'b0;
                end
            end
            else begin
                forw_rs1 = '0;
                forw_rs1_sel = 1'b0;
                forw_rs1_flag1 = 1'b0;
                forw_rs1_flag2 = 1'b0;
            end 
        end
        else begin
            forw_rs1 = '0;
            forw_rs1_sel = 1'b0;
            forw_rs1_flag1 = 1'b0;
            forw_rs1_flag2 = 1'b0;
        end
    end

    always_comb begin 
        // if (!((opcode == op_b_imm)  &&  (cur_funct3 inside {sll, sr}))) begin
            if (ex_mem_regf_we || mem_wb_regf_we) begin    
                if((cur_inst != 32'h13)&& (cur_rs2_s != 5'b00000)) begin
                    if ((cur_rs2_s == ex_mem_rd_s) && ex_mem_valid && ex_mem_regf_we) begin             //check ex_mem reg 1st
                        forw_rs2 = ex_mem_alu_result;
                        forw_rs2_sel = 1'b1;
                        forw_rs2_flag1 = 1'b1;
                        forw_rs2_flag2 = 1'b0;
                    end
                    else if ((cur_rs2_s == mem_wb_rd_s) && mem_wb_valid && mem_wb_regf_we) begin        //check mem_wb reg 2nd
                        forw_rs2 = mem_wb_mux_out;
                        forw_rs2_sel = 1'b1;
                        forw_rs2_flag1 = 1'b0;
                        forw_rs2_flag2 = 1'b1;
                    end
                    else begin
                        forw_rs2 = '0;
                        forw_rs2_sel = 1'b0;
                        forw_rs2_flag1 = 1'b0;
                        forw_rs2_flag2 = 1'b0;
                    end
                end
                else begin
                    forw_rs2 = '0;
                    forw_rs2_sel = 1'b0;
                    forw_rs2_flag1 = 1'b0;
                    forw_rs2_flag2 = 1'b0;
                end 
            end
            else begin
            forw_rs2 = '0;
                forw_rs2_sel = 1'b0;
                forw_rs2_flag1 = 1'b0;
                forw_rs2_flag2 = 1'b0; 
            end
        // end
    end
endmodule :   forward

