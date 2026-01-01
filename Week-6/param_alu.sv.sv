module param_alu #(parameter WIDTH=8) (input logic [WIDTH-1:0] a,
                                 input logic [WIDTH-1:0] b,
                                 input logic [1:0] sel,
                                 output logic [WIDTH-1:0] y);
  always_comb begin
    y='0;
    case(sel)
      2'b00: y=a+b;  // ADD
      2'b01: y=a-b;  // SUBTRACT
      2'b10: y=a&b;  // AND
      2'b11: y=a|b;  // OR
      default: y='0;
    endcase
  end
endmodule