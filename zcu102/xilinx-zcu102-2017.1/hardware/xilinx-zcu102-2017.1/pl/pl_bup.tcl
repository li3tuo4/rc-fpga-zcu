####
## IMPORTANT - add user repository and constraints
####

import_files -fileset constrs_1 {../xdc/bup.xdc }

set_property ip_repo_paths ../ip [current_project]
update_ip_catalog

###############
# Set bd_design
###############

# Create ports
  set dp_aux_data_in [ create_bd_port -dir I dp_aux_data_in ]
  set dp_aux_data_oe_n [ create_bd_port -dir O dp_aux_data_oe_n ]
  set dp_aux_data_out [ create_bd_port -dir O dp_aux_data_out ]
  set dp_hot_plug_detect [ create_bd_port -dir I dp_hot_plug_detect ]
  set pixel_clk_n [ create_bd_port -dir I -type clk pixel_clk_n ]
  set_property -dict [ list \
CONFIG.FREQ_HZ {150000000} \
 ] $pixel_clk_n
  set pixel_clk_p [ create_bd_port -dir I -type clk pixel_clk_p ]
  set_property -dict [ list \
CONFIG.FREQ_HZ {150000000} \
 ] $pixel_clk_p

  # Create instance: axi_dpchk_0, and set properties
  set axi_dpchk_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dpchk:1.00.c axi_dpchk_0 ]
  set_property -dict [ list \
CONFIG.C_S_AXI_ID_WIDTH {16} \
 ] $axi_dpchk_0

  # Create instance: axi_ex_0, and set properties  
  set axi_ex_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_exerciser:1.00.b axi_ex_0 ]
  set_property -dict [ list \
CONFIG.C_BASEADDR {0x80000000} \
CONFIG.C_HIGHADDR {0x803fffff} \
CONFIG.C_IS_AFI {0} \
CONFIG.C_IS_AXI4 {1} \
CONFIG.C_M_AXI_ADDR_WIDTH {40} \
CONFIG.C_M_AXI_DATA_WIDTH {128} \
CONFIG.C_M_AXI_THREAD_ID_WIDTH {6} \
CONFIG.C_NUM_EXCL {8} \
CONFIG.C_S_AXI_ADDR_WIDTH {40} \
CONFIG.C_S_AXI_DATA_WIDTH {64} \
CONFIG.C_S_AXI_ID_WIDTH {16} \
 ] $axi_ex_0

  # Create instance: axi_ex_1, and set properties
  set axi_ex_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_exerciser:1.00.b axi_ex_1 ]
  set_property -dict [ list \
CONFIG.C_BASEADDR {0xa0400000} \
CONFIG.C_ENABLE_HIGHMEM {1} \
CONFIG.C_HIGHADDR {0xa07fffff} \
CONFIG.C_HIGHMEM_BASEADDR {0x410400000} \
CONFIG.C_HIGHMEM_HIGHADDR {0x4107fffff} \
CONFIG.C_IS_AFI {0} \
CONFIG.C_IS_AXI4 {1} \
CONFIG.C_M_AXI_ADDR_WIDTH {40} \
CONFIG.C_M_AXI_DATA_WIDTH {128} \
CONFIG.C_M_AXI_THREAD_ID_WIDTH {6} \
CONFIG.C_NUM_EXCL {8} \
CONFIG.C_S_AXI_ADDR_WIDTH {40} \
CONFIG.C_S_AXI_DATA_WIDTH {128} \
CONFIG.C_S_AXI_ID_WIDTH {16} \
 ] $axi_ex_1

  # Create instance: axi_ex_2, and set properties
  set axi_ex_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_exerciser:1.00.b axi_ex_2 ]
  set_property -dict [ list \
CONFIG.C_BASEADDR {0xa0800000} \
CONFIG.C_ENABLE_HIGHMEM {1} \
CONFIG.C_HIGHADDR {0xa0bfffff} \
CONFIG.C_HIGHMEM_BASEADDR {0x410800000} \
CONFIG.C_HIGHMEM_HIGHADDR {0x410bfffff} \
CONFIG.C_IS_AFI {0} \
CONFIG.C_IS_AXI4 {1} \
CONFIG.C_M_AXI_ADDR_WIDTH {40} \
CONFIG.C_M_AXI_DATA_WIDTH {128} \
CONFIG.C_M_AXI_THREAD_ID_WIDTH {6} \
CONFIG.C_NUM_EXCL {8} \
CONFIG.C_S_AXI_ADDR_WIDTH {40} \
CONFIG.C_S_AXI_DATA_WIDTH {128} \
CONFIG.C_S_AXI_ID_WIDTH {16} \
 ] $axi_ex_2

  # Create instance: axi_ex_3, and set properties
  set axi_ex_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_exerciser:1.00.b axi_ex_3 ]
  set_property -dict [ list \
CONFIG.C_BASEADDR {0xa0c00000} \
CONFIG.C_ENABLE_HIGHMEM {1} \
CONFIG.C_HIGHADDR {0xa0ffffff} \
CONFIG.C_HIGHMEM_BASEADDR {0x410c00000} \
CONFIG.C_HIGHMEM_HIGHADDR {0x410ffffff} \
CONFIG.C_IS_AFI {0} \
CONFIG.C_IS_AXI4 {1} \
CONFIG.C_M_AXI_ADDR_WIDTH {40} \
CONFIG.C_M_AXI_DATA_WIDTH {64} \
CONFIG.C_M_AXI_THREAD_ID_WIDTH {6} \
CONFIG.C_NUM_EXCL {8} \
CONFIG.C_S_AXI_ADDR_WIDTH {40} \
CONFIG.C_S_AXI_DATA_WIDTH {128} \
CONFIG.C_S_AXI_ID_WIDTH {16} \
 ] $axi_ex_3

  # Create instance: axi_ex_4, and set properties
  set axi_ex_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_exerciser:1.00.b axi_ex_4 ]
  set_property -dict [ list \
CONFIG.C_BASEADDR {0xa1000000} \
CONFIG.C_ENABLE_HIGHMEM {1} \
CONFIG.C_HIGHADDR {0xa13fffff} \
CONFIG.C_HIGHMEM_BASEADDR {0x411000000} \
CONFIG.C_HIGHMEM_HIGHADDR {0x4113fffff} \
CONFIG.C_IS_AFI {0} \
CONFIG.C_IS_AXI4 {1} \
CONFIG.C_M_AXI_ADDR_WIDTH {40} \
CONFIG.C_M_AXI_DATA_WIDTH {32} \
CONFIG.C_M_AXI_THREAD_ID_WIDTH {6} \
CONFIG.C_NUM_EXCL {8} \
CONFIG.C_S_AXI_ADDR_WIDTH {40} \
CONFIG.C_S_AXI_DATA_WIDTH {128} \
CONFIG.C_S_AXI_ID_WIDTH {16} \
 ] $axi_ex_4

  # Create instance: axi_ex_5, and set properties
  set axi_ex_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_exerciser:1.00.b axi_ex_5 ]
  set_property -dict [ list \
CONFIG.C_BASEADDR {0xa1400000} \
CONFIG.C_ENABLE_HIGHMEM {1} \
CONFIG.C_HIGHADDR {0xa17fffff} \
CONFIG.C_HIGHMEM_BASEADDR {0x411400000} \
CONFIG.C_HIGHMEM_HIGHADDR {0x4117fffff} \
CONFIG.C_IS_AFI {0} \
CONFIG.C_IS_AXI4 {1} \
CONFIG.C_M_AXI_ADDR_WIDTH {40} \
CONFIG.C_M_AXI_DATA_WIDTH {128} \
CONFIG.C_M_AXI_THREAD_ID_WIDTH {6} \
CONFIG.C_NUM_EXCL {8} \
CONFIG.C_S_AXI_ADDR_WIDTH {40} \
CONFIG.C_S_AXI_DATA_WIDTH {128} \
CONFIG.C_S_AXI_ID_WIDTH {16} \
 ] $axi_ex_5

  # Create instance: axi_ex_6, and set properties
  set axi_ex_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_exerciser:1.00.b axi_ex_6 ]
  set_property -dict [ list \
CONFIG.C_BASEADDR {0xb0000000} \
CONFIG.C_HIGHADDR {0xb03fffff} \
CONFIG.C_IS_AFI {0} \
CONFIG.C_IS_AXI4 {1} \
CONFIG.C_M_AXI_ADDR_WIDTH {40} \
CONFIG.C_M_AXI_DATA_WIDTH {128} \
CONFIG.C_M_AXI_THREAD_ID_WIDTH {6} \
CONFIG.C_NUM_EXCL {8} \
CONFIG.C_S_AXI_ADDR_WIDTH {40} \
CONFIG.C_S_AXI_DATA_WIDTH {32} \
CONFIG.C_S_AXI_ID_WIDTH {16} \
 ] $axi_ex_6

  # Create instance: axi_ex_7, and set properties
  set axi_ex_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_exerciser:1.00.b axi_ex_7 ]
  set_property -dict [ list \
CONFIG.C_BASEADDR {0xa1800000} \
CONFIG.C_ENABLE_HIGHMEM {1} \
CONFIG.C_HIGHADDR {0xa1bfffff} \
CONFIG.C_HIGHMEM_BASEADDR {0x411800000} \
CONFIG.C_HIGHMEM_HIGHADDR {0x411bfffff} \
CONFIG.C_IS_AFI {0} \
CONFIG.C_IS_AXI4 {1} \
CONFIG.C_IS_COHERENT {1} \
CONFIG.C_M_AXI_ADDR_WIDTH {40} \
CONFIG.C_M_AXI_ARUSER_WIDTH {2} \
CONFIG.C_M_AXI_AWUSER_WIDTH {2} \
CONFIG.C_M_AXI_DATA_WIDTH {128} \
CONFIG.C_M_AXI_THREAD_ID_WIDTH {5} \
CONFIG.C_NUM_EXCL {8} \
CONFIG.C_S_AXI_ADDR_WIDTH {40} \
CONFIG.C_S_AXI_DATA_WIDTH {128} \
CONFIG.C_S_AXI_ID_WIDTH {16} \
 ] $axi_ex_7

  # Create instance: axi_ex_8, and set properties
  set axi_ex_8 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_exerciser:1.00.b axi_ex_8 ]
  set_property -dict [ list \
CONFIG.C_BASEADDR {0xa1c00000} \
CONFIG.C_ENABLE_HIGHMEM {1} \
CONFIG.C_HIGHADDR {0xa1ffffff} \
CONFIG.C_HIGHMEM_BASEADDR {0x411c00000} \
CONFIG.C_HIGHMEM_HIGHADDR {0x411ffffff} \
CONFIG.C_IS_ACE {1} \
CONFIG.C_IS_AFI {0} \
CONFIG.C_IS_AXI4 {1} \
CONFIG.C_IS_COHERENT {0} \
CONFIG.C_M_AXI_ADDR_WIDTH {40} \
CONFIG.C_M_AXI_ARUSER_WIDTH {10} \
CONFIG.C_M_AXI_AWUSER_WIDTH {10} \
CONFIG.C_M_AXI_DATA_WIDTH {128} \
CONFIG.C_M_AXI_THREAD_ID_WIDTH {5} \
CONFIG.C_NUM_EXCL {8} \
CONFIG.C_S_AXI_ADDR_WIDTH {40} \
CONFIG.C_S_AXI_DATA_WIDTH {128} \
CONFIG.C_S_AXI_ID_WIDTH {16} \
 ] $axi_ex_8

  # Create instance: axi_interconnect_1, and set properties
  set axi_interconnect_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_1 ]
  set_property -dict [ list \
CONFIG.NUM_MI {10} \
CONFIG.S00_HAS_REGSLICE {4} \
 ] $axi_interconnect_1

  # Create instance: axi_monitor_0, and set properties
  set axi_monitor_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_monitor:1.00.c axi_monitor_0 ]
  set_property -dict [ list \
CONFIG.C_BASEADDR {0xa0180000} \
CONFIG.C_DEPTH_MUL {8} \
CONFIG.C_HIGHADDR {0xa0180fff} \
CONFIG.C_IS_AXI4 {1} \
CONFIG.C_REGISTER_AXI {1} \
CONFIG.C_REG_LA_ADDR {1} \
CONFIG.C_SYSTEM_TYPE {0x04f4e918} \
CONFIG.C_S_AXI_DATA_WIDTH {128} \
CONFIG.C_S_AXI_ID_WIDTH {16} \
 ] $axi_monitor_0

  # Create instance: axi_monitor_1, and set properties
  set axi_monitor_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_monitor:1.00.c axi_monitor_1 ]
  set_property -dict [ list \
CONFIG.C_BASEADDR {0xa0181000} \
CONFIG.C_DEPTH_MUL {8} \
CONFIG.C_HIGHADDR {0xa0181fff} \
CONFIG.C_IS_AXI4 {1} \
CONFIG.C_REGISTER_AXI {1} \
CONFIG.C_REG_LA_ADDR {1} \
CONFIG.C_SYSTEM_TYPE {00000000000000000000000000000000} \
CONFIG.C_S_AXI_DATA_WIDTH {128} \
CONFIG.C_S_AXI_ID_WIDTH {16} \
 ] $axi_monitor_1

  # Create instance: axi_monstub_mgp0, and set properties
  set axi_monstub_mgp0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_monstub:1.00.c axi_monstub_mgp0 ]
  set_property -dict [ list \
CONFIG.C_AXI_ADDR_WIDTH {40} \
CONFIG.C_AXI_ARUSER_WIDTH {16} \
CONFIG.C_AXI_AWUSER_WIDTH {16} \
CONFIG.C_AXI_DATA_WIDTH {128} \
CONFIG.C_AXI_ID_WIDTH {16} \
CONFIG.C_AXI_PROTOCOL {AXI4} \
CONFIG.C_REGISTER_AXI {1} \
 ] $axi_monstub_mgp0

  # Create instance: axi_monstub_mgp1, and set properties
  set axi_monstub_mgp1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_monstub:1.00.c axi_monstub_mgp1 ]
  set_property -dict [ list \
CONFIG.C_AXI_ADDR_WIDTH {40} \
CONFIG.C_AXI_ARUSER_WIDTH {16} \
CONFIG.C_AXI_AWUSER_WIDTH {16} \
CONFIG.C_AXI_DATA_WIDTH {32} \
CONFIG.C_AXI_ID_WIDTH {16} \
CONFIG.C_AXI_PROTOCOL {AXI4} \
CONFIG.C_REGISTER_AXI {1} \
 ] $axi_monstub_mgp1

  # Create instance: axi_monstub_mgp2, and set properties
  set axi_monstub_mgp2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_monstub:1.00.c axi_monstub_mgp2 ]
  set_property -dict [ list \
CONFIG.C_AXI_ADDR_WIDTH {40} \
CONFIG.C_AXI_ARUSER_WIDTH {16} \
CONFIG.C_AXI_AWUSER_WIDTH {16} \
CONFIG.C_AXI_DATA_WIDTH {64} \
CONFIG.C_AXI_ID_WIDTH {16} \
CONFIG.C_AXI_PROTOCOL {AXI4} \
CONFIG.C_REGISTER_AXI {1} \
 ] $axi_monstub_mgp2

  # Create instance: axi_monstub_sace, and set properties
  set axi_monstub_sace [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_monstub:1.00.c axi_monstub_sace ]
  set_property -dict [ list \
CONFIG.C_AXI_ADDR_WIDTH {40} \
CONFIG.C_AXI_ARUSER_WIDTH {1} \
CONFIG.C_AXI_AWUSER_WIDTH {1} \
CONFIG.C_AXI_DATA_WIDTH {128} \
CONFIG.C_AXI_ID_WIDTH {5} \
CONFIG.C_AXI_PROTOCOL {ACE} \
CONFIG.C_REGISTER_AXI {1} \
 ] $axi_monstub_sace

  # Create instance: axi_monstub_sacp, and set properties
  set axi_monstub_sacp [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_monstub:1.00.c axi_monstub_sacp ]
  set_property -dict [ list \
CONFIG.C_AXI_ADDR_WIDTH {40} \
CONFIG.C_AXI_ARUSER_WIDTH {1} \
CONFIG.C_AXI_AWUSER_WIDTH {1} \
CONFIG.C_AXI_DATA_WIDTH {128} \
CONFIG.C_AXI_ID_WIDTH {5} \
CONFIG.C_AXI_PROTOCOL {AXI4} \
CONFIG.C_REGISTER_AXI {1} \
 ] $axi_monstub_sacp

  # Create instance: axi_monstub_sgp0, and set properties
  set axi_monstub_sgp0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_monstub:1.00.c axi_monstub_sgp0 ]
  set_property -dict [ list \
CONFIG.C_AXI_ADDR_WIDTH {40} \
CONFIG.C_AXI_ARUSER_WIDTH {1} \
CONFIG.C_AXI_AWUSER_WIDTH {1} \
CONFIG.C_AXI_DATA_WIDTH {128} \
CONFIG.C_AXI_ID_WIDTH {6} \
CONFIG.C_AXI_PROTOCOL {AXI4} \
CONFIG.C_REGISTER_AXI {1} \
 ] $axi_monstub_sgp0

  # Create instance: axi_monstub_sgp1, and set properties
  set axi_monstub_sgp1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_monstub:1.00.c axi_monstub_sgp1 ]
  set_property -dict [ list \
CONFIG.C_AXI_ADDR_WIDTH {40} \
CONFIG.C_AXI_ARUSER_WIDTH {1} \
CONFIG.C_AXI_AWUSER_WIDTH {1} \
CONFIG.C_AXI_DATA_WIDTH {128} \
CONFIG.C_AXI_ID_WIDTH {6} \
CONFIG.C_AXI_PROTOCOL {AXI4} \
CONFIG.C_REGISTER_AXI {1} \
 ] $axi_monstub_sgp1

  # Create instance: axi_monstub_sgp2, and set properties
  set axi_monstub_sgp2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_monstub:1.00.c axi_monstub_sgp2 ]
  set_property -dict [ list \
CONFIG.C_AXI_ADDR_WIDTH {40} \
CONFIG.C_AXI_ARUSER_WIDTH {1} \
CONFIG.C_AXI_AWUSER_WIDTH {1} \
CONFIG.C_AXI_DATA_WIDTH {128} \
CONFIG.C_AXI_ID_WIDTH {6} \
CONFIG.C_AXI_PROTOCOL {AXI4} \
CONFIG.C_REGISTER_AXI {1} \
 ] $axi_monstub_sgp2

  # Create instance: axi_monstub_sgp3, and set properties
  set axi_monstub_sgp3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_monstub:1.00.c axi_monstub_sgp3 ]
  set_property -dict [ list \
CONFIG.C_AXI_ADDR_WIDTH {40} \
CONFIG.C_AXI_ARUSER_WIDTH {1} \
CONFIG.C_AXI_AWUSER_WIDTH {1} \
CONFIG.C_AXI_DATA_WIDTH {64} \
CONFIG.C_AXI_ID_WIDTH {6} \
CONFIG.C_AXI_PROTOCOL {AXI4} \
CONFIG.C_REGISTER_AXI {1} \
 ] $axi_monstub_sgp3

  # Create instance: axi_monstub_sgp4, and set properties
  set axi_monstub_sgp4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_monstub:1.00.c axi_monstub_sgp4 ]
  set_property -dict [ list \
CONFIG.C_AXI_ADDR_WIDTH {40} \
CONFIG.C_AXI_ARUSER_WIDTH {1} \
CONFIG.C_AXI_AWUSER_WIDTH {1} \
CONFIG.C_AXI_DATA_WIDTH {32} \
CONFIG.C_AXI_ID_WIDTH {6} \
CONFIG.C_AXI_PROTOCOL {AXI4} \
CONFIG.C_REGISTER_AXI {1} \
 ] $axi_monstub_sgp4

  # Create instance: axi_monstub_sgp5, and set properties
  set axi_monstub_sgp5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_monstub:1.00.c axi_monstub_sgp5 ]
  set_property -dict [ list \
CONFIG.C_AXI_ADDR_WIDTH {40} \
CONFIG.C_AXI_ARUSER_WIDTH {1} \
CONFIG.C_AXI_AWUSER_WIDTH {1} \
CONFIG.C_AXI_DATA_WIDTH {128} \
CONFIG.C_AXI_ID_WIDTH {6} \
CONFIG.C_AXI_PROTOCOL {AXI4} \
CONFIG.C_REGISTER_AXI {1} \
 ] $axi_monstub_sgp5

  # Create instance: axi_monstub_sgp6, and set properties
  set axi_monstub_sgp6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_monstub:1.00.c axi_monstub_sgp6 ]
  set_property -dict [ list \
CONFIG.C_AXI_ADDR_WIDTH {40} \
CONFIG.C_AXI_ARUSER_WIDTH {1} \
CONFIG.C_AXI_AWUSER_WIDTH {1} \
CONFIG.C_AXI_DATA_WIDTH {128} \
CONFIG.C_AXI_ID_WIDTH {6} \
CONFIG.C_AXI_PROTOCOL {AXI4} \
CONFIG.C_REGISTER_AXI {1} \
 ] $axi_monstub_sgp6

  # Create instance: dbg_monmux_0, and set properties
  set dbg_monmux_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:dbg_monmux:1.0 dbg_monmux_0 ]
  set_property -dict [ list \
CONFIG.C_MUX_BIT {10} \
 ] $dbg_monmux_0

  # Create instance: dbg_monmux_1, and set properties
  set dbg_monmux_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:dbg_monmux:1.0 dbg_monmux_1 ]
  set_property -dict [ list \
CONFIG.C_MUX_BIT {14} \
 ] $dbg_monmux_1

  # Create instance: dbg_monmux_2, and set properties
  set dbg_monmux_2 [ create_bd_cell -type ip -vlnv xilinx.com:user:dbg_monmux:1.0 dbg_monmux_2 ]
  set_property -dict [ list \
CONFIG.C_MUX_BIT {12} \
 ] $dbg_monmux_2

  # Create instance: gmiiloop_0, and set properties
  set gmiiloop_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:gmiiloop:1.0 gmiiloop_0 ]

  # Create instance: gmiiloop_1, and set properties
  set gmiiloop_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:gmiiloop:1.0 gmiiloop_1 ]

  # Create instance: gmiiloop_2, and set properties
  set gmiiloop_2 [ create_bd_cell -type ip -vlnv xilinx.com:user:gmiiloop:1.0 gmiiloop_2 ]

  # Create instance: gmiiloop_3, and set properties
  set gmiiloop_3 [ create_bd_cell -type ip -vlnv xilinx.com:user:gmiiloop:1.0 gmiiloop_3 ]

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: proc_sys_reset_1, and set properties
  set proc_sys_reset_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_1 ]

  # Create instance: reset_0, and set properties
  set reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 reset_0 ]
  set_property -dict [ list \
CONFIG.C_NUM_INTERCONNECT_ARESETN {1} \
CONFIG.C_NUM_PERP_RST {1} \
 ] $reset_0

  # Create instance: util_ds_buf_0, and set properties
  set util_ds_buf_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 util_ds_buf_0 ]
  set_property -dict [ list \
CONFIG.C_BUF_TYPE {IBUFDS} \
 ] $util_ds_buf_0

  # Create instance: util_ds_buf_1, and set properties
  set util_ds_buf_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 util_ds_buf_1 ]
  set_property -dict [ list \
CONFIG.C_BUF_TYPE {BUFG} \
 ] $util_ds_buf_1

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $xlconstant_0

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $xlconstant_1

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $xlconstant_2
 
  # Create instance: zynq_ultra_ps_e_0, and set properties
  set_property -dict [ list \
CONFIG.PSU__ENET0__PERIPHERAL__ENABLE {1} \
CONFIG.PSU__ENET0__PERIPHERAL__IO {EMIO} \
CONFIG.PSU__ENET1__PERIPHERAL__ENABLE {1} \
CONFIG.PSU__ENET1__PERIPHERAL__IO {EMIO} \
CONFIG.PSU__ENET2__PERIPHERAL__ENABLE {1} \
CONFIG.PSU__ENET2__PERIPHERAL__IO {EMIO} \
CONFIG.PSU__ENET3__PERIPHERAL__ENABLE {1} \
CONFIG.PSU__ENET3__PERIPHERAL__IO {EMIO} \
CONFIG.PSU__FPGA_PL0_ENABLE {1} \
CONFIG.PSU__FPGA_PL1_ENABLE {1} \
CONFIG.PSU__FPGA_PL2_ENABLE {0} \
CONFIG.PSU__FPGA_PL3_ENABLE {0} \
CONFIG.PSU__FTM__CTI_IN {0} \
CONFIG.PSU__FTM__CTI_OUT {0} \
CONFIG.PSU__FTM__GPI {0} \
CONFIG.PSU__FTM__GPO {0} \
CONFIG.PSU__GPIO0_EMIO__PERIPHERAL__ENABLE {1} \
CONFIG.PSU__GPIO1_EMIO__PERIPHERAL__ENABLE {1} \
CONFIG.PSU__I2C0__PERIPHERAL__ENABLE {0} \
CONFIG.PSU__MAXIGP1__DATA_WIDTH {32} \
CONFIG.PSU__MAXIGP2__DATA_WIDTH {64} \
CONFIG.PSU__PMU__PERIPHERAL__ENABLE {1} \
CONFIG.PSU__PMU__EMIO_GPI__ENABLE {1} \
CONFIG.PSU__PMU__EMIO_GPO__ENABLE {1} \
CONFIG.PSU__SAXIGP3__DATA_WIDTH {64} \
CONFIG.PSU__SAXIGP4__DATA_WIDTH {32} \
CONFIG.PSU__USE__IRQ0 {1} \
CONFIG.PSU__USE__IRQ1 {1} \
CONFIG.PSU__USE__M_AXI_GP0 {1} \
CONFIG.PSU__USE__M_AXI_GP1 {1} \
CONFIG.PSU__USE__M_AXI_GP2 {1} \
CONFIG.PSU__USE__STM {0} \
CONFIG.PSU__USE__S_AXI_ACE {1} \
CONFIG.PSU__USE__S_AXI_ACP {1} \
CONFIG.PSU__USE__S_AXI_GP0 {1} \
CONFIG.PSU__USE__S_AXI_GP1 {1} \
CONFIG.PSU__USE__S_AXI_GP2 {1} \
CONFIG.PSU__USE__S_AXI_GP3 {1} \
CONFIG.PSU__USE__S_AXI_GP4 {1} \
CONFIG.PSU__USE__S_AXI_GP5 {1} \
CONFIG.PSU__USE__S_AXI_GP6 {1} \
CONFIG.PSU__USE__VIDEO {1} \
   ] [get_bd_cells zynq_ultra_ps_e_0]

  # Create interface connections
  connect_bd_intf_net -intf_net axi_ex_0_M_AXI [get_bd_intf_pins axi_ex_0/M_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HPC0_FPD]
