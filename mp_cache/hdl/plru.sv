module plru (
    input   logic           clk,
    input   logic           rst,
    input   logic           hit_,
    input   logic   [3:0]   set_sel,
    input   logic   [1:0]   way_sel,
    output  logic   [3:0]   plru,
    output  logic   [1:0]   plru_2
);
    logic  [2:0] next_status;
    logic  [2:0] status [16];


    always_ff @( posedge clk ) begin 
        if(rst) begin
            for(int i = 0; i < 16; i++) begin
                status[i] <= '0;
            end
        end
        else if (hit_) begin
            status[set_sel] <= next_status;
        end
        else begin
            status[set_sel] <= status[set_sel];
        end
    end

    assign next_status[2] = way_sel[1]    ?   1'b1 : 1'b0;
    assign next_status[1] = way_sel[1]    ?   status[set_sel][1]   :    way_sel[0];
    assign next_status[0] = way_sel[1]    ?   way_sel[0]         :    status[set_sel][0];

    always_comb begin
        unique case (status[set_sel])
            3'b000  :   plru = 4'b1000;       //way d
            3'b001  :   plru = 4'b0100;       //way c
            3'b010  :   plru = 4'b1000;       //way d
            3'b011  :   plru = 4'b0100;       //way c
            3'b100  :   plru = 4'b0010;       //way b   
            3'b101  :   plru = 4'b0010;       //way b
            3'b110  :   plru = 4'b0001;       //way a
            3'b111  :   plru = 4'b0001;       //way a
            default :   plru = 4'b1000;       //way d
        endcase
    end
    
    always_comb begin
        unique case (plru)
            4'b1000 :   plru_2 = 2'b11;
            4'b0100 :   plru_2 = 2'b10;
            4'b0010 :   plru_2 = 2'b01;
            4'b0001 :   plru_2 = 2'b00;
            default :   plru_2 = 2'b00;
        endcase
    end

endmodule