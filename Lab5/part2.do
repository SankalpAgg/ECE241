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


force Clock 0 0, 1 10ms -r 20ms
force Go 0 0, 1 50ms -r 100ms
force Reset 1 0, 0 15ms, 1 1200ms, 0 1250ms
force DataIn 4'd5 15ms, 4'd2 50ms, 4'd10 100ms, 4'd1 200ms, 4'd3 550ms, 4'd2 590ms, 4'd4 720ms, 4'd1 800ms
run 4000ms
