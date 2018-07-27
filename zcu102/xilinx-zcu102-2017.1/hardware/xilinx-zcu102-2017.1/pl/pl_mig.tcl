####
## IMPORTANT - add user repository and constraints
####

import_files -fileset constrs_1 {../xdc/mig.xdc }

set_property ip_repo_paths ../ip [current_project]
update_ip_catalog

  # Create interface ports
#   set ddr4_rtl [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddr4_rtl ddr4_rtl ]
	set ddr4_rtl [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 ddr4_rtl ]
#   set diff_clock_rtl [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl diff_clock_rtl ]
	set diff_clock_rtl [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 diff_clock_rtl ]
	set_property -dict [ list \
CONFIG.FREQ_HZ {300000000} \
 ] $diff_clock_rtl
 
  # Create ports
  set emio_uart0_ctsn [ create_bd_port -dir I emio_uart0_ctsn ]
  set emio_uart0_rtsn [ create_bd_port -dir O emio_uart0_rtsn ]
  set emio_uart0_rxd [ create_bd_port -dir I emio_uart0_rxd ]
  set emio_uart0_txd [ create_bd_port -dir O emio_uart0_txd ]

  # Create instance: axi_mem_intercon, and set properties
  set axi_mem_intercon [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect axi_mem_intercon ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
CONFIG.NUM_SI {1} \
 ] $axi_mem_intercon

  # Create instance: ddr4_0, and set properties
  set ddr4_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ddr4 ddr4_0 ]
  set_property -dict [ list \
CONFIG.C0.DDR4_AxiAddressWidth {30} \
CONFIG.C0.DDR4_AxiDataWidth {128} \
CONFIG.C0.DDR4_AxiNarrowBurst {true} \
CONFIG.C0.DDR4_CasLatency {18} \
CONFIG.C0.DDR4_CasWriteLatency {12} \
CONFIG.C0.DDR4_DataWidth {32} \
CONFIG.C0.DDR4_InputClockPeriod {3332} \
CONFIG.C0.DDR4_MemoryPart {EDY4016AABG-DR-F} \
CONFIG.C0.DDR4_TimePeriod {833} \
 ] $ddr4_0

  # Create instance: emio_gpio_reset_slice, and set properties
  set emio_gpio_reset_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice emio_gpio_reset_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {95} \
CONFIG.DIN_TO {95} \
CONFIG.DIN_WIDTH {96} \
 ] $emio_gpio_reset_slice

  # Create instance: pmu_gpo_reset_slice, and set properties
  set pmu_gpo_reset_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice pmu_gpo_reset_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {31} \
CONFIG.DIN_TO {31} \
CONFIG.DOUT_WIDTH {1} \
 ] $pmu_gpo_reset_slice

  # Create instance: reset_invert, and set properties
  set reset_invert [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic reset_invert ]
  set_property -dict [ list \
CONFIG.C_OPERATION {not} \
CONFIG.C_SIZE {1} \
 ] $reset_invert

  # Create instance: reset_or, and set properties
  set reset_or [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic reset_or ]
  set_property -dict [ list \
CONFIG.C_OPERATION {or} \
CONFIG.C_SIZE {1} \
 ] $reset_or

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat xlconcat_0 ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {3} \
 ] $xlconcat_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant xlconstant_0 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
