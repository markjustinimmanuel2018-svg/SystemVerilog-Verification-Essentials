module tb_mini_cpu;
  logic clk;
  logic rst_n;
  mini_cpu dut(.clk(clk),.rst_n(rst_n));
  always #5 clk=~clk;
  initial begin
    clk=0;
    rst_n=0;
    dut.instr_mem[0] = 8'b00_000011;
    dut.instr_mem[1] = 8'b00_000101;
    dut.instr_mem[2] = 8'b01_000010;
    dut.instr_mem[3] = 8'b10_000110;
    dut.instr_mem[4] = 8'b11_001101;
    dut.instr_mem[5] = 8'b10_000111;
    dut.instr_mem[6] = 8'b01_000011;
    dut.instr_mem[7] = 8'b00_000001;
    $monitor("Time=%0t | pc=%b | ir=%b | acc=%b", $time, dut.pc, dut.ir, dut.acc);
    #12 rst_n=1;
    #200
    $finish;
  end
endmodule