connect_bd_intf_net -intf_net [get_bd_intf_nets axi_ex_0_M_AXI] [get_bd_intf_pins axi_ex_0/M_AXI] [get_bd_intf_pins axi_monstub_sgp0/AXI4]
  connect_bd_intf_net -intf_net axi_ex_1_M_AXI [get_bd_intf_pins axi_ex_1/M_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HPC1_FPD]
connect_bd_intf_net -intf_net [get_bd_intf_nets axi_ex_1_M_AXI] [get_bd_intf_pins axi_ex_1/M_AXI] [get_bd_intf_pins axi_monstub_sgp1/AXI4]
  connect_bd_intf_net -intf_net axi_ex_2_M_AXI [get_bd_intf_pins axi_ex_2/M_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HP0_FPD]
connect_bd_intf_net -intf_net [get_bd_intf_nets axi_ex_2_M_AXI] [get_bd_intf_pins axi_ex_2/M_AXI] [get_bd_intf_pins axi_monstub_sgp2/AXI4]
  connect_bd_intf_net -intf_net axi_ex_3_M_AXI [get_bd_intf_pins axi_ex_3/M_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HP1_FPD]
connect_bd_intf_net -intf_net [get_bd_intf_nets axi_ex_3_M_AXI] [get_bd_intf_pins axi_ex_3/M_AXI] [get_bd_intf_pins axi_monstub_sgp3/AXI4]
  connect_bd_intf_net -intf_net axi_ex_4_M_AXI [get_bd_intf_pins axi_ex_4/M_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HP2_FPD]
