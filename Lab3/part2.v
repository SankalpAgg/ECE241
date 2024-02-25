module part2 (
  input wire Clock,
  input wire Reset_b,
  input [3:0] Data,
  input [1:0] Function,
  output reg [7:0] ALUout
);

  always @(posedge Clock || negedge Reset_b)
  begin
    if (!Reset_b) begin
      ALUout <= 8'b00000000;
    end else begin
      case(Function)
        2'b00: ALUout <= ALUout[3:0] + Data;
        2'b01: ALUout <= Data * ALUout[3:0];
        2'b10: ALUout <= ALUout[3:0] << 4;
        2'b11: ALUout <= ALUout;
        default: ALUout <= 8'b00000000;
      endcase
    end
  end

endmodule







