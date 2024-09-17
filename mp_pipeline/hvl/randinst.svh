// This class generates random valid RISC-V instructions to test your
// RISC-V cores.

class RandInst;
  // You will increment this number as you generate more random instruction
  // types. Once finished, NUM_TYPES should be 9, for each opcode type in
  // rv32i_opcode.
  localparam NUM_TYPES = 9;

  // You'll need this type to randomly generate variants of certain
  // instructions that have the funct7 field.
  typedef enum bit [6:0] {
    base    = 7'b0000000,
    variant = 7'b0100000
  } funct7_t;

  // Various ways RISC-V instruction words can be interpreted.
  // See page 104, Chapter 19 RV32/64G Instruction Set Listings
  // of the RISC-V v2.2 spec.
  typedef union packed {
    bit [31:0] word;

    struct packed {
      bit [11:0] i_imm;                                                               //why i_imm, not imm
      bit [4:0] rs1;
      bit [2:0] funct3;
      bit [4:0] rd;
      rv32i_opcode opcode;
    } i_type;

    struct packed {
      bit [6:0] funct7;
      bit [4:0] rs2;
      bit [4:0] rs1;
      bit [2:0] funct3;
      bit [4:0] rd;
      rv32i_opcode opcode;
    } r_type;

    struct packed {
      bit [11:5] imm_s_top;
      bit [4:0]  rs2;
      bit [4:0]  rs1;
      bit [2:0]  funct3;
      bit [4:0]  imm_s_bot;
      rv32i_opcode opcode;
    } s_type;

    // TODO: Write the struct for b-type instructions.                                      //check
    struct packed {
      bit       imm_12;
      bit [5:0] imm_10_5;
      bit [4:0] rs2;
      bit [4:0] rsfunct7_t1;
      bit [2:0] funct3;
      bit [3:0] imm_4_1;
      bit       imm_11;
      rv32i_opcode opcode;
    } b_type;
    

    struct packed {
      bit [31:12] imm;
      bit [4:0]  rd;
      rv32i_opcode opcode;
    } j_type;

  } instr_t;

  rand instr_t instr;
  rand bit [NUM_TYPES-1:0] instr_type;

  // Make sure we have an even distribution of instruction types.
  constraint solve_order_c { solve instr_type before instr; }

  // Hint/TODO: you will need another solve_order constraint for funct3
  // to get 100% coverage with 500 calls to .randomize().
  rand bit [2:0] func_3;
  constraint solve_order_funct3_c {  
    solve func_3 before instr; }  
    //rand bit [2:0] funct3;                                                           //help
  

  // Pick one of the instruction types.
  constraint instr_type_c {
    $countones(instr_type) == 1; // Ensures one-hot.
  }

  // Constraints for actually generating instructions, given the type.
  // Again, see the instruction set listings to see the valid set of
  // instructions, and constrain to meet it. Refer to ../pkg/types.sv
  // to see the typedef enums.

  constraint instr_c {
      instr.r_type.funct3 == func_3;                                                        //why only r_type
      // Reg-imm instructions
      instr_type[0] -> {
        instr.i_type.opcode == op_imm;

        // Implies syntax: if funct3 is sr, then funct7 must be
        // one of two possibilities.
        instr.r_type.funct3 == sr -> {
          instr.r_type.funct7 inside {base, variant};
        }

        // This if syntax is equivalent to the implies syntax above
        // but also supports an else { ... } clause.
        if (instr.r_type.funct3 == sll) {
          instr.r_type.funct7 == base;
        }
      }

      // Reg-reg instructions
      instr_type[1] -> {
          // TODO: Fill this out!
          instr.r_type.opcode == op_reg;  //check opcode

          if (instr.r_type.funct3 inside {add, sr}) {
            instr.r_type.funct7 inside {base, variant} ;           //add or sub, SRL or SRA  
          }
          
          if (instr.r_type.funct3 inside{sll, slt, sltu, axor, aor, aand}) {                        //SLL
            instr.r_type.funct7 == base;
          }
      }

      // Store instructions -- these are easy to constrain!
      instr_type[2] -> {
        instr.s_type.opcode == op_store;
        instr.s_type.funct3 inside {sw, sb, sh};

        // instr.s_type.rs1[1:0] == 2'b00;
        instr.s_type.rs1 == 5'b0;
        // instr.s_type.imm_s_bot[1:0] == 2'b00;

        if (instr.s_type.funct3 == sw ) {
          instr.s_type.imm_s_bot[1:0] == 2'b00;
        }

        if (instr.s_type.funct3 == sh ) {
          instr.s_type.imm_s_bot[0] == 0;
        }
      }

      // // Load instructions
      instr_type[3] -> {
        instr.i_type.opcode == op_load;
        instr.i_type.funct3 inside {lb, lh, lw, lbu, lhu};


        instr.i_type.rs1 == 5'b0;
        // instr.i_type.i_imm[1:0] == 0;

        if (instr.i_type.funct3 inside {lw}) {
          instr.i_type.i_imm[1:0] == 2'b00;
        }

        if (instr.i_type.funct3 inside {lh, lhu} ) {
          instr.i_type.i_imm[0] == 0;
        }


      }
      

      //branch instructions
      instr_type[4] -> {
        instr.b_type.opcode == op_br;
        instr.b_type.funct3 inside {beq, bne, blt, bge, bltu, bgeu};
      }
      // TODO: Do all 9 types!

      //jump and link register instructions
      instr_type[5] -> {
        instr.i_type.opcode == op_jalr;
        instr.i_type.funct3 == 0;
      }

      //jump and link instructions
      instr_type[6] -> {
        instr.j_type.opcode == op_jal;    //
      }


      //add upper immediate PC instructions
      instr_type[7] -> {
        instr.j_type.opcode == op_auipc;    //
      }

      //load upper immediate instructions
      instr_type[8] -> {
        instr.j_type.opcode == op_lui;    //
      }
  }

  `include "../../hvl/instr_cg.svh"

  // Constructor, make sure we construct the covergroup.
  function new();
    instr_cg = new();
  endfunction : new

  // Whenever randomize() is called, sample the covergroup. This assumes
  // that every time you generate a random instruction, you send it into
  // the CPU.
  function void post_randomize();
    instr_cg.sample(this.instr);
  endfunction : post_randomize

  // A nice part of writing constraints is that we get constraint checking
  // for free -- this function will check if a bit vector is a valid RISC-V
  // instruction (assuming you have written all the relevant constraints).
  function bit verify_valid_instr(instr_t inp);
    bit valid = 1'b0;
    this.instr = inp;
    for (int i = 0; i < NUM_TYPES; ++i) begin
      this.instr_type = 1 << i;
      if (this.randomize(null)) begin
        valid = 1'b1;
        break;
      end
    end
    return valid;
  endfunction : verify_valid_instr
endclass : RandInst
