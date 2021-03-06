# 
# Synthesis run script generated by Vivado
# 

set_param chipscope.enablePRFlowDRC 0
set_param hd.supportClockNetCrossDiffReconfigurablePartitions 1
create_project -in_memory -part xc7k70tfbg676-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /home/centos/fpgawesome/fpgawesome.cache/wt [current_project]
set_property parent.project_path /home/centos/fpgawesome/fpgawesome.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo /home/centos/fpgawesome/fpgawesome.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  /home/centos/fpgawesome/fpgawesome.srcs/vhdl/MAC/mac_types.vhdl
  /home/centos/fpgawesome/fpgawesome.srcs/vhdl/MAC/mac_outputverifier_soutputverifier.vhdl
  /home/centos/fpgawesome/fpgawesome.srcs/vhdl/MAC/mac_expectedoutput.vhdl
  /home/centos/fpgawesome/fpgawesome.srcs/vhdl/MAC/mac_mealy.vhdl
  /home/centos/fpgawesome/fpgawesome.srcs/vhdl/MAC/mac_stimuligenerator_sstimuligenerator.vhdl
  /home/centos/fpgawesome/fpgawesome.srcs/vhdl/MAC/mac_topentity_0.vhdl
  /home/centos/fpgawesome/fpgawesome.srcs/vhdl/MAC/mac_testinput.vhdl
  /home/centos/fpgawesome/fpgawesome.srcs/vhdl/MAC/mac_testbench.vhdl
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}

synth_design -top mac_testbench -part xc7k70tfbg676-1


write_checkpoint -force -noxdef mac_testbench.dcp

catch { report_utilization -file mac_testbench_utilization_synth.rpt -pb mac_testbench_utilization_synth.pb }
