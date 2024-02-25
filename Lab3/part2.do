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
#load reset condition
#set input values using the force command, signal names need to be in {} brackets
force {Data} 0000
force {Function} 11
force {Reset_b} 0
force {Clock} 0
#run simulation for a few ns
run 10ns

#triggering reset
force {Clock} 1
run 10ns

#Addition
#set input values using the force command, signal names need to be in {} brackets
force {Data} 0001
force {Function} 00
force {Reset_b} 1
force {Clock} 0
#run simulation for a few ns
run 10ns

force {Clock} 1
run 10ns

force {Data} 1001
force {Function} 01
force {Reset_b} 1
force {Clock} 0

run 10ns

force {Clock} 1
run 10ns

force {Data} 1000
force {Function} 10
force {Reset_b} 1
force {Clock} 0
run 10ns

force {Clock} 1
run 10ns

force {Data} 1100
force {Function} 11
force {Reset_b} 1
force {Clock} 0
run 10ns

force {Clock} 1
run 10ns
