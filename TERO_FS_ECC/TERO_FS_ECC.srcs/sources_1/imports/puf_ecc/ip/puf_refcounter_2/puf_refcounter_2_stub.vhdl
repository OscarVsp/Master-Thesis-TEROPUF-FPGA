-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Tue Apr 11 11:22:39 2023
-- Host        : PC-Oscar running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top puf_refcounter_2 -prefix
--               puf_refcounter_2_ puf_refcounter_2_stub.vhdl
-- Design      : puf_refcounter_2
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity puf_refcounter_2 is
  Port ( 
    clk : in STD_LOGIC;
    enable : in STD_LOGIC;
    count : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end puf_refcounter_2;

architecture stub of puf_refcounter_2 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,enable,count[15:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "counter,Vivado 2022.2";
begin
end;
