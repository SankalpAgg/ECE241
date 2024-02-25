module part3
#(parameter CLOCK_FREQUENCY=50000000)(
input wire ClockIn,
input wire Reset,
input wire Start,
input wire [2:0] Letter,
output wire dotDash,
output wire NewBitOut
);

  wire [11:0]Data;
  wire [11:0] Reg_Q;


  RateDivider #(.CLOCK_FREQUENCY(CLOCK_FREQUENCY)) RD (.ClockIn(ClockIn),.Enable(NewBitOut),.Reset(Reset),.Start(Start));
  MorseEncoder U1 (.val(Letter),.letter(Data));
  shiftRegister D1 (.Data_IN(Data), .reset(Reset), .ParallelLoadn(Start), .RotateLeft(ro), .clock(ClockIn), .Q(Reg_Q));

  assign DotDashOut=Reg_Q[11];


endmodule


module MorseEncoder(input [2:0] val, output reg [11:0] letter);

 always@(*)begin
    case(val)
      3'b000: letter=12'b101110000000;
    3'b001: letter=12'b111010101000;
    3'b010: letter=12'b111010111010;
    3'b011: letter=12'b111010100000;
    3'b100: letter=12'b100000000000;
    3'b101: letter=12'b101011101000;
    3'b110: letter=12'b111011101000;
    3'b111: letter=12'b101010100000;
    default: letter= 'b000000000000;
    endcase
  end
endmodule

module RateDivider #(parameter CLOCK_FREQUENCY = 50000000) (input ClockIn, output Enable,input Reset, input Start);
  reg [50:0] counter;
  reg startCount;
 
  always@(*)begin
    if(Start & ~Reset)startCount<=1;
  end

  always@(posedge ClockIn)begin
    if(Reset)begin
      counter<=0;
      startCount<=0;
    end
    else if(counter=='b0)begin
      counter <= (CLOCK_FREQUENCY / 2) - 1;

    end
    else if (startCount) begin
      counter=counter-'b1;
    end
  end

  assign Enable = (counter == 'b0);
endmodule


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

    mux2to1 m0 (.x(left), .y(right), .s(loadLeft), .m(w[0]));
    mux2to1 m1 (.x(D), .y(w[0]), .s(loadh), .m(w[1]));
    D_flip_flop inst1 (.d(w[1]), .clk(clock), .reset_b(reset), .q(Q));
endmodule


module shiftRegister(clock, reset, ParallelLoadn, RotateLeft, ASRight, Data_IN, Q);
input clock, reset, ParallelLoadn, RotateLeft, ASRight;
input [11:0] Data_IN;
output [11:0] Q;

subdff s0(.D(Data_IN[0]), .loadh(ParallelLoadn), .clock(clock), .reset(reset), .loadLeft(RotateLeft), .right(Q[3]), .left(Q[1]), .Q(Q[0]));
subdff s1(.D(Data_IN[1]), .loadh(ParallelLoadn), .clock(clock), .reset(reset), .loadLeft(RotateLeft), .right(Q[0]), .left(Q[2]), .Q(Q[1]));
subdff s2(.D(Data_IN[2]), .loadh(ParallelLoadn), .clock(clock), .reset(reset), .loadLeft(RotateLeft), .right(Q[1]), .left(Q[3]), .Q(Q[2]));
subdff s3(.D(Data_IN[3]), .loadh(ParallelLoadn), .clock(clock), .reset(reset), .loadLeft(RotateLeft), .right(Q[2]), .left(Q[4]), .Q(Q[3]));
subdff s4(.D(Data_IN[4]), .loadh(ParallelLoadn), .clock(clock), .reset(reset), .loadLeft(RotateLeft), .right(Q[3]), .left(Q[5]), .Q(Q[4]));
subdff s5(.D(Data_IN[5]), .loadh(ParallelLoadn), .clock(clock), .reset(reset), .loadLeft(RotateLeft), .right(Q[4]), .left(Q[6]), .Q(Q[5]));
subdff s6(.D(Data_IN[6]), .loadh(ParallelLoadn), .clock(clock), .reset(reset), .loadLeft(RotateLeft), .right(Q[5]), .left(Q[7]), .Q(Q[6]));
subdff s7(.D(Data_IN[7]), .loadh(ParallelLoadn), .clock(clock), .reset(reset), .loadLeft(RotateLeft), .right(Q[6]), .left(Q[8]), .Q(Q[7]));
subdff s8(.D(Data_IN[8]), .loadh(ParallelLoadn), .clock(clock), .reset(reset), .loadLeft(RotateLeft), .right(Q[7]), .left(Q[9]), .Q(Q[8]));
subdff s9(.D(Data_IN[9]), .loadh(ParallelLoadn), .clock(clock), .reset(reset), .loadLeft(RotateLeft), .right(Q[8]), .left(Q[10]), .Q(Q[9]));
subdff s10(.D(Data_IN[10]), .loadh(ParallelLoadn), .clock(clock), .reset(reset), .loadLeft(RotateLeft), .right(Q[9]), .left(Q[11]), .Q(Q[10]));
subdff s11(.D(Data_IN[11]), .loadh(ParallelLoadn), .clock(clock), .reset(reset), .loadLeft(RotateLeft), .right(Q[10]), .left(Q[0]), .Q(Q[11]));

endmodule
