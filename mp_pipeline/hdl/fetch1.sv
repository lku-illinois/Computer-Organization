module fetch1
import rv32i_types::*;
(   
    input   logic           clk,
    // input                   rst, 

    // input   logic           br_en,
    // input   logic   [31:0]  br,
    // input   logic   [31:0]  if_id_imem_addr,         //from if_id reg
    input   logic           imem_resp,
    input  logic           br_en,
    input  logic   [31:0]  br,
    input   logic          stall,
    input   logic           freeze,


    //for memory
    output  logic   [31:0]  imem_addr,
    output  logic   [3:0]   imem_rmask,

    //if_id
    output if_id_stage_reg_t if_id_reg_next
    
);                   
    logic   [31:0]  pc_next;
    // logic   [31:0]  br_en;
    // logic   [31:0]  br;
    logic   [31:0]  pc;
    logic           valid;
    // assign br = '0;
    // assign br_en = '0;
    // assign pc_next = pc +32'd4;

    always_comb begin 
        unique case (br_en)
            1'b0    :   pc_next = pc +32'd4;
            1'b1    :   pc_next = br - 4;
            default :   pc_next = '0;
        endcase
    end

    always_ff @( posedge clk ) begin
        if (imem_resp || freeze) begin
            pc <= imem_addr;
        end
        else begin
            pc <= 32'h60000000;
        end
    end

    

    always_comb begin 
        unique case (imem_resp && !stall && !freeze)
            1'b0    :   imem_addr = pc;
            1'b1    :   imem_addr = pc_next;
            default :   imem_addr = '0;
        endcase
    end
    // always_comb begin 
    //     if (!freeze) begin
    //         unique case (imem_resp && !stall)
    //             1'b0    :   imem_addr = pc;
    //             1'b1    :   imem_addr = pc_next;
    //             default :   imem_addr = '0;
    //         endcase
    //     end
    //     else begin
    //         imem_addr = pc_next + 4;
    //     end
    // end


    assign valid = 1'b1;

    assign imem_rmask = 4'b1111; 
    // assign if_id_reg_next.pc = imem_addr - 4;
    assign if_id_reg_next.pc = imem_addr;
    assign if_id_reg_next.valid = valid;
    

endmodule : fetch1