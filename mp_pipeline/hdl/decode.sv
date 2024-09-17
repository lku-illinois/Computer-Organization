module decode
import rv32i_types::*;
(
    // still need control signal, aluop is opcode, alusrc no clue
    input   logic           clk,
    input   logic           rst,
    
    // from i_mem
    input   logic           load_ir,                            //this is imem_resp
    input   logic   [31:0]  in,                                 //instruction 
    
    // from write back stage
    input   logic           wb_regf_we,                            //write signal
    input   logic   [4:0]   wb_rd_s,
    input   logic   [31:0]  wb_rd_v,
    
    // from if_id reg
    // input   logic   [31:0]  if_id_reg.pc,                           //pass on pc from reg to exec
    // input   logic           if_id_reg.valid,
    input if_id_stage_reg_t if_id_reg,

    output id_ex_stage_reg_t id_ex_reg_next
);
    logic           regf_we;
    logic   [2:0]   funct3;                        
    
    logic   [31:0]  imm;
    logic   [4:0]   rd_s;
    logic   [31:0]  rs1_v, rs2_v;
    logic   [2:0]   aluop;
    logic           alusrc;
    logic   [1:0]   a_src;
    logic   [2:0]   cmpop;              //choose which comparison op
    logic           f_src;              //choose comparison or alu
    logic   [3:0]   mem_wmask;      
    logic   [3:0]   mem_rmask;
    logic           MemtoReg;
    logic   [4:0]   rs1_s;
    logic   [4:0]   rs2_s;
    
    logic   [6:0]   funct7;
    logic   [6:0]   opcode;

    logic   [31:0]  i_imm;
    logic   [31:0]  s_imm;
    logic   [31:0]  b_imm;
    logic   [31:0]  u_imm;
    logic   [31:0]  j_imm;
    logic   [31:0]  mem_addr;


    //set regf_we, memtoreg, mem_wmask, mem_rmask
    always_comb begin 

        //default val
        cmpop = '0;
        f_src = 1'b1;
        mem_addr = 'x;
        mem_wmask = '0;
        mem_rmask = '0;

        unique case (opcode)
            op_b_lui    :   begin
                regf_we = 1'b1;
                // MemtoReg = 1'b0;
            end

            op_b_auipc  :   begin
                regf_we = 1'b1;
                // MemtoReg = 1'b0;
            end

            op_b_jal    :   begin
                regf_we = 1'b0;
                // MemtoReg = 'x;
            end

            op_b_jalr   :   begin             
                regf_we = 1'b1; 
                // MemtoReg = 1'b0;
            end

            op_b_br     :   begin           //set valid to zero with some condition  //set pcsrc
                regf_we = 1'b0;
                // MemtoReg = 'x;
            end

            op_b_load   :  begin                //mp verif also set rd_v
                regf_we = 1'b1;
                // MemtoReg = 1'b1;

                mem_addr = rs1_v + i_imm;

                unique case (funct3)
                    lb, lbu: mem_rmask = 4'b0001 << mem_addr[1:0];
                    lh, lhu: mem_rmask = 4'b0011 << mem_addr[1:0];
                    lw:      mem_rmask = 4'b1111;
                    default: mem_rmask = 'x;
                endcase
            end

            op_b_store  :  begin
                regf_we = 1'b0;
                // MemtoReg = 'x;

                mem_addr = rs1_v + s_imm;

                unique case (funct3)
                    sb: mem_wmask = 4'b0001 << mem_addr[1:0];
                    sh: mem_wmask = 4'b0011 << mem_addr[1:0];
                    // sw: mem_wmask = 4'b1111;
                    sw: mem_wmask = 4'b1111 << mem_addr[1:0];
                    default: mem_wmask = 'x;
                endcase
            end

            op_b_imm    :   begin

                regf_we = 1'b1;

                unique case (funct3)
                    slt: begin
                        cmpop = blt;
                        f_src = 1'b0;
                        
                    end
                    sltu: begin
                        cmpop = bltu;
                        f_src = 1'b0;
                        
                    end
                    default: begin
                        cmpop = 'x;
                        f_src = 1'b1;   
                    end
                endcase
                // unique case (funct3)
                //     slt: cmpop = blt;
                //     sltu: cmpop = bltu;
                //     default: cmpop = 'x;
                // endcase

                // MemtoReg = 1'b0;
            end

            op_b_reg    :  begin
                regf_we = 1'b1;

                unique case (funct3)
                    slt: begin
                        cmpop = blt;
                        f_src = 1'b0;
                    end
                    sltu: begin
                        cmpop = bltu;
                        f_src = 1'b0;
                    end
                    default: begin
                        cmpop = 'x;
                        f_src = 1'b1;   
                    end
                endcase
                // MemtoReg = 1'b0;
            end
            // op_b_csr    :   

            default     :   begin
                regf_we = 'x;
                // f_src = 1'b1; 
                // cmpop = 'x;
                // MemtoReg = 'x;
            end
        endcase
    end

    
    logic   [31:0]  data;

    // wait for imm_resp (done fetching), then start decocde
    always_comb begin
        if (load_ir) begin
            data = in;
        end 
        else begin
            data = 32'b0;
        end
    end


    // set each signal
    assign funct3 = data[14:12];
    assign funct7 = data[31:25];
    assign opcode = data[6:0];
    assign i_imm  = {{21{data[31]}}, data[30:20]};
    assign s_imm  = {{21{data[31]}}, data[30:25], data[11:7]};
    assign b_imm  = {{20{data[31]}}, data[7], data[30:25], data[11:8], 1'b0};
    assign u_imm  = {data[31:12], 12'h000};
    assign j_imm  = {{12{data[31]}}, data[19:12], data[20], data[30:21], 1'b0};
    assign rs1_s  = data[19:15];
    assign rs2_s  = data[24:20];
    assign rd_s   = data[11:7];


    
    //choose the correct imm to output
    always_comb begin 
        unique case (opcode)
            op_b_lui   :  imm = u_imm;
            op_b_auipc :  imm = u_imm;
            op_b_jal   :  imm = j_imm;
            op_b_jalr  :  imm = i_imm;
            op_b_br    :  imm = b_imm;
            op_b_load  :  imm = i_imm;
            op_b_store :  imm = s_imm;
            op_b_imm   :  imm = i_imm;
            // op_reg   :               //op_reg dont have imm value
            default:    imm = 'x;
        endcase
    end




    // generate aluop (choose which alu operation)
    always_comb begin                       //still need jal, jalr
        unique case (opcode)
            op_b_store, op_b_lui, op_b_auipc :  aluop = 3'b000;     //add
            op_b_load  :  aluop = 3'b000;               //add
            op_b_br    :  aluop = 3'b001;               //sub
            op_b_imm   :  begin
                unique case (funct3)
                    sr: begin
                            if (funct7[5]) begin
                                aluop = 3'b100;
                            end else begin
                                aluop = 3'b101;
                            end
                        end
                    default : aluop = 3'b010;
                endcase
            end
            op_b_reg    :   begin
                unique case (funct3)
                    add: begin
                        if (funct7[5]) begin
                            aluop = 3'b001;
                        end else begin
                            aluop = 3'b000;
                        end
                    end
                    sr: begin
                        if (funct7[5]) begin
                            aluop = 3'b100;
                        end else begin
                            aluop = 3'b101;
                        end
                    end

                    default: aluop = 3'b010;
                endcase
            end
            default  :  aluop = 3'b010;                //funct3
        endcase
    end


    // generate a_src (choose between rs1 or pc)
    // always_comb begin 
    //     if(opcode == op_b_auipc) begin
    //         a_src = 1'b1;
    //     end
    //     else begin
    //         a_src = 1'b0;
    //     end  
    // end
    always_comb begin
        unique case (opcode)
            op_b_auipc  : a_src = 2'b01;        //use pc
            op_b_lui    : a_src = 2'b10;        //use zero
            default     : a_src = 2'b00;        //use rs1_v
        endcase
    end

    // generate alusrc (choose rs2 or imm)
    always_comb begin
        if  (opcode inside {op_b_lui, op_b_auipc, op_b_jal, op_b_jalr, op_b_br, op_b_load, op_b_store}) begin
            alusrc = 1'b1;                                  //use imm
        end
        else if ((opcode == op_b_imm) && (funct3 inside {add, slt, sltu, axor, aor, aand, sr, sll})) begin
            alusrc = 1'b1;                                  //use imm
        end
        else begin
            alusrc = 1'b0;                                  //use rs2
        end
    end



    logic   [31:0]  reg_bank [32];

    // read reg_bank data (set rs1_v, rs2_v)
    // always_comb  begin                                                    //combinational 
    //     if (rst) begin
    //         rs1_v = 'x;
    //         rs2_v = 'x;
    //     end else begin
            // rs1_v = (rs1_s != 5'd0) ? reg_bank[rs1_s] : '0;
            // rs2_v = (rs2_s != 5'd0) ? reg_bank[rs2_s] : '0;
    //     end
    // end
    always_comb  begin                                                    //combinational 
        if (rst) begin
            rs1_v = 'x;
            rs2_v = 'x;
        end 
        else if (wb_regf_we)begin
            if (rs1_s == wb_rd_s) begin
                rs1_v = (rs1_s != 5'd0) ? wb_rd_v : '0;
                rs2_v = (rs2_s != 5'd0) ? reg_bank[rs2_s] : '0;
            end
            else begin
                rs1_v = (rs1_s != 5'd0) ? reg_bank[rs1_s] : '0;
                rs2_v = (rs2_s != 5'd0) ? reg_bank[rs2_s] : '0;
            end

            if(rs2_s == wb_rd_s) begin
                rs1_v = (rs1_s != 5'd0) ? reg_bank[rs1_s] : '0;
                rs2_v = (rs2_s != 5'd0) ?  wb_rd_v : '0;
            end
            else begin
                rs1_v = (rs1_s != 5'd0) ? reg_bank[rs1_s] : '0;
                rs2_v = (rs2_s != 5'd0) ? reg_bank[rs2_s] : '0;
            end
        end

        else begin
            rs1_v = (rs1_s != 5'd0) ? reg_bank[rs1_s] : '0;
            rs2_v = (rs2_s != 5'd0) ? reg_bank[rs2_s] : '0;
        end
    end



    // write reg_bank data
    always_ff @(posedge clk) begin
        if (rst) begin                                            //reset all registers
            for (int i = 0; i < 32; i++) begin
                reg_bank[i] <= '0;
            end
        end else if (wb_regf_we && (wb_rd_s != 5'd0)) begin          //using wb signals
            reg_bank[wb_rd_s] <= wb_rd_v;
        end
    end


    always_comb begin
        id_ex_reg_next.inst = in;
        id_ex_reg_next.funct3 = funct3;
        id_ex_reg_next.imm = imm;
        id_ex_reg_next.rd_s = rd_s;
        id_ex_reg_next.rs1_v = rs1_v;                       //this is fine
        id_ex_reg_next.rs2_v = rs2_v;                       //this is fine
        id_ex_reg_next.aluop = aluop;
        id_ex_reg_next.alusrc = alusrc;
        id_ex_reg_next.mem_wmask = mem_wmask;
        id_ex_reg_next.mem_rmask = mem_rmask;
        // id_ex_reg_next.MemtoReg = MemtoReg;
        id_ex_reg_next.rs1_s = rs1_s;
        id_ex_reg_next.rs2_s = rs2_s;
        id_ex_reg_next.regf_we = regf_we;
        id_ex_reg_next.valid = if_id_reg.valid;
        id_ex_reg_next.pc = if_id_reg.pc;
        // id_ex_reg_next.pc_next = if_id_reg.pc_next;
        id_ex_reg_next.a_src = a_src;
        id_ex_reg_next.cmpop = cmpop;
        id_ex_reg_next.f_src = f_src;
    end
endmodule   :   decode