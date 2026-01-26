module integrated_datapath(input clk,
                         input rst_n,
                         input logic [7:0] data_in,
                         input logic [7:0] instr,
                         output logic [7:0] data_out);
  logic [7:0] in_q;
  logic [7:0] stage_q;
  logic [7:0] d_out;
  logic [7:0] pc;
  logic [1:0] op;
  
  // Input register
  io_reg in_reg(.clk(clk),.rst_n(rst_n),.d(data_in),.q(in_q));
  
  // Control decode
  control_decode ctrl_d(.clk(clk),.rst_n(rst_n),.instr(instr),.op(op));
  
  // PC-like counter
  counter_unit count_pc(.clk(clk),.rst_n(rst_n),.en(1'b1),.count(pc));
  
  // Datapath Slice
  datapath_slice dp_s(.a(in_q),.b(pc),.op(op),.y(d_out));
  
  // Stage register
  io_reg stage_reg(.clk(clk),.rst_n(rst_n),.d(d_out),.q(stage_q));
  
  // Output register
  io_reg out_reg(.clk(clk),.rst_n(rst_n),.d(stage_q),.q(data_out));
  
endmodule



// Register module
module io_reg(input clk,
                 input rst_n,
                 input logic [7:0] d,
                 output logic [7:0] q);
  always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n)
      q<=8'b0;
    else
      q<=d;
  end
endmodule

// Datapath slice module
module datapath_slice(input [7:0] a,
                      input [7:0] b,
                      input [1:0] op,
                      output logic [7:0] y);
  always_comb begin
    y=8'b0;
    case(op)
      2'b00: y=a+b;
      2'b01: y=a-b;
      2'b10: y=a&b;
      2'b11: y=a|b;
    endcase
  end
endmodule

// Control decode module
module control_decode(input clk,
                      input rst_n,
                      input logic [7:0] instr,
                      output logic [1:0] op);
  always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n)
      op<=2'b0;
    else
      op<=instr[7:6];
  end
endmodule

// Control unit module
module counter_unit(input clk,
                    input rst_n,
                    input en,
                    output logic [7:0] count);
  always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n)
      count<=8'b0;
    else if(en)
      count<=count+1;
  end
endmodule