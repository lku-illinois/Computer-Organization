module random_tb
import rv32i_types::*;
(
  // mem_itf.mem itf
  mem_itf.mem itf_i,
  mem_itf.mem itf_d
);

  `include "../../hvl/randinst.svh"

  RandInst gen = new();

  // Do a bunch of LUIs to get useful register state.
  task init_register_state();
    itf_i.resp <= 1'b0;
    itf_d.resp <= 1'b0;
    for (int i = 0; i < 32; ++i) begin
        if (itf_i.rmask == 4'b1111) begin
        
        gen.randomize() with {
            instr.j_type.opcode == op_lui;
            instr.j_type.rd == i[4:0];
        };

        @(posedge itf_i.clk);
        itf_i.rdata <= gen.instr.word;
        itf_i.resp <= 1'b1;
        end
    end
  endtask : init_register_state

  // Note that this memory model is not consistent! It ignores
  // writes and always reads out a random, valid instruction.
  task run_random_instrs();
    // itf_d.resp <= 1'b0;
    repeat (20000000) begin
      // itf_d.resp <= 1'b0;
      // Always read out a valid instruction.
      if (itf_i.rmask == 4'b1111) begin
        gen.randomize();

        @(posedge itf_i.clk);
        itf_i.rdata <= gen.instr.word;
      end
      // If it's a write, do nothing and just respond.
      itf_i.resp <= 1'b1;

      //CP2
      // === for manually set rdata/wdata
      if (|itf_d.rmask) begin
        gen.randomize();
        // // Modified Give the hex value
        // $display("%x\n", gen.instr.word);
        //@(posedge itf_i.clk);
        itf_d.rdata <= gen.instr.word;
        itf_d.resp <= 1'b1;
      end
      else if (|itf_d.wmask) begin
        itf_d.resp <= 1'b1;
      end
      else begin
        itf_d.resp <= 1'b0;
      end
    end
  endtask : run_random_instrs

  // A single initial block ensures random stability.
  initial begin

    // Wait for reset.
    if (itf_i.rst == 1'b0) begin
        @(posedge itf_i.clk);
        @(posedge itf_i.clk);
        // Get some useful state into the processor by loading in a bunch of state.
        init_register_state();
        
        // Run!
        run_random_instrs();

        // Finish up
        $display("Random testbench finished!");
        $finish;
    end
  end

endmodule : random_tb