CONFIG.CONST_WIDTH {94} \
 ] $xlconstant_0

  # Create instance: zynq_ultra_ps_e_0, and set properties
  set zynq_ultra_ps_e_0 [ get_bd_cells zynq_ultra_ps_e_0 ]
  set_property -dict [ list \
CONFIG.PSU__GPIO_EMIO__PERIPHERAL__ENABLE {1} \
CONFIG.PSU__PMU__EMIO_GPO__ENABLE {1} \
CONFIG.PSU__PMU__PERIPHERAL__ENABLE {1} \
CONFIG.PSU__UART0__PERIPHERAL__ENABLE {1} \
CONFIG.PSU__UART0__PERIPHERAL__IO {EMIO} \
CONFIG.PSU__USE__M_AXI_GP0 {1} \
 ] $zynq_ultra_ps_e_0

  # Create interface connections
  connect_bd_intf_net -intf_net axi_mem_intercon_M00_AXI [get_bd_intf_pins axi_mem_intercon/M00_AXI] [get_bd_intf_pins ddr4_0/C0_DDR4_S_AXI]
  connect_bd_intf_net -intf_net ddr4_0_C0_DDR4 [get_bd_intf_ports ddr4_rtl] [get_bd_intf_pins ddr4_0/C0_DDR4]
  connect_bd_intf_net -intf_net diff_clock_rtl_1 [get_bd_intf_ports diff_clock_rtl] [get_bd_intf_pins ddr4_0/C0_SYS_CLK]
  connect_bd_intf_net -intf_net zynq_ultra_ps_e_0_M_AXI_HPM0_FPD [get_bd_intf_pins axi_mem_intercon/S00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/M_AXI_HPM0_FPD]

  # Create port connections
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk [get_bd_pins axi_mem_intercon/M00_ACLK] [get_bd_pins ddr4_0/c0_ddr4_ui_clk]
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk_sync_rst [get_bd_pins ddr4_0/c0_ddr4_ui_clk_sync_rst] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net ddr4_0_c0_init_calib_complete [get_bd_pins ddr4_0/c0_init_calib_complete] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net emio_gpio_reset_slice_Dout [get_bd_pins emio_gpio_reset_slice/Dout] [get_bd_pins reset_or/Op1]
  connect_bd_net -net emio_uart0_ctsn_1 [get_bd_ports emio_uart0_ctsn] [get_bd_pins zynq_ultra_ps_e_0/emio_uart0_ctsn]
  connect_bd_net -net emio_uart0_rxd_1 [get_bd_ports emio_uart0_rxd] [get_bd_pins zynq_ultra_ps_e_0/emio_uart0_rxd]
  connect_bd_net -net pmu_gpo_reset_slice_Dout [get_bd_pins pmu_gpo_reset_slice/Dout] [get_bd_pins reset_or/Op2]
  connect_bd_net -net reset_invert_Res [get_bd_pins axi_mem_intercon/ARESETN] [get_bd_pins axi_mem_intercon/M00_ARESETN] [get_bd_pins axi_mem_intercon/S00_ARESETN] [get_bd_pins ddr4_0/c0_ddr4_aresetn] [get_bd_pins reset_invert/Res]
  connect_bd_net -net reset_or_Res [get_bd_pins ddr4_0/sys_rst] [get_bd_pins reset_invert/Op1] [get_bd_pins reset_or/Res]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins xlconcat_0/dout] [get_bd_pins zynq_ultra_ps_e_0/emio_gpio_i]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconcat_0/In2] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net zynq_ultra_ps_e_0_emio_gpio_o [get_bd_pins emio_gpio_reset_slice/Din] [get_bd_pins zynq_ultra_ps_e_0/emio_gpio_o]
  connect_bd_net -net zynq_ultra_ps_e_0_emio_uart0_rtsn [get_bd_ports emio_uart0_rtsn] [get_bd_pins zynq_ultra_ps_e_0/emio_uart0_rtsn]
  connect_bd_net -net zynq_ultra_ps_e_0_emio_uart0_txd [get_bd_ports emio_uart0_txd] [get_bd_pins zynq_ultra_ps_e_0/emio_uart0_txd]
  connect_bd_net -net zynq_ultra_ps_e_0_pl_clk0 [get_bd_pins axi_mem_intercon/ACLK] [get_bd_pins axi_mem_intercon/S00_ACLK] [get_bd_pins zynq_ultra_ps_e_0/maxihpm0_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/pl_clk0]
  connect_bd_net -net zynq_ultra_ps_e_0_pmu_pl_gpo [get_bd_pins pmu_gpo_reset_slice/Din] [get_bd_pins zynq_ultra_ps_e_0/pmu_pl_gpo]

  # Create address segments
  create_bd_addr_seg -range 0x10000000 -offset 0xA0000000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] SEG_ddr4_0_C0_DDR4_ADDRESS_BLOCK

  save_bd_design
