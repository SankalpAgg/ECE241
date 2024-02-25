module part2(A, B, Function, ALUout);
  input [3:0] A, B;
  input [1:0] Function;
  output reg [7:0] ALUout;
  wire [3:0] s_0;
  wire s_1;

  part1 inst_1(.a(A), .b(B), .c_in(1'b0), .s(s_0), .c_out(s_1));

  always @(*)
  begin
    case(Function)
      2'b00: ALUout = {3'b000, s_0, s_1};
      2'b01: 
      begin
      if((A|B) == 1'b1)
      ALUout = {7'b0000000,1'b1};
      else
      ALUout = {7'b0000000,1'b0};
      end
      2'b10:
      begin
      if((A & B) == 1'b1)
      ALUout = {7'b0000000, 1'b1};
      else
      ALUout = {7'b0000000, 1'b0};
      end
      2'b11: ALUout = {A, B};
      default: ALUout = 8'b00000000;
    endcase
  end
endmodule

module sub_adder(first, second, carry_in, s_out, carry_out);
  input first, second, carry_in;
  output s_out, carry_out;
  
  assign s_out = first ^ second ^ carry_in;
  assign carry_out = (first & second) | (second & carry_in) | (first & carry_in);
endmodule

module part1(a, b, c_in, s, c_out);
  input [3:0] a, b;
  input c_in;
  output [3:0] s;
  output c_out;
  wire wire_0, wire_1, wire_2, wire_3;

  sub_adder bit0(.first(a[0]), .second(b[0]), .carry_in(c_in), .s_out(s[0]), .carry_out(wire_0));
  sub_adder bit1(.first(a[1]), .second(b[1]), .carry_in(wire_0), .s_out(s[1]), .carry_out(wire_1));
  sub_adder bit2(.first(a[2]), .second(b[2]), .carry_in(wire_1), .s_out(s[2]), .carry_out(wire_2));
  sub_adder bit3(.first(a[3]), .second(b[3]), .carry_in(wire_2), .s_out(s[3]), .carry_out(wire_3));

  assign c_out = {wire_3, wire_2, wire_1, wire_0};
endmodule

