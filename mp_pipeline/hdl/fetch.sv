module fetch
import rv32i_types::*;
(   
    input   logic           clk,
    input                   rst,           
    output  logic   [31:0]  imem_addr,
    output  logic   [3:0]   imem_rmask,


    output if_id_stage_reg_t if_id_reg_next
    
);                   
    
    logic   [31:0]  add_out;
    logic   [31:0]  pc;
    logic           valid;



    assign imem_rmask = 4'b1111; 
    
    always_ff @( posedge clk ) begin
        if (rst) begin
            pc <= 32'h60000000;
            valid <= '0;

        end
        else begin

            pc <= add_out;
            valid <= '1;

        end  
    end
    

    always_comb begin
        if (rst) begin
            imem_addr = '0;
            add_out = 32'h60000000;
        end
        else begin
            imem_addr = pc;
            add_out = pc + 32'd4;
        end
    end
    

    
    always_comb begin 
        if_id_reg_next.pc = pc-4;
        // if_id_reg_next.pc_next = add_out;           //for cp2 it will be muxout
        if_id_reg_next.valid = valid;
    end
    


endmodule : fetch