module tb_integrated_datapath;
  logic clk;
  logic rst_n;
  logic [7:0] data_in;
  logic [7:0] instr;
  logic [7:0] data_out;
  
  integrated_datapath dut(.clk(clk),.rst_n(rst_n),.data_in(data_in),.instr(instr),.data_out(data_out));
  
  always #5 clk=~clk;
  
  initial begin
    clk=0;
    rst_n=0;
    data_in=8'd5;
    instr=8'b00_000000;  // ADD
    $monitor("T=%0t | data_in=%0d | pc=%0d | op=%b | data_out=%0d",$time,data_in,dut.pc,dut.op,data_out);
    #12 rst_n=1;
    #20 instr=8'b01_000000;  // SUB
    #20 instr=8'b10_000000;  // AND
    #20 instr=8'b11_000000;  // OR
    #50 $finish;
  end
endmodule