vlog tb_syn_fifo.v
vsim tb +test_name=OVERFLOW
#do wave.do
add wave -r sim:/tb/dut/*
run -all
