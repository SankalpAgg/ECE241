module mux2to1(x, y, s, m);
    input x, y, s;
    output m;
    assign m = (~s&x)|(s&y);
endmodule

module D_flip_flop (clk, reset_b, d, q);
input wire d;
input wire clk;
input wire reset_b;
output reg q;

always@(posedge clk)
begin
if(reset_b) 
q <= 1'b0;
else
q <= d;
end
endmodule

module subdff(left, right, loadh, loadLeft, clock, reset, D, Q);
input left, right, loadh, loadLeft, clock, reset, D;
output Q;
wire [1:0] w;

mux2to1 m0(.x(right), .y(left), .s(loadLeft), .m(w[0]));
mux2to1 m1(.x(D), .y(w[0]), .s(loadh), .m(w[1]));
D_flip_flop inst1(.d(w[1]), .clk(clock), .reset_b(reset), .q(Q));
endmodule

module part3(clock, reset, ParallelLoadn, RotateRight, ASRight, Data_IN, Q);
input clock, reset, ParallelLoadn, RotateRight, ASRight;
input [3:0] Data_IN;
output [3:0] Q;

subdff s0(.D(Data_IN[0]), .loadh(ParallelLoadn), .clock(clock), .reset(reset), .loadLeft(RotateRight), .right(Q[3]), .left(Q[1]), .Q(Q[0]));
subdff s1(.D(Data_IN[1]), .loadh(ParallelLoadn), .clock(clock), .reset(reset), .loadLeft(RotateRight), .right(Q[0]), .left(Q[2]), .Q(Q[1]));
subdff s2(.D(Data_IN[2]), .loadh(ParallelLoadn), .clock(clock), .reset(reset), .loadLeft(RotateRight), .right(Q[1]), .left(Q[3]), .Q(Q[2]));
subdff s3(.D(Data_IN[3]), .loadh(ParallelLoadn), .clock(clock), .reset(reset), .loadLeft(RotateRight), .right(Q[2]), .left(Q[0]), .Q(Q[3]));
endmodule



