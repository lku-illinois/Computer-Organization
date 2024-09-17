module lfsr #(
  parameter bit [15:0] SEED_VALUE = 'hECEB, TEST = 'h1234
) (
  input               clk,
  input               rst,
  input               en,
  output logic        rand_bit,
  output logic [15:0] shift_reg
);

  // TODO: Fill this out!
  
  logic [14:0] shift_in;
  logic first_bit;
  assign shift_in = shift_reg[15:1];
  assign first_bit = shift_reg[0] ^ shift_reg[2] ^ shift_reg[3] ^ shift_reg[5];


  always_ff @( posedge clk ) begin 

    if(rst) begin
      shift_reg <= SEED_VALUE;              //set default value
    end

    else if(en) begin
      rand_bit <= shift_reg[0];             //set last bit as rand_bit
      //shift_reg <= {shift_reg[0] ^ shift_reg[2] ^ shift_reg[3] ^ shift_reg[5], shift_reg[15:1]};        //shift reg 
      shift_reg <= {first_bit,shift_in};
    end
  end

endmodule : lfsr
