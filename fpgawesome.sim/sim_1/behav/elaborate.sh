#!/bin/bash -f
xv_path="/opt/Xilinx/Vivado/2017.1"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xelab -wto ea23e5d9beaa4b00822e3b1c31552859 -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot ulaw_testbench_behav xil_defaultlib.ulaw_testbench -log elaborate.log
