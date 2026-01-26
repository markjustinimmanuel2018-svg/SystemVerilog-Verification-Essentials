**# Week-8 Mini Project - FSM Based Multi-Cycle Execution Engine**



This project focuses on integrating reusable RTL blocks under FSM control to implement a multi-cycle execution engine with timing-aware RTL design.



---------------------------------------------------------------

**## Files**



* exec\_block.sv    : RTL design for top-level execution engine
* exec\_fsm.sv      : FSM control unit
* tb\_exec\_block.sv : Testbench to verify the design



---------------------------------------------------------------

**## Objective**


* Integrate reusable RTL modules into a single execution block.
* Implement FSM controlled multi-cycle execution.
* Apply reg -> combinational -> reg timing discipline.
* Understand how control logic drives datapath behavior.



---------------------------------------------------------------

**## Design Overview**



* The execution engine consists of the following components:
  - Control FSM : Manages execution flow using IDLE -> LOAD -> EXEC -> STORE status
  - Operand Registers : Capture input data before execution
  - ALU : Performs arithmetic and logical operations
  - Multiplexer : Selects ALU operands based on control signals
  - Execution Register : Stores intermediate computation results
  - Cycle Counter : Supports multi-cycle execution when enabled
  - Output Register : Registers the final result
* All datapath operations are controlled by enable signals generated from the FSM.
* Execution proceeds across multiple clock cycles, and all state updates occur on clock edges.



--------------------------------------------------------------

**## Learning Outcome**


* Purpose of FSM-based multi-cycle execution.
* Integrated parameterized RTL blocks into a working datapath.
* Applied timing-aware RTL coding practices.
* Developed cycle-accurate understanding of control and datapath interaction.



--------------------------------------------------------------

**# Author:** MARK JUSTIN

