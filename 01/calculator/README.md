# RISC-V Calculator Project

A beginner-friendly project to practice RISC-V assembly fundamentals by building a simple calculator.

## Learning Objectives
- Implement basic arithmetic operations in RISC-V
- Handle user input and output
- Practice register management
- Understand control flow and branching

## Project Structure
```
calculator/
├── src/
│   ├── calculator.s    # Main calculator implementation
│   ├── operations.s    # Arithmetic operations
│   └── io.s           # Input/output routines
├── tests/
│   └── test_cases.s   # Test scenarios
└── README.md
```

## Step-by-Step Implementation

### 1. Basic Setup (calculator.s)
- Initialize registers
- Set up stack frame
- Create main program loop

### 2. Implement Operations (operations.s)
- [ ] Addition function
  - Handle two operands
  - Account for overflow
- [ ] Subtraction function
- [ ] Multiplication function
  - Use mul instruction
  - Handle larger numbers
- [ ] Division function
  - Include divide-by-zero check
  - Handle remainder

### 3. Input/Output (io.s)
- [ ] Number input routine
  - Parse ASCII to binary
  - Handle invalid input
- [ ] Operation selection
  - Read operation character
  - Validate input
- [ ] Result output
  - Convert binary to ASCII
  - Format output

### 4. Control Flow
- [ ] Main operation loop
- [ ] Error handling
- [ ] Exit condition

## Testing Guide
1. Basic Operations
   - Test each operation with simple numbers
   - Verify results match expected output

2. Edge Cases
   - Division by zero
   - Large numbers
   - Negative numbers
   - Invalid input

3. Integration
   - Full calculation sequences
   - Error recovery

## Assembly Concepts Used
- Register allocation
- Arithmetic instructions
- Branch instructions
- Memory operations
- Subroutine calls
- Stack management

## Bonus Challenges
1. Add floating-point support
2. Implement memory for previous results
3. Add more complex operations (power, square root)
4. Create a better user interface
