import_files -fileset constrs_1 {../xdc/vcu_uc1_pll.xdc }

#set_property ip_repo_paths ../ip/vcu_v1_0/ [current_project]
#update_ip_catalog

  # Create interface ports
  set C0_DDR4 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 C0_DDR4 ]
  set clk_125_ddr [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 clk_125_ddr ]
  set_property -dict [ list \
CONFIG.FREQ_HZ {125000000} \
 ] $clk_125_ddr
  set si570_gt_dp [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 si570_gt_dp ]
  set si570_user_vcu [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 si570_user_vcu ]
  set_property -dict [ list \
CONFIG.FREQ_HZ {300000000} \
 ] $si570_user_vcu

  # Create ports
  set clk_125_ddr [ create_bd_port -dir I -type clk clk_125_ddr ]
  set_property -dict [ list \
CONFIG.FREQ_HZ {125000000} \
 ] $clk_125_ddr

  # Create instance: DEC0_to_PS, and set properties
  set DEC0_to_PS [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect: DEC0_to_PS ]
  set_property -dict [ list \
CONFIG.ENABLE_ADVANCED_OPTIONS {0} \
CONFIG.M00_HAS_DATA_FIFO {2} \
CONFIG.M00_HAS_REGSLICE {1} \
CONFIG.NUM_MI {1} \
CONFIG.NUM_SI {1} \
CONFIG.S00_HAS_DATA_FIFO {0} \
CONFIG.S00_HAS_REGSLICE {4} \
CONFIG.S01_HAS_DATA_FIFO {2} \
CONFIG.S01_HAS_REGSLICE {1} \
CONFIG.S02_HAS_DATA_FIFO {2} \
CONFIG.STRATEGY {0} \
 ] $DEC0_to_PS

  # Create instance: DEC1_to_PS, and set properties
  set DEC1_to_PS [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect: DEC1_to_PS ]
  set_property -dict [ list \
CONFIG.ENABLE_ADVANCED_OPTIONS {0} \
CONFIG.M00_HAS_DATA_FIFO {2} \
CONFIG.M00_HAS_REGSLICE {1} \
CONFIG.NUM_MI {1} \
CONFIG.NUM_SI {1} \
CONFIG.S00_HAS_DATA_FIFO {0} \
CONFIG.S00_HAS_REGSLICE {4} \
CONFIG.S01_HAS_DATA_FIFO {2} \
CONFIG.S01_HAS_REGSLICE {1} \
CONFIG.S02_HAS_DATA_FIFO {2} \
CONFIG.STRATEGY {0} \
 ] $DEC1_to_PS

  # Create instance: ENC0_to_PS, and set properties
  set ENC0_to_PS [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect: ENC0_to_PS ]
  set_property -dict [ list \
CONFIG.ENABLE_ADVANCED_OPTIONS {0} \
CONFIG.M00_HAS_DATA_FIFO {2} \
CONFIG.M00_HAS_REGSLICE {1} \
CONFIG.NUM_MI {1} \
CONFIG.NUM_SI {1} \
CONFIG.S00_HAS_DATA_FIFO {0} \
CONFIG.S00_HAS_REGSLICE {4} \
CONFIG.S01_HAS_DATA_FIFO {2} \
CONFIG.S01_HAS_REGSLICE {1} \
CONFIG.S02_HAS_DATA_FIFO {2} \
CONFIG.STRATEGY {0} \
 ] $ENC0_to_PS

  # Create instance: ENC1_to_PS, and set properties
  set ENC1_to_PS [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect: ENC1_to_PS ]
  set_property -dict [ list \
CONFIG.ENABLE_ADVANCED_OPTIONS {0} \
CONFIG.M00_HAS_DATA_FIFO {2} \
CONFIG.M00_HAS_REGSLICE {1} \
CONFIG.NUM_MI {1} \
CONFIG.NUM_SI {1} \
CONFIG.S00_HAS_DATA_FIFO {0} \
CONFIG.S00_HAS_REGSLICE {4} \
CONFIG.S01_HAS_DATA_FIFO {2} \
CONFIG.S01_HAS_REGSLICE {1} \
CONFIG.S02_HAS_DATA_FIFO {2} \
CONFIG.STRATEGY {0} \
 ] $ENC1_to_PS

  # Create instance: GPIO_DDR_calib, and set properties
  set GPIO_DDR_calib [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio: GPIO_DDR_calib ]
  set_property -dict [ list \
CONFIG.C_ALL_INPUTS {1} \
 ] $GPIO_DDR_calib

  # Create instance: GPIO_VCU, and set properties
  set GPIO_VCU [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio: GPIO_VCU ]
  set_property -dict [ list \
CONFIG.C_ALL_INPUTS_2 {1} \
CONFIG.C_ALL_OUTPUTS {1} \
CONFIG.C_IS_DUAL {1} \
 ] $GPIO_VCU

  # Create instance: MCU_to_PS, and set properties
  set MCU_to_PS [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect: MCU_to_PS ]
  set_property -dict [ list \
CONFIG.ENABLE_ADVANCED_OPTIONS {0} \
CONFIG.M00_HAS_DATA_FIFO {2} \
CONFIG.M00_HAS_REGSLICE {1} \
CONFIG.NUM_MI {1} \
CONFIG.NUM_SI {1} \
CONFIG.S00_HAS_DATA_FIFO {0} \
CONFIG.S00_HAS_REGSLICE {4} \
CONFIG.S01_HAS_DATA_FIFO {2} \
CONFIG.S01_HAS_REGSLICE {1} \
CONFIG.S02_HAS_DATA_FIFO {2} \
CONFIG.STRATEGY {0} \
 ] $MCU_to_PS

  # Create instance: PS_to_MIG, and set properties
  set PS_to_MIG [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect: PS_to_MIG ]

  # Create instance: PS_to_VCU, and set properties
  set PS_to_VCU [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect: PS_to_VCU ]
  set_property -dict [ list \
CONFIG.NUM_MI {2} \
 ] $PS_to_VCU

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz: clk_wiz_0 ]
  set_property -dict [ list \
CONFIG.CLKIN1_JITTER_PS {33.330000000000005} \
CONFIG.CLKOUT1_JITTER {117.989} \
CONFIG.CLKOUT1_PHASE_ERROR {71.599} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {33.33} \
CONFIG.CLKOUT2_JITTER {86.112} \
CONFIG.CLKOUT2_PHASE_ERROR {71.599} \
CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {166.66} \
CONFIG.CLKOUT2_USED {true} \
CONFIG.CLKOUT3_JITTER {108.931} \
CONFIG.CLKOUT3_PHASE_ERROR {71.599} \
CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {50} \
CONFIG.CLKOUT3_USED {true} \
CONFIG.CLKOUT4_JITTER {148.677} \
CONFIG.CLKOUT4_PHASE_ERROR {98.575} \
CONFIG.CLKOUT4_REQUESTED_OUT_FREQ {100.000} \
CONFIG.CLKOUT4_USED {false} \
CONFIG.CLKOUT5_JITTER {129.710} \
CONFIG.CLKOUT5_PHASE_ERROR {165.732} \
CONFIG.CLKOUT5_REQUESTED_OUT_FREQ {100.000} \
CONFIG.CLKOUT5_USED {false} \
CONFIG.MMCM_CLKFBOUT_MULT_F {5.000} \
CONFIG.MMCM_CLKIN1_PERIOD {3.333} \
CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {45.000} \
CONFIG.MMCM_CLKOUT1_DIVIDE {9} \
CONFIG.MMCM_CLKOUT2_DIVIDE {30} \
CONFIG.MMCM_CLKOUT3_DIVIDE {1} \
CONFIG.MMCM_CLKOUT4_DIVIDE {1} \
CONFIG.MMCM_DIVCLK_DIVIDE {1} \
CONFIG.NUM_OUT_CLKS {3} \
CONFIG.PRIM_IN_FREQ {300.000} \
CONFIG.USE_RESET {false} \
 ] $clk_wiz_0

  # Create instance: ddr4_0, and set properties
  set ddr4_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ddr4: ddr4_0 ]
  set_property -dict [ list \
CONFIG.C0.BANK_GROUP_WIDTH {1} \
CONFIG.C0.DDR4_AxiAddressWidth {31} \
CONFIG.C0.DDR4_AxiDataWidth {512} \
CONFIG.C0.DDR4_DataWidth {64} \
CONFIG.C0.DDR4_InputClockPeriod {7997} \
CONFIG.C0.DDR4_MemoryPart {MT40A256M16GE-075E} \
 ] $ddr4_0

  # Create instance: dp_clk_source, and set properties
  set dp_clk_source [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf: dp_clk_source ]
  set_property -dict [ list \
CONFIG.C_BUF_TYPE {BUFG_GT} \
 ] $dp_clk_source

  # Create instance: interrupts, and set properties
  set interrupts [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat: interrupts ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {1} \
 ] $interrupts

  # Create instance: proc_sys_reset_clk50, and set properties
  set proc_sys_reset_clk50 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset: proc_sys_reset_clk50 ]
  set_property -dict [ list \
CONFIG.C_AUX_RESET_HIGH {0} \
 ] $proc_sys_reset_clk50

  # Create instance: proc_sys_reset_clk301, and set properties
  set proc_sys_reset_clk301 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset: proc_sys_reset_clk301 ]
  set_property -dict [ list \
CONFIG.C_AUX_RESET_HIGH {0} \
 ] $proc_sys_reset_clk301

  # Create instance: util_ds_buf_0, and set properties
  set util_ds_buf_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf: util_ds_buf_0 ]

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic: util_vector_logic_0 ]
  set_property -dict [ list \
CONFIG.C_OPERATION {not} \
CONFIG.C_SIZE {1} \
CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_0

  # Create instance: vcu_0, and set properties
  set vcu_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:vcu: vcu_0 ]
  set_property -dict [ list \
CONFIG.ENABLE_DECODER {true} \
CONFIG.ENC_BUFFER_B_FRAME {1} \
CONFIG.ENC_BUFFER_EN {true} \
CONFIG.ENC_BUFFER_SIZE {1160} \
CONFIG.ENC_BUFFER_SIZE_ACTUAL {1305} \
CONFIG.ENC_CODING_TYPE {1} \
CONFIG.ENC_MEM_URAM_USED {1305} \
CONFIG.PLL_BYPASS {0} \
CONFIG.TABLE_NO {1} \
 ] $vcu_0

  # Create instance: vcu_clock_source, and set properties
  set vcu_clock_source [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf: vcu_clock_source ]
  set_property -dict [ list \
CONFIG.C_BUF_TYPE {IBUFDSGTE} \
 ] $vcu_clock_source

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant: xlconstant_0 ]
 
  # Create instance: zynq_ultra_ps_e_0, and set properties 

  set_property -dict [ list \
CONFIG.PSU_DDR_RAM_HIGHADDR {0xFFFFFFFF} \
CONFIG.PSU_DDR_RAM_HIGHADDR_OFFSET {0x80000000} \
CONFIG.PSU__USE__IRQ0 {1} \
CONFIG.PSU__USE__M_AXI_GP0 {1} \
CONFIG.PSU__USE__M_AXI_GP1 {1} \
CONFIG.PSU__USE__M_AXI_GP2 {0} \
CONFIG.PSU__USE__S_AXI_GP0 {1} \
CONFIG.PSU__USE__S_AXI_GP1 {0} \
CONFIG.PSU__USE__S_AXI_GP2 {1} \
CONFIG.PSU__USE__S_AXI_GP3 {1} \
CONFIG.PSU__USE__S_AXI_GP4 {1} \
CONFIG.PSU__USE__S_AXI_GP5 {1} \
CONFIG.PSU__USE__VIDEO {1} \
CONFIG.PSU__DDRC__COMPONENTS {UDIMM} \
CONFIG.PSU__CRL_APB__PL0_REF_CTRL__SRCSEL {RPLL} \
CONFIG.PSU__CRL_APB__PL0_REF_CTRL__DIVISOR0 {6} \
CONFIG.PSU__CRL_APB__PL0_REF_CTRL__DIVISOR1 {1} \
CONFIG.PSU__CRL_APB__PL0_REF_CTRL__FREQMHZ {167} \
 ] [get_bd_cells zynq_ultra_ps_e_0]	 