connect_bd_intf_net -intf_net [get_bd_intf_nets axi_ex_4_M_AXI] [get_bd_intf_pins axi_ex_4/M_AXI] [get_bd_intf_pins axi_monstub_sgp4/AXI4]
  connect_bd_intf_net -intf_net axi_ex_5_M_AXI [get_bd_intf_pins axi_ex_5/M_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HP3_FPD]
connect_bd_intf_net -intf_net [get_bd_intf_nets axi_ex_5_M_AXI] [get_bd_intf_pins axi_ex_5/M_AXI] [get_bd_intf_pins axi_monstub_sgp5/AXI4]
  connect_bd_intf_net -intf_net axi_ex_6_M_AXI [get_bd_intf_pins axi_ex_6/M_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_LPD]
connect_bd_intf_net -intf_net [get_bd_intf_nets axi_ex_6_M_AXI] [get_bd_intf_pins axi_ex_6/M_AXI] [get_bd_intf_pins axi_monstub_sgp6/AXI4]
  connect_bd_intf_net -intf_net axi_ex_7_M_AXI [get_bd_intf_pins axi_ex_7/M_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_ACP_FPD]
connect_bd_intf_net -intf_net [get_bd_intf_nets axi_ex_7_M_AXI] [get_bd_intf_pins axi_ex_7/M_AXI] [get_bd_intf_pins axi_monstub_sacp/AXI4]
  connect_bd_intf_net -intf_net axi_ex_8_ACE [get_bd_intf_pins axi_ex_8/ACE] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_ACE_FPD]
