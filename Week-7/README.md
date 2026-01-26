**# Week-7 Mini Project - Timing Aware RTL Design**



This project focuses on understanding timing behavior in hardware designs and implements timing awareness while writing RTL.



------------------------------------------------------------------

**## Files**



* integrated\_datapath.sv    : RTL design
* tb\_integrated\_datapath.sv : Testbench to verify the design



------------------------------------------------------------------

**## Objective**



* Understanding how clock cycles govern hardware behavior.
* Identify **reg -> combinational -> reg** timing paths.
* To update outputs only on clock edges.
* Analyze FSM-controlled multi-cycle execution.



------------------------------------------------------------------

**## Design Overview**



* The datapath consists of the following stages:
  - Input Register Stage : Captures external input and acts as entry point of the datapath
  - Control Decode : Extracts operation from instruction
  - Program Counter-Like Counter : Continuously increments every clock cycle
  - Datapath Slice : Performs arithmetic/logical operation using register input and counter value
  - Stage Register : Captures combinational output of the datapath and breaks long combinational paths
  - Output Register : Registers the final output
* Data moves from one stage per clock cycle.
* No signal propagates across multiple stages in one cycle.



------------------------------------------------------------------

**## Learning Outcome**



* Clear understanding of cycle-accurate behaviour.
* Implemented reg -> combinational -> reg timing discipline.
* Implemented clean separation between control logic and datapath logic.
* Introducing pipeline registers for predictable multi-cycle latency.



-------------------------------------------------------------------

**# Author:** MARK JUSTIN

