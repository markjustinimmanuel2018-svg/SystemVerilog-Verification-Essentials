module reg_bank #(parameter WIDTH=8,
                  parameter DEPTH=4) (input logic clk,
                                      input logic rst_n,
                                      input logic [DEPTH-1:0] we,
                                      input logic [WIDTH-1:0] d,
                                      output logic [WIDTH-1:0] q[DEPTH]);
  genvar i;
  generate
    for(i=0;i<DEPTH;i++) begin: REG_GEN
      always_ff @(posedge clk or negedge rst_n) begin
        if(!rst_n)
          q[i]<='0;
        else if(we[i])
          q[i]<=d;
      end
    end
  endgenerate
endmodule