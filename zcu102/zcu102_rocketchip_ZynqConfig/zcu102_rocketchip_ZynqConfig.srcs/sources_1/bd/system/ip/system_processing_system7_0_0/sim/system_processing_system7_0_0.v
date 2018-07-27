
//MODULE DECLARATION
module system_processing_system7_0_0(
      maxihpm0_fpd_aclk,
      maxigp0_awid,
      maxigp0_awaddr,
      maxigp0_awlen,
      maxigp0_awsize,
      maxigp0_awburst,
      maxigp0_awlock,
      maxigp0_awcache,
      maxigp0_awprot,
      maxigp0_awvalid,
      maxigp0_awuser,
      maxigp0_awready,
      maxigp0_wdata,
      maxigp0_wstrb,
      maxigp0_wlast,
      maxigp0_wvalid,
      maxigp0_wready,
      maxigp0_bid,
      maxigp0_bresp,
      maxigp0_bvalid,
      maxigp0_bready,
      maxigp0_arid,
      maxigp0_araddr,
      maxigp0_arlen,
      maxigp0_arsize,
      maxigp0_arburst,
      maxigp0_arlock,
      maxigp0_arcache,
      maxigp0_arprot,
      maxigp0_arvalid,
      maxigp0_aruser,
      maxigp0_arready,
      maxigp0_rid,
      maxigp0_rdata,
      maxigp0_rresp,
      maxigp0_rlast,
      maxigp0_rvalid,
      maxigp0_rready,
      maxigp0_awqos,
      maxigp0_arqos,
      saxihpc0_fpd_aclk,
      saxigp0_aruser,
      saxigp0_awuser,
      saxigp0_awid,
      saxigp0_awaddr,
      saxigp0_awlen,
      saxigp0_awsize,
      saxigp0_awburst,
      saxigp0_awlock,
      saxigp0_awcache,
      saxigp0_awprot,
      saxigp0_awvalid,
      saxigp0_awready,
      saxigp0_wdata,
      saxigp0_wstrb,
      saxigp0_wlast,
      saxigp0_wvalid,
      saxigp0_wready,
      saxigp0_bid,
      saxigp0_bresp,
      saxigp0_bvalid,
      saxigp0_bready,
      saxigp0_arid,
      saxigp0_araddr,
      saxigp0_arlen,
      saxigp0_arsize,
      saxigp0_arburst,
      saxigp0_arlock,
      saxigp0_arcache,
      saxigp0_arprot,
      saxigp0_arvalid,
      saxigp0_arready,
      saxigp0_rid,
      saxigp0_rdata,
      saxigp0_rresp,
      saxigp0_rlast,
      saxigp0_rvalid,
      saxigp0_rready,
      saxigp0_awqos,
      saxigp0_arqos,
      pl_ps_irq0,
      pl_resetn0,
      pl_clk0
);

