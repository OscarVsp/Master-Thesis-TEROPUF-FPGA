--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
--Date        : Tue Apr 11 12:23:16 2023
--Host        : PC-Oscar running 64-bit major release  (build 9200)
--Command     : generate_target puf.bd
--Design      : puf
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf is
  port (
    reset : in STD_LOGIC;
    sys_clock : in STD_LOGIC;
    usb_uart_rxd : in STD_LOGIC;
    usb_uart_txd : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of puf : entity is "puf,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=puf,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=7,numReposBlks=7,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=4,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of puf : entity is "puf.hwdef";
end puf;

architecture STRUCTURE of puf is
  component puf_clk_wiz_1_0 is
  port (
    reset : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component puf_clk_wiz_1_0;
  component puf_proc_sys_reset_1_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component puf_proc_sys_reset_1_0;
  component puf_axi_uartlite_2_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    rx : in STD_LOGIC;
    tx : out STD_LOGIC
  );
  end component puf_axi_uartlite_2_0;
  component puf_refcounter_2 is
  port (
    clk : in STD_LOGIC;
    enable : in STD_LOGIC;
    count : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component puf_refcounter_2;
  component puf_uart_0_1 is
  port (
    clock : in STD_LOGIC;
    reset : in STD_LOGIC;
    write_out : in STD_LOGIC;
    wready : in STD_LOGIC;
    bvalid : in STD_LOGIC;
    bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    arready : in STD_LOGIC;
    rvalid : in STD_LOGIC;
    rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    awvalid : out STD_LOGIC;
    wvalid : out STD_LOGIC;
    bready : out STD_LOGIC;
    awaddr : out STD_LOGIC_VECTOR ( 3 downto 0 );
    wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    arvalid : out STD_LOGIC;
    rready : out STD_LOGIC;
    araddr : out STD_LOGIC_VECTOR ( 3 downto 0 );
    tero_responses : in STD_LOGIC_VECTOR ( 255 downto 0 );
    enable : out STD_LOGIC;
    refcounter_limit : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component puf_uart_0_1;
  component puf_comparator_0_1 is
  port (
    clock : in STD_LOGIC;
    enable : in STD_LOGIC;
    refcount : in STD_LOGIC_VECTOR ( 15 downto 0 );
    refcount_limit : in STD_LOGIC_VECTOR ( 15 downto 0 );
    finished : out STD_LOGIC
  );
  end component puf_comparator_0_1;
  component puf_tero_array_0_1 is
  port (
    clock : in STD_LOGIC;
    reset : in STD_LOGIC;
    enable : in STD_LOGIC;
    outputs : out STD_LOGIC_VECTOR ( 255 downto 0 )
  );
  end component puf_tero_array_0_1;
  signal axi_uartlite_2_UART_RxD : STD_LOGIC;
  signal axi_uartlite_2_UART_TxD : STD_LOGIC;
  signal axi_uartlite_2_s_axi_arready : STD_LOGIC;
  signal axi_uartlite_2_s_axi_bresp : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_uartlite_2_s_axi_bvalid : STD_LOGIC;
  signal axi_uartlite_2_s_axi_rdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_uartlite_2_s_axi_rresp : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_uartlite_2_s_axi_rvalid : STD_LOGIC;
  signal axi_uartlite_2_s_axi_wready : STD_LOGIC;
  signal clk_wiz_1_locked : STD_LOGIC;
  signal comparator_0_finished : STD_LOGIC;
  signal control_0_enable_counting : STD_LOGIC;
  signal proc_sys_reset_0_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal refcounter_count : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal reset_1 : STD_LOGIC;
  signal sys_clock_1 : STD_LOGIC;
  signal sys_clock_2 : STD_LOGIC;
  signal tero_array_1_outputs : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal uart_0_araddr : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal uart_0_arvalid : STD_LOGIC;
  signal uart_0_awaddr : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal uart_0_awvalid : STD_LOGIC;
  signal uart_0_bready : STD_LOGIC;
  signal uart_0_refcounter_limit : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal uart_0_rready : STD_LOGIC;
  signal uart_0_wdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal uart_0_wvalid : STD_LOGIC;
  signal NLW_axi_uartlite_2_interrupt_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_uartlite_2_s_axi_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_proc_sys_reset_1_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_proc_sys_reset_1_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_1_interconnect_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_1_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 RST.RESET RST";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME RST.RESET, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of sys_clock : signal is "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK";
  attribute X_INTERFACE_PARAMETER of sys_clock : signal is "XIL_INTERFACENAME CLK.SYS_CLOCK, ASSOCIATED_RESET reset, CLK_DOMAIN puf_sys_clock, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of usb_uart_rxd : signal is "xilinx.com:interface:uart:1.0 usb_uart RxD";
  attribute X_INTERFACE_INFO of usb_uart_txd : signal is "xilinx.com:interface:uart:1.0 usb_uart TxD";
begin
  axi_uartlite_2_UART_RxD <= usb_uart_rxd;
  reset_1 <= reset;
  sys_clock_2 <= sys_clock;
  usb_uart_txd <= axi_uartlite_2_UART_TxD;
axi_uartlite_2: component puf_axi_uartlite_2_0
     port map (
      interrupt => NLW_axi_uartlite_2_interrupt_UNCONNECTED,
      rx => axi_uartlite_2_UART_RxD,
      s_axi_aclk => sys_clock_1,
      s_axi_araddr(3 downto 0) => uart_0_araddr(3 downto 0),
      s_axi_aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      s_axi_arready => axi_uartlite_2_s_axi_arready,
      s_axi_arvalid => uart_0_arvalid,
      s_axi_awaddr(3 downto 0) => uart_0_awaddr(3 downto 0),
      s_axi_awready => NLW_axi_uartlite_2_s_axi_awready_UNCONNECTED,
      s_axi_awvalid => uart_0_awvalid,
      s_axi_bready => uart_0_bready,
      s_axi_bresp(1 downto 0) => axi_uartlite_2_s_axi_bresp(1 downto 0),
      s_axi_bvalid => axi_uartlite_2_s_axi_bvalid,
      s_axi_rdata(31 downto 0) => axi_uartlite_2_s_axi_rdata(31 downto 0),
      s_axi_rready => uart_0_rready,
      s_axi_rresp(1 downto 0) => axi_uartlite_2_s_axi_rresp(1 downto 0),
      s_axi_rvalid => axi_uartlite_2_s_axi_rvalid,
      s_axi_wdata(31 downto 0) => uart_0_wdata(31 downto 0),
      s_axi_wready => axi_uartlite_2_s_axi_wready,
      s_axi_wstrb(3 downto 0) => B"1111",
      s_axi_wvalid => uart_0_wvalid,
      tx => axi_uartlite_2_UART_TxD
    );
clk_wiz_1: component puf_clk_wiz_1_0
     port map (
      clk_in1 => sys_clock_2,
      clk_out1 => sys_clock_1,
      locked => clk_wiz_1_locked,
      reset => '0'
    );
comparator_0: component puf_comparator_0_1
     port map (
      clock => sys_clock_1,
      enable => control_0_enable_counting,
      finished => comparator_0_finished,
      refcount(15 downto 0) => refcounter_count(15 downto 0),
      refcount_limit(15 downto 0) => uart_0_refcounter_limit(15 downto 0)
    );
proc_sys_reset_1: component puf_proc_sys_reset_1_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_proc_sys_reset_1_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => clk_wiz_1_locked,
      ext_reset_in => reset_1,
      interconnect_aresetn(0) => NLW_proc_sys_reset_1_interconnect_aresetn_UNCONNECTED(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_proc_sys_reset_1_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => proc_sys_reset_0_peripheral_aresetn(0),
      peripheral_reset(0) => NLW_proc_sys_reset_1_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => sys_clock_1
    );
refcounter: component puf_refcounter_2
     port map (
      clk => sys_clock_1,
      count(15 downto 0) => refcounter_count(15 downto 0),
      enable => control_0_enable_counting
    );
tero_array_1: component puf_tero_array_0_1
     port map (
      clock => sys_clock_1,
      enable => control_0_enable_counting,
      outputs(255 downto 0) => tero_array_1_outputs(255 downto 0),
      reset => proc_sys_reset_0_peripheral_aresetn(0)
    );
uart_0: component puf_uart_0_1
     port map (
      araddr(3 downto 0) => uart_0_araddr(3 downto 0),
      arready => axi_uartlite_2_s_axi_arready,
      arvalid => uart_0_arvalid,
      awaddr(3 downto 0) => uart_0_awaddr(3 downto 0),
      awvalid => uart_0_awvalid,
      bready => uart_0_bready,
      bresp(1 downto 0) => axi_uartlite_2_s_axi_bresp(1 downto 0),
      bvalid => axi_uartlite_2_s_axi_bvalid,
      clock => sys_clock_1,
      enable => control_0_enable_counting,
      rdata(31 downto 0) => axi_uartlite_2_s_axi_rdata(31 downto 0),
      refcounter_limit(15 downto 0) => uart_0_refcounter_limit(15 downto 0),
      reset => proc_sys_reset_0_peripheral_aresetn(0),
      rready => uart_0_rready,
      rresp(1 downto 0) => axi_uartlite_2_s_axi_rresp(1 downto 0),
      rvalid => axi_uartlite_2_s_axi_rvalid,
      tero_responses(255 downto 0) => tero_array_1_outputs(255 downto 0),
      wdata(31 downto 0) => uart_0_wdata(31 downto 0),
      wready => axi_uartlite_2_s_axi_wready,
      write_out => comparator_0_finished,
      wvalid => uart_0_wvalid
    );
end STRUCTURE;
