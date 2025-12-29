module mini_cpu(input clk,
                input rst_n);
  typedef enum logic [1:0] { FETCH, DECODE, EXEC, WB } state_t;
  state_t state, next_state;
  
  logic [7:0] pc, ir, acc;
  logic [7:0] instr_mem [0:15];
  
  logic [1:0] opcode;
  logic [5:0] imm;
  assign opcode = ir[7:6];
  assign imm = ir[5:0];
  
  logic [7:0] alu_result;
  
  always_comb begin
    alu_result = acc;
    case(opcode)
      2'b00: alu_result = acc + imm ;  // ADD
      2'b01: alu_result = acc - imm ;  // SUBTRACT
      2'b10: alu_result = acc & imm ;  // AND
      2'b11: alu_result = acc | imm ;  // OR
      default: alu_result = acc;
    endcase
  end
  
  always_comb begin
    next_state = state ;
    case(state)
      FETCH: next_state = DECODE ;
      DECODE: next_state = EXEC ;
      EXEC: next_state = WB ;
      WB: next_state = FETCH ;
      default: next_state = FETCH;
    endcase
  end
  
  always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      state <= FETCH ;
      pc <= 8'b0 ;
      ir <= 8'b0 ;
      acc <= 8'b0 ;
    end
    else begin
      state <= next_state ;
      case(state) 
        FETCH: begin
          ir <= instr_mem[pc] ;
          pc <= pc + 1 ;
        end
        EXEC: acc <= alu_result ;
      endcase
    end
  end
endmodule