set_property -dict [list CONFIG.PSU__HIGH_ADDRESS__ENABLE {1}] [get_bd_cells zynq_ultra_ps_e_0]	 
 
  # Create interface connections
  connect_bd_intf_net -intf_net C0_SYS_CLK_1 [get_bd_intf_ports clk_125_ddr] [get_bd_intf_pins ddr4_0/C0_SYS_CLK]
  connect_bd_intf_net -intf_net CLK_IN_D_1 [get_bd_intf_ports si570_gt_dp] [get_bd_intf_pins vcu_clock_source/CLK_IN_D]
  connect_bd_intf_net -intf_net PS_to_VCU_M01_AXI [get_bd_intf_pins GPIO_VCU/S_AXI] [get_bd_intf_pins PS_to_VCU/M01_AXI]
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_pins PS_to_MIG/S00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/M_AXI_HPM1_FPD]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins PS_to_MIG/M00_AXI] [get_bd_intf_pins ddr4_0/C0_DDR4_S_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins GPIO_DDR_calib/S_AXI] [get_bd_intf_pins PS_to_MIG/M01_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_hp2_M00_AXI [get_bd_intf_pins ENC1_to_PS/M00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HP1_FPD]
  connect_bd_intf_net -intf_net axi_interconnect_hp3_M00_AXI [get_bd_intf_pins DEC1_to_PS/M00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HP3_FPD]
  connect_bd_intf_net -intf_net axi_interconnect_hp4_M00_AXI [get_bd_intf_pins ENC0_to_PS/M00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HP0_FPD]
  connect_bd_intf_net -intf_net axi_interconnect_hp5_M00_AXI [get_bd_intf_pins DEC0_to_PS/M00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HP2_FPD]
  connect_bd_intf_net -intf_net axi_interconnect_hp6_M00_AXI [get_bd_intf_pins MCU_to_PS/M00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HPC0_FPD]
  connect_bd_intf_net -intf_net axi_interconnect_hpm0_M00_AXI [get_bd_intf_pins PS_to_VCU/M00_AXI] [get_bd_intf_pins vcu_0/S_AXI_LITE]
  connect_bd_intf_net -intf_net ddr4_0_C0_DDR4 [get_bd_intf_ports C0_DDR4] [get_bd_intf_pins ddr4_0/C0_DDR4]
  connect_bd_intf_net -intf_net si570_gt_1 [get_bd_intf_ports si570_user_vcu] [get_bd_intf_pins util_ds_buf_0/CLK_IN_D]
  connect_bd_intf_net -intf_net vcu_0_M_AXI_DEC0 [get_bd_intf_pins DEC0_to_PS/S00_AXI] [get_bd_intf_pins vcu_0/M_AXI_DEC0]
  connect_bd_intf_net -intf_net vcu_0_M_AXI_DEC1 [get_bd_intf_pins DEC1_to_PS/S00_AXI] [get_bd_intf_pins vcu_0/M_AXI_DEC1]
  connect_bd_intf_net -intf_net vcu_0_M_AXI_ENC0 [get_bd_intf_pins ENC0_to_PS/S00_AXI] [get_bd_intf_pins vcu_0/M_AXI_ENC0]
  connect_bd_intf_net -intf_net vcu_0_M_AXI_ENC1 [get_bd_intf_pins ENC1_to_PS/S00_AXI] [get_bd_intf_pins vcu_0/M_AXI_ENC1]
  connect_bd_intf_net -intf_net vcu_0_M_AXI_MCU [get_bd_intf_pins MCU_to_PS/S00_AXI] [get_bd_intf_pins vcu_0/M_AXI_MCU]
  connect_bd_intf_net -intf_net zynq_ultra_ps_e_0_M_AXI_HPM0_FPD [get_bd_intf_pins PS_to_VCU/S00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/M_AXI_HPM0_FPD]

  # Create port connections
  connect_bd_net -net M00_ACLK_1 [get_bd_pins PS_to_MIG/M00_ACLK] [get_bd_pins ddr4_0/c0_ddr4_ui_clk]
  connect_bd_net -net M00_ARESETN_1 [get_bd_pins PS_to_MIG/M00_ARESETN] [get_bd_pins util_vector_logic_0/Res]
  connect_bd_net -net S00_ARESETN_1 [get_bd_pins DEC0_to_PS/M00_ARESETN] [get_bd_pins DEC0_to_PS/S00_ARESETN] [get_bd_pins DEC1_to_PS/M00_ARESETN] [get_bd_pins DEC1_to_PS/S00_ARESETN] [get_bd_pins ENC0_to_PS/M00_ARESETN] [get_bd_pins ENC0_to_PS/S00_ARESETN] [get_bd_pins ENC1_to_PS/M00_ARESETN] [get_bd_pins ENC1_to_PS/S00_ARESETN] [get_bd_pins GPIO_DDR_calib/s_axi_aresetn] [get_bd_pins MCU_to_PS/M00_ARESETN] [get_bd_pins MCU_to_PS/S00_ARESETN] [get_bd_pins PS_to_MIG/M01_ARESETN] [get_bd_pins PS_to_MIG/S00_ARESETN] [get_bd_pins ddr4_0/c0_ddr4_aresetn] [get_bd_pins proc_sys_reset_clk301/peripheral_aresetn]
  connect_bd_net -net axi_gpio_0_gpio_io_o [get_bd_pins GPIO_VCU/gpio2_io_i] [get_bd_pins GPIO_VCU/gpio_io_o]
  connect_bd_net -net clk_50mhz [get_bd_pins GPIO_VCU/s_axi_aclk] [get_bd_pins PS_to_VCU/ACLK] [get_bd_pins PS_to_VCU/M00_ACLK] [get_bd_pins PS_to_VCU/M01_ACLK] [get_bd_pins PS_to_VCU/S00_ACLK] [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins proc_sys_reset_clk50/slowest_sync_clk] [get_bd_pins vcu_0/s_axi_lite_aclk] [get_bd_pins zynq_ultra_ps_e_0/maxihpm0_fpd_aclk]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins vcu_0/pll_ref_clk]
  connect_bd_net -net clk_wiz_1_clk_out5 [get_bd_pins DEC0_to_PS/ACLK] [get_bd_pins DEC0_to_PS/M00_ACLK] [get_bd_pins DEC0_to_PS/S00_ACLK] [get_bd_pins DEC1_to_PS/ACLK] [get_bd_pins DEC1_to_PS/M00_ACLK] [get_bd_pins DEC1_to_PS/S00_ACLK] [get_bd_pins ENC0_to_PS/ACLK] [get_bd_pins ENC0_to_PS/M00_ACLK] [get_bd_pins ENC0_to_PS/S00_ACLK] [get_bd_pins ENC1_to_PS/ACLK] [get_bd_pins ENC1_to_PS/M00_ACLK] [get_bd_pins ENC1_to_PS/S00_ACLK] [get_bd_pins GPIO_DDR_calib/s_axi_aclk] [get_bd_pins MCU_to_PS/ACLK] [get_bd_pins MCU_to_PS/M00_ACLK] [get_bd_pins MCU_to_PS/S00_ACLK] [get_bd_pins PS_to_MIG/ACLK] [get_bd_pins PS_to_MIG/M01_ACLK] [get_bd_pins PS_to_MIG/S00_ACLK] [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins proc_sys_reset_clk301/slowest_sync_clk] [get_bd_pins vcu_0/m_axi_dec_aclk] [get_bd_pins vcu_0/m_axi_enc_aclk] [get_bd_pins vcu_0/m_axi_mcu_aclk] [get_bd_pins zynq_ultra_ps_e_0/maxihpm1_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/saxihp0_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/saxihp1_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/saxihp2_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/saxihp3_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/saxihpc0_fpd_aclk]
  connect_bd_net -net clk_wiz_1_locked [get_bd_pins clk_wiz_0/locked] [get_bd_pins proc_sys_reset_clk301/dcm_locked] [get_bd_pins proc_sys_reset_clk50/dcm_locked]
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk_sync_rst [get_bd_pins ddr4_0/c0_ddr4_ui_clk_sync_rst] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net ddr4_0_c0_init_calib_complete [get_bd_pins GPIO_DDR_calib/gpio_io_i] [get_bd_pins ddr4_0/c0_init_calib_complete]
  connect_bd_net -net gpio_Dout [get_bd_pins proc_sys_reset_clk301/ext_reset_in] [get_bd_pins proc_sys_reset_clk50/ext_reset_in] [get_bd_pins zynq_ultra_ps_e_0/pl_resetn0]
  connect_bd_net -net interrupts_dout [get_bd_pins interrupts/dout] [get_bd_pins zynq_ultra_ps_e_0/pl_ps_irq0]
  connect_bd_net -net proc_sys_reset_clk301_interconnect_aresetn [get_bd_pins DEC0_to_PS/ARESETN] [get_bd_pins DEC1_to_PS/ARESETN] [get_bd_pins ENC0_to_PS/ARESETN] [get_bd_pins ENC1_to_PS/ARESETN] [get_bd_pins MCU_to_PS/ARESETN] [get_bd_pins PS_to_MIG/ARESETN] [get_bd_pins proc_sys_reset_clk301/interconnect_aresetn]
  connect_bd_net -net proc_sys_reset_clk301_peripheral_reset [get_bd_pins ddr4_0/sys_rst] [get_bd_pins proc_sys_reset_clk301/peripheral_reset]
  connect_bd_net -net proc_sys_reset_clk50_interconnect_aresetn [get_bd_pins PS_to_VCU/ARESETN] [get_bd_pins proc_sys_reset_clk50/interconnect_aresetn]
  connect_bd_net -net proc_sys_reset_clk50_peripheral_aresetn [get_bd_pins GPIO_VCU/s_axi_aresetn] [get_bd_pins PS_to_VCU/M00_ARESETN] [get_bd_pins PS_to_VCU/M01_ARESETN] [get_bd_pins PS_to_VCU/S00_ARESETN] [get_bd_pins proc_sys_reset_clk50/peripheral_aresetn] [get_bd_pins vcu_0/vcu_resetn]
  connect_bd_net -net util_ds_buf_0_IBUF_OUT [get_bd_pins clk_wiz_0/clk_in1] [get_bd_pins util_ds_buf_0/IBUF_OUT]
  connect_bd_net -net util_ds_buf_1_IBUF_DS_ODIV2 [get_bd_pins dp_clk_source/BUFG_GT_I] [get_bd_pins vcu_clock_source/IBUF_DS_ODIV2]
  connect_bd_net -net util_ds_buf_2_BUFG_GT_O [get_bd_pins dp_clk_source/BUFG_GT_O] [get_bd_pins zynq_ultra_ps_e_0/dp_video_in_clk]
  connect_bd_net -net vcu_0_vcu_host_interrupt [get_bd_pins interrupts/In0] [get_bd_pins vcu_0/vcu_host_interrupt]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins dp_clk_source/BUFG_GT_CE] [get_bd_pins xlconstant_0/dout]

  # Create address segments
  create_bd_addr_seg -range 0x80000000 -offset 0x000800000000 [get_bd_addr_spaces vcu_0/EncData0] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_DDR_HIGH] SEG_zynq_ultra_ps_e_0_HP0_DDR_HIGH
  create_bd_addr_seg -range 0x80000000 -offset 0x00000000 [get_bd_addr_spaces vcu_0/EncData0] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_DDR_LOW] SEG_zynq_ultra_ps_e_0_HP0_DDR_LOW
  create_bd_addr_seg -range 0x01000000 -offset 0xFF000000 [get_bd_addr_spaces vcu_0/EncData0] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_LPS_OCM] SEG_zynq_ultra_ps_e_0_HP0_LPS_OCM
  create_bd_addr_seg -range 0x20000000 -offset 0xC0000000 [get_bd_addr_spaces vcu_0/EncData0] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_QSPI] SEG_zynq_ultra_ps_e_0_HP0_QSPI
  create_bd_addr_seg -range 0x80000000 -offset 0x000800000000 [get_bd_addr_spaces vcu_0/EncData1] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_DDR_HIGH] SEG_zynq_ultra_ps_e_0_HP1_DDR_HIGH
  create_bd_addr_seg -range 0x80000000 -offset 0x00000000 [get_bd_addr_spaces vcu_0/EncData1] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_DDR_LOW] SEG_zynq_ultra_ps_e_0_HP1_DDR_LOW
  create_bd_addr_seg -range 0x01000000 -offset 0xFF000000 [get_bd_addr_spaces vcu_0/EncData1] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_LPS_OCM] SEG_zynq_ultra_ps_e_0_HP1_LPS_OCM
  create_bd_addr_seg -range 0x20000000 -offset 0xC0000000 [get_bd_addr_spaces vcu_0/EncData1] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_QSPI] SEG_zynq_ultra_ps_e_0_HP1_QSPI
  create_bd_addr_seg -range 0x80000000 -offset 0x000800000000 [get_bd_addr_spaces vcu_0/DecData0] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP2_DDR_HIGH] SEG_zynq_ultra_ps_e_0_HP2_DDR_HIGH
  create_bd_addr_seg -range 0x80000000 -offset 0x00000000 [get_bd_addr_spaces vcu_0/DecData0] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP2_DDR_LOW] SEG_zynq_ultra_ps_e_0_HP2_DDR_LOW
  create_bd_addr_seg -range 0x01000000 -offset 0xFF000000 [get_bd_addr_spaces vcu_0/DecData0] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP2_LPS_OCM] SEG_zynq_ultra_ps_e_0_HP2_LPS_OCM
  create_bd_addr_seg -range 0x20000000 -offset 0xC0000000 [get_bd_addr_spaces vcu_0/DecData0] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP2_QSPI] SEG_zynq_ultra_ps_e_0_HP2_QSPI
  create_bd_addr_seg -range 0x80000000 -offset 0x000800000000 [get_bd_addr_spaces vcu_0/DecData1] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP5/HP3_DDR_HIGH] SEG_zynq_ultra_ps_e_0_HP3_DDR_HIGH
  create_bd_addr_seg -range 0x80000000 -offset 0x00000000 [get_bd_addr_spaces vcu_0/DecData1] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP5/HP3_DDR_LOW] SEG_zynq_ultra_ps_e_0_HP3_DDR_LOW
  create_bd_addr_seg -range 0x01000000 -offset 0xFF000000 [get_bd_addr_spaces vcu_0/DecData1] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP5/HP3_LPS_OCM] SEG_zynq_ultra_ps_e_0_HP3_LPS_OCM
  create_bd_addr_seg -range 0x20000000 -offset 0xC0000000 [get_bd_addr_spaces vcu_0/DecData1] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP5/HP3_QSPI] SEG_zynq_ultra_ps_e_0_HP3_QSPI
  create_bd_addr_seg -range 0x80000000 -offset 0x000800000000 [get_bd_addr_spaces vcu_0/Code] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP0/HPC0_DDR_HIGH] SEG_zynq_ultra_ps_e_0_HPC0_DDR_HIGH
  create_bd_addr_seg -range 0x80000000 -offset 0x00000000 [get_bd_addr_spaces vcu_0/Code] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP0/HPC0_DDR_LOW] SEG_zynq_ultra_ps_e_0_HPC0_DDR_LOW
  create_bd_addr_seg -range 0x01000000 -offset 0xFF000000 [get_bd_addr_spaces vcu_0/Code] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP0/HPC0_LPS_OCM] SEG_zynq_ultra_ps_e_0_HPC0_LPS_OCM
  create_bd_addr_seg -range 0x20000000 -offset 0xC0000000 [get_bd_addr_spaces vcu_0/Code] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP0/HPC0_QSPI] SEG_zynq_ultra_ps_e_0_HPC0_QSPI
  create_bd_addr_seg -range 0x00010000 -offset 0xB0000000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs GPIO_DDR_calib/S_AXI/Reg] SEG_GPIO_DDR_calib_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0xA0100000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs GPIO_VCU/S_AXI/Reg] SEG_GPIO_VCU_Reg
  create_bd_addr_seg -range 0x80000000 -offset 0x000500000000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] SEG_ddr4_0_C0_DDR4_ADDRESS_BLOCK
  create_bd_addr_seg -range 0x00100000 -offset 0xA0000000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs vcu_0/S_AXI_LITE/Reg] SEG_vcu_0_Reg
  save_bd_design