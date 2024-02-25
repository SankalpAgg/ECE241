vlib work
vlog part1.v 
vsim part1 -L altera_mf_ver
log {/*}
add wave {/*}


force {data} 0000
force {address} 00000
force {wren} 0

force {clock} 0
run 5 ns
force {clock} 1
run 5 ns
force {clock} 0
run 5 ns
force {clock} 1
run 5 ns
force {clock} 0
run 5 ns
force {clock} 1
run 5 ns

force {data} 0001
force {address} 00001
force {wren} 1

force {clock} 0
run 5 ns
force {clock} 1
run 5 ns

force {data} 0010
force {address} 00010
force {wren} 1

force {clock} 0
run 5 ns
force {clock} 1
run 5 ns

force {data} 0000
force {address} 00000
force {wren} 0

force {clock} 0
run 5 ns
force {clock} 1
run 5 ns
force {clock} 0
run 5 ns
force {clock} 1
run 5 ns

force {address} 00010
force {clock} 0
run 10 ns
force {address} 00000
force {clock} 1
run 10 ns
force {address} 00010
force {clock} 0
run 10 ns
force {address} 00010
force {clock} 1
run 10 ns

force {data} 0000
force {address} 00001
force {wren} 0

force {clock} 0
run 5 ns
force {clock} 1
run 5 ns

force {data} 0000
force {address} 00010
force {wren} 0

force {clock} 0
run 5 ns
force {clock} 1
run 5 ns

force {data} 0000
force {address} 00011
force {wren} 0

force {clock} 0
run 5 ns
force {clock} 1
run 5 ns
