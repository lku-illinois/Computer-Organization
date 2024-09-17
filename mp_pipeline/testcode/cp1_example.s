.section .text
.globl _start
    # Refer to the RISC-V ISA Spec for the functionality of
    # the instructions in this test program.
_start:
    # addi x1, x0, 4  # x1 <= 4
    # nop
    # nop
    # nop             # nops in between to prevent hazard
    # nop
    # nop
    # addi x3, x1, 8  # x3 <= x1 + 8
    # Note that the comments in this file should not be taken as
    # an example of good commenting style!!  They are merely provided
    # in an effort to help you understand the assembly style.

    lui x0, 0x938 # x1 <= 4          0x00000093
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x1, 0x100
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x2, 0x200
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x3, 0x300
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x4, 0x400
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x5, 0x500
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x6, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x7, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x8, 0x700
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x9, 0x800
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x10, 0x900
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x11, 0xA00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x12, 0xB00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x13, 0xC00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x14, 0xD00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x15, 0xE00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x16, 0xF00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x17, 0x123
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x18, 0x456
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x19, 0x789
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x20, 0xAB0
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x21, 0xCDE
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x22, 0x111
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x23, 0x222
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x24, 0x333
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x25, 0x444
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x26, 0x555
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x27, 0x666
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x28, 0x777
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x29, 0x888
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x30, 0x999
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x31, 0xAAA
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    addi x3, x1, 8  # x3 <= x1 + 8     0x00808193
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    addi x4, x1, 1
    nop
    nop
    nop
    nop
    addi x5, x2, 10
    nop
    nop
    nop
    nop
    addi x6, x3, 5
    nop
    nop
    nop
    nop
    addi x7, x4, 20
    nop
    nop
    nop
    nop
    addi x8, x5, -5
    nop
    nop
    nop
    nop
    addi x9, x6, 15
    nop
    nop
    nop
    nop
    addi x10, x7, -10
    nop
    nop
    nop
    nop
    addi x11, x8, 25
    nop
    nop
    nop
    nop
    addi x12, x9, 3
    nop
    nop
    nop
    nop
    addi x13, x10, -8
    nop
    nop
    nop
    nop
    addi x14, x11, 12
    nop
    nop
    nop
    nop
    addi x15, x12, 7
    nop
    nop
    nop
    nop
    addi x16, x13, -15
    nop
    nop
    nop
    nop
    addi x17, x14, 18
    nop
    nop
    nop
    nop
    addi x18, x15, 9
    nop
    nop
    nop
    nop
    addi x19, x16, -6
    nop
    nop
    nop
    nop
    addi x20, x17, 22
    nop
    nop
    nop
    nop
    addi x21, x18, -4
    nop
    nop
    nop
    nop
    addi x22, x19, 13
    nop
    nop
    nop
    nop
    addi x23, x20, -11
    nop
    nop
    nop
    nop
    addi x24, x21, 16
    nop
    nop
    nop
    nop
    addi x25, x22, 2
    nop
    nop
    nop
    nop
    addi x26, x23, -7
    nop
    nop
    nop
    nop
    addi x27, x24, 14
    nop
    nop
    nop
    nop
    addi x28, x25, 6
    nop
    nop
    nop
    nop
    addi x29, x26, -9
    nop
    nop
    nop
    nop
    addi x30, x27, 11
    nop
    nop
    nop
    nop
    addi x31, x28, 4
    nop
    nop
    nop
    nop
    addi x1, x29, -3
    nop
    nop
    nop
    nop
    addi x2, x30, 19
    nop
    nop
    nop
    nop
    addi x3, x31, 0
    nop
    nop
    nop
    nop
    addi x0, x1, 23


    # Add your own test cases here! 
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    
    addi x1, x0, -4  # x1 <= 4 
    nop
    nop
    nop
    nop
    nop
    lui x22, 0xfff5
    

    nop
    nop
    nop
    nop
    nop
    lui  x2, 2       # X2 <= 2          0x00002137
    nop
    nop
    nop
    nop
    nop
    lui x0, 0x938 # x1 <= 4          0x00000093
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x1, 0x100
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x2, 0x200
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x3, 0x300
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x4, 0x400
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x5, 0x500
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x6, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x7, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x8, 0x700
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x9, 0x800
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x10, 0x900
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x11, 0xA00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x12, 0xB00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x13, 0xC00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x14, 0xD00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x15, 0xE00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x16, 0xF00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x17, 0x123
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x18, 0x456
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x19, 0x789
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x20, 0xAB0
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x21, 0xCDE
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x22, 0x111
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x23, 0x222
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x24, 0x333
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x25, 0x444
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x26, 0x555
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x27, 0x666
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x28, 0x777
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x29, 0x888
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x30, 0x999
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x31, 0xAAA

    nop
    nop
    nop
    nop
    nop
    auipc x7, 8         # X7 <= PC + 8              0x00008397


     nop
    nop
    nop
    nop
    nop
    auipc x12, 988  

    nop
    nop
    nop
    nop
    nop
    slti x4, x1, 15     # Set x4 to 1 if x1 < 15, otherwise 0 (x2 = 1)     0x00f0a213
    nop
    nop
    nop
    nop
    nop
    slti x4, x1, 15
    nop
    nop
    nop
    nop
    slti x5, x2, -10
    nop
    nop
    nop
    nop
    slti x6, x3, 0
    nop
    nop
    nop
    nop
    slti x7, x4, 5
    nop
    nop
    nop
    nop
    slti x8, x5, 100
    nop
    nop
    nop
    nop
    slti x9, x6, -3
    nop
    nop
    nop
    nop
    slti x10, x7, 20
    nop
    nop
    nop
    nop
    slti x11, x8, 7
    nop
    nop
    nop
    nop
    slti x12, x9, -15
    nop
    nop
    nop
    nop
    slti x13, x10, 10
    nop
    nop
    nop
    nop
    slti x14, x11, 50
    nop
    nop
    nop
    nop
    slti x15, x12, 3
    nop
    nop
    nop
    nop
    slti x16, x13, -8
    nop
    nop
    nop
    nop
    slti x17, x14, 12
    nop
    nop
    nop
    nop
    slti x18, x15, 9
    nop
    nop
    nop
    nop
    slti x19, x16, 6
    nop
    nop
    nop
    nop
    slti x20, x17, 22
    nop
    nop
    nop
    nop
    slti x21, x18, -4
    nop
    nop
    nop
    nop
    slti x22, x19, 13
    nop
    nop
    nop
    nop
    slti x23, x20, -11
    nop
    nop
    nop
    nop
    slti x24, x21, 16
    nop
    nop
    nop
    nop
    slti x25, x22, 2
    nop
    nop
    nop
    nop
    slti x26, x23, -7
    nop
    nop
    nop
    nop
    slti x27, x24, 14
    nop
    nop
    nop
    nop
    slti x28, x25, 6
    nop
    nop
    nop
    nop
    slti x29, x26, -9
    nop
    nop
    nop
    nop
    slti x30, x27, 11
    nop
    nop
    nop
    nop
    slti x31, x28, 4
    nop
    nop
    nop
    nop
    slti x1, x29, -3
    nop
    nop
    nop
    nop
    slti x2, x30, 19
    nop
    nop
    nop
    nop
    slti x3, x31, 0
    nop
    nop
    nop
    nop
    slti x0, x1, 23
    
    nop
    nop
    nop
    nop
    nop
    lui x0, 0x938 # x1 <= 4          0x00000093
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x1, 0x100
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x2, 0x200
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x3, 0x300
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x4, 0x400
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x5, 0x500
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x6, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x7, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x8, 0x700
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x9, 0x800
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x10, 0x900
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x11, 0xA00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x12, 0xB00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x13, 0xC00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x14, 0xD00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x15, 0xE00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x16, 0xF00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x17, 0x123
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x18, 0x456
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x19, 0x789
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x20, 0xAB0
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x21, 0xCDE
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x22, 0x111
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x23, 0x222
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x24, 0x333
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x25, 0x444
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x26, 0x555
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x27, 0x666
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x28, 0x777
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x29, 0x888
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x30, 0x999
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x31, 0xAAA

    nop
    nop
    nop
    nop
    nop
    sltiu x4, x1, 1                             #0010b213
    nop
    nop
    nop
    nop
    nop
    sltiu x4, x1, 1
    nop
    nop
    nop
    nop
    sltiu x5, x2, 10
    nop
    nop
    nop
    nop
    sltiu x6, x3, 5
    nop
    nop
    nop
    nop
    sltiu x7, x4, 20
    nop
    nop
    nop
    nop
    sltiu x8, x5, 100
    nop
    nop
    nop
    nop
    sltiu x9, x6, 3
    nop
    nop
    nop
    nop
    sltiu x10, x7, 20
    nop
    nop
    nop
    nop
    sltiu x11, x8, 7
    nop
    nop
    nop
    nop
    sltiu x12, x9, 15
    nop
    nop
    nop
    nop
    sltiu x13, x10, 10
    nop
    nop
    nop
    nop
    sltiu x14, x11, 50
    nop
    nop
    nop
    nop
    sltiu x15, x12, 3
    nop
    nop
    nop
    nop
    sltiu x16, x13, 8
    nop
    nop
    nop
    nop
    sltiu x17, x14, 12
    nop
    nop
    nop
    nop
    sltiu x18, x15, 9
    nop
    nop
    nop
    nop
    sltiu x19, x16, 6
    nop
    nop
    nop
    nop
    sltiu x20, x17, 22
    nop
    nop
    nop
    nop
    sltiu x21, x18, 4
    nop
    nop
    nop
    nop
    sltiu x22, x19, 13
    nop
    nop
    nop
    nop
    sltiu x23, x20, 11
    nop
    nop
    nop
    nop
    sltiu x24, x21, 16
    nop
    nop
    nop
    nop
    sltiu x25, x22, 2
    nop
    nop
    nop
    nop
    sltiu x26, x23, 7
    nop
    nop
    nop
    nop
    sltiu x27, x24, 14
    nop
    nop
    nop
    nop
    sltiu x28, x25, 6
    nop
    nop
    nop
    nop
    sltiu x29, x26, 9
    nop
    nop
    nop
    nop
    sltiu x30, x27, 11
    nop
    nop
    nop
    nop
    sltiu x31, x28, 4
    nop
    nop
    nop
    nop
    sltiu x1, x29, 3
    nop
    nop
    nop
    nop
    sltiu x2, x30, 19
    nop
    nop
    nop
    nop
    sltiu x3, x31, 0
    nop
    nop
    nop
    nop
    sltiu x0, x1, 23

    nop
    nop
    nop
    nop
    nop
    lui x0, 0x938 # x1 <= 4          0x00000093
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x1, 0x100
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x2, 0x200
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x3, 0x300
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x4, 0x400
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x5, 0x500
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x6, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x7, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x8, 0x700
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x9, 0x800
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x10, 0x900
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x11, 0xA00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x12, 0xB00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x13, 0xC00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x14, 0xD00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x15, 0xE00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x16, 0xF00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x17, 0x123
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x18, 0x456
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x19, 0x789
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x20, 0xAB0
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x21, 0xCDE
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x22, 0x111
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x23, 0x222
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x24, 0x333
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x25, 0x444
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x26, 0x555
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x27, 0x666
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x28, 0x777
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x29, 0x888
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x30, 0x999
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x31, 0xAAA

    nop
    nop
    nop
    nop
    nop
    addi x1, x0, 0x55  # x1 <= 4
    nop
    nop
    nop
    nop
    nop
    xori x4, x1, 0xAA
    nop
    nop
    nop
    nop
    xori x4, x1, 0xAA
    nop
    nop
    nop
    nop
    xori x5, x2, 0xBB
    nop
    nop
    nop
    nop
    xori x6, x3, 0xCC
    nop
    nop
    nop
    nop
    xori x7, x4, 0xDD
    nop
    nop
    nop
    nop
    xori x8, x5, 0xEE
    nop
    nop
    nop
    nop
    xori x9, x6, 0xFF
    nop
    nop
    nop
    nop
    xori x10, x7, 0x123
    nop
    nop
    nop
    nop
    xori x11, x8, 0x456
    nop
    nop
    nop
    nop
    xori x12, x9, 0x789
    nop
    nop
    nop
    nop
    xori x13, x10, 0xAB
    nop
    nop
    nop
    nop
    xori x14, x11, 0xDE
    nop
    nop
    nop
    nop
    xori x15, x12, 0x98
    nop
    nop
    nop
    nop
    xori x16, x13, 0x65
    nop
    nop
    nop
    nop
    xori x17, x14, 0x32
    nop
    nop
    nop
    nop
    xori x18, x15, 0x87
    nop
    nop
    nop
    nop
    xori x19, x16, 0x54
    nop
    nop
    nop
    nop
    xori x20, x17, 0x21
    nop
    nop
    nop
    nop
    xori x21, x18, 0xAB
    nop
    nop
    nop
    nop
    xori x22, x19, 0xDE
    nop
    nop
    nop
    nop
    xori x23, x20, 0x98
    nop
    nop
    nop
    nop
    xori x24, x21, 0x65
    nop
    nop
    nop
    nop
    xori x25, x22, 0x32
    nop
    nop
    nop
    nop
    xori x26, x23, 0x87
    nop
    nop
    nop
    nop
    xori x27, x24, 0x54
    nop
    nop
    nop
    nop
    xori x28, x25, 0x21
    nop
    nop
    nop
    nop
    xori x29, x26, 0xAB
    nop
    nop
    nop
    nop
    xori x30, x27, 0xDE
    nop
    nop
    nop
    nop
    xori x31, x28, 0x98
    nop
    nop
    nop
    nop
    xori x1, x29, 0x65
    nop
    nop
    nop
    nop
    xori x2, x30, 0x32
    nop
    nop
    nop
    nop
    xori x3, x31, 0x87
    nop
    nop
    nop
    nop
    xori x0, x1, 0x54

    nop
    nop
    nop
    nop
    nop
    lui x0, 0x938 # x1 <= 4          0x00000093
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x1, 0x100
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x2, 0x200
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x3, 0x300
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x4, 0x400
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x5, 0x500
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x6, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x7, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x8, 0x700
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x9, 0x800
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x10, 0x900
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x11, 0xA00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x12, 0xB00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x13, 0xC00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x14, 0xD00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x15, 0xE00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x16, 0xF00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x17, 0x123
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x18, 0x456
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x19, 0x789
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x20, 0xAB0
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x21, 0xCDE
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x22, 0x111
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x23, 0x222
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x24, 0x333
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x25, 0x444
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x26, 0x555
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x27, 0x666
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x28, 0x777
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x29, 0x888
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x30, 0x999
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x31, 0xAAA
    nop
    nop
    nop
    nop
    nop
    ori x2, x1, 0xAA

    nop
    nop
    nop
    nop
    nop
    ori x2, x1, 0xAA
    nop
    nop
    nop
    nop
    ori x3, x2, 0xBB
    nop
    nop
    nop
    nop
    ori x4, x3, 0xCC
    nop
    nop
    nop
    nop
    ori x5, x4, 0xDD
    nop
    nop
    nop
    nop
    ori x6, x5, 0xEE
    nop
    nop
    nop
    nop
    ori x7, x6, 0xFF
    nop
    nop
    nop
    nop
    ori x8, x7, 0x23
    nop
    nop
    nop
    nop
    ori x9, x8, 0x56
    nop
    nop
    nop
    nop
    ori x10, x9, 0x89
    nop
    nop
    nop
    nop
    ori x11, x10, 0xAB
    nop
    nop
    nop
    nop
    ori x12, x11, 0xDE
    nop
    nop
    nop
    nop
    ori x13, x12, 0x87
    nop
    nop
    nop
    nop
    ori x14, x13, 0x54
    nop
    nop
    nop
    nop
    ori x15, x14, 0x21
    nop
    nop
    nop
    nop
    ori x16, x15, 0x76
    nop
    nop
    nop
    nop
    ori x17, x16, 0x43
    nop
    nop
    nop
    nop
    ori x18, x17, 0x10
    nop
    nop
    nop
    nop
    ori x19, x18, 0xBC
    nop
    nop
    nop
    nop
    ori x20, x19, 0xEF
    nop
    nop
    nop
    nop
    ori x21, x20, 0x98
    nop
    nop
    nop
    nop
    ori x22, x21, 0x65
    nop
    nop
    nop
    nop
    ori x23, x22, 0x32
    nop
    nop
    nop
    nop
    ori x24, x23, 0x76
    nop
    nop
    nop
    nop
    ori x25, x24, 0x43
    nop
    nop
    nop
    nop
    ori x26, x25, 0x21
    nop
    nop
    nop
    nop
    ori x27, x26, 0xBC
    nop
    nop
    nop
    nop
    ori x28, x27, 0xEF
    nop
    nop
    nop
    nop
    ori x29, x28, 0x98
    nop
    nop
    nop
    nop
    ori x30, x29, 0x65
    nop
    nop
    nop
    nop
    ori x31, x30, 0x32
    nop
    nop
    nop
    nop
    ori x1, x31, 0x76
    nop
    nop
    nop
    nop
    ori x0, x1, 0x43

    nop
    nop
    nop
    nop
    nop
    lui x0, 0x938 # x1 <= 4          0x00000093
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x1, 0x100
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x2, 0x200
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x3, 0x300
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x4, 0x400
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x5, 0x500
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x6, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x7, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x8, 0x700
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x9, 0x800
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x10, 0x900
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x11, 0xA00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x12, 0xB00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x13, 0xC00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x14, 0xD00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x15, 0xE00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x16, 0xF00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x17, 0x123
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x18, 0x456
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x19, 0x789
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x20, 0xAB0
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x21, 0xCDE
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x22, 0x111
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x23, 0x222
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x24, 0x333
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x25, 0x444
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x26, 0x555
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x27, 0x666
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x28, 0x777
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x29, 0x888
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x30, 0x999
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x31, 0xAAA
    nop
    nop
    nop
    nop
    nop
    andi x2, x1, 0xAA
    nop
    nop
    nop
    nop
    nop
    andi x1, x2, 0xAA
    nop
    nop
    nop
    nop
    andi x3, x4, 0x55
    nop
    nop
    nop
    nop
    andi x5, x6, 0xF0
    nop
    nop
    nop
    nop
    andi x7, x8, 0x0F
    nop
    nop
    nop
    nop
    andi x9, x10, 0x88
    nop
    nop
    nop
    nop
    andi x11, x12, 0x22
    nop
    nop
    nop
    nop
    andi x13, x14, 0xC3
    nop
    nop
    nop
    nop
    andi x15, x16, 0x71
    nop
    nop
    nop
    nop
    andi x17, x18, 0x99
    nop
    nop
    nop
    nop
    andi x19, x20, 0x44
    nop
    nop
    nop
    nop
    andi x21, x22, 0xBB
    nop
    nop
    nop
    nop
    andi x23, x24, 0x66
    nop
    nop
    nop
    nop
    andi x25, x26, 0xDD
    nop
    nop
    nop
    nop
    andi x27, x28, 0x33
    nop
    nop
    nop
    nop
    andi x29, x30, 0xEE
    nop
    nop
    nop
    nop
    andi x31, x1, 0xAA
    nop
    nop
    nop
    nop
    andi x2, x3, 0x55
    nop
    nop
    nop
    nop
    andi x4, x5, 0xF0
    nop
    nop
    nop
    nop
    andi x6, x7, 0x0F
    nop
    nop
    nop
    nop
    andi x8, x9, 0x88
    nop
    nop
    nop
    nop
    andi x10, x11, 0x22
    nop
    nop
    nop
    nop
    andi x12, x13, 0xC3
    nop
    nop
    nop
    nop
    andi x14, x15, 0x71
    nop
    nop
    nop
    nop
    andi x16, x17, 0x99
    nop
    nop
    nop
    nop
    andi x18, x19, 0x44
    nop
    nop
    nop
    nop
    andi x20, x21, 0xBB
    nop
    nop
    nop
    nop
    andi x22, x23, 0x66
    nop
    nop
    nop
    nop
    andi x24, x25, 0xDD
    nop
    nop
    nop
    nop
    andi x26, x27, 0x33
    nop
    nop
    nop
    nop
    andi x28, x29, 0xEE
    nop
    nop
    nop
    nop

    nop
    nop
    nop
    nop
    nop
    lui x0, 0x938 # x1 <= 4          0x00000093
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x1, 0x100
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x2, 0x200
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x3, 0x300
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x4, 0x400
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x5, 0x500
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x6, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x7, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x8, 0x700
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x9, 0x800
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x10, 0x900
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x11, 0xA00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x12, 0xB00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x13, 0xC00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x14, 0xD00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x15, 0xE00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x16, 0xF00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x17, 0x123
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x18, 0x456
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x19, 0x789
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x20, 0xAB0
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x21, 0xCDE
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x22, 0x111
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x23, 0x222
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x24, 0x333
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x25, 0x444
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x26, 0x555
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x27, 0x666
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x28, 0x777
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x29, 0x888
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x30, 0x999
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x31, 0xAAA
    nop
    nop
    nop
    nop
    nop
    slli x2, x1, 2                  #0x00209113
    nop
    nop
    nop
    nop
    slli x2, x1, 0x02
    nop
    nop
    nop
    nop
    slli x3, x2, 0x04
    nop
    nop
    nop
    nop
    slli x4, x3, 0x06
    nop
    nop
    nop
    nop
    slli x5, x4, 0x08
    nop
    nop
    nop
    nop
    slli x6, x5, 0x0A
    nop
    nop
    nop
    nop
    slli x7, x6, 0x0C
    nop
    nop
    nop
    nop
    slli x8, x7, 0x0E
    nop
    nop
    nop
    nop
    slli x9, x8, 0x10
    nop
    nop
    nop
    nop
    slli x10, x9, 0x12
    nop
    nop
    nop
    nop
    slli x11, x10, 0x14
    nop
    nop
    nop
    nop
    slli x12, x11, 0x16
    nop
    nop
    nop
    nop
    slli x13, x12, 0x18
    nop
    nop
    nop
    nop
    slli x14, x13, 0x1A
    nop
    nop
    nop
    nop
    slli x15, x14, 0x1C
    nop
    nop
    nop
    nop
    slli x16, x15, 0x1E
    nop
    nop
    nop
    nop
    slli x17, x16, 0x10
    nop
    nop
    nop
    nop
    slli x18, x17, 0x12
    nop
    nop
    nop
    nop
    slli x19, x18, 0x14
    nop
    nop
    nop
    nop
    slli x20, x19, 0x16
    nop
    nop
    nop
    nop
    slli x21, x20, 0x18
    nop
    nop
    nop
    nop
    slli x22, x21, 0x1A
    nop
    nop
    nop
    nop
    slli x23, x22, 0x1C
    nop
    nop
    nop
    nop
    slli x24, x23, 0x1E
    nop
    nop
    nop
    nop
    slli x25, x24, 0x10
    nop
    nop
    nop
    nop
    slli x26, x25, 0x12
    nop
    nop
    nop
    nop
    slli x27, x26, 0x14
    nop
    nop
    nop
    nop
    slli x28, x27, 0x16
    nop
    nop
    nop
    nop
    slli x29, x28, 0x18
    nop
    nop
    nop
    nop
    slli x30, x29, 0x1A
    nop
    nop
    nop
    nop
    slli x31, x30, 0x1C
    nop
    nop
    nop
    nop
    slli x1, x31, 0x1E
    nop
    nop
    nop
    nop
    slli x0, x1, 0x10

    nop
    nop
    nop
    nop
    nop
    lui x0, 0x938 # x1 <= 4          0x00000093
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x1, 0x100
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x2, 0x200
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x3, 0x300
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x4, 0x400
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x5, 0x500
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x6, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x7, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x8, 0x700
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x9, 0x800
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x10, 0x900
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x11, 0xA00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x12, 0xB00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x13, 0xC00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x14, 0xD00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x15, 0xE00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x16, 0xF00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x17, 0x123
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x18, 0x456
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x19, 0x789
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x20, 0xAB0
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x21, 0xCDE
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x22, 0x111
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x23, 0x222
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x24, 0x333
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x25, 0x444
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x26, 0x555
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x27, 0x666
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x28, 0x777
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x29, 0x888
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x30, 0x999
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x31, 0xAAA
    nop
    nop
    nop
    nop
    nop
    srli x2, x1, 2                  #0x0020d113
    nop
    nop
    nop
    nop
    nop
    srli x2, x1, 0x02
    nop
    nop
    nop
    nop
    srli x3, x2, 0x04
    nop
    nop
    nop
    nop
    srli x4, x3, 0x06
    nop
    nop
    nop
    nop
    srli x5, x4, 0x08
    nop
    nop
    nop
    nop
    srli x6, x5, 0x0A
    nop
    nop
    nop
    nop
    srli x7, x6, 0x0C
    nop
    nop
    nop
    nop
    srli x8, x7, 0x0E
    nop
    nop
    nop
    nop
    srli x9, x8, 0x10
    nop
    nop
    nop
    nop
    srli x10, x9, 0x12
    nop
    nop
    nop
    nop
    srli x11, x10, 0x14
    nop
    nop
    nop
    nop
    srli x12, x11, 0x16
    nop
    nop
    nop
    nop
    srli x13, x12, 0x18
    nop
    nop
    nop
    nop
    srli x14, x13, 0x1A
    nop
    nop
    nop
    nop
    srli x15, x14, 0x1C
    nop
    nop
    nop
    nop
    srli x16, x15, 0x1E
    nop
    nop
    nop
    nop
    srli x17, x16, 0x10
    nop
    nop
    nop
    nop
    srli x18, x17, 0x12
    nop
    nop
    nop
    nop
    srli x19, x18, 0x14
    nop
    nop
    nop
    nop
    srli x20, x19, 0x18
    nop
    nop
    nop
    nop
    srli x21, x20, 0x18
    nop
    nop
    nop
    nop
    srli x22, x21, 0x1A
    nop
    nop
    nop
    nop
    srli x23, x22, 0x1C
    nop
    nop
    nop
    nop
    srli x24, x23, 0x1E
    nop
    nop
    nop
    nop
    srli x25, x24, 0x10
    nop
    nop
    nop
    nop
    srli x26, x25, 0x12
    nop
    nop
    nop
    nop
    srli x27, x26, 0x14
    nop
    nop
    nop
    nop
    srli x28, x27, 0x16
    nop
    nop
    nop
    nop
    srli x29, x28, 0x18
    nop
    nop
    nop
    nop
    srli x30, x29, 0x1A
    nop
    nop
    nop
    nop
    srli x31, x30, 0x1C
    nop
    nop
    nop
    nop
    srli x1, x31, 0x1E
    nop
    nop
    nop
    nop
    srli x0, x1, 0x10

    nop
    nop
    nop
    nop
    nop
    lui x0, 0x938 # x1 <= 4          0x00000093
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x1, 0x100
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x2, 0x200
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x3, 0x300
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x4, 0x400
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x5, 0x500
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x6, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x7, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x8, 0x700
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x9, 0x800
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x10, 0x900
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x11, 0xA00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x12, 0xB00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x13, 0xC00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x14, 0xD00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x15, 0xE00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x16, 0xF00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x17, 0x123
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x18, 0x456
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x19, 0x789
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x20, 0xAB0
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x21, 0xCDE
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x22, 0x111
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x23, 0x222
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x24, 0x333
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x25, 0x444
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x26, 0x555
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x27, 0x666
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x28, 0x777
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x29, 0x888
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x30, 0x999
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x31, 0xAAA
    nop
    nop
    nop
    nop
    nop
    addi x1, x0, -4  # x1 <= 4
    nop
    nop
    nop
    nop
    nop
    srai x2, x1, 2
    nop
    nop
    nop
    nop
    nop
    srai x2, x1, 2
    nop
    nop
    nop
    nop
    srai x3, x2, 4
    nop
    nop
    nop
    nop
    srai x4, x3, 6
    nop
    nop
    nop
    nop
    srai x5, x4, 8
    nop
    nop
    nop
    nop
    srai x6, x5, 10
    nop
    nop
    nop
    nop
    srai x7, x6, 12
    nop
    nop
    nop
    nop
    srai x8, x7, 1
    nop
    nop
    nop
    nop
    srai x9, x8, 3
    nop
    nop
    nop
    nop
    srai x10, x9, 5
    nop
    nop
    nop
    nop
    srai x11, x10, 7
    nop
    nop
    nop
    nop
    srai x12, x11, 9
    nop
    nop
    nop
    nop
    srai x13, x12, 11
    nop
    nop
    nop
    nop
    srai x14, x13, 13
    nop
    nop
    nop
    nop
    srai x15, x14, 12
    nop
    nop
    nop
    nop
    srai x16, x15, 1
    nop
    nop
    nop
    nop
    srai x17, x16, 4
    nop
    nop
    nop
    nop
    srai x18, x17, 7
    nop
    nop
    nop
    nop
    srai x19, x18, 10
    nop
    nop
    nop
    nop
    srai x20, x19, 2
    nop
    nop
    nop
    nop
    srai x21, x20, 5
    nop
    nop
    nop
    nop
    srai x22, x21, 8
    nop
    nop
    nop
    nop
    srai x23, x22, 11
    nop
    nop
    nop
    nop
    srai x24, x23, 3
    nop
    nop
    nop
    nop
    srai x25, x24, 6
    nop
    nop
    nop
    nop
    srai x26, x25, 9
    nop
    nop
    nop
    nop
    srai x27, x26, 12
    nop
    nop
    nop
    nop
    srai x28, x27, 1
    nop
    nop
    nop
    nop
    srai x29, x28, 4
    nop
    nop
    nop
    nop
    srai x30, x29, 7
    nop
    nop
    nop
    nop
    srai x31, x30, 10
    nop
    nop
    nop
    nop
    srai x1, x31, 2
    nop
    nop
    nop
    nop
    srai x0, x1, 5


    nop
    nop
    nop
    nop
    nop
    addi x1, x0, 2
    nop
    nop
    nop
    nop
    nop
    addi x2, x0, 7

    nop
    nop
    nop
    nop
    nop
    lui x0, 0x938 # x1 <= 4          0x00000093
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x1, 0x100
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x2, 0x200
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x3, 0x300
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x4, 0x400
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x5, 0x500
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x6, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x7, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x8, 0x700
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x9, 0x800
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x10, 0x900
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x11, 0xA00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x12, 0xB00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x13, 0xC00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x14, 0xD00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x15, 0xE00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x16, 0xF00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x17, 0x123
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x18, 0x456
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x19, 0x789
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x20, 0xAB0
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x21, 0xCDE
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x22, 0x111
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x23, 0x222
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x24, 0x333
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x25, 0x444
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x26, 0x555
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x27, 0x666
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x28, 0x777
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x29, 0x888
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x30, 0x999
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x31, 0xAAA
    nop
    nop
    nop
    nop
    nop
    add x3, x1, x2
    nop
    nop
    nop
    nop
    nop
    add x3, x1, x2
    nop
    nop
    nop
    nop
    add x4, x2, x3
    nop
    nop
    nop
    nop
    add x5, x3, x4
    nop
    nop
    nop
    nop
    add x6, x4, x5
    nop
    nop
    nop
    nop
    add x7, x5, x6
    nop
    nop
    nop
    nop
    add x8, x6, x7
    nop
    nop
    nop
    nop
    add x9, x7, x8
    nop
    nop
    nop
    nop
    add x10, x8, x9
    nop
    nop
    nop
    nop
    add x11, x9, x10
    nop
    nop
    nop
    nop
    add x12, x10, x11
    nop
    nop
    nop
    nop
    add x13, x11, x12
    nop
    nop
    nop
    nop
    add x14, x12, x13
    nop
    nop
    nop
    nop
    add x15, x13, x14
    nop
    nop
    nop
    nop
    add x16, x14, x15
    nop
    nop
    nop
    nop
    add x17, x15, x16
    nop
    nop
    nop
    nop
    add x18, x16, x17
    nop
    nop
    nop
    nop
    add x19, x17, x18
    nop
    nop
    nop
    nop
    add x20, x18, x19
    nop
    nop
    nop
    nop
    add x21, x19, x20
    nop
    nop
    nop
    nop
    add x22, x20, x21
    nop
    nop
    nop
    nop
    add x23, x21, x22
    nop
    nop
    nop
    nop
    add x24, x22, x23
    nop
    nop
    nop
    nop
    add x25, x23, x24
    nop
    nop
    nop
    nop
    add x26, x24, x25
    nop
    nop
    nop
    nop
    add x27, x25, x26
    nop
    nop
    nop
    nop
    add x28, x26, x27
    nop
    nop
    nop
    nop
    add x29, x27, x28
    nop
    nop
    nop
    nop
    add x30, x28, x29
    nop
    nop
    nop
    nop
    add x31, x29, x30
    nop
    nop
    nop
    nop
    add x1, x30, x31
    nop
    nop
    nop
    nop
    add x0, x31, x1

    nop
    nop
    nop
    nop
    nop
    lui x0, 0x938 # x1 <= 4          0x00000093
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x1, 0x100
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x2, 0x200
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x3, 0x300
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x4, 0x400
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x5, 0x500
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x6, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x7, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x8, 0x700
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x9, 0x800
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x10, 0x900
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x11, 0xA00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x12, 0xB00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x13, 0xC00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x14, 0xD00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x15, 0xE00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x16, 0xF00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x17, 0x123
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x18, 0x456
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x19, 0x789
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x20, 0xAB0
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x21, 0xCDE
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x22, 0x111
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x23, 0x222
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x24, 0x333
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x25, 0x444
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x26, 0x555
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x27, 0x666
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x28, 0x777
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x29, 0x888
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x30, 0x999
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x31, 0xAAA
    nop
    nop
    nop
    nop
    nop
    sub x3, x1, x2                          #0x402081b3
    nop
    nop
    nop
    nop
    sub x3, x1, x2
    nop
    nop
    nop
    nop
    sub x4, x2, x3
    nop
    nop
    nop
    nop
    sub x5, x3, x4
    nop
    nop
    nop
    nop
    sub x6, x4, x5
    nop
    nop
    nop
    nop
    sub x7, x5, x6
    nop
    nop
    nop
    nop
    sub x8, x6, x7
    nop
    nop
    nop
    nop
    sub x9, x7, x8
    nop
    nop
    nop
    nop
    sub x10, x8, x9
    nop
    nop
    nop
    nop
    sub x11, x9, x10
    nop
    nop
    nop
    nop
    sub x12, x10, x11
    nop
    nop
    nop
    nop
    sub x13, x11, x12
    nop
    nop
    nop
    nop
    sub x14, x12, x13
    nop
    nop
    nop
    nop
    sub x15, x13, x14
    nop
    nop
    nop
    nop
    sub x16, x14, x15
    nop
    nop
    nop
    nop
    sub x17, x15, x16
    nop
    nop
    nop
    nop
    sub x18, x16, x17
    nop
    nop
    nop
    nop
    sub x19, x17, x18
    nop
    nop
    nop
    nop
    sub x20, x18, x19
    nop
    nop
    nop
    nop
    sub x21, x19, x20
    nop
    nop
    nop
    nop
    sub x22, x20, x21
    nop
    nop
    nop
    nop
    sub x23, x21, x22
    nop
    nop
    nop
    nop
    sub x24, x22, x23
    nop
    nop
    nop
    nop
    sub x25, x23, x24
    nop
    nop
    nop
    nop
    sub x26, x24, x25
    nop
    nop
    nop
    nop
    sub x27, x25, x26
    nop
    nop
    nop
    nop
    sub x28, x26, x27
    nop
    nop
    nop
    nop
    sub x29, x27, x28
    nop
    nop
    nop
    nop
    sub x30, x28, x29
    nop
    nop
    nop
    nop
    sub x31, x29, x30
    nop
    nop
    nop
    nop
    sub x1, x30, x31
    nop
    nop
    nop
    nop
    sub x0, x31, x1

    nop
    nop
    nop
    nop
    nop
    lui x0, 0x938 # x1 <= 4          0x00000093
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x1, 0x100
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x2, 0x200
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x3, 0x300
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x4, 0x400
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x5, 0x500
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x6, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x7, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x8, 0x700
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x9, 0x800
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x10, 0x900
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x11, 0xA00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x12, 0xB00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x13, 0xC00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x14, 0xD00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x15, 0xE00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x16, 0xF00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x17, 0x123
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x18, 0x456
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x19, 0x789
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x20, 0xAB0
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x21, 0xCDE
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x22, 0x111
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x23, 0x222
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x24, 0x333
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x25, 0x444
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x26, 0x555
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x27, 0x666
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x28, 0x777
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x29, 0x888
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x30, 0x999
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x31, 0xAAA
    nop
    nop
    nop
    nop
    nop
    sll x3, x2, x1
     nop
    nop
    nop
    nop
    sll x3, x1, x2
    nop
    nop
    nop
    nop
    sll x4, x2, x3
    nop
    nop
    nop
    nop
    sll x5, x3, x4
    nop
    nop
    nop
    nop
    sll x6, x4, x5
    nop
    nop
    nop
    nop
    sll x7, x5, x6
    nop
    nop
    nop
    nop
    sll x8, x6, x7
    nop
    nop
    nop
    nop
    sll x9, x7, x8
    nop
    nop
    nop
    nop
    sll x10, x8, x9
    nop
    nop
    nop
    nop
    sll x11, x9, x10
    nop
    nop
    nop
    nop
    sll x12, x10, x11
    nop
    nop
    nop
    nop
    sll x13, x11, x12
    nop
    nop
    nop
    nop
    sll x14, x12, x13
    nop
    nop
    nop
    nop
    sll x15, x13, x14
    nop
    nop
    nop
    nop
    sll x16, x14, x15
    nop
    nop
    nop
    nop
    sll x17, x15, x16
    nop
    nop
    nop
    nop
    sll x18, x16, x17
    nop
    nop
    nop
    nop
    sll x19, x17, x18
    nop
    nop
    nop
    nop
    sll x20, x18, x19
    nop
    nop
    nop
    nop
    sll x21, x19, x20
    nop
    nop
    nop
    nop
    sll x22, x20, x21
    nop
    nop
    nop
    nop
    sll x23, x21, x22
    nop
    nop
    nop
    nop
    sll x24, x22, x23
    nop
    nop
    nop
    nop
    sll x25, x23, x24
    nop
    nop
    nop
    nop
    sll x26, x24, x25
    nop
    nop
    nop
    nop
    sll x27, x25, x26
    nop
    nop
    nop
    nop
    sll x28, x26, x27
    nop
    nop
    nop
    nop
    sll x29, x27, x28
    nop
    nop
    nop
    nop
    sll x30, x28, x29
    nop
    nop
    nop
    nop
    sll x31, x29, x30
    nop
    nop
    nop
    nop
    sll x1, x30, x31
    nop
    nop
    nop
    nop
    sll x0, x31, x1

    nop
    nop
    nop
    nop
    nop
    sll x31, x31, 31
     nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    lui x0, 0x938 # x1 <= 4          0x00000093
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x1, 0x100
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x2, 0x200
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x3, 0x300
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x4, 0x400
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x5, 0x500
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x6, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x7, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x8, 0x700
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x9, 0x800
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x10, 0x900
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x11, 0xA00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x12, 0xB00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x13, 0xC00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x14, 0xD00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x15, 0xE00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x16, 0xF00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x17, 0x123
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x18, 0x456
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x19, 0x789
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x20, 0xAB0
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x21, 0xCDE
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x22, 0x111
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x23, 0x222
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x24, 0x333
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x25, 0x444
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x26, 0x555
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x27, 0x666
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x28, 0x777
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x29, 0x888
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x30, 0x999
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x31, 0xAAA
    auipc x1, 4096
     nop
    nop
    nop
    nop
    auipc x2, 8192
     nop
    nop
    nop
    nop
    auipc x3, 16384
     nop
    nop
    nop
    nop
    auipc x4, 32768
     nop
    nop
    nop
    nop
    auipc x5, 65536
     nop
    nop
    nop
    nop
    auipc x6, 131072
     nop
    nop
    nop
    nop
    auipc x8, 262144
     nop
    nop
    nop
    nop
    auipc x9, 524288
     nop
    nop
    nop
    nop
    auipc x10, 10485
     nop
    nop
    nop
    nop
    auipc x11, 2097
     nop
    nop
    nop
    nop
    auipc x12, 4194
     nop
    nop
    nop
    nop
    auipc x13, 8388
     nop
    nop
    nop
    nop
    auipc x14, 16777
     nop
    nop
    nop
    nop
    auipc x15, 33554
     nop
    nop
    nop
    nop
    auipc x16, 6710
     nop
    nop
    nop
    nop
    auipc x17, 1342
     nop
    nop
    nop
    nop
    auipc x18, 2684
     nop
    nop
    nop
    nop
    auipc x19, 5368
     nop
    nop
    nop
    nop
    auipc x20, 1073
     nop
    nop
    nop
    nop
    auipc x21, 2147

    nop
    nop
    nop
    nop
    nop
    lui x0, 0x938 # x1 <= 4          0x00000093
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x1, 0x100
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x2, 0x200
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x3, 0x300
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x4, 0x400
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x5, 0x500
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x6, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x7, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x8, 0x700
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x9, 0x800
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x10, 0x900
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x11, 0xA00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x12, 0xB00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x13, 0xC00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x14, 0xD00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x15, 0xE00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x16, 0xF00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x17, 0x123
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x18, 0x456
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x19, 0x789
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x20, 0xAB0
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x21, 0xCDE
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x22, 0x111
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x23, 0x222
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x24, 0x333
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x25, 0x444
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x26, 0x555
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x27, 0x666
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x28, 0x777
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x29, 0x888
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x30, 0x999
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x31, 0xAAA

    nop
    nop
    nop
    nop
    nop
    slt x3, x2, x1                          #0x001121b3
     nop
    nop
    nop
    nop
    slt x3, x1, x2
    nop
    nop
    nop
    nop
    slt x4, x2, x3
    nop
    nop
    nop
    nop
    slt x5, x3, x4
    nop
    nop
    nop
    nop
    slt x6, x4, x5
    nop
    nop
    nop
    nop
    slt x7, x5, x6
    nop
    nop
    nop
    nop
    slt x8, x6, x7
    nop
    nop
    nop
    nop
    slt x9, x7, x8
    nop
    nop
    nop
    nop
    slt x10, x8, x9
    nop
    nop
    nop
    nop
    slt x11, x9, x10
    nop
    nop
    nop
    nop
    slt x12, x10, x11
    nop
    nop
    nop
    nop
    slt x13, x11, x12
    nop
    nop
    nop
    nop
    slt x14, x12, x13
    nop
    nop
    nop
    nop
    slt x15, x13, x14
    nop
    nop
    nop
    nop
    slt x16, x14, x15
    nop
    nop
    nop
    nop
    slt x17, x15, x16
    nop
    nop
    nop
    nop
    slt x18, x16, x17
    nop
    nop
    nop
    nop
    slt x19, x17, x18
    nop
    nop
    nop
    nop
    slt x20, x18, x19
    nop
    nop
    nop
    nop
    slt x21, x19, x20
    nop
    nop
    nop
    nop
    slt x22, x20, x21
    nop
    nop
    nop
    nop
    slt x23, x21, x22
    nop
    nop
    nop
    nop
    slt x24, x22, x23
    nop
    nop
    nop
    nop
    slt x25, x23, x24
    nop
    nop
    nop
    nop
    slt x26, x24, x25
    nop
    nop
    nop
    nop
    slt x27, x25, x26
    nop
    nop
    nop
    nop
    slt x28, x26, x27
    nop
    nop
    nop
    nop
    slt x29, x27, x28
    nop
    nop
    nop
    nop
    slt x30, x28, x29
    nop
    nop
    nop
    nop
    slt x31, x29, x30
    nop
    nop
    nop
    nop
    slt x1, x30, x31
    nop
    nop
    nop
    nop
    slt x0, x31, x1

    nop
    nop
    nop
    nop
    nop
    lui x0, 0x938 # x1 <= 4          0x00000093
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x1, 0x100
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x2, 0x200
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x3, 0x300
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x4, 0x400
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x5, 0x500
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x6, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x7, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x8, 0x700
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x9, 0x800
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x10, 0x900
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x11, 0xA00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x12, 0xB00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x13, 0xC00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x14, 0xD00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x15, 0xE00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x16, 0xF00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x17, 0x123
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x18, 0x456
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x19, 0x789
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x20, 0xAB0
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x21, 0xCDE
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x22, 0x111
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x23, 0x222
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x24, 0x333
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x25, 0x444
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x26, 0x555
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x27, 0x666
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x28, 0x777
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x29, 0x888
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x30, 0x999
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x31, 0xAAA

    nop
    nop
    nop
    nop
    nop
    addi x1, x0, -1
    nop
    nop
    nop
    nop
    nop
    sltu x3, x2, x1
     nop
    nop
    nop
    nop
    sltu x3, x1, x2
    nop
    nop
    nop
    nop
    sltu x4, x2, x3
    nop
    nop
    nop
    nop
    sltu x5, x3, x4
    nop
    nop
    nop
    nop
    sltu x6, x4, x5
    nop
    nop
    nop
    nop
    sltu x7, x5, x6
    nop
    nop
    nop
    nop
    sltu x8, x6, x7
    nop
    nop
    nop
    nop
    sltu x9, x7, x8
    nop
    nop
    nop
    nop
    sltu x10, x8, x9
    nop
    nop
    nop
    nop
    sltu x11, x9, x10
    nop
    nop
    nop
    nop
    sltu x12, x10, x11
    nop
    nop
    nop
    nop
    sltu x13, x11, x12
    nop
    nop
    nop
    nop
    sltu x14, x12, x13
    nop
    nop
    nop
    nop
    sltu x15, x13, x14
    nop
    nop
    nop
    nop
    sltu x16, x14, x15
    nop
    nop
    nop
    nop
    sltu x17, x15, x16
    nop
    nop
    nop
    nop
    sltu x18, x16, x17
    nop
    nop
    nop
    nop
    sltu x19, x17, x18
    nop
    nop
    nop
    nop
    sltu x20, x18, x19
    nop
    nop
    nop
    nop
    sltu x21, x19, x20
    nop
    nop
    nop
    nop
    sltu x22, x20, x21
    nop
    nop
    nop
    nop
    sltu x23, x21, x22
    nop
    nop
    nop
    nop
    sltu x24, x22, x23
    nop
    nop
    nop
    nop
    sltu x25, x23, x24
    nop
    nop
    nop
    nop
    sltu x26, x24, x25
    nop
    nop
    nop
    nop
    sltu x27, x25, x26
    nop
    nop
    nop
    nop
    sltu x28, x26, x27
    nop
    nop
    nop
    nop
    sltu x29, x27, x28
    nop
    nop
    nop
    nop
    sltu x30, x28, x29
    nop
    nop
    nop
    nop
    sltu x31, x29, x30
    nop
    nop
    nop
    nop
    sltu x1, x30, x31
    nop
    nop
    nop
    nop
    sltu x0, x31, x1

    nop
    nop
    nop
    nop
    nop
    lui x0, 0x938 # x1 <= 4          0x00000093
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x1, 0x100
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x2, 0x200
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x3, 0x300
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x4, 0x400
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x5, 0x500
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x6, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x7, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x8, 0x700
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x9, 0x800
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x10, 0x900
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x11, 0xA00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x12, 0xB00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x13, 0xC00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x14, 0xD00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x15, 0xE00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x16, 0xF00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x17, 0x123
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x18, 0x456
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x19, 0x789
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x20, 0xAB0
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x21, 0xCDE
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x22, 0x111
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x23, 0x222
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x24, 0x333
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x25, 0x444
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x26, 0x555
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x27, 0x666
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x28, 0x777
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x29, 0x888
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x30, 0x999
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x31, 0xAAA
    nop
    nop
    nop
    nop
    nop
    addi x1, x0, 0x55
    nop
    nop
    nop
    nop
    nop
    addi x2, x0, 0xAA
    nop
    nop
    nop
    nop
    nop
    xor x3, x1, x2
     nop
    nop
    nop
    nop
    xor x3, x1, x2
    nop
    nop
    nop
    nop
    xor x4, x2, x3
    nop
    nop
    nop
    nop
    xor x5, x3, x4
    nop
    nop
    nop
    nop
    xor x6, x4, x5
    nop
    nop
    nop
    nop
    xor x7, x5, x6
    nop
    nop
    nop
    nop
    xor x8, x6, x7
    nop
    nop
    nop
    nop
    xor x9, x7, x8
    nop
    nop
    nop
    nop
    xor x10, x8, x9
    nop
    nop
    nop
    nop
    xor x11, x9, x10
    nop
    nop
    nop
    nop
    xor x12, x10, x11
    nop
    nop
    nop
    nop
    xor x13, x11, x12
    nop
    nop
    nop
    nop
    xor x14, x12, x13
    nop
    nop
    nop
    nop
    xor x15, x13, x14
    nop
    nop
    nop
    nop
    xor x16, x14, x15
    nop
    nop
    nop
    nop
    xor x17, x15, x16
    nop
    nop
    nop
    nop
    xor x18, x16, x17
    nop
    nop
    nop
    nop
    xor x19, x17, x18
    nop
    nop
    nop
    nop
    xor x20, x18, x19
    nop
    nop
    nop
    nop
    xor x21, x19, x20
    nop
    nop
    nop
    nop
    xor x22, x20, x21
    nop
    nop
    nop
    nop
    xor x23, x21, x22
    nop
    nop
    nop
    nop
    xor x24, x22, x23
    nop
    nop
    nop
    nop
    xor x25, x23, x24
    nop
    nop
    nop
    nop
    xor x26, x24, x25
    nop
    nop
    nop
    nop
    xor x27, x25, x26
    nop
    nop
    nop
    nop
    xor x28, x26, x27
    nop
    nop
    nop
    nop
    xor x29, x27, x28
    nop
    nop
    nop
    nop
    xor x30, x28, x29
    nop
    nop
    nop
    nop
    xor x31, x29, x30
    nop
    nop
    nop
    nop
    xor x1, x30, x31
    nop
    nop
    nop
    nop
    xor x0, x31, x1

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    lui x0, 0x938 # x1 <= 4          0x00000093
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x1, 0x100
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x2, 0x200
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x3, 0x300
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x4, 0x400
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x5, 0x500
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x6, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x7, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x8, 0x700
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x9, 0x800
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x10, 0x900
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x11, 0xA00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x12, 0xB00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x13, 0xC00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x14, 0xD00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x15, 0xE00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x16, 0xF00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x17, 0x123
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x18, 0x456
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x19, 0x789
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x20, 0xAB0
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x21, 0xCDE
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x22, 0x111
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x23, 0x222
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x24, 0x333
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x25, 0x444
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x26, 0x555
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x27, 0x666
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x28, 0x777
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x29, 0x888
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x30, 0x999
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x31, 0xAAA
    and x3, x1, x2
     nop
    nop
    nop
    nop
    and x3, x1, x2
    nop
    nop
    nop
    nop
    and x4, x2, x3
    nop
    nop
    nop
    nop
    and x5, x3, x4
    nop
    nop
    nop
    nop
    and x6, x4, x5
    nop
    nop
    nop
    nop
    and x7, x5, x6
    nop
    nop
    nop
    nop
    and x8, x6, x7
    nop
    nop
    nop
    nop
    and x9, x7, x8
    nop
    nop
    nop
    nop
    and x10, x8, x9
    nop
    nop
    nop
    nop
    and x11, x9, x10
    nop
    nop
    nop
    nop
    and x12, x10, x11
    nop
    nop
    nop
    nop
    and x13, x11, x12
    nop
    nop
    nop
    nop
    and x14, x12, x13
    nop
    nop
    nop
    nop
    and x15, x13, x14
    nop
    nop
    nop
    nop
    and x16, x14, x15
    nop
    nop
    nop
    nop
    and x17, x15, x16
    nop
    nop
    nop
    nop
    and x18, x16, x17
    nop
    nop
    nop
    nop
    and x19, x17, x18
    nop
    nop
    nop
    nop
    and x20, x18, x19
    nop
    nop
    nop
    nop
    and x21, x19, x20
    nop
    nop
    nop
    nop
    and x22, x20, x21
    nop
    nop
    nop
    nop
    and x23, x21, x22
    nop
    nop
    nop
    nop
    and x24, x22, x23
    nop
    nop
    nop
    nop
    and x25, x23, x24
    nop
    nop
    nop
    nop
    and x26, x24, x25
    nop
    nop
    nop
    nop
    and x27, x25, x26
    nop
    nop
    nop
    nop
    and x28, x26, x27
    nop
    nop
    nop
    nop
    and x29, x27, x28
    nop
    nop
    nop
    nop
    and x30, x28, x29
    nop
    nop
    nop
    nop
    and x31, x29, x30
    nop
    nop
    nop
    nop
    and x1, x30, x31
    nop
    nop
    nop
    nop
    and x0, x31, x1

    nop
    nop
    nop
    nop
    nop
    lui x0, 0x938 # x1 <= 4          0x00000093
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x1, 0x100
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x2, 0x200
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x3, 0x300
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x4, 0x400
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x5, 0x500
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x6, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x7, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x8, 0x700
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x9, 0x800
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x10, 0x900
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x11, 0xA00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x12, 0xB00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x13, 0xC00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x14, 0xD00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x15, 0xE00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x16, 0xF00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x17, 0x123
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x18, 0x456
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x19, 0x789
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x20, 0xAB0
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x21, 0xCDE
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x22, 0x111
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x23, 0x222
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x24, 0x333
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x25, 0x444
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x26, 0x555
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x27, 0x666
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x28, 0x777
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x29, 0x888
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x30, 0x999
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x31, 0xAAA
    nop
    nop
    nop
    nop
    nop
    or x3, x1, x2
     nop
    nop
    nop
    nop
    or x3, x1, x2
    nop
    nop
    nop
    nop
    or x4, x2, x3
    nop
    nop
    nop
    nop
    or x5, x3, x4
    nop
    nop
    nop
    nop
    or x6, x4, x5
    nop
    nop
    nop
    nop
    or x7, x5, x6
    nop
    nop
    nop
    nop
    or x8, x6, x7
    nop
    nop
    nop
    nop
    or x9, x7, x8
    nop
    nop
    nop
    nop
    or x10, x8, x9
    nop
    nop
    nop
    nop
    or x11, x9, x10
    nop
    nop
    nop
    nop
    or x12, x10, x11
    nop
    nop
    nop
    nop
    or x13, x11, x12
    nop
    nop
    nop
    nop
    or x14, x12, x13
    nop
    nop
    nop
    nop
    or x15, x13, x14
    nop
    nop
    nop
    nop
    or x16, x14, x15
    nop
    nop
    nop
    nop
    or x17, x15, x16
    nop
    nop
    nop
    nop
    or x18, x16, x17
    nop
    nop
    nop
    nop
    or x19, x17, x18
    nop
    nop
    nop
    nop
    or x20, x18, x19
    nop
    nop
    nop
    nop
    or x21, x19, x20
    nop
    nop
    nop
    nop
    or x22, x20, x21
    nop
    nop
    nop
    nop
    or x23, x21, x22
    nop
    nop
    nop
    nop
    or x24, x22, x23
    nop
    nop
    nop
    nop
    or x25, x23, x24
    nop
    nop
    nop
    nop
    or x26, x24, x25
    nop
    nop
    nop
    nop
    or x27, x25, x26
    nop
    nop
    nop
    nop
    or x28, x26, x27
    nop
    nop
    nop
    nop
    or x29, x27, x28
    nop
    nop
    nop
    nop
    or x30, x28, x29
    nop
    nop
    nop
    nop
    or x31, x29, x30
    nop
    nop
    nop
    nop
    or x1, x30, x31
    nop
    nop
    nop
    nop
    or x0, x31, x1

    nop
    nop
    nop
    nop
    nop
    lui x0, 0x938 # x1 <= 4          0x00000093
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x1, 0x100
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x2, 0x200
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x3, 0x300
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x4, 0x400
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x5, 0x500
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x6, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x7, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x8, 0x700
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x9, 0x800
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x10, 0x900
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x11, 0xA00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x12, 0xB00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x13, 0xC00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x14, 0xD00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x15, 0xE00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x16, 0xF00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x17, 0x123
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x18, 0x456
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x19, 0x789
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x20, 0xAB0
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x21, 0xCDE
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x22, 0x111
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x23, 0x222
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x24, 0x333
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x25, 0x444
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x26, 0x555
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x27, 0x666
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x28, 0x777
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x29, 0x888
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x30, 0x999
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x31, 0xAAA
    nop
    nop
    nop
    nop
    nop
    addi x1, x0, 0x04
    nop
    nop
    nop
    nop
    nop
    addi x2, x0, 2
    nop
    nop
    nop
    nop
    nop
    srl x3, x1, x2
     nop
    nop
    nop
    nop
    srl x3, x1, x2
    nop
    nop
    nop
    nop
    srl x4, x2, x3
    nop
    nop
    nop
    nop
    srl x5, x3, x4
    nop
    nop
    nop
    nop
    srl x6, x4, x5
    nop
    nop
    nop
    nop
    srl x7, x5, x6
    nop
    nop
    nop
    nop
    srl x8, x6, x7
    nop
    nop
    nop
    nop
    srl x9, x7, x8
    nop
    nop
    nop
    nop
    srl x10, x8, x9
    nop
    nop
    nop
    nop
    srl x11, x9, x10
    nop
    nop
    nop
    nop
    srl x12, x10, x11
    nop
    nop
    nop
    nop
    srl x13, x11, x12
    nop
    nop
    nop
    nop
    srl x14, x12, x13
    nop
    nop
    nop
    nop
    srl x15, x13, x14
    nop
    nop
    nop
    nop
    srl x16, x14, x15
    nop
    nop
    nop
    nop
    srl x17, x15, x16
    nop
    nop
    nop
    nop
    srl x18, x16, x17
    nop
    nop
    nop
    nop
    srl x19, x17, x18
    nop
    nop
    nop
    nop
    srl x20, x18, x19
    nop
    nop
    nop
    nop
    srl x21, x19, x20
    nop
    nop
    nop
    nop
    srl x22, x20, x21
    nop
    nop
    nop
    nop
    srl x23, x21, x22
    nop
    nop
    nop
    nop
    srl x24, x22, x23
    nop
    nop
    nop
    nop
    srl x25, x23, x24
    nop
    nop
    nop
    nop
    srl x26, x24, x25
    nop
    nop
    nop
    nop
    srl x27, x25, x26
    nop
    nop
    nop
    nop
    srl x28, x26, x27
    nop
    nop
    nop
    nop
    srl x29, x27, x28
    nop
    nop
    nop
    nop
    srl x30, x28, x29
    nop
    nop
    nop
    nop
    srl x31, x29, x30
    nop
    nop
    nop
    nop
    srl x1, x30, x31
    nop
    nop
    nop
    nop
    srl x0, x31, x1

    nop
    nop
    nop
    nop
    nop
    lui x0, 0x938 # x1 <= 4          0x00000093
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x1, 0x100
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x2, 0x200
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x3, 0x300
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x4, 0x400
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x5, 0x500
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x6, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x7, 0x600
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x8, 0x700
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x9, 0x800
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x10, 0x900
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x11, 0xA00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x12, 0xB00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x13, 0xC00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x14, 0xD00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x15, 0xE00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x16, 0xF00
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x17, 0x123
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x18, 0x456
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x19, 0x789
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x20, 0xAB0
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x21, 0xCDE
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x22, 0x111
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x23, 0x222
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x24, 0x333
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x25, 0x444
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x26, 0x555
    nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x27, 0x666
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x28, 0x777
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x29, 0x888
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x30, 0x999
     nop
    nop
    nop             # nops in between to prevent hazard
    nop
    nop
    lui x31, 0xAAA

    nop
    nop
    nop
    nop
    nop
    addi x1, x0, -32

    nop
    nop
    nop
    nop
    nop
    sra x3, x1, x2
     nop
    nop
    nop
    nop
    sra x3, x1, x2
    nop
    nop
    nop
    nop
    sra x4, x2, x3
    nop
    nop
    nop
    nop
    sra x5, x3, x4
    nop
    nop
    nop
    nop
    sra x6, x4, x5
    nop
    nop
    nop
    nop
    sra x7, x5, x6
    nop
    nop
    nop
    nop
    sra x8, x6, x7
    nop
    nop
    nop
    nop
    sra x9, x7, x8
    nop
    nop
    nop
    nop
    sra x10, x8, x9
    nop
    nop
    nop
    nop
    sra x11, x9, x10
    nop
    nop
    nop
    nop
    sra x12, x10, x11
    nop
    nop
    nop
    nop
    sra x13, x11, x12
    nop
    nop
    nop
    nop
    sra x14, x12, x13
    nop
    nop
    nop
    nop
    sra x15, x13, x14
    nop
    nop
    nop
    nop
    sra x16, x14, x15
    nop
    nop
    nop
    nop
    sra x17, x15, x16
    nop
    nop
    nop
    nop
    sra x18, x16, x17
    nop
    nop
    nop
    nop
    sra x19, x17, x18
    nop
    nop
    nop
    nop
    sra x20, x18, x19
    nop
    nop
    nop
    nop
    sra x21, x19, x20
    nop
    nop
    nop
    nop
    sra x22, x20, x21
    nop
    nop
    nop
    nop
    sra x23, x21, x22
    nop
    nop
    nop
    nop
    sra x24, x22, x23
    nop
    nop
    nop
    nop
    sra x25, x23, x24
    nop
    nop
    nop
    nop
    sra x26, x24, x25
    nop
    nop
    nop
    nop
    sra x27, x25, x26
    nop
    nop
    nop
    nop
    sra x28, x26, x27
    nop
    nop
    nop
    nop
    sra x29, x27, x28
    nop
    nop
    nop
    nop
    sra x30, x28, x29
    nop
    nop
    nop
    nop
    sra x31, x29, x30
    nop
    nop
    nop
    nop
    sra x1, x30, x31
    nop
    nop
    nop
    nop
    sra x0, x31, x1


    slti x0, x0, -256 # this is the magic instruction to end the simulation