//INPUT AND OUTPUT PORTS

    input maxihpm0_fpd_aclk;
    output [15:0] maxigp0_awid;
    output [39:0] maxigp0_awaddr;
    output [7:0] maxigp0_awlen;
    output [2:0] maxigp0_awsize;
    output [1:0] maxigp0_awburst;
    output maxigp0_awlock;
    output [3:0] maxigp0_awcache;
    output [2:0] maxigp0_awprot;
    output maxigp0_awvalid;
    output [15:0] maxigp0_awuser;
    input maxigp0_awready;
    output [31:0] maxigp0_wdata;
    output [3:0] maxigp0_wstrb;
    output maxigp0_wlast;
    output maxigp0_wvalid;
    input maxigp0_wready;
    input [15:0] maxigp0_bid;
    input [1:0] maxigp0_bresp;
    input maxigp0_bvalid;
    output maxigp0_bready;
    output [15:0] maxigp0_arid;
    output [39:0] maxigp0_araddr;
    output [7:0] maxigp0_arlen;
    output [2:0] maxigp0_arsize;
    output [1:0] maxigp0_arburst;
    output maxigp0_arlock;
    output [3:0] maxigp0_arcache;
    output [2:0] maxigp0_arprot;
    output maxigp0_arvalid;
    output [15:0] maxigp0_aruser;
    input maxigp0_arready;
    input [15:0] maxigp0_rid;
    input [31:0] maxigp0_rdata;
    input [1:0] maxigp0_rresp;
    input maxigp0_rlast;
    input maxigp0_rvalid;
    output maxigp0_rready;
    output [3:0] maxigp0_awqos;
    output [3:0] maxigp0_arqos;
    input saxihpc0_fpd_aclk;
    input saxigp0_aruser;
    input saxigp0_awuser;
    input [5:0] saxigp0_awid;
    input [48:0] saxigp0_awaddr;
    input [7:0] saxigp0_awlen;
    input [2:0] saxigp0_awsize;
    input [1:0] saxigp0_awburst;
    input saxigp0_awlock;
    input [3:0] saxigp0_awcache;
    input [2:0] saxigp0_awprot;
    input saxigp0_awvalid;
    output saxigp0_awready;
    input [63:0] saxigp0_wdata;
    input [7:0] saxigp0_wstrb;
    input saxigp0_wlast;
    input saxigp0_wvalid;
    output saxigp0_wready;
    output [5:0] saxigp0_bid;
    output [1:0] saxigp0_bresp;
    output saxigp0_bvalid;
    input saxigp0_bready;
    input [5:0] saxigp0_arid;
    input [48:0] saxigp0_araddr;
    input [7:0] saxigp0_arlen;
    input [2:0] saxigp0_arsize;
    input [1:0] saxigp0_arburst;
    input saxigp0_arlock;
    input [3:0] saxigp0_arcache;
    input [2:0] saxigp0_arprot;
    input saxigp0_arvalid;
    output saxigp0_arready;
    output [5:0] saxigp0_rid;
    output [63:0] saxigp0_rdata;
    output [1:0] saxigp0_rresp;
    output saxigp0_rlast;
    output saxigp0_rvalid;
    input saxigp0_rready;
    input [3:0] saxigp0_awqos;
    input [3:0] saxigp0_arqos;
    input [0:0] pl_ps_irq0;
    output pl_resetn0;
    output pl_clk0;

//REG DECLARATIONS

    reg  [15:0] maxigp0_awid;
    reg  [39:0] maxigp0_awaddr;
    reg  [7:0] maxigp0_awlen;
    reg  [2:0] maxigp0_awsize;
    reg  [1:0] maxigp0_awburst;
    reg  maxigp0_awlock;
    reg  [3:0] maxigp0_awcache;
    reg  [2:0] maxigp0_awprot;
    reg  maxigp0_awvalid;
    reg  [15:0] maxigp0_awuser;
    reg  [31:0] maxigp0_wdata;
    reg  [3:0] maxigp0_wstrb;
    reg  maxigp0_wlast;
    reg  maxigp0_wvalid;
    reg  maxigp0_bready;
    reg  [15:0] maxigp0_arid;
    reg  [39:0] maxigp0_araddr;
    reg  [7:0] maxigp0_arlen;
    reg  [2:0] maxigp0_arsize;
    reg  [1:0] maxigp0_arburst;
    reg  maxigp0_arlock;
    reg  [3:0] maxigp0_arcache;
    reg  [2:0] maxigp0_arprot;
    reg  maxigp0_arvalid;
    reg  [15:0] maxigp0_aruser;
    reg  maxigp0_rready;
    reg  [3:0] maxigp0_awqos;
    reg  [3:0] maxigp0_arqos;
    reg  saxigp0_awready;
    reg  saxigp0_wready;
    reg  [5:0] saxigp0_bid;
    reg  [1:0] saxigp0_bresp;
    reg  saxigp0_bvalid;
    reg  saxigp0_arready;
    reg  [5:0] saxigp0_rid;
    reg  [63:0] saxigp0_rdata;
    reg  [1:0] saxigp0_rresp;
    reg  saxigp0_rlast;
    reg  saxigp0_rvalid;
    reg  pl_resetn0;
    reg  pl_clk0;

initial
 begin


   $display("WARNING: Zynq UltraScale IP doesn't support simulation");
     end
endmodule
