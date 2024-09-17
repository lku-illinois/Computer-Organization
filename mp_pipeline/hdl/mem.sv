module memory
import rv32i_types::*;
(
    input    ex_mem_stage_reg_t ex_mem_reg,
    input    [31:0]     wb_rd_v,
    input    mem_wb_stage_reg_t mem_wb_reg,
    input    logic          freeze,

    output   logic   [31:0]  d_mem_addr,       
    output   logic   [31:0]  d_w_data,         
    output   logic   [3:0]   d_mem_wmask,      
    output   logic   [3:0]   d_mem_rmask,

    output   logic   [31:0] br_addr,
    output   logic          br_en,
    
    output   mem_wb_stage_reg_t mem_wb_reg_next
);
logic [1:0]flag;
logic    flag2, flag3, flag4;

always_comb begin 
    mem_wb_reg_next.rs2_v = ex_mem_reg.rs2_v;
    flag2 = '0;
    flag3 = '0;
    flag4 = '0;
    if(mem_wb_reg.opcode == op_load) begin
        flag2 = '1;
        if((ex_mem_reg.opcode == op_imm) & (ex_mem_reg.funct3 inside {sll, sr})) begin
            flag3 = '1;
            if(ex_mem_reg.rs2_s == mem_wb_reg.rd_s) begin
                flag4 = '1;
                mem_wb_reg_next.rs2_v = wb_rd_v;
            end
        end
    end 
