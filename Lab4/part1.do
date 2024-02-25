# Set the working dir, where all compiled Verilog goes
vlib work

# Compile the Verilog module
vlog part1.v

# Load simulation using part1 as the top-level simulation module
vsim part1

# Log all signals and add some signals to the waveform window
log -r /*
add wave -r /*



# Set input values using the force command, signal names need to be in {} brackets
force {Clock} 0 5ns, 1 {5ns} -r 10ns


force {Enable} 1
force {Reset} 1
#run simulation for a few ns
run 1ms

# Set input values using the force command, signal names need to be in {} brackets

force {Enable} 1
force {Reset} 0
#run simulation for a few ns
run 1ms


force {Enable} 1
force {Reset} 1
#run simulation for a few ns
run 1ms


force {Enable} 1
force {Reset} 0
#run simulation for a few ns
run 1ms
