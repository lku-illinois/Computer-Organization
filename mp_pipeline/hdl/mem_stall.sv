module mem_stall
import rv32i_types::*;
(
    //dmem_stall
    input   logic           wb_valid,
    input   logic   [31:0]  wb_inst,
    input   logic   [6:0]   wb_opcode,
    input   logic           dmem_resp,
    input   logic           rst,

    //imem_stall
    input   logic           de_valid,
    input   logic           imem_resp,

    output logic            freeze
);
    logic dmem_stall, imem_stall;
    logic flag, flag2, flag3;
    logic wbvalid;
    logic   [31:0] wbinst;
    assign wbvalid = wb_valid;
    assign wbinst = wb_inst;
    // assign dmem_stall = '0;

    // determine dmem_stall
    always_comb begin 
        dmem_stall = '0;
        flag = '0;
        flag2 = '0;
        flag3 = '0;
        if(wb_inst != 32'h13) begin
            // flag = '1;

            if(wb_opcode inside {op_b_load, op_b_store}) begin
                flag2 = '1;

                if(!dmem_resp) begin
                    flag3 = '1;
                    dmem_stall = '1;
                end
            end

        end
    end


    //determine imem_stall
    logic flag4, flag5;
    always_comb begin 
        imem_stall = '0;
        flag4 = '0;
        flag5 = '0;
        // if(de_valid) begin
            flag4 = '1;
            if(!imem_resp && !rst) begin
                flag5 = '1;
                imem_stall = '1;
            end
        // end
    end


    logic   valid;
    assign valid = de_valid;

    //react to different case
    
    assign  freeze = imem_stall | dmem_stall;
    // assign freeze = '0;
    
        
    //if freeze, stop register from moving. freeze pc
    //rmask? 
endmodule :   mem_stall