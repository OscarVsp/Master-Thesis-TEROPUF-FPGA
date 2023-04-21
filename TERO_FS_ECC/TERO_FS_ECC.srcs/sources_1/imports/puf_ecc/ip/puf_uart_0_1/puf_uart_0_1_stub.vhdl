-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Tue Apr 11 11:49:54 2023
-- Host        : PC-Oscar running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Oscar/Desktop/MFE/TERO_FS_ECC/TERO_FS_ECC.srcs/sources_1/imports/puf_ecc/ip/puf_uart_0_1/puf_uart_0_1_stub.vhdl
-- Design      : puf_uart_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity puf_uart_0_1 is
  Port ( 
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

end puf_uart_0_1;

architecture stub of puf_uart_0_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clock,reset,write_out,wready,bvalid,bresp[1:0],arready,rvalid,rdata[31:0],rresp[1:0],awvalid,wvalid,bready,awaddr[3:0],wdata[31:0],arvalid,rready,araddr[3:0],tero_responses[255:0],enable,refcounter_limit[15:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "uart,Vivado 2022.2";
begin
end;
