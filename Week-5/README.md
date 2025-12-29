**# Week 5 Mini Project - Mini CPU Core** 



This project implements a simple FSM-based CPU core, mapping Computer Organization concepts into real hardware using SystemVerilog.



---------------------------------------------------------------------

**## Files**



* mini\_cpu.sv : RTL design of mini CPU
* tb\_mini\_cpu.sv : Testbench to verify the design 



---------------------------------------------------------------------

**## Objective**



* Design a mini CPU with basic instruction cycle: **FETCH -> DECODE -> EXEC -> WB**
* Apply industry-style RTL coding:
  - 'logic', 'enum'
  - 'always\_ff', 'always\_comb'
  - Latch-free combinational circuit
  - One clock, one reset discipline
* Integrate control FSM with datapath blocks.



----------------------------------------------------------------------

**## CPU Overview**



The CPU consists of:
- **PC (Program Counter)** -> points to next instruction
- **IR (Instruction Register)** -> holds current instruction
- **ACC (Accumulator)** -> stores ALU result
- **ALU** -> performs arithmetic/logic operations
- **FSM Control Unit** -> controls instruction flow


-----------------------------------------------------------------------

**## Operation**



| Opcode | Operation |
|--------|-----------|
|   00   |    ADD    |

|   01   |    SUB    |

|   10   |    AND    |
|   11   |    OR     |



------------------------------------------------------------------------
**## Learning Outcomes**



* Designed FSM-based control logic
* Integrated datapath registers with control
* Followed modern SystemVerilog RTL style
* Mapped CO instruction cycle into RTL
* Verified design using a simple testbench



-----------------------------------------------------------------------

**# Author:** MARK JUSTIN