connect_bd_intf_net -intf_net [get_bd_intf_nets axi_ex_8_ACE] [get_bd_intf_pins axi_ex_8/ACE] [get_bd_intf_pins axi_monstub_sace/ACE]
  connect_bd_intf_net -intf_net axi_interconnect_1_M00_AXI [get_bd_intf_pins axi_interconnect_1/M00_AXI] [get_bd_intf_pins axi_monitor_0/S_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_1_M01_AXI [get_bd_intf_pins axi_ex_1/S_AXI] [get_bd_intf_pins axi_interconnect_1/M01_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_1_M02_AXI [get_bd_intf_pins axi_ex_2/S_AXI] [get_bd_intf_pins axi_interconnect_1/M02_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_1_M03_AXI [get_bd_intf_pins axi_ex_3/S_AXI] [get_bd_intf_pins axi_interconnect_1/M03_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_1_M04_AXI [get_bd_intf_pins axi_ex_4/S_AXI] [get_bd_intf_pins axi_interconnect_1/M04_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_1_M05_AXI [get_bd_intf_pins axi_ex_5/S_AXI] [get_bd_intf_pins axi_interconnect_1/M05_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_1_M06_AXI [get_bd_intf_pins axi_ex_7/S_AXI] [get_bd_intf_pins axi_interconnect_1/M06_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_1_M07_AXI [get_bd_intf_pins axi_interconnect_1/M07_AXI] [get_bd_intf_pins axi_monitor_1/S_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_1_M08_AXI [get_bd_intf_pins axi_dpchk_0/S_AXI] [get_bd_intf_pins axi_interconnect_1/M08_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_1_M09_AXI [get_bd_intf_pins axi_ex_8/S_AXI] [get_bd_intf_pins axi_interconnect_1/M09_AXI]
  connect_bd_intf_net -intf_net zynq_ultra_ps_e_0_M_AXI_HPM0_FPD [get_bd_intf_pins axi_ex_0/S_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/M_AXI_HPM0_LPD]
connect_bd_intf_net -intf_net [get_bd_intf_nets zynq_ultra_ps_e_0_M_AXI_HPM0_FPD] [get_bd_intf_pins axi_monstub_mgp2/AXI4] [get_bd_intf_pins zynq_ultra_ps_e_0/M_AXI_HPM0_LPD]
  connect_bd_intf_net -intf_net zynq_ultra_ps_e_0_M_AXI_HPM0_LPD [get_bd_intf_pins axi_interconnect_1/S00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/M_AXI_HPM0_FPD]
connect_bd_intf_net -intf_net [get_bd_intf_nets zynq_ultra_ps_e_0_M_AXI_HPM0_LPD] [get_bd_intf_pins axi_monstub_mgp0/AXI4] [get_bd_intf_pins zynq_ultra_ps_e_0/M_AXI_HPM0_FPD]
  connect_bd_intf_net -intf_net zynq_ultra_ps_e_0_M_AXI_HPM1_FPD [get_bd_intf_pins axi_ex_6/S_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/M_AXI_HPM1_FPD]
connect_bd_intf_net -intf_net [get_bd_intf_nets zynq_ultra_ps_e_0_M_AXI_HPM1_FPD] [get_bd_intf_pins axi_monstub_mgp1/AXI4] [get_bd_intf_pins zynq_ultra_ps_e_0/M_AXI_HPM1_FPD]

  # Create port connections
  connect_bd_net -net M08_ARESETN_1 [get_bd_pins axi_dpchk_0/axi_aresetn] [get_bd_pins axi_interconnect_1/M08_ARESETN] [get_bd_pins proc_sys_reset_0/interconnect_aresetn]
  connect_bd_net -net Net [get_bd_pins axi_monitor_0/debug_ina2_127_0] [get_bd_pins axi_monstub_mgp2/debug_out_b_127_0] [get_bd_pins dbg_monmux_0/debug_in0_127_0]
  connect_bd_net -net Net1 [get_bd_pins axi_monitor_0/debug_inc1_ext_15_0] [get_bd_pins axi_monstub_mgp2/debug_out_a_ext_15_0] [get_bd_pins dbg_monmux_0/debug_in0_ext_15_0]
  connect_bd_net -net axi_dpchk_0_bpg_de [get_bd_pins axi_dpchk_0/bpg_de] [get_bd_pins zynq_ultra_ps_e_0/dp_live_video_in_de]
  connect_bd_net -net axi_dpchk_0_bpg_hs [get_bd_pins axi_dpchk_0/bpg_hs] [get_bd_pins zynq_ultra_ps_e_0/dp_live_video_in_hsync]
  connect_bd_net -net axi_dpchk_0_bpg_out [get_bd_pins axi_dpchk_0/bpg_out] [get_bd_pins zynq_ultra_ps_e_0/dp_live_gfx_pixel1_in]
  connect_bd_net -net axi_dpchk_0_bpg_vs [get_bd_pins axi_dpchk_0/bpg_vs] [get_bd_pins zynq_ultra_ps_e_0/dp_live_video_in_vsync]
  connect_bd_net -net axi_dpchk_0_dbg0_ext_o [get_bd_pins axi_dpchk_0/dbg0_ext_o] [get_bd_pins axi_monitor_1/debug_inc3_ext_15_0]
  connect_bd_net -net axi_dpchk_0_dbg0_o [get_bd_pins axi_dpchk_0/dbg0_o] [get_bd_pins axi_monitor_1/debug_inc3_127_0]
  connect_bd_net -net axi_dpchk_0_dbg1_ext_o [get_bd_pins axi_dpchk_0/dbg1_ext_o] [get_bd_pins axi_monitor_1/debug_ind3_ext_15_0]
  connect_bd_net -net axi_dpchk_0_dbg1_o [get_bd_pins axi_dpchk_0/dbg1_o] [get_bd_pins axi_monitor_1/debug_ind3_127_0]
  connect_bd_net -net axi_dpchk_0_err_out8_o [get_bd_pins axi_dpchk_0/err_out8_o] [get_bd_pins axi_monitor_1/err_in8]
  connect_bd_net -net axi_ex_0_dbg_out [get_bd_pins axi_ex_0/dbg_out] [get_bd_pins axi_monitor_0/debug_ind2_127_0]
  connect_bd_net -net axi_ex_0_dbg_out_ext [get_bd_pins axi_ex_0/dbg_out_ext] [get_bd_pins axi_monitor_0/debug_ind2_ext_15_0]
  connect_bd_net -net axi_ex_0_err_out [get_bd_pins axi_ex_0/err_out] [get_bd_pins axi_monitor_0/err_in0]
  connect_bd_net -net axi_ex_0_irq_out [get_bd_pins axi_ex_0/irq_out] [get_bd_pins axi_monitor_0/ext_int]
  connect_bd_net -net axi_ex_1_err_out [get_bd_pins axi_ex_1/err_out] [get_bd_pins axi_monitor_0/err_in1]
  connect_bd_net -net axi_ex_1_irq_out [get_bd_pins axi_ex_1/irq_out] [get_bd_pins axi_monitor_0/ext_int1]
  connect_bd_net -net axi_ex_2_err_out [get_bd_pins axi_ex_2/err_out] [get_bd_pins axi_monitor_0/err_in2]
  connect_bd_net -net axi_ex_2_irq_out [get_bd_pins axi_ex_2/irq_out] [get_bd_pins axi_monitor_0/ext_int2]
  connect_bd_net -net axi_ex_3_err_out [get_bd_pins axi_ex_3/err_out] [get_bd_pins axi_monitor_0/err_in3]
  connect_bd_net -net axi_ex_3_irq_out [get_bd_pins axi_ex_3/irq_out] [get_bd_pins axi_monitor_0/ext_int3]
  connect_bd_net -net axi_ex_4_err_out [get_bd_pins axi_ex_4/err_out] [get_bd_pins axi_monitor_0/err_in4]
  connect_bd_net -net axi_ex_4_irq_out [get_bd_pins axi_ex_4/irq_out] [get_bd_pins axi_monitor_0/ext_int4]
  connect_bd_net -net axi_ex_5_err_out [get_bd_pins axi_ex_5/err_out] [get_bd_pins axi_monitor_0/err_in5]
  connect_bd_net -net axi_ex_5_irq_out [get_bd_pins axi_ex_5/irq_out] [get_bd_pins axi_monitor_0/ext_int5]
  connect_bd_net -net axi_ex_6_err_out [get_bd_pins axi_ex_6/err_out] [get_bd_pins axi_monitor_0/err_in6]
  connect_bd_net -net axi_ex_6_irq_out [get_bd_pins axi_ex_6/irq_out] [get_bd_pins axi_monitor_0/ext_int6]
  connect_bd_net -net axi_ex_7_dbg_out [get_bd_pins axi_ex_7/dbg_out] [get_bd_pins axi_monitor_1/debug_ind1_127_0]
  connect_bd_net -net axi_ex_7_dbg_out_ext [get_bd_pins axi_ex_7/dbg_out_ext] [get_bd_pins axi_monitor_1/debug_ind1_ext_15_0]
  connect_bd_net -net axi_ex_7_err_out [get_bd_pins axi_ex_7/err_out] [get_bd_pins axi_monitor_0/err_in7]
  connect_bd_net -net axi_ex_7_irq_out [get_bd_pins axi_ex_7/irq_out] [get_bd_pins axi_monitor_0/ext_int7]
  connect_bd_net -net axi_ex_8_err_out [get_bd_pins axi_ex_8/err_out] [get_bd_pins axi_monitor_0/err_in8a]
  connect_bd_net -net axi_ex_8_irq_out [get_bd_pins axi_ex_8/irq_out] [get_bd_pins axi_monitor_0/ext_int8]
  connect_bd_net -net axi_monitor_0_global_test_en_l [get_bd_pins axi_ex_0/global_test_en_l] [get_bd_pins axi_ex_1/global_test_en_l] [get_bd_pins axi_ex_2/global_test_en_l] [get_bd_pins axi_ex_3/global_test_en_l] [get_bd_pins axi_ex_4/global_test_en_l] [get_bd_pins axi_ex_5/global_test_en_l] [get_bd_pins axi_ex_6/global_test_en_l] [get_bd_pins axi_ex_7/global_test_en_l] [get_bd_pins axi_ex_8/global_test_en_l] [get_bd_pins axi_monitor_0/global_test_en_l]
  connect_bd_net -net axi_monitor_0_gpio_systype96 [get_bd_pins axi_monitor_0/gpio_systype96] [get_bd_pins zynq_ultra_ps_e_0/emio_gpio_i]
  connect_bd_net -net axi_monitor_0_mii_ctl0 [get_bd_pins axi_monitor_0/mii_ctl0] [get_bd_pins gmiiloop_1/mii_ctl]
  connect_bd_net -net axi_monitor_0_mii_ctl1 [get_bd_pins axi_monitor_0/mii_ctl1] [get_bd_pins gmiiloop_0/mii_ctl]
  connect_bd_net -net axi_monitor_0_mii_ctl2 [get_bd_pins axi_monitor_0/mii_ctl2] [get_bd_pins dbg_monmux_0/mux_ctl] [get_bd_pins dbg_monmux_1/mux_ctl] [get_bd_pins dbg_monmux_2/mux_ctl]
  connect_bd_net -net axi_monitor_0_out_int8a [get_bd_pins axi_monitor_0/out_int8a] [get_bd_pins zynq_ultra_ps_e_0/pl_ps_irq0]
  connect_bd_net -net axi_monitor_1_mii_ctl0 [get_bd_pins axi_monitor_1/mii_ctl0] [get_bd_pins gmiiloop_3/mii_ctl]
  connect_bd_net -net axi_monitor_1_mii_ctl1 [get_bd_pins axi_monitor_1/mii_ctl1] [get_bd_pins gmiiloop_2/mii_ctl]
  connect_bd_net -net axi_monitor_1_out_int8b [get_bd_pins axi_monitor_1/out_int8b] [get_bd_pins zynq_ultra_ps_e_0/pl_ps_irq1]
  connect_bd_net -net axi_monstub_mgp0_debug_out_a_127_0 [get_bd_pins axi_monstub_mgp0/debug_out_a_127_0] [get_bd_pins dbg_monmux_0/debug_in1_127_0]
  connect_bd_net -net axi_monstub_mgp0_debug_out_a_ext_15_0 [get_bd_pins axi_monstub_mgp0/debug_out_a_ext_15_0] [get_bd_pins dbg_monmux_0/debug_in1_ext_15_0]
  connect_bd_net -net axi_monstub_mgp0_debug_out_b_127_0 [get_bd_pins axi_monitor_0/debug_ina1_127_0] [get_bd_pins axi_monstub_mgp0/debug_out_b_127_0]
  connect_bd_net -net axi_monstub_mgp1_debug_out_a_127_0 [get_bd_pins axi_monstub_mgp1/debug_out_a_127_0] [get_bd_pins dbg_monmux_0/debug_in2_127_0]
  connect_bd_net -net axi_monstub_mgp1_debug_out_a_ext_15_0 [get_bd_pins axi_monstub_mgp1/debug_out_a_ext_15_0] [get_bd_pins dbg_monmux_0/debug_in2_ext_15_0]
  connect_bd_net -net axi_monstub_mgp2_debug_out_a_127_0 [get_bd_pins axi_monitor_0/debug_inc1_127_0] [get_bd_pins axi_monstub_mgp2/debug_out_a_127_0]
  connect_bd_net -net axi_monstub_sace_debug_out_a_127_0 [get_bd_pins axi_monitor_1/debug_inb1_127_0] [get_bd_pins axi_monstub_sace/debug_out_a_127_0]
  connect_bd_net -net axi_monstub_sace_debug_out_a_ext_15_0 [get_bd_pins axi_monitor_1/debug_inb1_ext_15_0] [get_bd_pins axi_monstub_sace/debug_out_a_ext_15_0]
  connect_bd_net -net axi_monstub_sacp_debug_out_a_127_0 [get_bd_pins axi_monitor_0/debug_ind3_127_0] [get_bd_pins axi_monstub_sacp/debug_out_a_127_0] [get_bd_pins dbg_monmux_2/debug_in3_127_0]
  connect_bd_net -net axi_monstub_sacp_debug_out_a_ext_15_0 [get_bd_pins axi_monitor_0/debug_ind3_ext_15_0] [get_bd_pins axi_monstub_sacp/debug_out_a_ext_15_0] [get_bd_pins dbg_monmux_2/debug_in3_ext_15_0]
  connect_bd_net -net axi_monstub_sgp0_debug_out_a_127_0 [get_bd_pins axi_monstub_sgp0/debug_out_a_127_0] [get_bd_pins dbg_monmux_1/debug_in0_127_0]
  connect_bd_net -net axi_monstub_sgp0_debug_out_a_ext_15_0 [get_bd_pins axi_monstub_sgp0/debug_out_a_ext_15_0] [get_bd_pins dbg_monmux_1/debug_in0_ext_15_0]
  connect_bd_net -net axi_monstub_sgp0_debug_out_b_127_0 [get_bd_pins axi_monitor_0/debug_ina3_127_0] [get_bd_pins axi_monitor_1/debug_ina1_127_0] [get_bd_pins axi_monstub_sgp0/debug_out_b_127_0]
  connect_bd_net -net axi_monstub_sgp1_debug_out_a_127_0 [get_bd_pins axi_monstub_sgp1/debug_out_a_127_0] [get_bd_pins dbg_monmux_1/debug_in1_127_0]
  connect_bd_net -net axi_monstub_sgp1_debug_out_a_ext_15_0 [get_bd_pins axi_monstub_sgp1/debug_out_a_ext_15_0] [get_bd_pins dbg_monmux_1/debug_in1_ext_15_0]
  connect_bd_net -net axi_monstub_sgp2_debug_out_a_127_0 [get_bd_pins axi_monstub_sgp2/debug_out_a_127_0] [get_bd_pins dbg_monmux_1/debug_in2_127_0]
  connect_bd_net -net axi_monstub_sgp2_debug_out_a_ext_15_0 [get_bd_pins axi_monstub_sgp2/debug_out_a_ext_15_0] [get_bd_pins dbg_monmux_1/debug_in2_ext_15_0]
  connect_bd_net -net axi_monstub_sgp3_debug_out_a_127_0 [get_bd_pins axi_monstub_sgp3/debug_out_a_127_0] [get_bd_pins dbg_monmux_1/debug_in3_127_0]
  connect_bd_net -net axi_monstub_sgp3_debug_out_a_ext_15_0 [get_bd_pins axi_monstub_sgp3/debug_out_a_ext_15_0] [get_bd_pins dbg_monmux_1/debug_in3_ext_15_0]
  connect_bd_net -net axi_monstub_sgp4_debug_out_a_127_0 [get_bd_pins axi_monstub_sgp4/debug_out_a_127_0] [get_bd_pins dbg_monmux_2/debug_in0_127_0]
  connect_bd_net -net axi_monstub_sgp4_debug_out_a_ext_15_0 [get_bd_pins axi_monstub_sgp4/debug_out_a_ext_15_0] [get_bd_pins dbg_monmux_2/debug_in0_ext_15_0]
  connect_bd_net -net axi_monstub_sgp5_debug_out_a_127_0 [get_bd_pins axi_monstub_sgp5/debug_out_a_127_0] [get_bd_pins dbg_monmux_2/debug_in1_127_0]
  connect_bd_net -net axi_monstub_sgp5_debug_out_a_ext_15_0 [get_bd_pins axi_monstub_sgp5/debug_out_a_ext_15_0] [get_bd_pins dbg_monmux_2/debug_in1_ext_15_0]
  connect_bd_net -net axi_monstub_sgp6_debug_out_a_127_0 [get_bd_pins axi_monstub_sgp6/debug_out_a_127_0] [get_bd_pins dbg_monmux_2/debug_in2_127_0]
  connect_bd_net -net axi_monstub_sgp6_debug_out_a_ext_15_0 [get_bd_pins axi_monstub_sgp6/debug_out_a_ext_15_0] [get_bd_pins dbg_monmux_2/debug_in2_ext_15_0]
  connect_bd_net -net dbg_monmux_0_debug_out_127_0 [get_bd_pins axi_monitor_0/debug_inc0_127_0] [get_bd_pins dbg_monmux_0/debug_out_127_0]
  connect_bd_net -net dbg_monmux_0_debug_out_ext_15_0 [get_bd_pins axi_monitor_0/debug_inc0_ext_15_0] [get_bd_pins dbg_monmux_0/debug_out_ext_15_0]
  connect_bd_net -net dbg_monmux_1_debug_out_127_0 [get_bd_pins axi_monitor_0/debug_inb3_127_0] [get_bd_pins dbg_monmux_1/debug_out_127_0]
  connect_bd_net -net dbg_monmux_1_debug_out_ext_15_0 [get_bd_pins axi_monitor_0/debug_inb3_ext_15_0] [get_bd_pins dbg_monmux_1/debug_out_ext_15_0]
  connect_bd_net -net dbg_monmux_2_debug_out_127_0 [get_bd_pins axi_monitor_0/debug_inb1_127_0] [get_bd_pins dbg_monmux_2/debug_out_127_0]
  connect_bd_net -net dbg_monmux_2_debug_out_ext_15_0 [get_bd_pins axi_monitor_0/debug_inb1_ext_15_0] [get_bd_pins dbg_monmux_2/debug_out_ext_15_0]
  connect_bd_net -net dp_aux_data_in_1 [get_bd_ports dp_aux_data_in] [get_bd_pins zynq_ultra_ps_e_0/dp_aux_data_in]
  connect_bd_net -net dp_hot_plug_detect_1 [get_bd_ports dp_hot_plug_detect] [get_bd_pins zynq_ultra_ps_e_0/dp_hot_plug_detect]
  connect_bd_net -net gmiiloop_0_dbg_out128 [get_bd_pins axi_monitor_1/debug_inb2_127_0] [get_bd_pins gmiiloop_0/dbg_out128]
  connect_bd_net -net gmiiloop_0_phy_col [get_bd_pins gmiiloop_0/phy_col] [get_bd_pins zynq_ultra_ps_e_0/emio_enet3_gmii_col]
  connect_bd_net -net gmiiloop_0_phy_crs [get_bd_pins gmiiloop_0/phy_crs] [get_bd_pins zynq_ultra_ps_e_0/emio_enet3_gmii_crs]
  connect_bd_net -net gmiiloop_0_phy_dv [get_bd_pins gmiiloop_0/phy_dv] [get_bd_pins zynq_ultra_ps_e_0/emio_enet3_gmii_rx_dv]
  connect_bd_net -net gmiiloop_0_phy_rx_data [get_bd_pins gmiiloop_0/phy_rx_data] [get_bd_pins zynq_ultra_ps_e_0/emio_enet3_gmii_rxd]
  connect_bd_net -net gmiiloop_0_phy_rx_er [get_bd_pins gmiiloop_0/phy_rx_er] [get_bd_pins zynq_ultra_ps_e_0/emio_enet3_gmii_rx_er]
  connect_bd_net -net gmiiloop_1_dbg_out128 [get_bd_pins axi_monitor_1/debug_inc1_127_0] [get_bd_pins gmiiloop_1/dbg_out128]
  connect_bd_net -net gmiiloop_1_phy_col [get_bd_pins gmiiloop_1/phy_col] [get_bd_pins zynq_ultra_ps_e_0/emio_enet2_gmii_col]
  connect_bd_net -net gmiiloop_1_phy_crs [get_bd_pins gmiiloop_1/phy_crs] [get_bd_pins zynq_ultra_ps_e_0/emio_enet2_gmii_crs]
  connect_bd_net -net gmiiloop_1_phy_dv [get_bd_pins gmiiloop_1/phy_dv] [get_bd_pins zynq_ultra_ps_e_0/emio_enet2_gmii_rx_dv]
  connect_bd_net -net gmiiloop_1_phy_rx_data [get_bd_pins gmiiloop_1/phy_rx_data] [get_bd_pins zynq_ultra_ps_e_0/emio_enet2_gmii_rxd]
  connect_bd_net -net gmiiloop_1_phy_rx_er [get_bd_pins gmiiloop_1/phy_rx_er] [get_bd_pins zynq_ultra_ps_e_0/emio_enet2_gmii_rx_er]
  connect_bd_net -net gmiiloop_2_dbg_out128 [get_bd_pins axi_monitor_1/debug_inc2_127_0] [get_bd_pins gmiiloop_2/dbg_out128]
  connect_bd_net -net gmiiloop_2_phy_col [get_bd_pins gmiiloop_2/phy_col] [get_bd_pins zynq_ultra_ps_e_0/emio_enet1_gmii_col]
  connect_bd_net -net gmiiloop_2_phy_crs [get_bd_pins gmiiloop_2/phy_crs] [get_bd_pins zynq_ultra_ps_e_0/emio_enet1_gmii_crs]
  connect_bd_net -net gmiiloop_2_phy_dv [get_bd_pins gmiiloop_2/phy_dv] [get_bd_pins zynq_ultra_ps_e_0/emio_enet1_gmii_rx_dv]
  connect_bd_net -net gmiiloop_2_phy_rx_data [get_bd_pins gmiiloop_2/phy_rx_data] [get_bd_pins zynq_ultra_ps_e_0/emio_enet1_gmii_rxd]
  connect_bd_net -net gmiiloop_2_phy_rx_er [get_bd_pins gmiiloop_2/phy_rx_er] [get_bd_pins zynq_ultra_ps_e_0/emio_enet1_gmii_rx_er]
  connect_bd_net -net gmiiloop_3_dbg_out128 [get_bd_pins axi_monitor_1/debug_ina2_127_0] [get_bd_pins gmiiloop_3/dbg_out128]
  connect_bd_net -net gmiiloop_3_phy_col [get_bd_pins gmiiloop_3/phy_col] [get_bd_pins zynq_ultra_ps_e_0/emio_enet0_gmii_col]
  connect_bd_net -net gmiiloop_3_phy_crs [get_bd_pins gmiiloop_3/phy_crs] [get_bd_pins zynq_ultra_ps_e_0/emio_enet0_gmii_crs]
  connect_bd_net -net gmiiloop_3_phy_dv [get_bd_pins gmiiloop_3/phy_dv] [get_bd_pins zynq_ultra_ps_e_0/emio_enet0_gmii_rx_dv]
  connect_bd_net -net gmiiloop_3_phy_rx_data [get_bd_pins gmiiloop_3/phy_rx_data] [get_bd_pins zynq_ultra_ps_e_0/emio_enet0_gmii_rxd]
  connect_bd_net -net gmiiloop_3_phy_rx_er [get_bd_pins gmiiloop_3/phy_rx_er] [get_bd_pins zynq_ultra_ps_e_0/emio_enet0_gmii_rx_er]
  connect_bd_net -net pixel_clk_n_1 [get_bd_ports pixel_clk_n] [get_bd_pins util_ds_buf_0/IBUF_DS_N]
  connect_bd_net -net pixel_clk_p_1 [get_bd_ports pixel_clk_p] [get_bd_pins util_ds_buf_0/IBUF_DS_P]
  connect_bd_net -net reset_0_bus_struct_reset [get_bd_pins gmiiloop_0/rst] [get_bd_pins gmiiloop_1/rst] [get_bd_pins gmiiloop_2/rst] [get_bd_pins gmiiloop_3/rst] [get_bd_pins proc_sys_reset_1/bus_struct_reset]
  connect_bd_net -net reset_0_interconnect_aresetn [get_bd_pins axi_ex_0/Rst_n] [get_bd_pins axi_ex_1/Rst_n] [get_bd_pins axi_ex_2/Rst_n] [get_bd_pins axi_ex_3/Rst_n] [get_bd_pins axi_ex_4/Rst_n] [get_bd_pins axi_ex_5/Rst_n] [get_bd_pins axi_ex_6/Rst_n] [get_bd_pins axi_ex_7/Rst_n] [get_bd_pins axi_ex_8/Rst_n] [get_bd_pins axi_interconnect_1/ARESETN] [get_bd_pins axi_interconnect_1/M00_ARESETN] [get_bd_pins axi_interconnect_1/M01_ARESETN] [get_bd_pins axi_interconnect_1/M02_ARESETN] [get_bd_pins axi_interconnect_1/M03_ARESETN] [get_bd_pins axi_interconnect_1/M04_ARESETN] [get_bd_pins axi_interconnect_1/M05_ARESETN] [get_bd_pins axi_interconnect_1/M06_ARESETN] [get_bd_pins axi_interconnect_1/M07_ARESETN] [get_bd_pins axi_interconnect_1/M09_ARESETN] [get_bd_pins axi_interconnect_1/S00_ARESETN] [get_bd_pins axi_monitor_0/Rst_n] [get_bd_pins axi_monitor_1/Rst_n] [get_bd_pins axi_monstub_mgp0/Rst_n] [get_bd_pins axi_monstub_mgp1/Rst_n] [get_bd_pins axi_monstub_mgp2/Rst_n] [get_bd_pins axi_monstub_sace/Rst_n] [get_bd_pins axi_monstub_sacp/Rst_n] [get_bd_pins axi_monstub_sgp0/Rst_n] [get_bd_pins axi_monstub_sgp1/Rst_n] [get_bd_pins axi_monstub_sgp2/Rst_n] [get_bd_pins axi_monstub_sgp3/Rst_n] [get_bd_pins axi_monstub_sgp4/Rst_n] [get_bd_pins axi_monstub_sgp5/Rst_n] [get_bd_pins axi_monstub_sgp6/Rst_n] [get_bd_pins reset_0/interconnect_aresetn]
  connect_bd_net -net reset_0_peripheral_reset [get_bd_pins dbg_monmux_0/Rst] [get_bd_pins dbg_monmux_1/Rst] [get_bd_pins dbg_monmux_2/Rst] [get_bd_pins reset_0/peripheral_reset]
  connect_bd_net -net util_ds_buf_0_IBUF_OUT [get_bd_pins axi_dpchk_0/clk] [get_bd_pins axi_dpchk_0/vid_clk_i] [get_bd_pins axi_interconnect_1/M08_ACLK] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins util_ds_buf_1/BUFG_O] [get_bd_pins zynq_ultra_ps_e_0/dp_video_in_clk]
  connect_bd_net -net util_ds_buf_0_IBUF_OUT1 [get_bd_pins util_ds_buf_0/IBUF_OUT] [get_bd_pins util_ds_buf_1/BUFG_I]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins reset_0/ext_reset_in] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins proc_sys_reset_1/ext_reset_in] [get_bd_pins xlconstant_2/dout]
  connect_bd_net -net zynq_ultra_ps_e_0_dp_aux_data_oe_n [get_bd_ports dp_aux_data_oe_n] [get_bd_pins zynq_ultra_ps_e_0/dp_aux_data_oe_n]
  connect_bd_net -net zynq_ultra_ps_e_0_dp_aux_data_out [get_bd_ports dp_aux_data_out] [get_bd_pins zynq_ultra_ps_e_0/dp_aux_data_out]
  connect_bd_net -net zynq_ultra_ps_e_0_dp_live_video_de_out [get_bd_pins axi_dpchk_0/dp_live_video_out_de] [get_bd_pins zynq_ultra_ps_e_0/dp_live_video_de_out]
  connect_bd_net -net zynq_ultra_ps_e_0_dp_video_out_hsync [get_bd_pins axi_dpchk_0/dp_live_video_out_hsync] [get_bd_pins zynq_ultra_ps_e_0/dp_video_out_hsync]
  connect_bd_net -net zynq_ultra_ps_e_0_dp_video_out_pixel1 [get_bd_pins axi_dpchk_0/dp_live_video_out_pixel1] [get_bd_pins zynq_ultra_ps_e_0/dp_video_out_pixel1]
  connect_bd_net -net zynq_ultra_ps_e_0_dp_video_out_vsync [get_bd_pins axi_dpchk_0/dp_live_video_out_vsync] [get_bd_pins zynq_ultra_ps_e_0/dp_video_out_vsync]
  connect_bd_net -net zynq_ultra_ps_e_0_emio_enet0_gmii_tx_en [get_bd_pins gmiiloop_3/phy_tx_en] [get_bd_pins zynq_ultra_ps_e_0/emio_enet0_gmii_tx_en]
  connect_bd_net -net zynq_ultra_ps_e_0_emio_enet0_gmii_tx_er [get_bd_pins gmiiloop_3/phy_tx_er] [get_bd_pins zynq_ultra_ps_e_0/emio_enet0_gmii_tx_er]
  connect_bd_net -net zynq_ultra_ps_e_0_emio_enet0_gmii_txd [get_bd_pins gmiiloop_3/phy_tx_data] [get_bd_pins zynq_ultra_ps_e_0/emio_enet0_gmii_txd]
  connect_bd_net -net zynq_ultra_ps_e_0_emio_enet1_gmii_tx_en [get_bd_pins gmiiloop_2/phy_tx_en] [get_bd_pins zynq_ultra_ps_e_0/emio_enet1_gmii_tx_en]
  connect_bd_net -net zynq_ultra_ps_e_0_emio_enet1_gmii_tx_er [get_bd_pins gmiiloop_2/phy_tx_er] [get_bd_pins zynq_ultra_ps_e_0/emio_enet1_gmii_tx_er]
  connect_bd_net -net zynq_ultra_ps_e_0_emio_enet1_gmii_txd [get_bd_pins gmiiloop_2/phy_tx_data] [get_bd_pins zynq_ultra_ps_e_0/emio_enet1_gmii_txd]
  connect_bd_net -net zynq_ultra_ps_e_0_emio_enet2_gmii_tx_en [get_bd_pins gmiiloop_1/phy_tx_en] [get_bd_pins zynq_ultra_ps_e_0/emio_enet2_gmii_tx_en]
  connect_bd_net -net zynq_ultra_ps_e_0_emio_enet2_gmii_tx_er [get_bd_pins gmiiloop_1/phy_tx_er] [get_bd_pins zynq_ultra_ps_e_0/emio_enet2_gmii_tx_er]
  connect_bd_net -net zynq_ultra_ps_e_0_emio_enet2_gmii_txd [get_bd_pins gmiiloop_1/phy_tx_data] [get_bd_pins zynq_ultra_ps_e_0/emio_enet2_gmii_txd]
  connect_bd_net -net zynq_ultra_ps_e_0_emio_enet3_gmii_tx_en [get_bd_pins gmiiloop_0/phy_tx_en] [get_bd_pins zynq_ultra_ps_e_0/emio_enet3_gmii_tx_en]
  connect_bd_net -net zynq_ultra_ps_e_0_emio_enet3_gmii_tx_er [get_bd_pins gmiiloop_0/phy_tx_er] [get_bd_pins zynq_ultra_ps_e_0/emio_enet3_gmii_tx_er]
  connect_bd_net -net zynq_ultra_ps_e_0_emio_enet3_gmii_txd [get_bd_pins gmiiloop_0/phy_tx_data] [get_bd_pins zynq_ultra_ps_e_0/emio_enet3_gmii_txd]
  connect_bd_net -net zynq_ultra_ps_e_0_pl_clk0 [get_bd_pins axi_ex_0/Clk] [get_bd_pins axi_ex_1/Clk] [get_bd_pins axi_ex_2/Clk] [get_bd_pins axi_ex_3/Clk] [get_bd_pins axi_ex_4/Clk] [get_bd_pins axi_ex_5/Clk] [get_bd_pins axi_ex_6/Clk] [get_bd_pins axi_ex_7/Clk] [get_bd_pins axi_ex_8/Clk] [get_bd_pins axi_interconnect_1/ACLK] [get_bd_pins axi_interconnect_1/M00_ACLK] [get_bd_pins axi_interconnect_1/M01_ACLK] [get_bd_pins axi_interconnect_1/M02_ACLK] [get_bd_pins axi_interconnect_1/M03_ACLK] [get_bd_pins axi_interconnect_1/M04_ACLK] [get_bd_pins axi_interconnect_1/M05_ACLK] [get_bd_pins axi_interconnect_1/M06_ACLK] [get_bd_pins axi_interconnect_1/M07_ACLK] [get_bd_pins axi_interconnect_1/M09_ACLK] [get_bd_pins axi_interconnect_1/S00_ACLK] [get_bd_pins axi_monitor_0/Clk] [get_bd_pins axi_monitor_0/LA_Clk] [get_bd_pins axi_monitor_1/Clk] [get_bd_pins axi_monitor_1/LA_Clk] [get_bd_pins axi_monstub_mgp0/Clk] [get_bd_pins axi_monstub_mgp1/Clk] [get_bd_pins axi_monstub_mgp2/Clk] [get_bd_pins axi_monstub_sace/Clk] [get_bd_pins axi_monstub_sacp/Clk] [get_bd_pins axi_monstub_sgp0/Clk] [get_bd_pins axi_monstub_sgp1/Clk] [get_bd_pins axi_monstub_sgp2/Clk] [get_bd_pins axi_monstub_sgp3/Clk] [get_bd_pins axi_monstub_sgp4/Clk] [get_bd_pins axi_monstub_sgp5/Clk] [get_bd_pins axi_monstub_sgp6/Clk] [get_bd_pins dbg_monmux_0/Clk] [get_bd_pins dbg_monmux_1/Clk] [get_bd_pins dbg_monmux_2/Clk] [get_bd_pins reset_0/slowest_sync_clk] [get_bd_pins zynq_ultra_ps_e_0/maxihpm0_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/maxihpm0_lpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/maxihpm1_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/pl_clk0] [get_bd_pins zynq_ultra_ps_e_0/sacefpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/saxiacp_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/saxihp1_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/saxihp2_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/saxihp3_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/saxi_lpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/saxihpc0_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/saxihpc1_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/saxihp0_fpd_aclk]
  connect_bd_net -net zynq_ultra_ps_e_0_pl_clk1 [get_bd_pins gmiiloop_0/opb_clk] [get_bd_pins gmiiloop_0/opb_clk_n] [get_bd_pins gmiiloop_1/opb_clk] [get_bd_pins gmiiloop_1/opb_clk_n] [get_bd_pins gmiiloop_2/opb_clk] [get_bd_pins gmiiloop_2/opb_clk_n] [get_bd_pins gmiiloop_3/opb_clk] [get_bd_pins gmiiloop_3/opb_clk_n] [get_bd_pins proc_sys_reset_1/slowest_sync_clk] [get_bd_pins zynq_ultra_ps_e_0/pl_clk1]

  # Create address segments
  create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces axi_ex_0/Data] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP0/HPC0_DDR_LOW] SEG_zynq_ultra_ps_e_0_HPC0_DDR_LOW
  create_bd_addr_seg -range 0x40000 -offset 0xFFFC0000 [get_bd_addr_spaces axi_ex_0/Data] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP0/HPC0_LPS_OCM] SEG_zynq_ultra_ps_e_0_HPC0_LPS_OCM
  create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces axi_ex_1/Data] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP1/HPC1_DDR_LOW] SEG_zynq_ultra_ps_e_0_HPC1_DDR_LOW
  create_bd_addr_seg -range 0x40000 -offset 0xFFFC0000 [get_bd_addr_spaces axi_ex_1/Data] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP1/HPC1_LPS_OCM] SEG_zynq_ultra_ps_e_0_HPC1_LPS_OCM
  create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces axi_ex_2/Data] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/PLLPD_DDR_LOW] SEG_zynq_ultra_ps_e_0_PLLPD_DDR_LOW
  create_bd_addr_seg -range 0x40000 -offset 0xFFFC0000 [get_bd_addr_spaces axi_ex_2/Data] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/PLLPD_LPS_OCM] SEG_zynq_ultra_ps_e_0_PLLPD_LPS_OCM
  create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces axi_ex_3/Data] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP0_DDR_LOW] SEG_zynq_ultra_ps_e_0_HP0_DDR_LOW
  create_bd_addr_seg -range 0x40000 -offset 0xFFFC0000 [get_bd_addr_spaces axi_ex_3/Data] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP0_LPS_OCM] SEG_zynq_ultra_ps_e_0_HP0_LPS_OCM
  create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces axi_ex_4/Data] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP1_DDR_LOW] SEG_zynq_ultra_ps_e_0_HP1_DDR_LOW
  create_bd_addr_seg -range 0x40000 -offset 0xFFFC0000 [get_bd_addr_spaces axi_ex_4/Data] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP1_LPS_OCM] SEG_zynq_ultra_ps_e_0_HP1_LPS_OCM
  create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces axi_ex_5/Data] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP5/HP2_DDR_LOW] SEG_zynq_ultra_ps_e_0_HP2_DDR_LOW
  create_bd_addr_seg -range 0x40000 -offset 0xFFFC0000 [get_bd_addr_spaces axi_ex_5/Data] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP5/HP2_LPS_OCM] SEG_zynq_ultra_ps_e_0_HP2_LPS_OCM
  create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces axi_ex_6/Data] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP6/HP3_DDR_LOW] SEG_zynq_ultra_ps_e_0_HP3_DDR_LOW
  create_bd_addr_seg -range 0x40000 -offset 0xFFFC0000 [get_bd_addr_spaces axi_ex_6/Data] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP6/HP3_LPS_OCM] SEG_zynq_ultra_ps_e_0_HP3_LPS_OCM
  create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces axi_ex_7/Data] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIACP/ACP_DDR_LOW] SEG_zynq_ultra_ps_e_0_ACP_DDR_LOW
  create_bd_addr_seg -range 0x40000 -offset 0xFFFC0000 [get_bd_addr_spaces axi_ex_7/Data] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIACP/ACP_LPS_OCM] SEG_zynq_ultra_ps_e_0_ACP_LPS_OCM
  create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces axi_ex_8/Data] [get_bd_addr_segs zynq_ultra_ps_e_0/SACEFPD/ACE_DDR_LOW] SEG_zynq_ultra_ps_e_0_ACE_DDR_LOW
  create_bd_addr_seg -range 0x40000 -offset 0xFFFC0000 [get_bd_addr_spaces axi_ex_8/Data] [get_bd_addr_segs zynq_ultra_ps_e_0/SACEFPD/ACE_LPS_OCM] SEG_zynq_ultra_ps_e_0_ACE_LPS_OCM
  create_bd_addr_seg -range 0x10000 -offset 0xA2400000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_dpchk_0/S_AXI/Mem] SEG_axi_dpchk_0_Mem
  create_bd_addr_seg -range 0x400000 -offset 0x80000000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_ex_0/S_AXI/Mem] SEG_axi_ex_0_Mem
  create_bd_addr_seg -range 0x400000 -offset 0x410400000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_ex_1/S_AXI/HighMem] SEG_axi_ex_1_HighMem
  create_bd_addr_seg -range 0x400000 -offset 0xA0400000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_ex_1/S_AXI/Mem] SEG_axi_ex_1_Mem
  create_bd_addr_seg -range 0x400000 -offset 0x410800000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_ex_2/S_AXI/HighMem] SEG_axi_ex_2_HighMem
  create_bd_addr_seg -range 0x400000 -offset 0xA0800000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_ex_2/S_AXI/Mem] SEG_axi_ex_2_Mem
  create_bd_addr_seg -range 0x400000 -offset 0x410C00000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_ex_3/S_AXI/HighMem] SEG_axi_ex_3_HighMem
  create_bd_addr_seg -range 0x400000 -offset 0xA0C00000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_ex_3/S_AXI/Mem] SEG_axi_ex_3_Mem
  create_bd_addr_seg -range 0x400000 -offset 0x411000000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_ex_4/S_AXI/HighMem] SEG_axi_ex_4_HighMem
  create_bd_addr_seg -range 0x400000 -offset 0xA1000000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_ex_4/S_AXI/Mem] SEG_axi_ex_4_Mem
  create_bd_addr_seg -range 0x400000 -offset 0x411400000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_ex_5/S_AXI/HighMem] SEG_axi_ex_5_HighMem
  create_bd_addr_seg -range 0x400000 -offset 0xA1400000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_ex_5/S_AXI/Mem] SEG_axi_ex_5_Mem
  create_bd_addr_seg -range 0x400000 -offset 0xB0000000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_ex_6/S_AXI/Mem] SEG_axi_ex_6_Mem
  create_bd_addr_seg -range 0x400000 -offset 0x411800000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_ex_7/S_AXI/HighMem] SEG_axi_ex_7_HighMem
  create_bd_addr_seg -range 0x400000 -offset 0xA1800000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_ex_7/S_AXI/Mem] SEG_axi_ex_7_Mem
  create_bd_addr_seg -range 0x10000 -offset 0x411C00000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_ex_8/S_AXI/HighMem] SEG_axi_ex_8_HighMem
  create_bd_addr_seg -range 0x10000 -offset 0xA1C00000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_ex_8/S_AXI/Mem] SEG_axi_ex_8_Mem
  create_bd_addr_seg -range 0x1000 -offset 0xA0180000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_monitor_0/S_AXI/Mem] SEG_axi_monitor_0_Mem
  create_bd_addr_seg -range 0x1000 -offset 0xA0181000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_monitor_1/S_AXI/Mem] SEG_axi_monitor_1_Mem

   
  save_bd_design
