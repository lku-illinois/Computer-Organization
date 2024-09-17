.section .text
.globl _start
    # Refer to the RISC-V ISA Spec for the functionality of
    # the instructions in this test program.
_start:
    # Note that the comments in this file should not be taken as
    # an example of good commenting style!!  They are merely provided
    # in an effort to help you understand the assembly style.

    # addi x1, x0, 4  # x1 <= 4
    # addi x3, x1, 8  # x3 <= x1 + 8
    
    
    lui x0, 0x938 # x1 <= 4          0x00000093
    lui x1, 0x100
    lui x2, 0x200
    lui x3, 0x300
    lui x4, 0x400
    lui x5, 0x4
    lui x6, 0x600
    lui x7, 0x600
    lui x8, 0x700
    lui x9, 0x800
    lui x10, 0x900
    lui x11, 0xA00
    lui x12, 0xB00
    lui x13, 0xC00
    lui x14, 0xD00
    lui x15, 0xE00
    lui x16, 0xF00
    lui x17, 0x123
    lui x18, 0x456
    lui x19, 0x789
    lui x20, 0xAB0
    lui x21, 0xCDE
    lui x22, 0x111
    lui x23, 0x222
    lui x24, 0x333
    lui x25, 0x444
    lui x26, 0x555
    lui x27, 0x666
    lui x28, 0x777
    lui x29, 0x888
    lui x30, 0x999
    lui x31, 0xAAA

    # Add your own test cases here!
    # sb x3, 6(x15)           #mem[x15+6]  <= x3
    nop
    nop
    nop
    nop
    nop
    sub  x2, x1, x3                     #0x40308133        x2 = x1 - x3 
    # lb x9, 6(x15)            #x9 <= mem[x15+6]
    and  x12, x2, x5                    #0x00517633        x12 = x2 and x5  
    or   x13, x6, x2                    #0x002366b3        x13 = x6 or x2         
    add  x14, x2, x2                    #0x00210733        x14 = x2 + x2
    and  x4, x2, x8

    slti x0, x0, -256 # this is the magic instruction to end the simulation
