-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Tue Apr 11 11:51:42 2023
-- Host        : PC-Oscar running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/Oscar/Desktop/MFE/TERO_FS_ECC/TERO_FS_ECC.srcs/sources_1/imports/puf_ecc/ip/puf_comparator_0_1/puf_comparator_0_1_sim_netlist.vhdl
-- Design      : puf_comparator_0_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_comparator_0_1_comparator is
  port (
    finished : out STD_LOGIC;
    refcount_limit : in STD_LOGIC_VECTOR ( 15 downto 0 );
    refcount : in STD_LOGIC_VECTOR ( 15 downto 0 );
    enable : in STD_LOGIC;
    clock : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_comparator_0_1_comparator : entity is "comparator";
end puf_comparator_0_1_comparator;

architecture STRUCTURE of puf_comparator_0_1_comparator is
  signal eqOp : STD_LOGIC;
  signal \^finished\ : STD_LOGIC;
  signal finished_i_10_n_0 : STD_LOGIC;
  signal finished_i_1_n_0 : STD_LOGIC;
  signal finished_i_2_n_0 : STD_LOGIC;
  signal finished_i_5_n_0 : STD_LOGIC;
  signal finished_i_6_n_0 : STD_LOGIC;
  signal finished_i_7_n_0 : STD_LOGIC;
  signal finished_i_8_n_0 : STD_LOGIC;
  signal finished_i_9_n_0 : STD_LOGIC;
  signal finished_reg_i_3_n_3 : STD_LOGIC;
  signal finished_reg_i_4_n_0 : STD_LOGIC;
  signal finished_reg_i_4_n_1 : STD_LOGIC;
  signal finished_reg_i_4_n_2 : STD_LOGIC;
  signal finished_reg_i_4_n_3 : STD_LOGIC;
  signal NLW_finished_reg_i_3_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_finished_reg_i_3_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_finished_reg_i_4_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  finished <= \^finished\;
finished_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => eqOp,
      I1 => \^finished\,
      O => finished_i_1_n_0
    );
finished_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => refcount(0),
      I1 => refcount_limit(0),
      I2 => refcount_limit(2),
      I3 => refcount(2),
      I4 => refcount_limit(1),
      I5 => refcount(1),
      O => finished_i_10_n_0
    );
finished_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => enable,
      O => finished_i_2_n_0
    );
finished_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => refcount_limit(15),
      I1 => refcount(15),
      O => finished_i_5_n_0
    );
finished_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => refcount(12),
      I1 => refcount_limit(12),
      I2 => refcount_limit(14),
      I3 => refcount(14),
      I4 => refcount_limit(13),
      I5 => refcount(13),
      O => finished_i_6_n_0
    );
finished_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => refcount(9),
      I1 => refcount_limit(9),
      I2 => refcount_limit(11),
      I3 => refcount(11),
      I4 => refcount_limit(10),
      I5 => refcount(10),
      O => finished_i_7_n_0
    );
finished_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => refcount(6),
      I1 => refcount_limit(6),
      I2 => refcount_limit(8),
      I3 => refcount(8),
      I4 => refcount_limit(7),
      I5 => refcount(7),
      O => finished_i_8_n_0
    );
finished_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => refcount(3),
      I1 => refcount_limit(3),
      I2 => refcount_limit(5),
      I3 => refcount(5),
      I4 => refcount_limit(4),
      I5 => refcount(4),
      O => finished_i_9_n_0
    );
finished_reg: unisim.vcomponents.FDCE
     port map (
      C => clock,
      CE => '1',
      CLR => finished_i_2_n_0,
      D => finished_i_1_n_0,
      Q => \^finished\
    );
finished_reg_i_3: unisim.vcomponents.CARRY4
     port map (
      CI => finished_reg_i_4_n_0,
      CO(3 downto 2) => NLW_finished_reg_i_3_CO_UNCONNECTED(3 downto 2),
      CO(1) => eqOp,
      CO(0) => finished_reg_i_3_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_finished_reg_i_3_O_UNCONNECTED(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => finished_i_5_n_0,
      S(0) => finished_i_6_n_0
    );
finished_reg_i_4: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => finished_reg_i_4_n_0,
      CO(2) => finished_reg_i_4_n_1,
      CO(1) => finished_reg_i_4_n_2,
      CO(0) => finished_reg_i_4_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_finished_reg_i_4_O_UNCONNECTED(3 downto 0),
      S(3) => finished_i_7_n_0,
      S(2) => finished_i_8_n_0,
      S(1) => finished_i_9_n_0,
      S(0) => finished_i_10_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_comparator_0_1 is
  port (
    clock : in STD_LOGIC;
    enable : in STD_LOGIC;
    refcount : in STD_LOGIC_VECTOR ( 15 downto 0 );
    refcount_limit : in STD_LOGIC_VECTOR ( 15 downto 0 );
    finished : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of puf_comparator_0_1 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of puf_comparator_0_1 : entity is "puf_comparator_0_1,comparator,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of puf_comparator_0_1 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of puf_comparator_0_1 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of puf_comparator_0_1 : entity is "comparator,Vivado 2022.2";
end puf_comparator_0_1;

architecture STRUCTURE of puf_comparator_0_1 is
  attribute x_interface_info : string;
  attribute x_interface_info of clock : signal is "xilinx.com:signal:clock:1.0 clock CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clock : signal is "XIL_INTERFACENAME clock, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, INSERT_VIP 0";
begin
U0: entity work.puf_comparator_0_1_comparator
     port map (
      clock => clock,
      enable => enable,
      finished => finished,
      refcount(15 downto 0) => refcount(15 downto 0),
      refcount_limit(15 downto 0) => refcount_limit(15 downto 0)
    );
end STRUCTURE;
