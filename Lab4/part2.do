# Set the working dir, where all compiled Verilog goes
vlib work

# Compile the Verilog module
vlog part2.v

# Load simulation using part1 as the top-level simulation module
vsim -novopt work.part2

# Log all signals and add some signals to the waveform window
log -r /*
add wave -r /*

# First test case
# Set input values using the force command, signal names need to be in {} brackets
force {ClockIn} 1
force {Reset} 1
force {Speed} 00
#run simulation for a few ns
run 1ms

# first test case
# Set input values using the force command, signal names need to be in {} brackets
force {ClockIn} 0
force {Reset} 0
force {Speed} 00
#run simulation for a few ns
run 1ms

# first test case
# Set input values using the force command, signal names need to be in {} brackets
force {ClockIn} 1
force {Reset} 0
force {Speed} 00
#run simulation for a few ns
run 1ms

# second test case
# Set input values using the force command, signal names need to be in {} brackets
force {ClockIn} 0
force {Reset} 0
force {Speed} 01
#run simulation for a few ns
run 1ms

# second test case
# Set input values using the force command, signal names need to be in {} brackets
force {ClockIn} 1
force {Reset} 0
force {Speed} 01
#run simulation for a few ns
run 1ms

# second test case
# Set input values using the force command, signal names need to be in {} brackets
force {ClockIn} 0
force {Reset} 0
force {Speed} 01
#run simulation for a few ns
run 1ms

# second test case
# Set input values using the force command, signal names need to be in {} brackets
force {ClockIn} 1
force {Reset} 0
force {Speed} 01
#run simulation for a few ns
run 1ms
