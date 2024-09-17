module alu (
  input               clk,
  input               rst,
  input [63:0]        a,
  input [63:0]        b,
  input               valid_i,
  input [3:0]         op,
  output logic [63:0] z,
  output logic        valid_o
);

  //----------------------------------------------------------------------------
  // Valid signaling
  //----------------------------------------------------------------------------
  // The ALU is currently purely combinational, so it responds as soon as
  // it gets input.
  
  logic [63:0] a_reg, b_reg;
  logic [3:0] op_reg, op_reg1, op_reg2, op_reg3;
  logic valid_i1, valid_i2, valid_i3, valid_i4, valid_i5;

 
  //assign valid_o = valid_i;
  always_ff @( posedge clk ) begin                                                        //set a_reg, b_reg
    if (rst) begin
      a_reg <= 0;
      b_reg <= 0;
      op_reg <= 0;
      op_reg1 <= 0;
      op_reg2 <= 0;
      op_reg3 <= 0;
    end
    else begin
      a_reg <= a;
      b_reg <= b;
      op_reg <= op;
      op_reg1 <= op_reg;
      op_reg2 <= op_reg1;
      op_reg3 <= op_reg2;
    end
  end

  always_ff @(posedge clk) begin                                                            //valid_o buffer
    valid_i1 <= valid_i;
    valid_i2 <= valid_i1;
    valid_i3 <= valid_i2;
    valid_i4 <= valid_i3;
    valid_i5 <= valid_i4;
    //valid_o <= valid_i5;
  end

  // always_ff @( posedge clk ) begin                                                        //set a_reg, b_reg
  //   if (rst) begin
  //     a_reg <= 0;
  //     b_reg <= 0;
  //   end
  //   else begin
  //     a_reg <= a;
  //     b_reg <= b;
  //   end
  // end

  //assign z = a_reg;

  // always_ff @( posedge clk ) begin 
  //   a_reg <= a;
  //   b_reg <= b;
  // end



  
  //----------------------------------------------------------------------------
  // Population count implementation
  //----------------------------------------------------------------------------
  // Popcount = number of '1' bits in a
  
  logic [63:0] popcnt, popcnt_tmp1, popcnt_tmp2, popcnt_tmp3, popcnt_tmp4, popcnt_tmp5;
  logic [63:0] popcnt_1, popcnt_2, popcnt_3, popcnt_4;
  logic [63:0] temp_popcnt_1, temp_popcnt_2, temp_popcnt_3, temp_popcnt_4;

  // always_comb begin
  //   popcnt = '0;
  //   foreach (a[i]) begin
  //     if (a[i]) begin
  //       popcnt = popcnt + 1'b1;
  //     end
  //   end
  // end
  

  //-------------------------------------------------------------------- popcnt 1
  always_comb begin
    popcnt_1 = '0;
    for (int i = 0; i < 16; ++i ) begin
      if (a_reg[i]) begin
        popcnt_1 = popcnt_1 + 1'b1;
      end
    end 
  end

  always_ff @(posedge clk) begin
    temp_popcnt_1 <= popcnt_1;
  end


  //----------------------------------------------------------------------popcnt_2
  always_comb begin
    popcnt_2 = '0;
    for (int i = 16; i < 32; ++i ) begin
      if (a_reg[i]) begin
        popcnt_2 = popcnt_2 + 1'b1;
      end
    end 
  end

  always_ff @(posedge clk) begin
    temp_popcnt_2 <= popcnt_2;
  end
  
  //----------------------------------------------------------------------popcnt_3

  always_comb begin
    popcnt_3 = '0;
    for (int i = 32; i < 48; ++i ) begin
      if (a_reg[i]) begin
        popcnt_3 = popcnt_3 + 1'b1;
      end
    end 
  end

  always_ff @(posedge clk) begin
    temp_popcnt_3 <= popcnt_3;
  end

//----------------------------------------------------------------------popcnt_4
  always_comb begin
    popcnt_4 = '0;
    for (int i = 48; i <  64; ++i ) begin
      if (a_reg[i]) begin
        popcnt_4 = popcnt_4 + 1'b1;
      end
    end 
  end

  always_ff @(posedge clk) begin
    temp_popcnt_4 <= popcnt_4;
  end

