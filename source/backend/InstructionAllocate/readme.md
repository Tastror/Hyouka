# Instruction Allocation(armv7 32-bit)
Simon updated in 2022.7.1

## Pipeline
optimized IR --> arm assembly code

## Data storage
### register
a1-a4 are used for param transition, more params need to be stored on stack
v1-v7 are usually used for local variable
sp(stack pointer), is pointed to the top of the stack
lr(link register), is used for store exit of function
pc(program counter), is used for store the next instruction

### spill
data not in registers will be stored in memory

## Structure
### Static
This section is used for global variable declaration and definition
including int, float, array...

### Function
This section is used for function

## Progress
### Done(maybe bugs in it)

#### assign
#### le/eq
#### arithmetic (add, sub...)
#### jumpr (maked the end of function)

### TODO
support for float
jumpn (jump inside function)
...

