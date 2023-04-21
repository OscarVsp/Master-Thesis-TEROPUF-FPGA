-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Tue Apr 11 12:24:41 2023
-- Host        : PC-Oscar running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Oscar/Desktop/MFE/TERO_FS_ECC/TERO_FS_ECC.srcs/sources_1/imports/puf_ecc/ip/puf_tero_array_0_1/puf_tero_array_0_1_stub.vhdl
-- Design      : puf_tero_array_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity puf_tero_array_0_1 is
  Port ( 
    clock : in STD_LOGIC;
    reset : in STD_LOGIC;
    enable : in STD_LOGIC;
    outputs : out STD_LOGIC_VECTOR ( 255 downto 0 )
  );

end puf_tero_array_0_1;

architecture stub of puf_tero_array_0_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clock,reset,enable,outputs[255:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "tero_array,Vivado 2022.2";
begin
end;
