# RISC-V Calculator Implementation Guide

This guide walks through implementing a basic calculator in RISC-V assembly, breaking down each component into manageable steps.

## 1. Environment Setup

First, ensure you have:
- RARS (RISC-V Assembler and Runtime Simulator) installed
- Basic understanding of RISC-V registers and instructions

## 2. Basic Program Structure

Start with `calculator.s`:

```riscv
.data
    prompt:     .string "Enter operation (+,-,*,/): "
    num1_msg:   .string "Enter first number: "
    num2_msg:   .string "Enter second number: "
    result_msg: .string "Result: "
    newline:    .string "\n"

.text
.globl main
main:
    # Setup stack frame
    addi sp, sp, -4
    sw ra, 0(sp)
    
    # Main program loop
    jal operation_loop
    
    # Exit program
    lw ra, 0(sp)
    addi sp, sp, 4
    li a7, 10
    ecall
```

## 3. Input/Output Implementation

In `io.s`, implement these key functions:

### 3.1 Reading Numbers

```riscv
read_number:
    # Read integer from user
    li a7, 5       # syscall for reading integer
    ecall
    # Result is automatically stored in a0
    ret
```

### 3.2 Reading Operation

```riscv
read_operation:
    # Read character
    li a7, 12      # syscall for reading character
    ecall
    # Result in a0
    ret
```

## 4. Arithmetic Operations

In `operations.s`, implement each operation:

### 4.1 Addition

```riscv
add_numbers:
    # a0, a1 contain operands
    add t0, a0, a1
    mv a0, t0      # Move result to a0
    ret
```

### 4.2 Subtraction

```riscv
subtract_numbers:
    # a0, a1 contain operands
    sub t0, a0, a1
    mv a0, t0
    ret
```

### 4.3 Multiplication

```riscv
multiply_numbers:
    # a0, a1 contain operands
    mul t0, a0, a1
    mv a0, t0
    ret
```

### 4.4 Division

```riscv
divide_numbers:
    # Check for divide by zero
    beqz a1, division_error
    
    div t0, a0, a1
    mv a0, t0
    ret

division_error:
    li a0, -1      # Error code
    ret
```

## 5. Main Operation Loop

Implement the main loop that ties everything together:

```riscv
operation_loop:
    # Print operation prompt
    la a0, prompt
    li a7, 4
    ecall
    
    # Get operation
    jal read_operation
    mv s0, a0      # Save operation
    
    # Get first number
    la a0, num1_msg
    li a7, 4
    ecall
    jal read_number
    mv s1, a0      # Save first number
    
    # Get second number
    la a0, num2_msg
    li a7, 4
    ecall
    jal read_number
    mv s2, a0      # Save second number
    
    # Branch to correct operation
    li t0, '+'
    beq s0, t0, do_add
    li t0, '-'
    beq s0, t0, do_subtract
    li t0, '*'
    beq s0, t0, do_multiply
    li t0, '/'
    beq s0, t0, do_divide
    
    # ... operation implementations ...
```

## 6. Testing Strategy

1. Test each operation individually:
```riscv
test_add:
    li a0, 5
    li a1, 3
    jal add_numbers
    # Expected result: 8
```

2. Test edge cases:
- Division by zero
- Negative numbers
- Large numbers

## 7. Advanced Features

Once basic functionality is working, consider adding:

1. Error handling:
```riscv
handle_error:
    la a0, error_msg
    li a7, 4
    ecall
    j operation_loop
```

2. Result storage:
```riscv
.data
    last_result: .word 0
```

## Tips and Best Practices

1. Register Usage:
- t0-t6: Temporary values
- s0-s11: Saved registers (preserve across calls)
- a0-a7: Arguments and return values

2. Always save/restore registers:
```riscv
function:
    # Save registers
    addi sp, sp, -8
    sw s0, 0(sp)
    sw ra, 4(sp)
    
    # ... function body ...
    
    # Restore registers
    lw s0, 0(sp)
    lw ra, 4(sp)
    addi sp, sp, 8
    ret
```

3. Comment your code thoroughly
4. Test incrementally
5. Handle edge cases explicitly

## Next Steps

After implementing basic functionality:
1. Add input validation
2. Implement floating-point operations
3. Add memory features for storing previous results
4. Enhance the user interface
