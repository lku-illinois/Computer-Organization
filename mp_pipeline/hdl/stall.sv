module stall
import rv32i_types::*;
(
    input   logic   [31:0]  de_inst,
    input   logic   [6:0]   ex_opcode,
    input   logic   [6:0]   de_opcode,
    input   logic   [4:0]   ex_rds,
    input   logic   [4:0]   de_rs1_s,
    input   logic   [4:0]   de_rs2_s,
    input   logic           ex_valid,

    input   logic   [31:0]  ex_inst,
    // input   logic   [31:0]  de_inst,

    output logic            stall,
    output logic            rs1_stall,
    output logic            rs2_stall
);
    logic reg1, reg2;

    logic   [31:0]  exec_inst, decode_inst;

    assign exec_inst = ex_inst;
    // assign decode_inst = de_inst;

    //check possible dependency
    always_comb begin 
        reg1 = '0;
        reg2 = '0;

        if (de_inst != 32'h13) begin                        //decode inst is not nop
            unique case (de_opcode)
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
                op_reg     :  begin                         //rd <= rs1 + rs2                  
                    reg1 = '1;
                    reg2 = '1;
                end 
                default     : begin
                    reg1 = '0;
                    reg2 = '0;
                end       
            endcase
        end
        // else begin
            // reg1 = '0;
            // reg2 = '0;
        // end 
    end

    logic flag1, flag2, flag3;

    //set stall signal
    always_comb begin 
        flag1 = '0;
        stall = '0;
        if((ex_opcode == op_b_load) && ex_valid) begin
            flag1 = 1'b1;
            if(reg1) begin
                if (de_rs1_s == ex_rds) begin
                    stall = 1'b1;
                end
            end
        end

        if((ex_opcode == op_b_load) && ex_valid) begin
            if(reg2) begin
                if (de_rs2_s == ex_rds) begin
                    stall = 1'b1;
                end
            end
        end
    end

    // always_comb begin 
    //     flag2 = '0;
    //     rs1_stall = '0;
    //     if(ex_opcode == op_b_load) begin
    //         flag2 = 1'b1;
            
    //         if (de_rs1_s == ex_rds) begin
    //             rs1_stall = 1'b1;                   //update rs1 val
    //         end
            
    //     end
    // end


    // always_comb begin 
    //     flag3 = '0;
    //     rs2_stall = '0;
    //     if(ex_opcode == op_b_load) begin
    //         flag3 = 1'b1;

    //         if (de_rs2_s == ex_rds) begin
    //             rs2_stall = 1'b1;                     //update rs2 val
    //         end
            
    //     end
    // end

    always_comb begin
        rs2_stall = '0;
        rs1_stall = '0;
    end

        
endmodule :   stall