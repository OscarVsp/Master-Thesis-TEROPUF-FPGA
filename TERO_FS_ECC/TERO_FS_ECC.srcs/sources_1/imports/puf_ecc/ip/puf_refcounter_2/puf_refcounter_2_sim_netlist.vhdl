-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Tue Apr 11 11:22:39 2023
-- Host        : PC-Oscar running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top puf_refcounter_2 -prefix
--               puf_refcounter_2_ puf_refcounter_2_sim_netlist.vhdl
-- Design      : puf_refcounter_2
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_refcounter_2_counter is
  port (
    count : out STD_LOGIC_VECTOR ( 15 downto 0 );
    clk : in STD_LOGIC;
    enable : in STD_LOGIC
  );
end puf_refcounter_2_counter;

architecture STRUCTURE of puf_refcounter_2_counter is
  signal \^count\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \count_internal[15]_i_2_n_0\ : STD_LOGIC;
  signal \count_internal[3]_i_2_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1_n_1\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1_n_2\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1_n_3\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1_n_4\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1_n_5\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1_n_6\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1_n_7\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1_n_1\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1_n_2\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1_n_3\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1_n_4\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1_n_5\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1_n_6\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1_n_7\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1_n_1\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1_n_2\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1_n_3\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1_n_4\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1_n_5\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1_n_6\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1_n_7\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1_n_4\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1_n_5\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1_n_6\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1_n_7\ : STD_LOGIC;
  signal \NLW_count_internal_reg[15]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \count_internal_reg[11]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[15]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[3]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[7]_i_1\ : label is 11;
begin
  count(15 downto 0) <= \^count\(15 downto 0);
\count_internal[15]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => enable,
      O => \count_internal[15]_i_2_n_0\
    );
\count_internal[3]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^count\(0),
      O => \count_internal[3]_i_2_n_0\
    );
\count_internal_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \count_internal[15]_i_2_n_0\,
      D => \count_internal_reg[3]_i_1_n_7\,
      Q => \^count\(0)
    );
\count_internal_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \count_internal[15]_i_2_n_0\,
      D => \count_internal_reg[11]_i_1_n_5\,
      Q => \^count\(10)
    );
\count_internal_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \count_internal[15]_i_2_n_0\,
      D => \count_internal_reg[11]_i_1_n_4\,
      Q => \^count\(11)
    );
\count_internal_reg[11]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[7]_i_1_n_0\,
      CO(3) => \count_internal_reg[11]_i_1_n_0\,
      CO(2) => \count_internal_reg[11]_i_1_n_1\,
      CO(1) => \count_internal_reg[11]_i_1_n_2\,
      CO(0) => \count_internal_reg[11]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[11]_i_1_n_4\,
      O(2) => \count_internal_reg[11]_i_1_n_5\,
      O(1) => \count_internal_reg[11]_i_1_n_6\,
      O(0) => \count_internal_reg[11]_i_1_n_7\,
      S(3 downto 0) => \^count\(11 downto 8)
    );
\count_internal_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \count_internal[15]_i_2_n_0\,
      D => \count_internal_reg[15]_i_1_n_7\,
      Q => \^count\(12)
    );
\count_internal_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \count_internal[15]_i_2_n_0\,
      D => \count_internal_reg[15]_i_1_n_6\,
      Q => \^count\(13)
    );
\count_internal_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \count_internal[15]_i_2_n_0\,
      D => \count_internal_reg[15]_i_1_n_5\,
      Q => \^count\(14)
    );
\count_internal_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \count_internal[15]_i_2_n_0\,
      D => \count_internal_reg[15]_i_1_n_4\,
      Q => \^count\(15)
    );
\count_internal_reg[15]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[11]_i_1_n_0\,
      CO(3) => \NLW_count_internal_reg[15]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \count_internal_reg[15]_i_1_n_1\,
      CO(1) => \count_internal_reg[15]_i_1_n_2\,
      CO(0) => \count_internal_reg[15]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[15]_i_1_n_4\,
      O(2) => \count_internal_reg[15]_i_1_n_5\,
      O(1) => \count_internal_reg[15]_i_1_n_6\,
      O(0) => \count_internal_reg[15]_i_1_n_7\,
      S(3 downto 0) => \^count\(15 downto 12)
    );
\count_internal_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \count_internal[15]_i_2_n_0\,
      D => \count_internal_reg[3]_i_1_n_6\,
      Q => \^count\(1)
    );
\count_internal_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \count_internal[15]_i_2_n_0\,
      D => \count_internal_reg[3]_i_1_n_5\,
      Q => \^count\(2)
    );
\count_internal_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \count_internal[15]_i_2_n_0\,
      D => \count_internal_reg[3]_i_1_n_4\,
      Q => \^count\(3)
    );
\count_internal_reg[3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_internal_reg[3]_i_1_n_0\,
      CO(2) => \count_internal_reg[3]_i_1_n_1\,
      CO(1) => \count_internal_reg[3]_i_1_n_2\,
      CO(0) => \count_internal_reg[3]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \count_internal_reg[3]_i_1_n_4\,
      O(2) => \count_internal_reg[3]_i_1_n_5\,
      O(1) => \count_internal_reg[3]_i_1_n_6\,
      O(0) => \count_internal_reg[3]_i_1_n_7\,
      S(3 downto 1) => \^count\(3 downto 1),
      S(0) => \count_internal[3]_i_2_n_0\
    );
\count_internal_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \count_internal[15]_i_2_n_0\,
      D => \count_internal_reg[7]_i_1_n_7\,
      Q => \^count\(4)
    );
\count_internal_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \count_internal[15]_i_2_n_0\,
      D => \count_internal_reg[7]_i_1_n_6\,
      Q => \^count\(5)
    );
\count_internal_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \count_internal[15]_i_2_n_0\,
      D => \count_internal_reg[7]_i_1_n_5\,
      Q => \^count\(6)
    );
\count_internal_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \count_internal[15]_i_2_n_0\,
      D => \count_internal_reg[7]_i_1_n_4\,
      Q => \^count\(7)
    );
\count_internal_reg[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[3]_i_1_n_0\,
      CO(3) => \count_internal_reg[7]_i_1_n_0\,
      CO(2) => \count_internal_reg[7]_i_1_n_1\,
      CO(1) => \count_internal_reg[7]_i_1_n_2\,
      CO(0) => \count_internal_reg[7]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[7]_i_1_n_4\,
      O(2) => \count_internal_reg[7]_i_1_n_5\,
      O(1) => \count_internal_reg[7]_i_1_n_6\,
      O(0) => \count_internal_reg[7]_i_1_n_7\,
      S(3 downto 0) => \^count\(7 downto 4)
    );
\count_internal_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \count_internal[15]_i_2_n_0\,
      D => \count_internal_reg[11]_i_1_n_7\,
      Q => \^count\(8)
    );
\count_internal_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \count_internal[15]_i_2_n_0\,
      D => \count_internal_reg[11]_i_1_n_6\,
      Q => \^count\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_refcounter_2 is
  port (
    clk : in STD_LOGIC;
    enable : in STD_LOGIC;
    count : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of puf_refcounter_2 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of puf_refcounter_2 : entity is "puf_refcounter_2,counter,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of puf_refcounter_2 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of puf_refcounter_2 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of puf_refcounter_2 : entity is "counter,Vivado 2022.2";
end puf_refcounter_2;

architecture STRUCTURE of puf_refcounter_2 is
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, INSERT_VIP 0";
begin
U0: entity work.puf_refcounter_2_counter
     port map (
      clk => clk,
      count(15 downto 0) => count(15 downto 0),
      enable => enable
    );
end STRUCTURE;
