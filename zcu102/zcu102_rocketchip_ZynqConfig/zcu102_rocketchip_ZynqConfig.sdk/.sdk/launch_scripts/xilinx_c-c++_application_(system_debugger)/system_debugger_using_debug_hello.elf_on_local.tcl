connect -url tcp:127.0.0.1:3121
source /opt/Xilinx/SDK/2017.1/scripts/sdk/util/zynqmp_utils.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-SMT2NC 210308A5F4E7"} -index 1
source /home/lituo/workspace/riscv/riscv-zcu102/fpga-zynq/zcu102/zcu102_rocketchip_ZynqConfig/zcu102_rocketchip_ZynqConfig.sdk/rocketchip_wrapper_hw_platform_0/psu_init.tcl
psu_init
catch {psu_protection}
targets -set -nocase -filter {name =~"*A53*0" && jtag_cable_name =~ "Digilent JTAG-SMT2NC 210308A5F4E7"} -index 1
rst -processor
dow /home/lituo/workspace/riscv/riscv-zcu102/fpga-zynq/zcu102/zcu102_rocketchip_ZynqConfig/zcu102_rocketchip_ZynqConfig.sdk/hello/Debug/hello.elf
targets -set -nocase -filter {name =~"*A53*0" && jtag_cable_name =~ "Digilent JTAG-SMT2NC 210308A5F4E7"} -index 1
con
