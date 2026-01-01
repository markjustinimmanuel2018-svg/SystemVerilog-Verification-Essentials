**# Week 6 Mini Project - Reusable RTL Datapath Library**



This project focuses on building a reusable RTL datapath library using SystemVerilog.



----------------------------------------------------------------------

**## Files**



* param\_alu.sv : Parameterized ALU supporting basic operations
* reg\_n.sv     : Reusable N-bit register with enable and reset
* counter.sv   : Parameterized counter (Program Counter / timer)
* mux2.sv      : Width-generic 2:1 multiplexer
* reg\_bank.sv  : Generate-based register bank (WIDTH x DEPTH)



----------------------------------------------------------------------

**## Objective**



* Design reusable RTL building blocks instead of a full CPU
* Apply parameterized and width-generic RTL coding
* Use 'generate' constructs to build scalable hardware



----------------------------------------------------------------------

**## Design Overview**



* The library consists of independent RTL blocks such as:
  - ALU
  - Registers
  - Counters
  - Multiplexers
  - Register banks
* Each block:
  - Is parameterized for width and/or depth
  - Has a single clear responsibility
  - Can be reused without modification
* These blocks together form the foundation of a reusable datapath library



----------------------------------------------------------------------

**## Learning Outcomes** 



* Understood how to build scalable RTL using parameters
* Implemented generate-based register structures
* Designed reusable datapath components
* Connected CO datapath concepts to RTL



----------------------------------------------------------------------

**# Author:** MARK JUSTIN

