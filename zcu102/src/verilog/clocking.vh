/*

Rocket Chip Clock Configuration


Rocket Chip             1000              RC_CLK_MULT
 Clockrate     =   ---------------   X   -------------
  (in MHz)         ZYNQ_CLK_PERIOD       RC_CLK_DIVIDE


This sets the parameters used by rocketchip_wrapper.v to
generate its own clock.

Most uses should only change RC_CLK_MULT & RC_CLK_DIVIDE.
ZYNQ_CLK_PERIOD should only be changed to match the input
clock period set in the Vivado GUI and 
hw/src/constrs/pin_constraints.xdc

*/

`ifndef _clocking_vh_
`define _clocking_vh_


//`define ZYNQ_CLK_PERIOD  5.0
`define ZYNQ_CLK_PERIOD  3.33

`define RC_CLK_MULT      4.0

//`define RC_CLK_DIVIDE   16.0
//50MHz
`define RC_CLK_DIVIDE   24.0
//100MHz
//`define RC_CLK_DIVIDE   12.01

//500MHz
//`define RC_CLK_DIVIDE   2.402

//400Mhz
//`define RC_CLK_DIVIDE   3.003

//300Mhz
//`define RC_CLK_DIVIDE   4.004


//150Mhz
//`define RC_CLK_DIVIDE   8.008

//180MHz
//`define RC_CLK_DIVIDE   6.673

`define differential_clock

`endif // _clocking_vh_
