# 1 "/home/lituo/workspace/riscv/riscv-zcu102/fpga-zynq/zcu102/xilinx-zcu102-2017.1/build/../components/plnx_workspace/device-tree-generation/system-top.dts"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/home/lituo/workspace/riscv/riscv-zcu102/fpga-zynq/zcu102/xilinx-zcu102-2017.1/build/../components/plnx_workspace/device-tree-generation/system-top.dts"







/dts-v1/;
/include/ "zynqmp.dtsi"
/include/ "zynqmp-clk-ccf.dtsi"
/include/ "zcu102-revb.dtsi"
/include/ "pl.dtsi"
/include/ "pcw.dtsi"
/ {
 chosen {
  bootargs = "earlycon clk_ignore_unused";
  stdout-path = "serial0:115200n8";
 };
 aliases {
  ethernet0 = &gem3;
  serial0 = &uart0;
  serial1 = &uart1;
 };
 memory {
  device_type = "memory";
  reg = <0x0 0x0 0x0 0x80000000>, <0x00000008 0x00000000 0x0 0x80000000>;
 };
 cpus {
 };
};
# 1 "/home/lituo/workspace/riscv/riscv-zcu102/fpga-zynq/zcu102/xilinx-zcu102-2017.1/build/tmp/work/plnx_aarch64-xilinx-linux/device-tree-generation/xilinx+gitAUTOINC+94fc615234-r0/system-user.dtsi" 1
/include/ "system-conf.dtsi"
/ {
gpio-keys {
 sw19 {
  compatible = "gpio-keys";
  label = "sw19";
  status = "disabled";
  };
 };
 leds {
 compatible = "gpio-leds";
 heartbeat_led {
 label = "heartbeat";
 linux,default-trigger = "heartbeat";
 status = "disabled";
 };
 };
};
&uart1
{
 status = "disabled";
};
# 31 "/home/lituo/workspace/riscv/riscv-zcu102/fpga-zynq/zcu102/xilinx-zcu102-2017.1/build/../components/plnx_workspace/device-tree-generation/system-top.dts" 2
