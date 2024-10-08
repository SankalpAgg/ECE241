//part3
module part3(A, B, Function, ALUout);

parameter N = 4;

input [N-1:0] A, B;
input [1:0] Function;
output reg [2*N-1:0] ALUout;

always @(*)
begin
  case(Function)
    2'b00: ALUout = A + B;
    2'b01: 
    begin
      if((A|B) == 1'b1)
        ALUout = {{2*N-1{1'b0}}, 1'b1};
      else
        ALUout = {{2*N-1{1'b0}}, 1'b0};
    end
    2'b10:
    begin
      if((A & B) == 1'b1)
        ALUout = {{2*N-1{1'b0}}, 1'b1};
      else
        ALUout = {{2*N-1{1'b0}}, 1'b0};
    end
    2'b11: ALUout = {A, B};
    default: ALUout = {2*N{1'b0}};
  endcase
end

endmodule
