# RISC-V Fundamentals

This section covers the essential basics of RISC-V architecture and assembly programming.

## Contents

1. [RISC-V Registers](./01-registers/README.md)
   - General-purpose registers (x0-x31)
   - Special register conventions (zero, ra, sp, etc.)
   - ABI register naming

2. [Basic Instructions](./02-instructions/README.md)
   - Arithmetic operations (add, sub, mul, div)
   - Logical operations (and, or, xor)
   - Shifts and rotates
   - Immediate variants

3. [Memory Operations](./03-memory/README.md)
   - Load instructions (lb, lh, lw, ld)
   - Store instructions (sb, sh, sw, sd)
   - Memory addressing modes
   - Alignment requirements

4. [Control Flow](./04-control-flow/README.md)
   - Branches (beq, bne, blt, bge)
   - Jumps (j, jal, jalr)
   - Function calls and returns

## Practice Projects

### 1. Simple Calculator
Build a basic calculator that can:
- Perform arithmetic operations
- Handle user input through registers
- Display results
- [Project Directory](./calculator/)

### 2. Memory Pattern Generator
Create a program that:
- Generates patterns in memory
- Validates memory contents
- Demonstrates different access patterns
- [Project Directory](./memory-patterns/)

## Resources

- [RISC-V ISA Specification](https://riscv.org/technical/specifications/)
- [RISC-V Assembly Programmer's Manual](https://github.com/riscv/riscv-asm-manual/blob/master/riscv-asm.md)
- [RISC-V Green Card](https://www.cl.cam.ac.uk/teaching/1617/ECAD+Arch/files/docs/RISCVGreenCardv8-20151013.pdf)

## Learning Objectives

By completing this section, you should be able to:
- Understand the RISC-V register set and conventions
- Write basic arithmetic and logical operations
- Implement memory access patterns
- Create simple programs using control flow instructions
- Debug assembly code using common tools

## Next Steps

After completing the fundamentals, proceed to:
- [Memory and Stack Management](../02-Memory/README.md)
- Practice with more complex assembly programs
- Begin exploring bare metal programming concepts

## Testing Your Knowledge

Each subdirectory contains exercises and unit tests to verify your understanding. Make sure to:
1. Complete all practice exercises
2. Run provided test cases
3. Create your own test programs
4. Document your learning process

Remember to use the RISC-V simulator or emulator provided in the tools directory for testing your code.
