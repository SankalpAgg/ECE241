module part1(Clock, Enable, Reset, CounterValue);
input Clock, Enable, Reset;
output [7:0]CounterValue;
wire [6:0]AndGate;

TFlipFlop u0(.clock(Clock), .reset(Reset), .T(Enable), .Q(CounterValue[0]));

assign AndGate[0] = Enable & CounterValue[0];
TFlipFlop u1(.clock(Clock), .reset(Reset), .T(AndGate [0]) , .Q(CounterValue[1]));

assign AndGate[1] = AndGate[0] & CounterValue[1];
TFlipFlop u2(.clock(Clock), .reset(Reset), .T(AndGate[1]) , .Q(CounterValue[2]));

assign AndGate[2] = AndGate[1] & CounterValue[2];
TFlipFlop u3(.clock(Clock), .reset(Reset), .T(AndGate[2]) , .Q(CounterValue[3]));

assign AndGate[3] = AndGate[2] & CounterValue[3];
TFlipFlop u4(.clock(Clock), .reset(Reset), .T(AndGate[3]) , .Q(CounterValue[4]));

assign AndGate[4] = AndGate[3] & CounterValue[4];
TFlipFlop u5(.clock(Clock), .reset(Reset), .T(AndGate[4]) , .Q(CounterValue[5]));

assign AndGate[5] = AndGate[4] & CounterValue[5];
TFlipFlop u6(.clock(Clock), .reset(Reset), .T(AndGate[5]) , .Q(CounterValue[6]));

assign AndGate[6] = AndGate[5] & CounterValue[6];
TFlipFlop u7(.clock(Clock), .reset(Reset), .T(AndGate[6]) , .Q(CounterValue[7]));
endmodule

module TFlipFlop(clock, reset, T, Q);
input T, clock, reset;
output reg Q;
always@(posedge clock)
begin
if(reset)
Q <= 1'b0;
else
Q <= T^Q;
end 
endmodule