//----------------------------------------------------------------------total popcnt
  always_ff @(posedge clk) begin
    popcnt_tmp1 <= temp_popcnt_1 + temp_popcnt_2 + temp_popcnt_3 + temp_popcnt_4;
    popcnt <= popcnt_tmp1;
    // popcnt_tmp2 <= popcnt_tmp1;
    // popcnt_tmp3 <= popcnt_tmp2;
    // popcnt <= popcnt_tmp3;
  end

  // always_ff @(posedge clk) begin
  //   popcnt_temp <= popcnt;
  // end
  //----------------------------------------------------------------------------
  // Simple logical/arithmetic operations
  //----------------------------------------------------------------------------
  logic [63:0] land, land_temp;
  logic [63:0] lor, lor_temp;
  logic [63:0] lnot, lnot_temp;
  logic [63:0] add, add_temp;
  logic [63:0] sub, sub_temp;
  logic [63:0] inc, inc_temp;
  logic [63:0] shl, shl_temp;
  logic [63:0] shr, shr_temp;

  always_comb begin
      land = a_reg & b_reg;
      lor  = a_reg | b_reg;
      lnot = ~a_reg;
      add  = a_reg + b_reg;
      sub  = a_reg - b_reg;
      inc  = a_reg + 1'b1;
      shl  = a_reg << b_reg[5:0];
      shr  = a_reg >> b_reg[5:0];
  end

  // always_ff @(posedge clk) begin
  //   land_temp <= land;
  //   lor_temp <= lor;
  //   lnot_temp <= lnot;
  //   add_temp <= add;
  //   sub_temp <= sub;
  //   inc_temp <= inc;
  //   shl_temp <= shl;
  //   shr_temp <= shr;
  // end
  //----------------------------------------------------------------------------
  // Output MUX
  //----------------------------------------------------------------------------
  // always_comb begin
  //   case (op)
  //     0: z = land;
  //     1: z = lor;
  //     2: z = lnot;
  //     3: z = add;
  //     4: z = sub;
  //     5: z = inc;
  //     6: z = shl;
  //     7: z = shr;
  //     8: z = popcnt;
  //     default z = 'x;
  //   endcase
  // end


  //---------------------------------------------
  logic [63:0] z1,z2,z3,z4;
  logic [63:0] temp1,temp2,temp3,temp4;

  always_comb begin
    case (op_reg[0])
      0: z1 = land;
      1: z1 = lor;
    endcase
  end

  always_ff @( posedge clk ) begin
    temp1 <= z1;
    //valid_i2 <= valid_i1;                                                            //delay2
  end

  always_comb begin
    case (op_reg[0])
      0: z2 = lnot;
      1: z2 = add;
    endcase
  end

  always_ff @( posedge clk ) begin
    temp2 <= z2;
  end

  always_comb begin
    case (op_reg[0])
      0: z3 = sub;
      1: z3 = inc;
    endcase
  end

  always_ff @( posedge clk ) begin
    temp3 <= z3;
  end

  always_comb begin
    case (op_reg[0])
      0: z4 = shl;
      1: z4 = shr;
    endcase
  end

  always_ff @( posedge clk ) begin
    temp4 <= z4;
  end
  //----------------------------------------------

  logic [63:0] z5,z6;
  logic [63:0] temp5,temp6;

  always_comb begin
    case (op_reg1[1])
      0: z5 = temp1;
      1: z5 = temp2;
    endcase
  end

  always_ff @( posedge clk ) begin
    temp5 <= z5;
    //valid_i3 <= valid_i2;                                                     //delay3;
  end


  always_comb begin
    case (op_reg1[1])
      0: z6 = temp3;
      1: z6 = temp4;
    endcase
  end

  always_ff @( posedge clk ) begin
    temp6 <= z6;
  end
  //-------------------------------------------------

  logic [63:0] z7;
  logic [63:0] temp7;

  always_comb begin
    case (op_reg2[2])
      0: z7 = temp5;
      1: z7 = temp6;
    endcase
  end

  always_ff @( posedge clk ) begin
    temp7 <= z7;
  end
  //----------------------------------------------------

  logic [63:0] z8, z_new;
  logic prompt;
  

  always_comb begin
    case (op_reg3[3])
      0: z8 = temp7;
      1: z8 = popcnt;
    endcase
  end

  always_ff @( posedge clk ) begin  
    z_new <= z8;  
    //z <= z8;
    // prompt <= 1'b1;                                                                                      //check
  end

  always_ff @( posedge clk ) begin 
    if (valid_i5) begin
      valid_o <= 1'b1;
      z <= z_new;
    end
    else begin
      z <= 'x;
      valid_o <= 0;
    end
  end
  

endmodule : alu