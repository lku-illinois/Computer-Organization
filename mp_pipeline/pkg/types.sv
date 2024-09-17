/////////////////////////////////////////////////////////////
// Maybe merge what is in mp_verif/pkg/types.sv over here? //
/////////////////////////////////////////////////////////////

package rv32i_types;

    typedef enum logic [6:0] {
        op_b_lui   = 7'b0110111, // U load upper immediate 
        op_b_auipc = 7'b0010111, // U add upper immediate PC 
        op_b_jal   = 7'b1101111, // J jump and link 
        op_b_jalr  = 7'b1100111, // I jump and link register 
        op_b_br    = 7'b1100011, // B branch 
        op_b_load  = 7'b0000011, // I load 
        op_b_store = 7'b0100011, // S store 
        op_b_imm   = 7'b0010011, // I arith ops with register/immediate operands 
        op_b_reg   = 7'b0110011, // R arith ops with register operands 
        op_b_csr   = 7'b1110011  // I control and status register 
    } rv32i_op_b_t;

    typedef enum bit [6:0] {
        op_lui   = 7'b0110111, // load upper immediate (U type)
        op_auipc = 7'b0010111, // add upper immediate PC (U type)
        op_jal   = 7'b1101111, // jump and link (J type)
        op_jalr  = 7'b1100111, // jump and link register (I type)
        op_br    = 7'b1100011, // branch (B type)
        op_load  = 7'b0000011, // load (I type)
        op_store = 7'b0100011, // store (S type)
        op_imm   = 7'b0010011, // arith ops with register/immediate operands (I type)
        op_reg   = 7'b0110011  // arith ops with register operands (R type)
    } rv32i_opcode;
    
    typedef enum logic {
        rs1_out = 1'b0
        ,pc_out = 1'b1
    } alu_m1_sel_t;

    typedef enum bit [2:0] {
        beq  = 3'b000,
        bne  = 3'b001,
        blt  = 3'b100,
        bge  = 3'b101,
        bltu = 3'b110,
        bgeu = 3'b111
    } branch_funct3_t;

    typedef enum bit [2:0] {
        lb  = 3'b000,
        lh  = 3'b001,
        lw  = 3'b010,
        lbu = 3'b100,
        lhu = 3'b101
    } load_funct3_t;

    typedef enum bit [2:0] {
        sb = 3'b000,
        sh = 3'b001,
        sw = 3'b010
    } store_funct3_t;

    typedef enum bit [2:0] {
        add  = 3'b000, //check bit 30 for sub if op_reg opcode
        sll  = 3'b001,
        slt  = 3'b010,
        sltu = 3'b011,
        axor = 3'b100,
        sr   = 3'b101, //check bit 30 for logical/arithmetic
        aor  = 3'b110,
        aand = 3'b111
    } arith_funct3_t;

    typedef enum bit [2:0] {
        alu_add = 3'b000,
        alu_sll = 3'b001,
        alu_sra = 3'b010,
        alu_sub = 3'b011,
        alu_xor = 3'b100,
        alu_srl = 3'b101,
        alu_or  = 3'b110,
        alu_and = 3'b111
    } alu_ops;

    // more mux def here

    typedef struct packed {
        logic   [31:0]  pc;
        logic   [31:0]  pc_next;
        logic           valid;
        logic   [31:0]  inst;
        logic   [4:0]   rd_s;
        logic   [31:0]  alu_result;
        logic   [4:0]   rs1_s;
        logic   [4:0]   rs2_s;
        logic   [31:0]  rs1_v;
        logic   [31:0]  rs2_v;
        logic   [3:0]   mem_wmask;
        logic   [3:0]   mem_rmask;
        // logic           MemtoReg;
        logic           regf_we;
        logic   [6:0]   opcode;
        logic   [31:0]  mem_wdata;
        logic   [2:0]   funct3;
        logic   [31:0]  d_mem_addr;
        logic   [31:0]  unconst_addr;
        logic           br_en;
    } mem_wb_stage_reg_t;

    typedef struct packed {
        logic   [31:0]  inst;
        logic   [31:0]  alu_result;
        logic   [31:0]  pc;
        logic   [31:0]  pc_next;
        logic           valid;
        logic   [4:0]   rd_s;
        logic   [31:0]  rs1_v;
        logic   [31:0]  rs2_v;
        logic   [3:0]   mem_wmask;
        logic   [3:0]   mem_rmask;
        // logic           MemtoReg;
        logic   [4:0]   rs1_s;
        logic   [4:0]   rs2_s;
        logic           regf_we;
        logic   [6:0]   opcode;
        logic   [31:0]  br_addr;
        logic           br_en_out;
        logic   [31:0]  mem_wdata;
        logic   [31:0]  mem_addr;
        logic   [2:0]   funct3;
    } ex_mem_stage_reg_t;

    typedef struct packed {
        logic   [31:0]  inst;
        logic   [2:0]   funct3;
        logic   [31:0]  imm;
        logic   [4:0]   rd_s;
        logic   [31:0]  rs1_v;
        logic   [31:0]  rs2_v;
        logic   [2:0]   aluop;
        logic           alusrc;
        logic   [3:0]   mem_wmask;
        logic   [3:0]   mem_rmask;
        // logic           MemtoReg;
        logic           valid;
        logic   [4:0]   rs1_s;
        logic   [4:0]   rs2_s;
        logic   [31:0]  pc;
        // logic    [31:0]   pc_next;
        logic           regf_we;
        logic   [1:0]   a_src;
        logic   [2:0]   cmpop;
        logic           f_src;
        logic   [6:0]   opcode;
        logic   [31:0]  br_imm;
        logic           br_sel;
        logic   [1:0]   br_en_sel;
    } id_ex_stage_reg_t;


    // typedef struct packed {              //first
    //    logic    [31:0]   pc;
    //    logic             valid;
    // } if_id_stage_reg_t;

    typedef struct packed {                //changed version
       logic    [31:0]   pc;
       logic             valid;
    } if_id_stage_reg_t;

endpackage
