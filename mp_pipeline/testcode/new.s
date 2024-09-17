.section .text
.globl _start
    # Refer to the RISC-V ISA Spec for the functionality of
    # the instructions in this test program.
_start:
    # Note that the comments in this file should not be taken as
    # an example of good commenting style!!  They are merely provided
    # in an effort to help you understand the assembly style.
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

    lw    x17,4(x18)
    lw    x16,4(x15)
    lh    x13,0(x17)
    lh    x29,2(x16)
    lh    x31,2(x17)
    sll    x5,x13,0x10
    srl    x5,x5,0x10
    and    x13,x13,-256
    srl    x5,x5,0x8




    slti x0, x0, -256 # this is the magic instruction to end the simulation