end


    always_comb begin    
        unique case(freeze)  
            1'b0    :   begin
                d_mem_addr  =   {ex_mem_reg.mem_addr[31:2], 2'b00};
                d_w_data    =   ex_mem_reg.mem_wdata;
            end
            1'b1    :   begin
                d_mem_addr  =   mem_wb_reg.d_mem_addr;
                d_w_data    =   mem_wb_reg.mem_wdata;
            end
            default :   begin
                d_mem_addr  =   {ex_mem_reg.mem_addr[31:2], 2'b00};
                d_w_data    =   ex_mem_reg.mem_wdata;
            end

        endcase
    end

        logic   [3:0]   mem_wmask;
        logic   [3:0]   mem_rmask;

        always_comb begin
            mem_wmask = '0;
            mem_rmask = '0;

            unique case (ex_mem_reg.opcode)
                op_b_load   :  begin                //mp verif also set rd_v

                    unique case (ex_mem_reg.funct3)
                        lb, lbu: begin
                            mem_rmask = 4'b0001 << ex_mem_reg.mem_addr[1:0];
                            mem_wmask = '0;
                        end
                        lh, lhu: begin
                            mem_rmask = 4'b0011 << ex_mem_reg.mem_addr[1:0];
                            mem_wmask = '0;
                        end
                        lw:      begin
                            mem_rmask = 4'b1111;
                            mem_wmask = '0;
                        end
                        default: begin
                            mem_rmask = '0;
                            mem_wmask = '0;
                        end
                    endcase
                end

                op_b_store  :  begin
                    

                    unique case (ex_mem_reg.funct3)
                        sb:     begin
                            mem_wmask = 4'b0001 << ex_mem_reg.mem_addr[1:0];
                            mem_rmask = '0;
                        end
                        sh:     begin
                            mem_wmask = 4'b0011 << ex_mem_reg.mem_addr[1:0];
                            mem_rmask = '0;
                        end
                        sw:     begin
                            mem_wmask = 4'b1111 << ex_mem_reg.mem_addr[1:0];
                            mem_rmask = '0;
                        end
                        default: begin
                            mem_wmask = '0;
                            mem_rmask = '0;
                        end
                    endcase
                end

                default: begin
                        mem_wmask = '0;
                        mem_rmask = '0;
                end
            endcase
        end




always_comb begin
       
    unique case(freeze)  
        1'b0    :   begin
            d_mem_wmask =   mem_wmask;
            d_mem_rmask =   mem_rmask;

            mem_wb_reg_next.mem_wmask = mem_wmask;
            mem_wb_reg_next.mem_rmask = mem_rmask;    
        end
        1'b1    :   begin
            d_mem_wmask =   mem_wb_reg.mem_wmask;
            d_mem_rmask =   mem_wb_reg.mem_rmask;

            mem_wb_reg_next.mem_wmask = mem_wb_reg.mem_wmask;
            mem_wb_reg_next.mem_rmask = mem_wb_reg.mem_rmask;
        end
        default :   begin
            d_mem_wmask =   mem_wmask;
            d_mem_rmask =   mem_rmask;

            mem_wb_reg_next.mem_wmask = mem_wmask;
            mem_wb_reg_next.mem_rmask = mem_rmask;  
        end

    endcase
    

    // d_mem_wmask =   mem_wmask;
    // d_mem_rmask =   mem_rmask;

    // mem_wb_reg_next.mem_wmask = mem_wmask;
    // mem_wb_reg_next.mem_rmask = mem_rmask;


    mem_wb_reg_next.br_en = ex_mem_reg.br_en_out;


    br_addr = ex_mem_reg.br_addr;
    // br_en = ex_mem_reg.br_en_out;
    br_en = mem_wb_reg_next.br_en;

    mem_wb_reg_next.pc = ex_mem_reg.pc;

    unique case (br_en)
        1'b0    :   mem_wb_reg_next.pc_next = ex_mem_reg.pc_next;
        1'b1    :   mem_wb_reg_next.pc_next = br_addr;
        default :   mem_wb_reg_next.pc_next = ex_mem_reg.pc_next;
    endcase
    // mem_wb_reg_next.pc_next = ex_mem_reg.pc_next;
    mem_wb_reg_next.valid = ex_mem_reg.valid;
    mem_wb_reg_next.inst = ex_mem_reg.inst;

    
    unique case (ex_mem_reg.opcode inside {op_b_br})
        1'b0    :   begin
            mem_wb_reg_next.rd_s = ex_mem_reg.rd_s;
            mem_wb_reg_next.alu_result = ex_mem_reg.alu_result;
            flag = '0;
        end

        1'b1    :   begin
            mem_wb_reg_next.rd_s = '0;
            mem_wb_reg_next.alu_result = '0;
            flag = '1;
        end

        default :   begin
            mem_wb_reg_next.rd_s = ex_mem_reg.rd_s;
            mem_wb_reg_next.alu_result = ex_mem_reg.alu_result;
            flag = 2'b01;

        end
    endcase

    if (ex_mem_reg.opcode != op_b_br) begin
        unique case (ex_mem_reg.opcode inside {op_b_store})
            1'b0    :   begin
                mem_wb_reg_next.rd_s = ex_mem_reg.rd_s;
                
            end

            1'b1    :   begin
                mem_wb_reg_next.rd_s = '0;
            
            end

            default :   begin
                mem_wb_reg_next.rd_s = ex_mem_reg.rd_s;
                
            end
        endcase
    end

    
    // mem_wb_reg_next.rd_s = ex_mem_reg.rd_s;
    // mem_wb_reg_next.alu_result = ex_mem_reg.alu_result;
    mem_wb_reg_next.rs1_s = ex_mem_reg.rs1_s;
    mem_wb_reg_next.rs2_s = ex_mem_reg.rs2_s;
    mem_wb_reg_next.rs1_v = ex_mem_reg.rs1_v;
    // mem_wb_reg_next.rs2_v = ex_mem_reg.rs2_v;


    // mem_wb_reg_next.mem_wmask = ex_mem_reg.mem_wmask;
    // mem_wb_reg_next.mem_rmask = ex_mem_reg.mem_rmask;



    // mem_wb_reg_next.MemtoReg = ex_mem_reg.MemtoReg;
    mem_wb_reg_next.regf_we = ex_mem_reg.regf_we;
    mem_wb_reg_next.opcode = ex_mem_reg.opcode;
    // mem_wb_reg_next.mem_wdata = d_w_data;
    mem_wb_reg_next.funct3 = ex_mem_reg.funct3;

    mem_wb_reg_next.mem_wdata = d_w_data;
    mem_wb_reg_next.d_mem_addr = d_mem_addr;


    mem_wb_reg_next.unconst_addr = ex_mem_reg.mem_addr;
end

endmodule   :   memory