# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in mux.v to working dir
# could also have multiple verilog files
vlog part2.v

#load simulation using mux as the top level simulation module
vsim part2

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module
add wave {/*}

# first test case
#set input values using the force command, signal names need to be in {} brackets
force {A} 4'b1111
force {B} 4'b1111
force {Function} 2'b00
#run simulation for a few ns
run 10ns

# second test case
#set input values using the force command, signal names need to be in {} brackets
force {A} 4'b0000
force {B} 4'b0000
force {Function} 2'b01
#run simulation for a few ns
run 10ns

# third test case
#set input values using the force command, signal names need to be in {} brackets
force {A} 4'b0000
force {B} 4'b0000
force {Function} 2'b01
#run simulation for a few ns
run 10ns

# fourth test case
#set input values using the force command, signal names need to be in {} brackets
force {A} 4'b1100
force {B} 4'b0011
force {Function} 2'b11
#run simulation for a few ns
run 10ns


