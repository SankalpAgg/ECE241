# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in mux.v to working dir
# could also have multiple verilog files
vlog part1.v

#load simulation using mux as the top level simulation module
vsim part1

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module
add wave {/*}


# first test case
#set input values using the force command, signal names need to be in {} brackets
force {SW[0]} 0
force {KEY[0]} 1
force {SW[1]} 0
#run simulation for a few ns
run 5ns

force {SW[0]} 0
force {KEY[0]} 0
#run simulation for a few ns
run 5ns

#putting value 1 four times consecutively
force {SW[0]} 1
force {KEY[0]} 1
force {SW[1]} 0
#run simulation for a few ns
run 5ns

force {KEY[0]} 1
run 5ns
force {KEY[0]} 0
run 5ns

force {KEY[0]} 1
run 5ns
force {KEY[0]} 0
run 5ns

force {KEY[0]} 1
run 5ns
force {KEY[0]} 0
run 5ns

#now clock - on ledr9 - on
force {KEY[0]} 1
run 5ns
force {KEY[0]} 0
run 5ns

#now clock - on ledr9 - on cause overlaps and gets a new s
force {KEY[0]} 1
run 5ns
force {KEY[0]} 0
run 5ns

#set w = 0 and then to 1 and output light should be 1
force {SW[1]} 0
force {KEY[0]} 1
run 5ns
force {KEY[0]} 0
run 5ns

force {SW[1]} 1
force {KEY[0]} 1
run 5ns
force {KEY[0]} 0
run 5ns

force {KEY[0]} 1
run 5ns
force {KEY[0]} 0
run 5ns
#z output should be 1 ledr9 - on
