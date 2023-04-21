-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Tue Apr 11 12:24:41 2023
-- Host        : PC-Oscar running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/Oscar/Desktop/MFE/TERO_FS_ECC/TERO_FS_ECC.srcs/sources_1/imports/puf_ecc/ip/puf_tero_array_0_1/puf_tero_array_0_1_sim_netlist.vhdl
-- Design      : puf_tero_array_0_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_counter is
  port (
    outputs : out STD_LOGIC_VECTOR ( 15 downto 0 );
    output : in STD_LOGIC;
    \count_internal_reg[0]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_counter : entity is "counter";
end puf_tero_array_0_1_counter;

architecture STRUCTURE of puf_tero_array_0_1_counter is
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
  signal \^outputs\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_count_internal_reg[15]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \count_internal_reg[11]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[15]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[3]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[7]_i_1\ : label is 11;
begin
  outputs(15 downto 0) <= \^outputs\(15 downto 0);
\count_internal[3]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^outputs\(0),
      O => \count_internal[3]_i_2_n_0\
    );
\count_internal_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1_n_7\,
      Q => \^outputs\(0)
    );
\count_internal_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1_n_5\,
      Q => \^outputs\(10)
    );
\count_internal_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1_n_4\,
      Q => \^outputs\(11)
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
      S(3 downto 0) => \^outputs\(11 downto 8)
    );
\count_internal_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1_n_7\,
      Q => \^outputs\(12)
    );
\count_internal_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1_n_6\,
      Q => \^outputs\(13)
    );
\count_internal_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1_n_5\,
      Q => \^outputs\(14)
    );
\count_internal_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1_n_4\,
      Q => \^outputs\(15)
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
      S(3 downto 0) => \^outputs\(15 downto 12)
    );
\count_internal_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1_n_6\,
      Q => \^outputs\(1)
    );
\count_internal_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1_n_5\,
      Q => \^outputs\(2)
    );
\count_internal_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1_n_4\,
      Q => \^outputs\(3)
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
      S(3 downto 1) => \^outputs\(3 downto 1),
      S(0) => \count_internal[3]_i_2_n_0\
    );
\count_internal_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1_n_7\,
      Q => \^outputs\(4)
    );
\count_internal_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1_n_6\,
      Q => \^outputs\(5)
    );
\count_internal_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1_n_5\,
      Q => \^outputs\(6)
    );
\count_internal_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1_n_4\,
      Q => \^outputs\(7)
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
      S(3 downto 0) => \^outputs\(7 downto 4)
    );
\count_internal_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1_n_7\,
      Q => \^outputs\(8)
    );
\count_internal_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1_n_6\,
      Q => \^outputs\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_counter_0 is
  port (
    outputs : out STD_LOGIC_VECTOR ( 15 downto 0 );
    output : in STD_LOGIC;
    \count_internal_reg[0]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_counter_0 : entity is "counter";
end puf_tero_array_0_1_counter_0;

architecture STRUCTURE of puf_tero_array_0_1_counter_0 is
  signal \count_internal[3]_i_2__9_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__9_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__9_n_1\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__9_n_2\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__9_n_3\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__9_n_4\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__9_n_5\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__9_n_6\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__9_n_7\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__9_n_1\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__9_n_2\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__9_n_3\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__9_n_4\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__9_n_5\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__9_n_6\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__9_n_7\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__9_n_0\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__9_n_1\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__9_n_2\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__9_n_3\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__9_n_4\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__9_n_5\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__9_n_6\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__9_n_7\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__9_n_0\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__9_n_1\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__9_n_2\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__9_n_3\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__9_n_4\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__9_n_5\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__9_n_6\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__9_n_7\ : STD_LOGIC;
  signal \^outputs\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_count_internal_reg[15]_i_1__9_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \count_internal_reg[11]_i_1__9\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[15]_i_1__9\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[3]_i_1__9\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[7]_i_1__9\ : label is 11;
begin
  outputs(15 downto 0) <= \^outputs\(15 downto 0);
\count_internal[3]_i_2__9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^outputs\(0),
      O => \count_internal[3]_i_2__9_n_0\
    );
\count_internal_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__9_n_7\,
      Q => \^outputs\(0)
    );
\count_internal_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__9_n_5\,
      Q => \^outputs\(10)
    );
\count_internal_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__9_n_4\,
      Q => \^outputs\(11)
    );
\count_internal_reg[11]_i_1__9\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[7]_i_1__9_n_0\,
      CO(3) => \count_internal_reg[11]_i_1__9_n_0\,
      CO(2) => \count_internal_reg[11]_i_1__9_n_1\,
      CO(1) => \count_internal_reg[11]_i_1__9_n_2\,
      CO(0) => \count_internal_reg[11]_i_1__9_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[11]_i_1__9_n_4\,
      O(2) => \count_internal_reg[11]_i_1__9_n_5\,
      O(1) => \count_internal_reg[11]_i_1__9_n_6\,
      O(0) => \count_internal_reg[11]_i_1__9_n_7\,
      S(3 downto 0) => \^outputs\(11 downto 8)
    );
\count_internal_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__9_n_7\,
      Q => \^outputs\(12)
    );
\count_internal_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__9_n_6\,
      Q => \^outputs\(13)
    );
\count_internal_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__9_n_5\,
      Q => \^outputs\(14)
    );
\count_internal_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__9_n_4\,
      Q => \^outputs\(15)
    );
\count_internal_reg[15]_i_1__9\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[11]_i_1__9_n_0\,
      CO(3) => \NLW_count_internal_reg[15]_i_1__9_CO_UNCONNECTED\(3),
      CO(2) => \count_internal_reg[15]_i_1__9_n_1\,
      CO(1) => \count_internal_reg[15]_i_1__9_n_2\,
      CO(0) => \count_internal_reg[15]_i_1__9_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[15]_i_1__9_n_4\,
      O(2) => \count_internal_reg[15]_i_1__9_n_5\,
      O(1) => \count_internal_reg[15]_i_1__9_n_6\,
      O(0) => \count_internal_reg[15]_i_1__9_n_7\,
      S(3 downto 0) => \^outputs\(15 downto 12)
    );
\count_internal_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__9_n_6\,
      Q => \^outputs\(1)
    );
\count_internal_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__9_n_5\,
      Q => \^outputs\(2)
    );
\count_internal_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__9_n_4\,
      Q => \^outputs\(3)
    );
\count_internal_reg[3]_i_1__9\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_internal_reg[3]_i_1__9_n_0\,
      CO(2) => \count_internal_reg[3]_i_1__9_n_1\,
      CO(1) => \count_internal_reg[3]_i_1__9_n_2\,
      CO(0) => \count_internal_reg[3]_i_1__9_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \count_internal_reg[3]_i_1__9_n_4\,
      O(2) => \count_internal_reg[3]_i_1__9_n_5\,
      O(1) => \count_internal_reg[3]_i_1__9_n_6\,
      O(0) => \count_internal_reg[3]_i_1__9_n_7\,
      S(3 downto 1) => \^outputs\(3 downto 1),
      S(0) => \count_internal[3]_i_2__9_n_0\
    );
\count_internal_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__9_n_7\,
      Q => \^outputs\(4)
    );
\count_internal_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__9_n_6\,
      Q => \^outputs\(5)
    );
\count_internal_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__9_n_5\,
      Q => \^outputs\(6)
    );
\count_internal_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__9_n_4\,
      Q => \^outputs\(7)
    );
\count_internal_reg[7]_i_1__9\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[3]_i_1__9_n_0\,
      CO(3) => \count_internal_reg[7]_i_1__9_n_0\,
      CO(2) => \count_internal_reg[7]_i_1__9_n_1\,
      CO(1) => \count_internal_reg[7]_i_1__9_n_2\,
      CO(0) => \count_internal_reg[7]_i_1__9_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[7]_i_1__9_n_4\,
      O(2) => \count_internal_reg[7]_i_1__9_n_5\,
      O(1) => \count_internal_reg[7]_i_1__9_n_6\,
      O(0) => \count_internal_reg[7]_i_1__9_n_7\,
      S(3 downto 0) => \^outputs\(7 downto 4)
    );
\count_internal_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__9_n_7\,
      Q => \^outputs\(8)
    );
\count_internal_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__9_n_6\,
      Q => \^outputs\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_counter_1 is
  port (
    outputs : out STD_LOGIC_VECTOR ( 15 downto 0 );
    output : in STD_LOGIC;
    \count_internal_reg[0]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_counter_1 : entity is "counter";
end puf_tero_array_0_1_counter_1;

architecture STRUCTURE of puf_tero_array_0_1_counter_1 is
  signal \count_internal[3]_i_2__10_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__10_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__10_n_1\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__10_n_2\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__10_n_3\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__10_n_4\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__10_n_5\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__10_n_6\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__10_n_7\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__10_n_1\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__10_n_2\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__10_n_3\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__10_n_4\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__10_n_5\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__10_n_6\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__10_n_7\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__10_n_0\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__10_n_1\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__10_n_2\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__10_n_3\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__10_n_4\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__10_n_5\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__10_n_6\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__10_n_7\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__10_n_0\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__10_n_1\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__10_n_2\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__10_n_3\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__10_n_4\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__10_n_5\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__10_n_6\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__10_n_7\ : STD_LOGIC;
  signal \^outputs\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_count_internal_reg[15]_i_1__10_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \count_internal_reg[11]_i_1__10\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[15]_i_1__10\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[3]_i_1__10\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[7]_i_1__10\ : label is 11;
begin
  outputs(15 downto 0) <= \^outputs\(15 downto 0);
\count_internal[3]_i_2__10\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^outputs\(0),
      O => \count_internal[3]_i_2__10_n_0\
    );
\count_internal_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__10_n_7\,
      Q => \^outputs\(0)
    );
\count_internal_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__10_n_5\,
      Q => \^outputs\(10)
    );
\count_internal_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__10_n_4\,
      Q => \^outputs\(11)
    );
\count_internal_reg[11]_i_1__10\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[7]_i_1__10_n_0\,
      CO(3) => \count_internal_reg[11]_i_1__10_n_0\,
      CO(2) => \count_internal_reg[11]_i_1__10_n_1\,
      CO(1) => \count_internal_reg[11]_i_1__10_n_2\,
      CO(0) => \count_internal_reg[11]_i_1__10_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[11]_i_1__10_n_4\,
      O(2) => \count_internal_reg[11]_i_1__10_n_5\,
      O(1) => \count_internal_reg[11]_i_1__10_n_6\,
      O(0) => \count_internal_reg[11]_i_1__10_n_7\,
      S(3 downto 0) => \^outputs\(11 downto 8)
    );
\count_internal_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__10_n_7\,
      Q => \^outputs\(12)
    );
\count_internal_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__10_n_6\,
      Q => \^outputs\(13)
    );
\count_internal_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__10_n_5\,
      Q => \^outputs\(14)
    );
\count_internal_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__10_n_4\,
      Q => \^outputs\(15)
    );
\count_internal_reg[15]_i_1__10\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[11]_i_1__10_n_0\,
      CO(3) => \NLW_count_internal_reg[15]_i_1__10_CO_UNCONNECTED\(3),
      CO(2) => \count_internal_reg[15]_i_1__10_n_1\,
      CO(1) => \count_internal_reg[15]_i_1__10_n_2\,
      CO(0) => \count_internal_reg[15]_i_1__10_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[15]_i_1__10_n_4\,
      O(2) => \count_internal_reg[15]_i_1__10_n_5\,
      O(1) => \count_internal_reg[15]_i_1__10_n_6\,
      O(0) => \count_internal_reg[15]_i_1__10_n_7\,
      S(3 downto 0) => \^outputs\(15 downto 12)
    );
\count_internal_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__10_n_6\,
      Q => \^outputs\(1)
    );
\count_internal_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__10_n_5\,
      Q => \^outputs\(2)
    );
\count_internal_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__10_n_4\,
      Q => \^outputs\(3)
    );
\count_internal_reg[3]_i_1__10\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_internal_reg[3]_i_1__10_n_0\,
      CO(2) => \count_internal_reg[3]_i_1__10_n_1\,
      CO(1) => \count_internal_reg[3]_i_1__10_n_2\,
      CO(0) => \count_internal_reg[3]_i_1__10_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \count_internal_reg[3]_i_1__10_n_4\,
      O(2) => \count_internal_reg[3]_i_1__10_n_5\,
      O(1) => \count_internal_reg[3]_i_1__10_n_6\,
      O(0) => \count_internal_reg[3]_i_1__10_n_7\,
      S(3 downto 1) => \^outputs\(3 downto 1),
      S(0) => \count_internal[3]_i_2__10_n_0\
    );
\count_internal_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__10_n_7\,
      Q => \^outputs\(4)
    );
\count_internal_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__10_n_6\,
      Q => \^outputs\(5)
    );
\count_internal_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__10_n_5\,
      Q => \^outputs\(6)
    );
\count_internal_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__10_n_4\,
      Q => \^outputs\(7)
    );
\count_internal_reg[7]_i_1__10\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[3]_i_1__10_n_0\,
      CO(3) => \count_internal_reg[7]_i_1__10_n_0\,
      CO(2) => \count_internal_reg[7]_i_1__10_n_1\,
      CO(1) => \count_internal_reg[7]_i_1__10_n_2\,
      CO(0) => \count_internal_reg[7]_i_1__10_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[7]_i_1__10_n_4\,
      O(2) => \count_internal_reg[7]_i_1__10_n_5\,
      O(1) => \count_internal_reg[7]_i_1__10_n_6\,
      O(0) => \count_internal_reg[7]_i_1__10_n_7\,
      S(3 downto 0) => \^outputs\(7 downto 4)
    );
\count_internal_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__10_n_7\,
      Q => \^outputs\(8)
    );
\count_internal_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__10_n_6\,
      Q => \^outputs\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_counter_10 is
  port (
    outputs : out STD_LOGIC_VECTOR ( 15 downto 0 );
    output : in STD_LOGIC;
    \count_internal_reg[0]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_counter_10 : entity is "counter";
end puf_tero_array_0_1_counter_10;

architecture STRUCTURE of puf_tero_array_0_1_counter_10 is
  signal \count_internal[3]_i_2__4_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__4_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__4_n_1\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__4_n_2\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__4_n_3\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__4_n_4\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__4_n_5\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__4_n_6\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__4_n_7\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__4_n_1\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__4_n_2\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__4_n_3\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__4_n_4\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__4_n_5\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__4_n_6\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__4_n_7\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__4_n_0\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__4_n_1\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__4_n_2\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__4_n_3\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__4_n_4\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__4_n_5\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__4_n_6\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__4_n_7\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__4_n_0\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__4_n_1\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__4_n_2\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__4_n_3\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__4_n_4\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__4_n_5\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__4_n_6\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__4_n_7\ : STD_LOGIC;
  signal \^outputs\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_count_internal_reg[15]_i_1__4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \count_internal_reg[11]_i_1__4\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[15]_i_1__4\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[3]_i_1__4\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[7]_i_1__4\ : label is 11;
begin
  outputs(15 downto 0) <= \^outputs\(15 downto 0);
\count_internal[3]_i_2__4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^outputs\(0),
      O => \count_internal[3]_i_2__4_n_0\
    );
\count_internal_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__4_n_7\,
      Q => \^outputs\(0)
    );
\count_internal_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__4_n_5\,
      Q => \^outputs\(10)
    );
\count_internal_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__4_n_4\,
      Q => \^outputs\(11)
    );
\count_internal_reg[11]_i_1__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[7]_i_1__4_n_0\,
      CO(3) => \count_internal_reg[11]_i_1__4_n_0\,
      CO(2) => \count_internal_reg[11]_i_1__4_n_1\,
      CO(1) => \count_internal_reg[11]_i_1__4_n_2\,
      CO(0) => \count_internal_reg[11]_i_1__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[11]_i_1__4_n_4\,
      O(2) => \count_internal_reg[11]_i_1__4_n_5\,
      O(1) => \count_internal_reg[11]_i_1__4_n_6\,
      O(0) => \count_internal_reg[11]_i_1__4_n_7\,
      S(3 downto 0) => \^outputs\(11 downto 8)
    );
\count_internal_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__4_n_7\,
      Q => \^outputs\(12)
    );
\count_internal_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__4_n_6\,
      Q => \^outputs\(13)
    );
\count_internal_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__4_n_5\,
      Q => \^outputs\(14)
    );
\count_internal_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__4_n_4\,
      Q => \^outputs\(15)
    );
\count_internal_reg[15]_i_1__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[11]_i_1__4_n_0\,
      CO(3) => \NLW_count_internal_reg[15]_i_1__4_CO_UNCONNECTED\(3),
      CO(2) => \count_internal_reg[15]_i_1__4_n_1\,
      CO(1) => \count_internal_reg[15]_i_1__4_n_2\,
      CO(0) => \count_internal_reg[15]_i_1__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[15]_i_1__4_n_4\,
      O(2) => \count_internal_reg[15]_i_1__4_n_5\,
      O(1) => \count_internal_reg[15]_i_1__4_n_6\,
      O(0) => \count_internal_reg[15]_i_1__4_n_7\,
      S(3 downto 0) => \^outputs\(15 downto 12)
    );
\count_internal_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__4_n_6\,
      Q => \^outputs\(1)
    );
\count_internal_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__4_n_5\,
      Q => \^outputs\(2)
    );
\count_internal_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__4_n_4\,
      Q => \^outputs\(3)
    );
\count_internal_reg[3]_i_1__4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_internal_reg[3]_i_1__4_n_0\,
      CO(2) => \count_internal_reg[3]_i_1__4_n_1\,
      CO(1) => \count_internal_reg[3]_i_1__4_n_2\,
      CO(0) => \count_internal_reg[3]_i_1__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \count_internal_reg[3]_i_1__4_n_4\,
      O(2) => \count_internal_reg[3]_i_1__4_n_5\,
      O(1) => \count_internal_reg[3]_i_1__4_n_6\,
      O(0) => \count_internal_reg[3]_i_1__4_n_7\,
      S(3 downto 1) => \^outputs\(3 downto 1),
      S(0) => \count_internal[3]_i_2__4_n_0\
    );
\count_internal_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__4_n_7\,
      Q => \^outputs\(4)
    );
\count_internal_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__4_n_6\,
      Q => \^outputs\(5)
    );
\count_internal_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__4_n_5\,
      Q => \^outputs\(6)
    );
\count_internal_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__4_n_4\,
      Q => \^outputs\(7)
    );
\count_internal_reg[7]_i_1__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[3]_i_1__4_n_0\,
      CO(3) => \count_internal_reg[7]_i_1__4_n_0\,
      CO(2) => \count_internal_reg[7]_i_1__4_n_1\,
      CO(1) => \count_internal_reg[7]_i_1__4_n_2\,
      CO(0) => \count_internal_reg[7]_i_1__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[7]_i_1__4_n_4\,
      O(2) => \count_internal_reg[7]_i_1__4_n_5\,
      O(1) => \count_internal_reg[7]_i_1__4_n_6\,
      O(0) => \count_internal_reg[7]_i_1__4_n_7\,
      S(3 downto 0) => \^outputs\(7 downto 4)
    );
\count_internal_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__4_n_7\,
      Q => \^outputs\(8)
    );
\count_internal_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__4_n_6\,
      Q => \^outputs\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_counter_11 is
  port (
    outputs : out STD_LOGIC_VECTOR ( 15 downto 0 );
    output : in STD_LOGIC;
    \count_internal_reg[0]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_counter_11 : entity is "counter";
end puf_tero_array_0_1_counter_11;

architecture STRUCTURE of puf_tero_array_0_1_counter_11 is
  signal \count_internal[3]_i_2__5_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__5_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__5_n_1\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__5_n_2\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__5_n_3\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__5_n_4\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__5_n_5\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__5_n_6\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__5_n_7\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__5_n_1\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__5_n_2\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__5_n_3\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__5_n_4\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__5_n_5\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__5_n_6\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__5_n_7\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__5_n_0\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__5_n_1\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__5_n_2\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__5_n_3\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__5_n_4\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__5_n_5\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__5_n_6\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__5_n_7\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__5_n_0\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__5_n_1\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__5_n_2\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__5_n_3\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__5_n_4\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__5_n_5\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__5_n_6\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__5_n_7\ : STD_LOGIC;
  signal \^outputs\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_count_internal_reg[15]_i_1__5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \count_internal_reg[11]_i_1__5\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[15]_i_1__5\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[3]_i_1__5\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[7]_i_1__5\ : label is 11;
begin
  outputs(15 downto 0) <= \^outputs\(15 downto 0);
\count_internal[3]_i_2__5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^outputs\(0),
      O => \count_internal[3]_i_2__5_n_0\
    );
\count_internal_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__5_n_7\,
      Q => \^outputs\(0)
    );
\count_internal_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__5_n_5\,
      Q => \^outputs\(10)
    );
\count_internal_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__5_n_4\,
      Q => \^outputs\(11)
    );
\count_internal_reg[11]_i_1__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[7]_i_1__5_n_0\,
      CO(3) => \count_internal_reg[11]_i_1__5_n_0\,
      CO(2) => \count_internal_reg[11]_i_1__5_n_1\,
      CO(1) => \count_internal_reg[11]_i_1__5_n_2\,
      CO(0) => \count_internal_reg[11]_i_1__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[11]_i_1__5_n_4\,
      O(2) => \count_internal_reg[11]_i_1__5_n_5\,
      O(1) => \count_internal_reg[11]_i_1__5_n_6\,
      O(0) => \count_internal_reg[11]_i_1__5_n_7\,
      S(3 downto 0) => \^outputs\(11 downto 8)
    );
\count_internal_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__5_n_7\,
      Q => \^outputs\(12)
    );
\count_internal_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__5_n_6\,
      Q => \^outputs\(13)
    );
\count_internal_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__5_n_5\,
      Q => \^outputs\(14)
    );
\count_internal_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__5_n_4\,
      Q => \^outputs\(15)
    );
\count_internal_reg[15]_i_1__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[11]_i_1__5_n_0\,
      CO(3) => \NLW_count_internal_reg[15]_i_1__5_CO_UNCONNECTED\(3),
      CO(2) => \count_internal_reg[15]_i_1__5_n_1\,
      CO(1) => \count_internal_reg[15]_i_1__5_n_2\,
      CO(0) => \count_internal_reg[15]_i_1__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[15]_i_1__5_n_4\,
      O(2) => \count_internal_reg[15]_i_1__5_n_5\,
      O(1) => \count_internal_reg[15]_i_1__5_n_6\,
      O(0) => \count_internal_reg[15]_i_1__5_n_7\,
      S(3 downto 0) => \^outputs\(15 downto 12)
    );
\count_internal_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__5_n_6\,
      Q => \^outputs\(1)
    );
\count_internal_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__5_n_5\,
      Q => \^outputs\(2)
    );
\count_internal_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__5_n_4\,
      Q => \^outputs\(3)
    );
\count_internal_reg[3]_i_1__5\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_internal_reg[3]_i_1__5_n_0\,
      CO(2) => \count_internal_reg[3]_i_1__5_n_1\,
      CO(1) => \count_internal_reg[3]_i_1__5_n_2\,
      CO(0) => \count_internal_reg[3]_i_1__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \count_internal_reg[3]_i_1__5_n_4\,
      O(2) => \count_internal_reg[3]_i_1__5_n_5\,
      O(1) => \count_internal_reg[3]_i_1__5_n_6\,
      O(0) => \count_internal_reg[3]_i_1__5_n_7\,
      S(3 downto 1) => \^outputs\(3 downto 1),
      S(0) => \count_internal[3]_i_2__5_n_0\
    );
\count_internal_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__5_n_7\,
      Q => \^outputs\(4)
    );
\count_internal_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__5_n_6\,
      Q => \^outputs\(5)
    );
\count_internal_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__5_n_5\,
      Q => \^outputs\(6)
    );
\count_internal_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__5_n_4\,
      Q => \^outputs\(7)
    );
\count_internal_reg[7]_i_1__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[3]_i_1__5_n_0\,
      CO(3) => \count_internal_reg[7]_i_1__5_n_0\,
      CO(2) => \count_internal_reg[7]_i_1__5_n_1\,
      CO(1) => \count_internal_reg[7]_i_1__5_n_2\,
      CO(0) => \count_internal_reg[7]_i_1__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[7]_i_1__5_n_4\,
      O(2) => \count_internal_reg[7]_i_1__5_n_5\,
      O(1) => \count_internal_reg[7]_i_1__5_n_6\,
      O(0) => \count_internal_reg[7]_i_1__5_n_7\,
      S(3 downto 0) => \^outputs\(7 downto 4)
    );
\count_internal_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__5_n_7\,
      Q => \^outputs\(8)
    );
\count_internal_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__5_n_6\,
      Q => \^outputs\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_counter_12 is
  port (
    outputs : out STD_LOGIC_VECTOR ( 15 downto 0 );
    output : in STD_LOGIC;
    \count_internal_reg[0]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_counter_12 : entity is "counter";
end puf_tero_array_0_1_counter_12;

architecture STRUCTURE of puf_tero_array_0_1_counter_12 is
  signal \count_internal[3]_i_2__6_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__6_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__6_n_1\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__6_n_2\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__6_n_3\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__6_n_4\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__6_n_5\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__6_n_6\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__6_n_7\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__6_n_1\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__6_n_2\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__6_n_3\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__6_n_4\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__6_n_5\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__6_n_6\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__6_n_7\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__6_n_0\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__6_n_1\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__6_n_2\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__6_n_3\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__6_n_4\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__6_n_5\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__6_n_6\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__6_n_7\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__6_n_0\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__6_n_1\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__6_n_2\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__6_n_3\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__6_n_4\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__6_n_5\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__6_n_6\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__6_n_7\ : STD_LOGIC;
  signal \^outputs\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_count_internal_reg[15]_i_1__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \count_internal_reg[11]_i_1__6\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[15]_i_1__6\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[3]_i_1__6\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[7]_i_1__6\ : label is 11;
begin
  outputs(15 downto 0) <= \^outputs\(15 downto 0);
\count_internal[3]_i_2__6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^outputs\(0),
      O => \count_internal[3]_i_2__6_n_0\
    );
\count_internal_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__6_n_7\,
      Q => \^outputs\(0)
    );
\count_internal_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__6_n_5\,
      Q => \^outputs\(10)
    );
\count_internal_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__6_n_4\,
      Q => \^outputs\(11)
    );
\count_internal_reg[11]_i_1__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[7]_i_1__6_n_0\,
      CO(3) => \count_internal_reg[11]_i_1__6_n_0\,
      CO(2) => \count_internal_reg[11]_i_1__6_n_1\,
      CO(1) => \count_internal_reg[11]_i_1__6_n_2\,
      CO(0) => \count_internal_reg[11]_i_1__6_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[11]_i_1__6_n_4\,
      O(2) => \count_internal_reg[11]_i_1__6_n_5\,
      O(1) => \count_internal_reg[11]_i_1__6_n_6\,
      O(0) => \count_internal_reg[11]_i_1__6_n_7\,
      S(3 downto 0) => \^outputs\(11 downto 8)
    );
\count_internal_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__6_n_7\,
      Q => \^outputs\(12)
    );
\count_internal_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__6_n_6\,
      Q => \^outputs\(13)
    );
\count_internal_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__6_n_5\,
      Q => \^outputs\(14)
    );
\count_internal_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__6_n_4\,
      Q => \^outputs\(15)
    );
\count_internal_reg[15]_i_1__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[11]_i_1__6_n_0\,
      CO(3) => \NLW_count_internal_reg[15]_i_1__6_CO_UNCONNECTED\(3),
      CO(2) => \count_internal_reg[15]_i_1__6_n_1\,
      CO(1) => \count_internal_reg[15]_i_1__6_n_2\,
      CO(0) => \count_internal_reg[15]_i_1__6_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[15]_i_1__6_n_4\,
      O(2) => \count_internal_reg[15]_i_1__6_n_5\,
      O(1) => \count_internal_reg[15]_i_1__6_n_6\,
      O(0) => \count_internal_reg[15]_i_1__6_n_7\,
      S(3 downto 0) => \^outputs\(15 downto 12)
    );
\count_internal_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__6_n_6\,
      Q => \^outputs\(1)
    );
\count_internal_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__6_n_5\,
      Q => \^outputs\(2)
    );
\count_internal_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__6_n_4\,
      Q => \^outputs\(3)
    );
\count_internal_reg[3]_i_1__6\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_internal_reg[3]_i_1__6_n_0\,
      CO(2) => \count_internal_reg[3]_i_1__6_n_1\,
      CO(1) => \count_internal_reg[3]_i_1__6_n_2\,
      CO(0) => \count_internal_reg[3]_i_1__6_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \count_internal_reg[3]_i_1__6_n_4\,
      O(2) => \count_internal_reg[3]_i_1__6_n_5\,
      O(1) => \count_internal_reg[3]_i_1__6_n_6\,
      O(0) => \count_internal_reg[3]_i_1__6_n_7\,
      S(3 downto 1) => \^outputs\(3 downto 1),
      S(0) => \count_internal[3]_i_2__6_n_0\
    );
\count_internal_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__6_n_7\,
      Q => \^outputs\(4)
    );
\count_internal_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__6_n_6\,
      Q => \^outputs\(5)
    );
\count_internal_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__6_n_5\,
      Q => \^outputs\(6)
    );
\count_internal_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__6_n_4\,
      Q => \^outputs\(7)
    );
\count_internal_reg[7]_i_1__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[3]_i_1__6_n_0\,
      CO(3) => \count_internal_reg[7]_i_1__6_n_0\,
      CO(2) => \count_internal_reg[7]_i_1__6_n_1\,
      CO(1) => \count_internal_reg[7]_i_1__6_n_2\,
      CO(0) => \count_internal_reg[7]_i_1__6_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[7]_i_1__6_n_4\,
      O(2) => \count_internal_reg[7]_i_1__6_n_5\,
      O(1) => \count_internal_reg[7]_i_1__6_n_6\,
      O(0) => \count_internal_reg[7]_i_1__6_n_7\,
      S(3 downto 0) => \^outputs\(7 downto 4)
    );
\count_internal_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__6_n_7\,
      Q => \^outputs\(8)
    );
\count_internal_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__6_n_6\,
      Q => \^outputs\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_counter_13 is
  port (
    outputs : out STD_LOGIC_VECTOR ( 15 downto 0 );
    output : in STD_LOGIC;
    \count_internal_reg[0]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_counter_13 : entity is "counter";
end puf_tero_array_0_1_counter_13;

architecture STRUCTURE of puf_tero_array_0_1_counter_13 is
  signal \count_internal[3]_i_2__7_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__7_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__7_n_1\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__7_n_2\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__7_n_3\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__7_n_4\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__7_n_5\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__7_n_6\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__7_n_7\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__7_n_1\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__7_n_2\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__7_n_3\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__7_n_4\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__7_n_5\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__7_n_6\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__7_n_7\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__7_n_0\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__7_n_1\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__7_n_2\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__7_n_3\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__7_n_4\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__7_n_5\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__7_n_6\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__7_n_7\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__7_n_0\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__7_n_1\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__7_n_2\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__7_n_3\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__7_n_4\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__7_n_5\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__7_n_6\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__7_n_7\ : STD_LOGIC;
  signal \^outputs\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_count_internal_reg[15]_i_1__7_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \count_internal_reg[11]_i_1__7\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[15]_i_1__7\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[3]_i_1__7\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[7]_i_1__7\ : label is 11;
begin
  outputs(15 downto 0) <= \^outputs\(15 downto 0);
\count_internal[3]_i_2__7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^outputs\(0),
      O => \count_internal[3]_i_2__7_n_0\
    );
\count_internal_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__7_n_7\,
      Q => \^outputs\(0)
    );
\count_internal_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__7_n_5\,
      Q => \^outputs\(10)
    );
\count_internal_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__7_n_4\,
      Q => \^outputs\(11)
    );
\count_internal_reg[11]_i_1__7\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[7]_i_1__7_n_0\,
      CO(3) => \count_internal_reg[11]_i_1__7_n_0\,
      CO(2) => \count_internal_reg[11]_i_1__7_n_1\,
      CO(1) => \count_internal_reg[11]_i_1__7_n_2\,
      CO(0) => \count_internal_reg[11]_i_1__7_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[11]_i_1__7_n_4\,
      O(2) => \count_internal_reg[11]_i_1__7_n_5\,
      O(1) => \count_internal_reg[11]_i_1__7_n_6\,
      O(0) => \count_internal_reg[11]_i_1__7_n_7\,
      S(3 downto 0) => \^outputs\(11 downto 8)
    );
\count_internal_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__7_n_7\,
      Q => \^outputs\(12)
    );
\count_internal_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__7_n_6\,
      Q => \^outputs\(13)
    );
\count_internal_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__7_n_5\,
      Q => \^outputs\(14)
    );
\count_internal_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__7_n_4\,
      Q => \^outputs\(15)
    );
\count_internal_reg[15]_i_1__7\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[11]_i_1__7_n_0\,
      CO(3) => \NLW_count_internal_reg[15]_i_1__7_CO_UNCONNECTED\(3),
      CO(2) => \count_internal_reg[15]_i_1__7_n_1\,
      CO(1) => \count_internal_reg[15]_i_1__7_n_2\,
      CO(0) => \count_internal_reg[15]_i_1__7_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[15]_i_1__7_n_4\,
      O(2) => \count_internal_reg[15]_i_1__7_n_5\,
      O(1) => \count_internal_reg[15]_i_1__7_n_6\,
      O(0) => \count_internal_reg[15]_i_1__7_n_7\,
      S(3 downto 0) => \^outputs\(15 downto 12)
    );
\count_internal_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__7_n_6\,
      Q => \^outputs\(1)
    );
\count_internal_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__7_n_5\,
      Q => \^outputs\(2)
    );
\count_internal_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__7_n_4\,
      Q => \^outputs\(3)
    );
\count_internal_reg[3]_i_1__7\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_internal_reg[3]_i_1__7_n_0\,
      CO(2) => \count_internal_reg[3]_i_1__7_n_1\,
      CO(1) => \count_internal_reg[3]_i_1__7_n_2\,
      CO(0) => \count_internal_reg[3]_i_1__7_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \count_internal_reg[3]_i_1__7_n_4\,
      O(2) => \count_internal_reg[3]_i_1__7_n_5\,
      O(1) => \count_internal_reg[3]_i_1__7_n_6\,
      O(0) => \count_internal_reg[3]_i_1__7_n_7\,
      S(3 downto 1) => \^outputs\(3 downto 1),
      S(0) => \count_internal[3]_i_2__7_n_0\
    );
\count_internal_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__7_n_7\,
      Q => \^outputs\(4)
    );
\count_internal_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__7_n_6\,
      Q => \^outputs\(5)
    );
\count_internal_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__7_n_5\,
      Q => \^outputs\(6)
    );
\count_internal_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__7_n_4\,
      Q => \^outputs\(7)
    );
\count_internal_reg[7]_i_1__7\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[3]_i_1__7_n_0\,
      CO(3) => \count_internal_reg[7]_i_1__7_n_0\,
      CO(2) => \count_internal_reg[7]_i_1__7_n_1\,
      CO(1) => \count_internal_reg[7]_i_1__7_n_2\,
      CO(0) => \count_internal_reg[7]_i_1__7_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[7]_i_1__7_n_4\,
      O(2) => \count_internal_reg[7]_i_1__7_n_5\,
      O(1) => \count_internal_reg[7]_i_1__7_n_6\,
      O(0) => \count_internal_reg[7]_i_1__7_n_7\,
      S(3 downto 0) => \^outputs\(7 downto 4)
    );
\count_internal_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__7_n_7\,
      Q => \^outputs\(8)
    );
\count_internal_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__7_n_6\,
      Q => \^outputs\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_counter_14 is
  port (
    outputs : out STD_LOGIC_VECTOR ( 15 downto 0 );
    output : in STD_LOGIC;
    \count_internal_reg[0]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_counter_14 : entity is "counter";
end puf_tero_array_0_1_counter_14;

architecture STRUCTURE of puf_tero_array_0_1_counter_14 is
  signal \count_internal[3]_i_2__8_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__8_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__8_n_1\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__8_n_2\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__8_n_3\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__8_n_4\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__8_n_5\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__8_n_6\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__8_n_7\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__8_n_1\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__8_n_2\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__8_n_3\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__8_n_4\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__8_n_5\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__8_n_6\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__8_n_7\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__8_n_0\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__8_n_1\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__8_n_2\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__8_n_3\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__8_n_4\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__8_n_5\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__8_n_6\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__8_n_7\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__8_n_0\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__8_n_1\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__8_n_2\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__8_n_3\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__8_n_4\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__8_n_5\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__8_n_6\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__8_n_7\ : STD_LOGIC;
  signal \^outputs\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_count_internal_reg[15]_i_1__8_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \count_internal_reg[11]_i_1__8\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[15]_i_1__8\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[3]_i_1__8\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[7]_i_1__8\ : label is 11;
begin
  outputs(15 downto 0) <= \^outputs\(15 downto 0);
\count_internal[3]_i_2__8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^outputs\(0),
      O => \count_internal[3]_i_2__8_n_0\
    );
\count_internal_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__8_n_7\,
      Q => \^outputs\(0)
    );
\count_internal_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__8_n_5\,
      Q => \^outputs\(10)
    );
\count_internal_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__8_n_4\,
      Q => \^outputs\(11)
    );
\count_internal_reg[11]_i_1__8\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[7]_i_1__8_n_0\,
      CO(3) => \count_internal_reg[11]_i_1__8_n_0\,
      CO(2) => \count_internal_reg[11]_i_1__8_n_1\,
      CO(1) => \count_internal_reg[11]_i_1__8_n_2\,
      CO(0) => \count_internal_reg[11]_i_1__8_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[11]_i_1__8_n_4\,
      O(2) => \count_internal_reg[11]_i_1__8_n_5\,
      O(1) => \count_internal_reg[11]_i_1__8_n_6\,
      O(0) => \count_internal_reg[11]_i_1__8_n_7\,
      S(3 downto 0) => \^outputs\(11 downto 8)
    );
\count_internal_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__8_n_7\,
      Q => \^outputs\(12)
    );
\count_internal_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__8_n_6\,
      Q => \^outputs\(13)
    );
\count_internal_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__8_n_5\,
      Q => \^outputs\(14)
    );
\count_internal_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__8_n_4\,
      Q => \^outputs\(15)
    );
\count_internal_reg[15]_i_1__8\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[11]_i_1__8_n_0\,
      CO(3) => \NLW_count_internal_reg[15]_i_1__8_CO_UNCONNECTED\(3),
      CO(2) => \count_internal_reg[15]_i_1__8_n_1\,
      CO(1) => \count_internal_reg[15]_i_1__8_n_2\,
      CO(0) => \count_internal_reg[15]_i_1__8_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[15]_i_1__8_n_4\,
      O(2) => \count_internal_reg[15]_i_1__8_n_5\,
      O(1) => \count_internal_reg[15]_i_1__8_n_6\,
      O(0) => \count_internal_reg[15]_i_1__8_n_7\,
      S(3 downto 0) => \^outputs\(15 downto 12)
    );
\count_internal_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__8_n_6\,
      Q => \^outputs\(1)
    );
\count_internal_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__8_n_5\,
      Q => \^outputs\(2)
    );
\count_internal_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__8_n_4\,
      Q => \^outputs\(3)
    );
\count_internal_reg[3]_i_1__8\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_internal_reg[3]_i_1__8_n_0\,
      CO(2) => \count_internal_reg[3]_i_1__8_n_1\,
      CO(1) => \count_internal_reg[3]_i_1__8_n_2\,
      CO(0) => \count_internal_reg[3]_i_1__8_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \count_internal_reg[3]_i_1__8_n_4\,
      O(2) => \count_internal_reg[3]_i_1__8_n_5\,
      O(1) => \count_internal_reg[3]_i_1__8_n_6\,
      O(0) => \count_internal_reg[3]_i_1__8_n_7\,
      S(3 downto 1) => \^outputs\(3 downto 1),
      S(0) => \count_internal[3]_i_2__8_n_0\
    );
\count_internal_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__8_n_7\,
      Q => \^outputs\(4)
    );
\count_internal_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__8_n_6\,
      Q => \^outputs\(5)
    );
\count_internal_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__8_n_5\,
      Q => \^outputs\(6)
    );
\count_internal_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__8_n_4\,
      Q => \^outputs\(7)
    );
\count_internal_reg[7]_i_1__8\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[3]_i_1__8_n_0\,
      CO(3) => \count_internal_reg[7]_i_1__8_n_0\,
      CO(2) => \count_internal_reg[7]_i_1__8_n_1\,
      CO(1) => \count_internal_reg[7]_i_1__8_n_2\,
      CO(0) => \count_internal_reg[7]_i_1__8_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[7]_i_1__8_n_4\,
      O(2) => \count_internal_reg[7]_i_1__8_n_5\,
      O(1) => \count_internal_reg[7]_i_1__8_n_6\,
      O(0) => \count_internal_reg[7]_i_1__8_n_7\,
      S(3 downto 0) => \^outputs\(7 downto 4)
    );
\count_internal_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__8_n_7\,
      Q => \^outputs\(8)
    );
\count_internal_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__8_n_6\,
      Q => \^outputs\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_counter_2 is
  port (
    outputs : out STD_LOGIC_VECTOR ( 15 downto 0 );
    output : in STD_LOGIC;
    \count_internal_reg[0]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_counter_2 : entity is "counter";
end puf_tero_array_0_1_counter_2;

architecture STRUCTURE of puf_tero_array_0_1_counter_2 is
  signal \count_internal[3]_i_2__11_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__11_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__11_n_1\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__11_n_2\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__11_n_3\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__11_n_4\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__11_n_5\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__11_n_6\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__11_n_7\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__11_n_1\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__11_n_2\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__11_n_3\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__11_n_4\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__11_n_5\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__11_n_6\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__11_n_7\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__11_n_0\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__11_n_1\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__11_n_2\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__11_n_3\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__11_n_4\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__11_n_5\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__11_n_6\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__11_n_7\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__11_n_0\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__11_n_1\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__11_n_2\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__11_n_3\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__11_n_4\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__11_n_5\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__11_n_6\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__11_n_7\ : STD_LOGIC;
  signal \^outputs\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_count_internal_reg[15]_i_1__11_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \count_internal_reg[11]_i_1__11\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[15]_i_1__11\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[3]_i_1__11\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[7]_i_1__11\ : label is 11;
begin
  outputs(15 downto 0) <= \^outputs\(15 downto 0);
\count_internal[3]_i_2__11\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^outputs\(0),
      O => \count_internal[3]_i_2__11_n_0\
    );
\count_internal_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__11_n_7\,
      Q => \^outputs\(0)
    );
\count_internal_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__11_n_5\,
      Q => \^outputs\(10)
    );
\count_internal_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__11_n_4\,
      Q => \^outputs\(11)
    );
\count_internal_reg[11]_i_1__11\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[7]_i_1__11_n_0\,
      CO(3) => \count_internal_reg[11]_i_1__11_n_0\,
      CO(2) => \count_internal_reg[11]_i_1__11_n_1\,
      CO(1) => \count_internal_reg[11]_i_1__11_n_2\,
      CO(0) => \count_internal_reg[11]_i_1__11_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[11]_i_1__11_n_4\,
      O(2) => \count_internal_reg[11]_i_1__11_n_5\,
      O(1) => \count_internal_reg[11]_i_1__11_n_6\,
      O(0) => \count_internal_reg[11]_i_1__11_n_7\,
      S(3 downto 0) => \^outputs\(11 downto 8)
    );
\count_internal_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__11_n_7\,
      Q => \^outputs\(12)
    );
\count_internal_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__11_n_6\,
      Q => \^outputs\(13)
    );
\count_internal_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__11_n_5\,
      Q => \^outputs\(14)
    );
\count_internal_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__11_n_4\,
      Q => \^outputs\(15)
    );
\count_internal_reg[15]_i_1__11\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[11]_i_1__11_n_0\,
      CO(3) => \NLW_count_internal_reg[15]_i_1__11_CO_UNCONNECTED\(3),
      CO(2) => \count_internal_reg[15]_i_1__11_n_1\,
      CO(1) => \count_internal_reg[15]_i_1__11_n_2\,
      CO(0) => \count_internal_reg[15]_i_1__11_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[15]_i_1__11_n_4\,
      O(2) => \count_internal_reg[15]_i_1__11_n_5\,
      O(1) => \count_internal_reg[15]_i_1__11_n_6\,
      O(0) => \count_internal_reg[15]_i_1__11_n_7\,
      S(3 downto 0) => \^outputs\(15 downto 12)
    );
\count_internal_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__11_n_6\,
      Q => \^outputs\(1)
    );
\count_internal_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__11_n_5\,
      Q => \^outputs\(2)
    );
\count_internal_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__11_n_4\,
      Q => \^outputs\(3)
    );
\count_internal_reg[3]_i_1__11\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_internal_reg[3]_i_1__11_n_0\,
      CO(2) => \count_internal_reg[3]_i_1__11_n_1\,
      CO(1) => \count_internal_reg[3]_i_1__11_n_2\,
      CO(0) => \count_internal_reg[3]_i_1__11_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \count_internal_reg[3]_i_1__11_n_4\,
      O(2) => \count_internal_reg[3]_i_1__11_n_5\,
      O(1) => \count_internal_reg[3]_i_1__11_n_6\,
      O(0) => \count_internal_reg[3]_i_1__11_n_7\,
      S(3 downto 1) => \^outputs\(3 downto 1),
      S(0) => \count_internal[3]_i_2__11_n_0\
    );
\count_internal_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__11_n_7\,
      Q => \^outputs\(4)
    );
\count_internal_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__11_n_6\,
      Q => \^outputs\(5)
    );
\count_internal_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__11_n_5\,
      Q => \^outputs\(6)
    );
\count_internal_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__11_n_4\,
      Q => \^outputs\(7)
    );
\count_internal_reg[7]_i_1__11\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[3]_i_1__11_n_0\,
      CO(3) => \count_internal_reg[7]_i_1__11_n_0\,
      CO(2) => \count_internal_reg[7]_i_1__11_n_1\,
      CO(1) => \count_internal_reg[7]_i_1__11_n_2\,
      CO(0) => \count_internal_reg[7]_i_1__11_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[7]_i_1__11_n_4\,
      O(2) => \count_internal_reg[7]_i_1__11_n_5\,
      O(1) => \count_internal_reg[7]_i_1__11_n_6\,
      O(0) => \count_internal_reg[7]_i_1__11_n_7\,
      S(3 downto 0) => \^outputs\(7 downto 4)
    );
\count_internal_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__11_n_7\,
      Q => \^outputs\(8)
    );
\count_internal_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__11_n_6\,
      Q => \^outputs\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_counter_3 is
  port (
    outputs : out STD_LOGIC_VECTOR ( 15 downto 0 );
    output : in STD_LOGIC;
    \count_internal_reg[0]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_counter_3 : entity is "counter";
end puf_tero_array_0_1_counter_3;

architecture STRUCTURE of puf_tero_array_0_1_counter_3 is
  signal \count_internal[3]_i_2__12_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__12_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__12_n_1\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__12_n_2\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__12_n_3\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__12_n_4\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__12_n_5\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__12_n_6\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__12_n_7\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__12_n_1\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__12_n_2\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__12_n_3\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__12_n_4\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__12_n_5\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__12_n_6\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__12_n_7\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__12_n_0\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__12_n_1\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__12_n_2\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__12_n_3\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__12_n_4\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__12_n_5\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__12_n_6\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__12_n_7\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__12_n_0\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__12_n_1\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__12_n_2\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__12_n_3\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__12_n_4\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__12_n_5\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__12_n_6\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__12_n_7\ : STD_LOGIC;
  signal \^outputs\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_count_internal_reg[15]_i_1__12_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \count_internal_reg[11]_i_1__12\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[15]_i_1__12\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[3]_i_1__12\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[7]_i_1__12\ : label is 11;
begin
  outputs(15 downto 0) <= \^outputs\(15 downto 0);
\count_internal[3]_i_2__12\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^outputs\(0),
      O => \count_internal[3]_i_2__12_n_0\
    );
\count_internal_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__12_n_7\,
      Q => \^outputs\(0)
    );
\count_internal_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__12_n_5\,
      Q => \^outputs\(10)
    );
\count_internal_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__12_n_4\,
      Q => \^outputs\(11)
    );
\count_internal_reg[11]_i_1__12\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[7]_i_1__12_n_0\,
      CO(3) => \count_internal_reg[11]_i_1__12_n_0\,
      CO(2) => \count_internal_reg[11]_i_1__12_n_1\,
      CO(1) => \count_internal_reg[11]_i_1__12_n_2\,
      CO(0) => \count_internal_reg[11]_i_1__12_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[11]_i_1__12_n_4\,
      O(2) => \count_internal_reg[11]_i_1__12_n_5\,
      O(1) => \count_internal_reg[11]_i_1__12_n_6\,
      O(0) => \count_internal_reg[11]_i_1__12_n_7\,
      S(3 downto 0) => \^outputs\(11 downto 8)
    );
\count_internal_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__12_n_7\,
      Q => \^outputs\(12)
    );
\count_internal_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__12_n_6\,
      Q => \^outputs\(13)
    );
\count_internal_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__12_n_5\,
      Q => \^outputs\(14)
    );
\count_internal_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__12_n_4\,
      Q => \^outputs\(15)
    );
\count_internal_reg[15]_i_1__12\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[11]_i_1__12_n_0\,
      CO(3) => \NLW_count_internal_reg[15]_i_1__12_CO_UNCONNECTED\(3),
      CO(2) => \count_internal_reg[15]_i_1__12_n_1\,
      CO(1) => \count_internal_reg[15]_i_1__12_n_2\,
      CO(0) => \count_internal_reg[15]_i_1__12_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[15]_i_1__12_n_4\,
      O(2) => \count_internal_reg[15]_i_1__12_n_5\,
      O(1) => \count_internal_reg[15]_i_1__12_n_6\,
      O(0) => \count_internal_reg[15]_i_1__12_n_7\,
      S(3 downto 0) => \^outputs\(15 downto 12)
    );
\count_internal_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__12_n_6\,
      Q => \^outputs\(1)
    );
\count_internal_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__12_n_5\,
      Q => \^outputs\(2)
    );
\count_internal_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__12_n_4\,
      Q => \^outputs\(3)
    );
\count_internal_reg[3]_i_1__12\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_internal_reg[3]_i_1__12_n_0\,
      CO(2) => \count_internal_reg[3]_i_1__12_n_1\,
      CO(1) => \count_internal_reg[3]_i_1__12_n_2\,
      CO(0) => \count_internal_reg[3]_i_1__12_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \count_internal_reg[3]_i_1__12_n_4\,
      O(2) => \count_internal_reg[3]_i_1__12_n_5\,
      O(1) => \count_internal_reg[3]_i_1__12_n_6\,
      O(0) => \count_internal_reg[3]_i_1__12_n_7\,
      S(3 downto 1) => \^outputs\(3 downto 1),
      S(0) => \count_internal[3]_i_2__12_n_0\
    );
\count_internal_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__12_n_7\,
      Q => \^outputs\(4)
    );
\count_internal_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__12_n_6\,
      Q => \^outputs\(5)
    );
\count_internal_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__12_n_5\,
      Q => \^outputs\(6)
    );
\count_internal_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__12_n_4\,
      Q => \^outputs\(7)
    );
\count_internal_reg[7]_i_1__12\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[3]_i_1__12_n_0\,
      CO(3) => \count_internal_reg[7]_i_1__12_n_0\,
      CO(2) => \count_internal_reg[7]_i_1__12_n_1\,
      CO(1) => \count_internal_reg[7]_i_1__12_n_2\,
      CO(0) => \count_internal_reg[7]_i_1__12_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[7]_i_1__12_n_4\,
      O(2) => \count_internal_reg[7]_i_1__12_n_5\,
      O(1) => \count_internal_reg[7]_i_1__12_n_6\,
      O(0) => \count_internal_reg[7]_i_1__12_n_7\,
      S(3 downto 0) => \^outputs\(7 downto 4)
    );
\count_internal_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__12_n_7\,
      Q => \^outputs\(8)
    );
\count_internal_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__12_n_6\,
      Q => \^outputs\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_counter_4 is
  port (
    outputs : out STD_LOGIC_VECTOR ( 15 downto 0 );
    output : in STD_LOGIC;
    \count_internal_reg[0]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_counter_4 : entity is "counter";
end puf_tero_array_0_1_counter_4;

architecture STRUCTURE of puf_tero_array_0_1_counter_4 is
  signal \count_internal[3]_i_2__13_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__13_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__13_n_1\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__13_n_2\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__13_n_3\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__13_n_4\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__13_n_5\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__13_n_6\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__13_n_7\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__13_n_1\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__13_n_2\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__13_n_3\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__13_n_4\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__13_n_5\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__13_n_6\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__13_n_7\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__13_n_0\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__13_n_1\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__13_n_2\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__13_n_3\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__13_n_4\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__13_n_5\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__13_n_6\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__13_n_7\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__13_n_0\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__13_n_1\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__13_n_2\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__13_n_3\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__13_n_4\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__13_n_5\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__13_n_6\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__13_n_7\ : STD_LOGIC;
  signal \^outputs\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_count_internal_reg[15]_i_1__13_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \count_internal_reg[11]_i_1__13\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[15]_i_1__13\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[3]_i_1__13\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[7]_i_1__13\ : label is 11;
begin
  outputs(15 downto 0) <= \^outputs\(15 downto 0);
\count_internal[3]_i_2__13\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^outputs\(0),
      O => \count_internal[3]_i_2__13_n_0\
    );
\count_internal_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__13_n_7\,
      Q => \^outputs\(0)
    );
\count_internal_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__13_n_5\,
      Q => \^outputs\(10)
    );
\count_internal_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__13_n_4\,
      Q => \^outputs\(11)
    );
\count_internal_reg[11]_i_1__13\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[7]_i_1__13_n_0\,
      CO(3) => \count_internal_reg[11]_i_1__13_n_0\,
      CO(2) => \count_internal_reg[11]_i_1__13_n_1\,
      CO(1) => \count_internal_reg[11]_i_1__13_n_2\,
      CO(0) => \count_internal_reg[11]_i_1__13_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[11]_i_1__13_n_4\,
      O(2) => \count_internal_reg[11]_i_1__13_n_5\,
      O(1) => \count_internal_reg[11]_i_1__13_n_6\,
      O(0) => \count_internal_reg[11]_i_1__13_n_7\,
      S(3 downto 0) => \^outputs\(11 downto 8)
    );
\count_internal_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__13_n_7\,
      Q => \^outputs\(12)
    );
\count_internal_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__13_n_6\,
      Q => \^outputs\(13)
    );
\count_internal_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__13_n_5\,
      Q => \^outputs\(14)
    );
\count_internal_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__13_n_4\,
      Q => \^outputs\(15)
    );
\count_internal_reg[15]_i_1__13\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[11]_i_1__13_n_0\,
      CO(3) => \NLW_count_internal_reg[15]_i_1__13_CO_UNCONNECTED\(3),
      CO(2) => \count_internal_reg[15]_i_1__13_n_1\,
      CO(1) => \count_internal_reg[15]_i_1__13_n_2\,
      CO(0) => \count_internal_reg[15]_i_1__13_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[15]_i_1__13_n_4\,
      O(2) => \count_internal_reg[15]_i_1__13_n_5\,
      O(1) => \count_internal_reg[15]_i_1__13_n_6\,
      O(0) => \count_internal_reg[15]_i_1__13_n_7\,
      S(3 downto 0) => \^outputs\(15 downto 12)
    );
\count_internal_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__13_n_6\,
      Q => \^outputs\(1)
    );
\count_internal_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__13_n_5\,
      Q => \^outputs\(2)
    );
\count_internal_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__13_n_4\,
      Q => \^outputs\(3)
    );
\count_internal_reg[3]_i_1__13\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_internal_reg[3]_i_1__13_n_0\,
      CO(2) => \count_internal_reg[3]_i_1__13_n_1\,
      CO(1) => \count_internal_reg[3]_i_1__13_n_2\,
      CO(0) => \count_internal_reg[3]_i_1__13_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \count_internal_reg[3]_i_1__13_n_4\,
      O(2) => \count_internal_reg[3]_i_1__13_n_5\,
      O(1) => \count_internal_reg[3]_i_1__13_n_6\,
      O(0) => \count_internal_reg[3]_i_1__13_n_7\,
      S(3 downto 1) => \^outputs\(3 downto 1),
      S(0) => \count_internal[3]_i_2__13_n_0\
    );
\count_internal_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__13_n_7\,
      Q => \^outputs\(4)
    );
\count_internal_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__13_n_6\,
      Q => \^outputs\(5)
    );
\count_internal_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__13_n_5\,
      Q => \^outputs\(6)
    );
\count_internal_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__13_n_4\,
      Q => \^outputs\(7)
    );
\count_internal_reg[7]_i_1__13\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[3]_i_1__13_n_0\,
      CO(3) => \count_internal_reg[7]_i_1__13_n_0\,
      CO(2) => \count_internal_reg[7]_i_1__13_n_1\,
      CO(1) => \count_internal_reg[7]_i_1__13_n_2\,
      CO(0) => \count_internal_reg[7]_i_1__13_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[7]_i_1__13_n_4\,
      O(2) => \count_internal_reg[7]_i_1__13_n_5\,
      O(1) => \count_internal_reg[7]_i_1__13_n_6\,
      O(0) => \count_internal_reg[7]_i_1__13_n_7\,
      S(3 downto 0) => \^outputs\(7 downto 4)
    );
\count_internal_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__13_n_7\,
      Q => \^outputs\(8)
    );
\count_internal_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__13_n_6\,
      Q => \^outputs\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_counter_5 is
  port (
    outputs : out STD_LOGIC_VECTOR ( 15 downto 0 );
    enable_0 : out STD_LOGIC;
    output : in STD_LOGIC;
    enable : in STD_LOGIC;
    reset : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_counter_5 : entity is "counter";
end puf_tero_array_0_1_counter_5;

architecture STRUCTURE of puf_tero_array_0_1_counter_5 is
  signal \count_internal[3]_i_2__14_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__14_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__14_n_1\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__14_n_2\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__14_n_3\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__14_n_4\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__14_n_5\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__14_n_6\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__14_n_7\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__14_n_1\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__14_n_2\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__14_n_3\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__14_n_4\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__14_n_5\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__14_n_6\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__14_n_7\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__14_n_0\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__14_n_1\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__14_n_2\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__14_n_3\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__14_n_4\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__14_n_5\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__14_n_6\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__14_n_7\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__14_n_0\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__14_n_1\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__14_n_2\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__14_n_3\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__14_n_4\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__14_n_5\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__14_n_6\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__14_n_7\ : STD_LOGIC;
  signal \^enable_0\ : STD_LOGIC;
  signal \^outputs\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_count_internal_reg[15]_i_1__14_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \count_internal_reg[11]_i_1__14\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[15]_i_1__14\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[3]_i_1__14\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[7]_i_1__14\ : label is 11;
begin
  enable_0 <= \^enable_0\;
  outputs(15 downto 0) <= \^outputs\(15 downto 0);
\count_internal[15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => enable,
      I1 => reset,
      O => \^enable_0\
    );
\count_internal[3]_i_2__14\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^outputs\(0),
      O => \count_internal[3]_i_2__14_n_0\
    );
\count_internal_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \^enable_0\,
      D => \count_internal_reg[3]_i_1__14_n_7\,
      Q => \^outputs\(0)
    );
\count_internal_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \^enable_0\,
      D => \count_internal_reg[11]_i_1__14_n_5\,
      Q => \^outputs\(10)
    );
\count_internal_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \^enable_0\,
      D => \count_internal_reg[11]_i_1__14_n_4\,
      Q => \^outputs\(11)
    );
\count_internal_reg[11]_i_1__14\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[7]_i_1__14_n_0\,
      CO(3) => \count_internal_reg[11]_i_1__14_n_0\,
      CO(2) => \count_internal_reg[11]_i_1__14_n_1\,
      CO(1) => \count_internal_reg[11]_i_1__14_n_2\,
      CO(0) => \count_internal_reg[11]_i_1__14_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[11]_i_1__14_n_4\,
      O(2) => \count_internal_reg[11]_i_1__14_n_5\,
      O(1) => \count_internal_reg[11]_i_1__14_n_6\,
      O(0) => \count_internal_reg[11]_i_1__14_n_7\,
      S(3 downto 0) => \^outputs\(11 downto 8)
    );
\count_internal_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \^enable_0\,
      D => \count_internal_reg[15]_i_1__14_n_7\,
      Q => \^outputs\(12)
    );
\count_internal_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \^enable_0\,
      D => \count_internal_reg[15]_i_1__14_n_6\,
      Q => \^outputs\(13)
    );
\count_internal_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \^enable_0\,
      D => \count_internal_reg[15]_i_1__14_n_5\,
      Q => \^outputs\(14)
    );
\count_internal_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \^enable_0\,
      D => \count_internal_reg[15]_i_1__14_n_4\,
      Q => \^outputs\(15)
    );
\count_internal_reg[15]_i_1__14\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[11]_i_1__14_n_0\,
      CO(3) => \NLW_count_internal_reg[15]_i_1__14_CO_UNCONNECTED\(3),
      CO(2) => \count_internal_reg[15]_i_1__14_n_1\,
      CO(1) => \count_internal_reg[15]_i_1__14_n_2\,
      CO(0) => \count_internal_reg[15]_i_1__14_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[15]_i_1__14_n_4\,
      O(2) => \count_internal_reg[15]_i_1__14_n_5\,
      O(1) => \count_internal_reg[15]_i_1__14_n_6\,
      O(0) => \count_internal_reg[15]_i_1__14_n_7\,
      S(3 downto 0) => \^outputs\(15 downto 12)
    );
\count_internal_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \^enable_0\,
      D => \count_internal_reg[3]_i_1__14_n_6\,
      Q => \^outputs\(1)
    );
\count_internal_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \^enable_0\,
      D => \count_internal_reg[3]_i_1__14_n_5\,
      Q => \^outputs\(2)
    );
\count_internal_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \^enable_0\,
      D => \count_internal_reg[3]_i_1__14_n_4\,
      Q => \^outputs\(3)
    );
\count_internal_reg[3]_i_1__14\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_internal_reg[3]_i_1__14_n_0\,
      CO(2) => \count_internal_reg[3]_i_1__14_n_1\,
      CO(1) => \count_internal_reg[3]_i_1__14_n_2\,
      CO(0) => \count_internal_reg[3]_i_1__14_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \count_internal_reg[3]_i_1__14_n_4\,
      O(2) => \count_internal_reg[3]_i_1__14_n_5\,
      O(1) => \count_internal_reg[3]_i_1__14_n_6\,
      O(0) => \count_internal_reg[3]_i_1__14_n_7\,
      S(3 downto 1) => \^outputs\(3 downto 1),
      S(0) => \count_internal[3]_i_2__14_n_0\
    );
\count_internal_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \^enable_0\,
      D => \count_internal_reg[7]_i_1__14_n_7\,
      Q => \^outputs\(4)
    );
\count_internal_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \^enable_0\,
      D => \count_internal_reg[7]_i_1__14_n_6\,
      Q => \^outputs\(5)
    );
\count_internal_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \^enable_0\,
      D => \count_internal_reg[7]_i_1__14_n_5\,
      Q => \^outputs\(6)
    );
\count_internal_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \^enable_0\,
      D => \count_internal_reg[7]_i_1__14_n_4\,
      Q => \^outputs\(7)
    );
\count_internal_reg[7]_i_1__14\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[3]_i_1__14_n_0\,
      CO(3) => \count_internal_reg[7]_i_1__14_n_0\,
      CO(2) => \count_internal_reg[7]_i_1__14_n_1\,
      CO(1) => \count_internal_reg[7]_i_1__14_n_2\,
      CO(0) => \count_internal_reg[7]_i_1__14_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[7]_i_1__14_n_4\,
      O(2) => \count_internal_reg[7]_i_1__14_n_5\,
      O(1) => \count_internal_reg[7]_i_1__14_n_6\,
      O(0) => \count_internal_reg[7]_i_1__14_n_7\,
      S(3 downto 0) => \^outputs\(7 downto 4)
    );
\count_internal_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \^enable_0\,
      D => \count_internal_reg[11]_i_1__14_n_7\,
      Q => \^outputs\(8)
    );
\count_internal_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \^enable_0\,
      D => \count_internal_reg[11]_i_1__14_n_6\,
      Q => \^outputs\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_counter_6 is
  port (
    outputs : out STD_LOGIC_VECTOR ( 15 downto 0 );
    output : in STD_LOGIC;
    \count_internal_reg[0]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_counter_6 : entity is "counter";
end puf_tero_array_0_1_counter_6;

architecture STRUCTURE of puf_tero_array_0_1_counter_6 is
  signal \count_internal[3]_i_2__0_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__0_n_1\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__0_n_2\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__0_n_3\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__0_n_4\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__0_n_5\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__0_n_6\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__0_n_7\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__0_n_1\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__0_n_2\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__0_n_3\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__0_n_4\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__0_n_5\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__0_n_6\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__0_n_7\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__0_n_1\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__0_n_2\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__0_n_3\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__0_n_4\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__0_n_5\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__0_n_6\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__0_n_7\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__0_n_1\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__0_n_2\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__0_n_3\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__0_n_4\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__0_n_5\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__0_n_6\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__0_n_7\ : STD_LOGIC;
  signal \^outputs\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_count_internal_reg[15]_i_1__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \count_internal_reg[11]_i_1__0\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[15]_i_1__0\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[3]_i_1__0\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[7]_i_1__0\ : label is 11;
begin
  outputs(15 downto 0) <= \^outputs\(15 downto 0);
\count_internal[3]_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^outputs\(0),
      O => \count_internal[3]_i_2__0_n_0\
    );
\count_internal_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__0_n_7\,
      Q => \^outputs\(0)
    );
\count_internal_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__0_n_5\,
      Q => \^outputs\(10)
    );
\count_internal_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__0_n_4\,
      Q => \^outputs\(11)
    );
\count_internal_reg[11]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[7]_i_1__0_n_0\,
      CO(3) => \count_internal_reg[11]_i_1__0_n_0\,
      CO(2) => \count_internal_reg[11]_i_1__0_n_1\,
      CO(1) => \count_internal_reg[11]_i_1__0_n_2\,
      CO(0) => \count_internal_reg[11]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[11]_i_1__0_n_4\,
      O(2) => \count_internal_reg[11]_i_1__0_n_5\,
      O(1) => \count_internal_reg[11]_i_1__0_n_6\,
      O(0) => \count_internal_reg[11]_i_1__0_n_7\,
      S(3 downto 0) => \^outputs\(11 downto 8)
    );
\count_internal_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__0_n_7\,
      Q => \^outputs\(12)
    );
\count_internal_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__0_n_6\,
      Q => \^outputs\(13)
    );
\count_internal_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__0_n_5\,
      Q => \^outputs\(14)
    );
\count_internal_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__0_n_4\,
      Q => \^outputs\(15)
    );
\count_internal_reg[15]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[11]_i_1__0_n_0\,
      CO(3) => \NLW_count_internal_reg[15]_i_1__0_CO_UNCONNECTED\(3),
      CO(2) => \count_internal_reg[15]_i_1__0_n_1\,
      CO(1) => \count_internal_reg[15]_i_1__0_n_2\,
      CO(0) => \count_internal_reg[15]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[15]_i_1__0_n_4\,
      O(2) => \count_internal_reg[15]_i_1__0_n_5\,
      O(1) => \count_internal_reg[15]_i_1__0_n_6\,
      O(0) => \count_internal_reg[15]_i_1__0_n_7\,
      S(3 downto 0) => \^outputs\(15 downto 12)
    );
\count_internal_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__0_n_6\,
      Q => \^outputs\(1)
    );
\count_internal_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__0_n_5\,
      Q => \^outputs\(2)
    );
\count_internal_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__0_n_4\,
      Q => \^outputs\(3)
    );
\count_internal_reg[3]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_internal_reg[3]_i_1__0_n_0\,
      CO(2) => \count_internal_reg[3]_i_1__0_n_1\,
      CO(1) => \count_internal_reg[3]_i_1__0_n_2\,
      CO(0) => \count_internal_reg[3]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \count_internal_reg[3]_i_1__0_n_4\,
      O(2) => \count_internal_reg[3]_i_1__0_n_5\,
      O(1) => \count_internal_reg[3]_i_1__0_n_6\,
      O(0) => \count_internal_reg[3]_i_1__0_n_7\,
      S(3 downto 1) => \^outputs\(3 downto 1),
      S(0) => \count_internal[3]_i_2__0_n_0\
    );
\count_internal_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__0_n_7\,
      Q => \^outputs\(4)
    );
\count_internal_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__0_n_6\,
      Q => \^outputs\(5)
    );
\count_internal_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__0_n_5\,
      Q => \^outputs\(6)
    );
\count_internal_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__0_n_4\,
      Q => \^outputs\(7)
    );
\count_internal_reg[7]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[3]_i_1__0_n_0\,
      CO(3) => \count_internal_reg[7]_i_1__0_n_0\,
      CO(2) => \count_internal_reg[7]_i_1__0_n_1\,
      CO(1) => \count_internal_reg[7]_i_1__0_n_2\,
      CO(0) => \count_internal_reg[7]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[7]_i_1__0_n_4\,
      O(2) => \count_internal_reg[7]_i_1__0_n_5\,
      O(1) => \count_internal_reg[7]_i_1__0_n_6\,
      O(0) => \count_internal_reg[7]_i_1__0_n_7\,
      S(3 downto 0) => \^outputs\(7 downto 4)
    );
\count_internal_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__0_n_7\,
      Q => \^outputs\(8)
    );
\count_internal_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__0_n_6\,
      Q => \^outputs\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_counter_7 is
  port (
    outputs : out STD_LOGIC_VECTOR ( 15 downto 0 );
    output : in STD_LOGIC;
    \count_internal_reg[0]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_counter_7 : entity is "counter";
end puf_tero_array_0_1_counter_7;

architecture STRUCTURE of puf_tero_array_0_1_counter_7 is
  signal \count_internal[3]_i_2__1_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__1_n_1\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__1_n_2\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__1_n_3\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__1_n_4\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__1_n_5\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__1_n_6\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__1_n_7\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__1_n_1\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__1_n_2\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__1_n_3\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__1_n_4\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__1_n_5\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__1_n_6\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__1_n_7\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__1_n_1\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__1_n_2\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__1_n_3\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__1_n_4\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__1_n_5\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__1_n_6\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__1_n_7\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__1_n_1\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__1_n_2\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__1_n_3\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__1_n_4\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__1_n_5\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__1_n_6\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__1_n_7\ : STD_LOGIC;
  signal \^outputs\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_count_internal_reg[15]_i_1__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \count_internal_reg[11]_i_1__1\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[15]_i_1__1\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[3]_i_1__1\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[7]_i_1__1\ : label is 11;
begin
  outputs(15 downto 0) <= \^outputs\(15 downto 0);
\count_internal[3]_i_2__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^outputs\(0),
      O => \count_internal[3]_i_2__1_n_0\
    );
\count_internal_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__1_n_7\,
      Q => \^outputs\(0)
    );
\count_internal_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__1_n_5\,
      Q => \^outputs\(10)
    );
\count_internal_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__1_n_4\,
      Q => \^outputs\(11)
    );
\count_internal_reg[11]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[7]_i_1__1_n_0\,
      CO(3) => \count_internal_reg[11]_i_1__1_n_0\,
      CO(2) => \count_internal_reg[11]_i_1__1_n_1\,
      CO(1) => \count_internal_reg[11]_i_1__1_n_2\,
      CO(0) => \count_internal_reg[11]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[11]_i_1__1_n_4\,
      O(2) => \count_internal_reg[11]_i_1__1_n_5\,
      O(1) => \count_internal_reg[11]_i_1__1_n_6\,
      O(0) => \count_internal_reg[11]_i_1__1_n_7\,
      S(3 downto 0) => \^outputs\(11 downto 8)
    );
\count_internal_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__1_n_7\,
      Q => \^outputs\(12)
    );
\count_internal_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__1_n_6\,
      Q => \^outputs\(13)
    );
\count_internal_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__1_n_5\,
      Q => \^outputs\(14)
    );
\count_internal_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__1_n_4\,
      Q => \^outputs\(15)
    );
\count_internal_reg[15]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[11]_i_1__1_n_0\,
      CO(3) => \NLW_count_internal_reg[15]_i_1__1_CO_UNCONNECTED\(3),
      CO(2) => \count_internal_reg[15]_i_1__1_n_1\,
      CO(1) => \count_internal_reg[15]_i_1__1_n_2\,
      CO(0) => \count_internal_reg[15]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[15]_i_1__1_n_4\,
      O(2) => \count_internal_reg[15]_i_1__1_n_5\,
      O(1) => \count_internal_reg[15]_i_1__1_n_6\,
      O(0) => \count_internal_reg[15]_i_1__1_n_7\,
      S(3 downto 0) => \^outputs\(15 downto 12)
    );
\count_internal_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__1_n_6\,
      Q => \^outputs\(1)
    );
\count_internal_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__1_n_5\,
      Q => \^outputs\(2)
    );
\count_internal_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__1_n_4\,
      Q => \^outputs\(3)
    );
\count_internal_reg[3]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_internal_reg[3]_i_1__1_n_0\,
      CO(2) => \count_internal_reg[3]_i_1__1_n_1\,
      CO(1) => \count_internal_reg[3]_i_1__1_n_2\,
      CO(0) => \count_internal_reg[3]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \count_internal_reg[3]_i_1__1_n_4\,
      O(2) => \count_internal_reg[3]_i_1__1_n_5\,
      O(1) => \count_internal_reg[3]_i_1__1_n_6\,
      O(0) => \count_internal_reg[3]_i_1__1_n_7\,
      S(3 downto 1) => \^outputs\(3 downto 1),
      S(0) => \count_internal[3]_i_2__1_n_0\
    );
\count_internal_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__1_n_7\,
      Q => \^outputs\(4)
    );
\count_internal_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__1_n_6\,
      Q => \^outputs\(5)
    );
\count_internal_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__1_n_5\,
      Q => \^outputs\(6)
    );
\count_internal_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__1_n_4\,
      Q => \^outputs\(7)
    );
\count_internal_reg[7]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[3]_i_1__1_n_0\,
      CO(3) => \count_internal_reg[7]_i_1__1_n_0\,
      CO(2) => \count_internal_reg[7]_i_1__1_n_1\,
      CO(1) => \count_internal_reg[7]_i_1__1_n_2\,
      CO(0) => \count_internal_reg[7]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[7]_i_1__1_n_4\,
      O(2) => \count_internal_reg[7]_i_1__1_n_5\,
      O(1) => \count_internal_reg[7]_i_1__1_n_6\,
      O(0) => \count_internal_reg[7]_i_1__1_n_7\,
      S(3 downto 0) => \^outputs\(7 downto 4)
    );
\count_internal_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__1_n_7\,
      Q => \^outputs\(8)
    );
\count_internal_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__1_n_6\,
      Q => \^outputs\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_counter_8 is
  port (
    outputs : out STD_LOGIC_VECTOR ( 15 downto 0 );
    output : in STD_LOGIC;
    \count_internal_reg[0]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_counter_8 : entity is "counter";
end puf_tero_array_0_1_counter_8;

architecture STRUCTURE of puf_tero_array_0_1_counter_8 is
  signal \count_internal[3]_i_2__2_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__2_n_1\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__2_n_2\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__2_n_3\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__2_n_4\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__2_n_5\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__2_n_6\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__2_n_7\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__2_n_1\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__2_n_2\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__2_n_3\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__2_n_4\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__2_n_5\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__2_n_6\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__2_n_7\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__2_n_1\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__2_n_2\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__2_n_3\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__2_n_4\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__2_n_5\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__2_n_6\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__2_n_7\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__2_n_1\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__2_n_2\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__2_n_3\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__2_n_4\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__2_n_5\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__2_n_6\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__2_n_7\ : STD_LOGIC;
  signal \^outputs\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_count_internal_reg[15]_i_1__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \count_internal_reg[11]_i_1__2\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[15]_i_1__2\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[3]_i_1__2\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[7]_i_1__2\ : label is 11;
begin
  outputs(15 downto 0) <= \^outputs\(15 downto 0);
\count_internal[3]_i_2__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^outputs\(0),
      O => \count_internal[3]_i_2__2_n_0\
    );
\count_internal_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__2_n_7\,
      Q => \^outputs\(0)
    );
\count_internal_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__2_n_5\,
      Q => \^outputs\(10)
    );
\count_internal_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__2_n_4\,
      Q => \^outputs\(11)
    );
\count_internal_reg[11]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[7]_i_1__2_n_0\,
      CO(3) => \count_internal_reg[11]_i_1__2_n_0\,
      CO(2) => \count_internal_reg[11]_i_1__2_n_1\,
      CO(1) => \count_internal_reg[11]_i_1__2_n_2\,
      CO(0) => \count_internal_reg[11]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[11]_i_1__2_n_4\,
      O(2) => \count_internal_reg[11]_i_1__2_n_5\,
      O(1) => \count_internal_reg[11]_i_1__2_n_6\,
      O(0) => \count_internal_reg[11]_i_1__2_n_7\,
      S(3 downto 0) => \^outputs\(11 downto 8)
    );
\count_internal_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__2_n_7\,
      Q => \^outputs\(12)
    );
\count_internal_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__2_n_6\,
      Q => \^outputs\(13)
    );
\count_internal_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__2_n_5\,
      Q => \^outputs\(14)
    );
\count_internal_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__2_n_4\,
      Q => \^outputs\(15)
    );
\count_internal_reg[15]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[11]_i_1__2_n_0\,
      CO(3) => \NLW_count_internal_reg[15]_i_1__2_CO_UNCONNECTED\(3),
      CO(2) => \count_internal_reg[15]_i_1__2_n_1\,
      CO(1) => \count_internal_reg[15]_i_1__2_n_2\,
      CO(0) => \count_internal_reg[15]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[15]_i_1__2_n_4\,
      O(2) => \count_internal_reg[15]_i_1__2_n_5\,
      O(1) => \count_internal_reg[15]_i_1__2_n_6\,
      O(0) => \count_internal_reg[15]_i_1__2_n_7\,
      S(3 downto 0) => \^outputs\(15 downto 12)
    );
\count_internal_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__2_n_6\,
      Q => \^outputs\(1)
    );
\count_internal_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__2_n_5\,
      Q => \^outputs\(2)
    );
\count_internal_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__2_n_4\,
      Q => \^outputs\(3)
    );
\count_internal_reg[3]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_internal_reg[3]_i_1__2_n_0\,
      CO(2) => \count_internal_reg[3]_i_1__2_n_1\,
      CO(1) => \count_internal_reg[3]_i_1__2_n_2\,
      CO(0) => \count_internal_reg[3]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \count_internal_reg[3]_i_1__2_n_4\,
      O(2) => \count_internal_reg[3]_i_1__2_n_5\,
      O(1) => \count_internal_reg[3]_i_1__2_n_6\,
      O(0) => \count_internal_reg[3]_i_1__2_n_7\,
      S(3 downto 1) => \^outputs\(3 downto 1),
      S(0) => \count_internal[3]_i_2__2_n_0\
    );
\count_internal_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__2_n_7\,
      Q => \^outputs\(4)
    );
\count_internal_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__2_n_6\,
      Q => \^outputs\(5)
    );
\count_internal_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__2_n_5\,
      Q => \^outputs\(6)
    );
\count_internal_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__2_n_4\,
      Q => \^outputs\(7)
    );
\count_internal_reg[7]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[3]_i_1__2_n_0\,
      CO(3) => \count_internal_reg[7]_i_1__2_n_0\,
      CO(2) => \count_internal_reg[7]_i_1__2_n_1\,
      CO(1) => \count_internal_reg[7]_i_1__2_n_2\,
      CO(0) => \count_internal_reg[7]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[7]_i_1__2_n_4\,
      O(2) => \count_internal_reg[7]_i_1__2_n_5\,
      O(1) => \count_internal_reg[7]_i_1__2_n_6\,
      O(0) => \count_internal_reg[7]_i_1__2_n_7\,
      S(3 downto 0) => \^outputs\(7 downto 4)
    );
\count_internal_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__2_n_7\,
      Q => \^outputs\(8)
    );
\count_internal_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__2_n_6\,
      Q => \^outputs\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_counter_9 is
  port (
    outputs : out STD_LOGIC_VECTOR ( 15 downto 0 );
    output : in STD_LOGIC;
    \count_internal_reg[0]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_counter_9 : entity is "counter";
end puf_tero_array_0_1_counter_9;

architecture STRUCTURE of puf_tero_array_0_1_counter_9 is
  signal \count_internal[3]_i_2__3_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__3_n_0\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__3_n_1\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__3_n_2\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__3_n_3\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__3_n_4\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__3_n_5\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__3_n_6\ : STD_LOGIC;
  signal \count_internal_reg[11]_i_1__3_n_7\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__3_n_1\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__3_n_2\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__3_n_3\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__3_n_4\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__3_n_5\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__3_n_6\ : STD_LOGIC;
  signal \count_internal_reg[15]_i_1__3_n_7\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__3_n_0\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__3_n_1\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__3_n_2\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__3_n_3\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__3_n_4\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__3_n_5\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__3_n_6\ : STD_LOGIC;
  signal \count_internal_reg[3]_i_1__3_n_7\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__3_n_0\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__3_n_1\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__3_n_2\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__3_n_3\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__3_n_4\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__3_n_5\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__3_n_6\ : STD_LOGIC;
  signal \count_internal_reg[7]_i_1__3_n_7\ : STD_LOGIC;
  signal \^outputs\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_count_internal_reg[15]_i_1__3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \count_internal_reg[11]_i_1__3\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[15]_i_1__3\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[3]_i_1__3\ : label is 11;
  attribute ADDER_THRESHOLD of \count_internal_reg[7]_i_1__3\ : label is 11;
begin
  outputs(15 downto 0) <= \^outputs\(15 downto 0);
\count_internal[3]_i_2__3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^outputs\(0),
      O => \count_internal[3]_i_2__3_n_0\
    );
\count_internal_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__3_n_7\,
      Q => \^outputs\(0)
    );
\count_internal_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__3_n_5\,
      Q => \^outputs\(10)
    );
\count_internal_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__3_n_4\,
      Q => \^outputs\(11)
    );
\count_internal_reg[11]_i_1__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[7]_i_1__3_n_0\,
      CO(3) => \count_internal_reg[11]_i_1__3_n_0\,
      CO(2) => \count_internal_reg[11]_i_1__3_n_1\,
      CO(1) => \count_internal_reg[11]_i_1__3_n_2\,
      CO(0) => \count_internal_reg[11]_i_1__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[11]_i_1__3_n_4\,
      O(2) => \count_internal_reg[11]_i_1__3_n_5\,
      O(1) => \count_internal_reg[11]_i_1__3_n_6\,
      O(0) => \count_internal_reg[11]_i_1__3_n_7\,
      S(3 downto 0) => \^outputs\(11 downto 8)
    );
\count_internal_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__3_n_7\,
      Q => \^outputs\(12)
    );
\count_internal_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__3_n_6\,
      Q => \^outputs\(13)
    );
\count_internal_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__3_n_5\,
      Q => \^outputs\(14)
    );
\count_internal_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[15]_i_1__3_n_4\,
      Q => \^outputs\(15)
    );
\count_internal_reg[15]_i_1__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[11]_i_1__3_n_0\,
      CO(3) => \NLW_count_internal_reg[15]_i_1__3_CO_UNCONNECTED\(3),
      CO(2) => \count_internal_reg[15]_i_1__3_n_1\,
      CO(1) => \count_internal_reg[15]_i_1__3_n_2\,
      CO(0) => \count_internal_reg[15]_i_1__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[15]_i_1__3_n_4\,
      O(2) => \count_internal_reg[15]_i_1__3_n_5\,
      O(1) => \count_internal_reg[15]_i_1__3_n_6\,
      O(0) => \count_internal_reg[15]_i_1__3_n_7\,
      S(3 downto 0) => \^outputs\(15 downto 12)
    );
\count_internal_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__3_n_6\,
      Q => \^outputs\(1)
    );
\count_internal_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__3_n_5\,
      Q => \^outputs\(2)
    );
\count_internal_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[3]_i_1__3_n_4\,
      Q => \^outputs\(3)
    );
\count_internal_reg[3]_i_1__3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_internal_reg[3]_i_1__3_n_0\,
      CO(2) => \count_internal_reg[3]_i_1__3_n_1\,
      CO(1) => \count_internal_reg[3]_i_1__3_n_2\,
      CO(0) => \count_internal_reg[3]_i_1__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \count_internal_reg[3]_i_1__3_n_4\,
      O(2) => \count_internal_reg[3]_i_1__3_n_5\,
      O(1) => \count_internal_reg[3]_i_1__3_n_6\,
      O(0) => \count_internal_reg[3]_i_1__3_n_7\,
      S(3 downto 1) => \^outputs\(3 downto 1),
      S(0) => \count_internal[3]_i_2__3_n_0\
    );
\count_internal_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__3_n_7\,
      Q => \^outputs\(4)
    );
\count_internal_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__3_n_6\,
      Q => \^outputs\(5)
    );
\count_internal_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__3_n_5\,
      Q => \^outputs\(6)
    );
\count_internal_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[7]_i_1__3_n_4\,
      Q => \^outputs\(7)
    );
\count_internal_reg[7]_i_1__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_internal_reg[3]_i_1__3_n_0\,
      CO(3) => \count_internal_reg[7]_i_1__3_n_0\,
      CO(2) => \count_internal_reg[7]_i_1__3_n_1\,
      CO(1) => \count_internal_reg[7]_i_1__3_n_2\,
      CO(0) => \count_internal_reg[7]_i_1__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_internal_reg[7]_i_1__3_n_4\,
      O(2) => \count_internal_reg[7]_i_1__3_n_5\,
      O(1) => \count_internal_reg[7]_i_1__3_n_6\,
      O(0) => \count_internal_reg[7]_i_1__3_n_7\,
      S(3 downto 0) => \^outputs\(7 downto 4)
    );
\count_internal_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__3_n_7\,
      Q => \^outputs\(8)
    );
\count_internal_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => output,
      CE => '1',
      CLR => \count_internal_reg[0]_0\,
      D => \count_internal_reg[11]_i_1__3_n_6\,
      Q => \^outputs\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_tero is
  port (
    enable : out STD_LOGIC;
    output : out STD_LOGIC;
    reset : in STD_LOGIC;
    u0_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_tero : entity is "tero";
end puf_tero_array_0_1_tero;

architecture STRUCTURE of puf_tero_array_0_1_tero is
  signal O : STD_LOGIC;
  signal \^enable\ : STD_LOGIC;
  signal \^output\ : STD_LOGIC;
  signal u1_n_0 : STD_LOGIC;
  signal u2_n_0 : STD_LOGIC;
  attribute BEL : string;
  attribute BEL of u0 : label is "A6LUT";
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of u0 : label is std.standard.true;
  attribute RLOC : string;
  attribute RLOC of u0 : label is "X0Y0";
  attribute box_type : string;
  attribute box_type of u0 : label is "PRIMITIVE";
  attribute BEL of u1 : label is "B6LUT";
  attribute DONT_TOUCH of u1 : label is std.standard.true;
  attribute RLOC of u1 : label is "X0Y0";
  attribute box_type of u1 : label is "PRIMITIVE";
  attribute BEL of u2 : label is "C6LUT";
  attribute DONT_TOUCH of u2 : label is std.standard.true;
  attribute RLOC of u2 : label is "X0Y0";
  attribute box_type of u2 : label is "PRIMITIVE";
  attribute BEL of u3 : label is "D6LUT";
  attribute DONT_TOUCH of u3 : label is std.standard.true;
  attribute RLOC of u3 : label is "X0Y0";
  attribute box_type of u3 : label is "PRIMITIVE";
begin
  enable <= \^enable\;
  output <= \^output\;
u0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^output\,
      I1 => \^enable\,
      O => O
    );
u0_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => reset,
      I1 => u0_0,
      O => \^enable\
    );
u1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => O,
      O => u1_n_0
    );
u2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => u1_n_0,
      I1 => \^enable\,
      O => u2_n_0
    );
u3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => u2_n_0,
      O => \^output\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_tero_15 is
  port (
    output : out STD_LOGIC;
    enable : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_tero_15 : entity is "tero";
end puf_tero_array_0_1_tero_15;

architecture STRUCTURE of puf_tero_array_0_1_tero_15 is
  signal O : STD_LOGIC;
  signal \^output\ : STD_LOGIC;
  signal u1_n_0 : STD_LOGIC;
  signal u2_n_0 : STD_LOGIC;
  attribute BEL : string;
  attribute BEL of u0 : label is "A6LUT";
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of u0 : label is std.standard.true;
  attribute RLOC : string;
  attribute RLOC of u0 : label is "X0Y0";
  attribute box_type : string;
  attribute box_type of u0 : label is "PRIMITIVE";
  attribute BEL of u1 : label is "B6LUT";
  attribute DONT_TOUCH of u1 : label is std.standard.true;
  attribute RLOC of u1 : label is "X0Y0";
  attribute box_type of u1 : label is "PRIMITIVE";
  attribute BEL of u2 : label is "C6LUT";
  attribute DONT_TOUCH of u2 : label is std.standard.true;
  attribute RLOC of u2 : label is "X0Y0";
  attribute box_type of u2 : label is "PRIMITIVE";
  attribute BEL of u3 : label is "D6LUT";
  attribute DONT_TOUCH of u3 : label is std.standard.true;
  attribute RLOC of u3 : label is "X0Y0";
  attribute box_type of u3 : label is "PRIMITIVE";
begin
  output <= \^output\;
u0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^output\,
      I1 => enable,
      O => O
    );
u1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => O,
      O => u1_n_0
    );
u2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => u1_n_0,
      I1 => enable,
      O => u2_n_0
    );
u3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => u2_n_0,
      O => \^output\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_tero_16 is
  port (
    output : out STD_LOGIC;
    enable : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_tero_16 : entity is "tero";
end puf_tero_array_0_1_tero_16;

architecture STRUCTURE of puf_tero_array_0_1_tero_16 is
  signal O : STD_LOGIC;
  signal \^output\ : STD_LOGIC;
  signal u1_n_0 : STD_LOGIC;
  signal u2_n_0 : STD_LOGIC;
  attribute BEL : string;
  attribute BEL of u0 : label is "A6LUT";
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of u0 : label is std.standard.true;
  attribute RLOC : string;
  attribute RLOC of u0 : label is "X0Y0";
  attribute box_type : string;
  attribute box_type of u0 : label is "PRIMITIVE";
  attribute BEL of u1 : label is "B6LUT";
  attribute DONT_TOUCH of u1 : label is std.standard.true;
  attribute RLOC of u1 : label is "X0Y0";
  attribute box_type of u1 : label is "PRIMITIVE";
  attribute BEL of u2 : label is "C6LUT";
  attribute DONT_TOUCH of u2 : label is std.standard.true;
  attribute RLOC of u2 : label is "X0Y0";
  attribute box_type of u2 : label is "PRIMITIVE";
  attribute BEL of u3 : label is "D6LUT";
  attribute DONT_TOUCH of u3 : label is std.standard.true;
  attribute RLOC of u3 : label is "X0Y0";
  attribute box_type of u3 : label is "PRIMITIVE";
begin
  output <= \^output\;
u0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^output\,
      I1 => enable,
      O => O
    );
u1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => O,
      O => u1_n_0
    );
u2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => u1_n_0,
      I1 => enable,
      O => u2_n_0
    );
u3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => u2_n_0,
      O => \^output\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_tero_17 is
  port (
    output : out STD_LOGIC;
    enable : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_tero_17 : entity is "tero";
end puf_tero_array_0_1_tero_17;

architecture STRUCTURE of puf_tero_array_0_1_tero_17 is
  signal O : STD_LOGIC;
  signal \^output\ : STD_LOGIC;
  signal u1_n_0 : STD_LOGIC;
  signal u2_n_0 : STD_LOGIC;
  attribute BEL : string;
  attribute BEL of u0 : label is "A6LUT";
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of u0 : label is std.standard.true;
  attribute RLOC : string;
  attribute RLOC of u0 : label is "X0Y0";
  attribute box_type : string;
  attribute box_type of u0 : label is "PRIMITIVE";
  attribute BEL of u1 : label is "B6LUT";
  attribute DONT_TOUCH of u1 : label is std.standard.true;
  attribute RLOC of u1 : label is "X0Y0";
  attribute box_type of u1 : label is "PRIMITIVE";
  attribute BEL of u2 : label is "C6LUT";
  attribute DONT_TOUCH of u2 : label is std.standard.true;
  attribute RLOC of u2 : label is "X0Y0";
  attribute box_type of u2 : label is "PRIMITIVE";
  attribute BEL of u3 : label is "D6LUT";
  attribute DONT_TOUCH of u3 : label is std.standard.true;
  attribute RLOC of u3 : label is "X0Y0";
  attribute box_type of u3 : label is "PRIMITIVE";
begin
  output <= \^output\;
u0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^output\,
      I1 => enable,
      O => O
    );
u1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => O,
      O => u1_n_0
    );
u2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => u1_n_0,
      I1 => enable,
      O => u2_n_0
    );
u3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => u2_n_0,
      O => \^output\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_tero_18 is
  port (
    output : out STD_LOGIC;
    enable : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_tero_18 : entity is "tero";
end puf_tero_array_0_1_tero_18;

architecture STRUCTURE of puf_tero_array_0_1_tero_18 is
  signal O : STD_LOGIC;
  signal \^output\ : STD_LOGIC;
  signal u1_n_0 : STD_LOGIC;
  signal u2_n_0 : STD_LOGIC;
  attribute BEL : string;
  attribute BEL of u0 : label is "A6LUT";
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of u0 : label is std.standard.true;
  attribute RLOC : string;
  attribute RLOC of u0 : label is "X0Y0";
  attribute box_type : string;
  attribute box_type of u0 : label is "PRIMITIVE";
  attribute BEL of u1 : label is "B6LUT";
  attribute DONT_TOUCH of u1 : label is std.standard.true;
  attribute RLOC of u1 : label is "X0Y0";
  attribute box_type of u1 : label is "PRIMITIVE";
  attribute BEL of u2 : label is "C6LUT";
  attribute DONT_TOUCH of u2 : label is std.standard.true;
  attribute RLOC of u2 : label is "X0Y0";
  attribute box_type of u2 : label is "PRIMITIVE";
  attribute BEL of u3 : label is "D6LUT";
  attribute DONT_TOUCH of u3 : label is std.standard.true;
  attribute RLOC of u3 : label is "X0Y0";
  attribute box_type of u3 : label is "PRIMITIVE";
begin
  output <= \^output\;
u0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^output\,
      I1 => enable,
      O => O
    );
u1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => O,
      O => u1_n_0
    );
u2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => u1_n_0,
      I1 => enable,
      O => u2_n_0
    );
u3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => u2_n_0,
      O => \^output\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_tero_19 is
  port (
    output : out STD_LOGIC;
    enable : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_tero_19 : entity is "tero";
end puf_tero_array_0_1_tero_19;

architecture STRUCTURE of puf_tero_array_0_1_tero_19 is
  signal O : STD_LOGIC;
  signal \^output\ : STD_LOGIC;
  signal u1_n_0 : STD_LOGIC;
  signal u2_n_0 : STD_LOGIC;
  attribute BEL : string;
  attribute BEL of u0 : label is "A6LUT";
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of u0 : label is std.standard.true;
  attribute RLOC : string;
  attribute RLOC of u0 : label is "X0Y0";
  attribute box_type : string;
  attribute box_type of u0 : label is "PRIMITIVE";
  attribute BEL of u1 : label is "B6LUT";
  attribute DONT_TOUCH of u1 : label is std.standard.true;
  attribute RLOC of u1 : label is "X0Y0";
  attribute box_type of u1 : label is "PRIMITIVE";
  attribute BEL of u2 : label is "C6LUT";
  attribute DONT_TOUCH of u2 : label is std.standard.true;
  attribute RLOC of u2 : label is "X0Y0";
  attribute box_type of u2 : label is "PRIMITIVE";
  attribute BEL of u3 : label is "D6LUT";
  attribute DONT_TOUCH of u3 : label is std.standard.true;
  attribute RLOC of u3 : label is "X0Y0";
  attribute box_type of u3 : label is "PRIMITIVE";
begin
  output <= \^output\;
u0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^output\,
      I1 => enable,
      O => O
    );
u1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => O,
      O => u1_n_0
    );
u2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => u1_n_0,
      I1 => enable,
      O => u2_n_0
    );
u3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => u2_n_0,
      O => \^output\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_tero_20 is
  port (
    output : out STD_LOGIC;
    enable : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_tero_20 : entity is "tero";
end puf_tero_array_0_1_tero_20;

architecture STRUCTURE of puf_tero_array_0_1_tero_20 is
  signal O : STD_LOGIC;
  signal \^output\ : STD_LOGIC;
  signal u1_n_0 : STD_LOGIC;
  signal u2_n_0 : STD_LOGIC;
  attribute BEL : string;
  attribute BEL of u0 : label is "A6LUT";
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of u0 : label is std.standard.true;
  attribute RLOC : string;
  attribute RLOC of u0 : label is "X0Y0";
  attribute box_type : string;
  attribute box_type of u0 : label is "PRIMITIVE";
  attribute BEL of u1 : label is "B6LUT";
  attribute DONT_TOUCH of u1 : label is std.standard.true;
  attribute RLOC of u1 : label is "X0Y0";
  attribute box_type of u1 : label is "PRIMITIVE";
  attribute BEL of u2 : label is "C6LUT";
  attribute DONT_TOUCH of u2 : label is std.standard.true;
  attribute RLOC of u2 : label is "X0Y0";
  attribute box_type of u2 : label is "PRIMITIVE";
  attribute BEL of u3 : label is "D6LUT";
  attribute DONT_TOUCH of u3 : label is std.standard.true;
  attribute RLOC of u3 : label is "X0Y0";
  attribute box_type of u3 : label is "PRIMITIVE";
begin
  output <= \^output\;
u0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^output\,
      I1 => enable,
      O => O
    );
u1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => O,
      O => u1_n_0
    );
u2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => u1_n_0,
      I1 => enable,
      O => u2_n_0
    );
u3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => u2_n_0,
      O => \^output\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_tero_21 is
  port (
    output : out STD_LOGIC;
    enable : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_tero_21 : entity is "tero";
end puf_tero_array_0_1_tero_21;

architecture STRUCTURE of puf_tero_array_0_1_tero_21 is
  signal O : STD_LOGIC;
  signal \^output\ : STD_LOGIC;
  signal u1_n_0 : STD_LOGIC;
  signal u2_n_0 : STD_LOGIC;
  attribute BEL : string;
  attribute BEL of u0 : label is "A6LUT";
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of u0 : label is std.standard.true;
  attribute RLOC : string;
  attribute RLOC of u0 : label is "X0Y0";
  attribute box_type : string;
  attribute box_type of u0 : label is "PRIMITIVE";
  attribute BEL of u1 : label is "B6LUT";
  attribute DONT_TOUCH of u1 : label is std.standard.true;
  attribute RLOC of u1 : label is "X0Y0";
  attribute box_type of u1 : label is "PRIMITIVE";
  attribute BEL of u2 : label is "C6LUT";
  attribute DONT_TOUCH of u2 : label is std.standard.true;
  attribute RLOC of u2 : label is "X0Y0";
  attribute box_type of u2 : label is "PRIMITIVE";
  attribute BEL of u3 : label is "D6LUT";
  attribute DONT_TOUCH of u3 : label is std.standard.true;
  attribute RLOC of u3 : label is "X0Y0";
  attribute box_type of u3 : label is "PRIMITIVE";
begin
  output <= \^output\;
u0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^output\,
      I1 => enable,
      O => O
    );
u1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => O,
      O => u1_n_0
    );
u2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => u1_n_0,
      I1 => enable,
      O => u2_n_0
    );
u3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => u2_n_0,
      O => \^output\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_tero_22 is
  port (
    output : out STD_LOGIC;
    enable : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_tero_22 : entity is "tero";
end puf_tero_array_0_1_tero_22;

architecture STRUCTURE of puf_tero_array_0_1_tero_22 is
  signal O : STD_LOGIC;
  signal \^output\ : STD_LOGIC;
  signal u1_n_0 : STD_LOGIC;
  signal u2_n_0 : STD_LOGIC;
  attribute BEL : string;
  attribute BEL of u0 : label is "A6LUT";
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of u0 : label is std.standard.true;
  attribute RLOC : string;
  attribute RLOC of u0 : label is "X0Y0";
  attribute box_type : string;
  attribute box_type of u0 : label is "PRIMITIVE";
  attribute BEL of u1 : label is "B6LUT";
  attribute DONT_TOUCH of u1 : label is std.standard.true;
  attribute RLOC of u1 : label is "X0Y0";
  attribute box_type of u1 : label is "PRIMITIVE";
  attribute BEL of u2 : label is "C6LUT";
  attribute DONT_TOUCH of u2 : label is std.standard.true;
  attribute RLOC of u2 : label is "X0Y0";
  attribute box_type of u2 : label is "PRIMITIVE";
  attribute BEL of u3 : label is "D6LUT";
  attribute DONT_TOUCH of u3 : label is std.standard.true;
  attribute RLOC of u3 : label is "X0Y0";
  attribute box_type of u3 : label is "PRIMITIVE";
begin
  output <= \^output\;
u0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^output\,
      I1 => enable,
      O => O
    );
u1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => O,
      O => u1_n_0
    );
u2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => u1_n_0,
      I1 => enable,
      O => u2_n_0
    );
u3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => u2_n_0,
      O => \^output\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_tero_23 is
  port (
    output : out STD_LOGIC;
    enable : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_tero_23 : entity is "tero";
end puf_tero_array_0_1_tero_23;

architecture STRUCTURE of puf_tero_array_0_1_tero_23 is
  signal O : STD_LOGIC;
  signal \^output\ : STD_LOGIC;
  signal u1_n_0 : STD_LOGIC;
  signal u2_n_0 : STD_LOGIC;
  attribute BEL : string;
  attribute BEL of u0 : label is "A6LUT";
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of u0 : label is std.standard.true;
  attribute RLOC : string;
  attribute RLOC of u0 : label is "X0Y0";
  attribute box_type : string;
  attribute box_type of u0 : label is "PRIMITIVE";
  attribute BEL of u1 : label is "B6LUT";
  attribute DONT_TOUCH of u1 : label is std.standard.true;
  attribute RLOC of u1 : label is "X0Y0";
  attribute box_type of u1 : label is "PRIMITIVE";
  attribute BEL of u2 : label is "C6LUT";
  attribute DONT_TOUCH of u2 : label is std.standard.true;
  attribute RLOC of u2 : label is "X0Y0";
  attribute box_type of u2 : label is "PRIMITIVE";
  attribute BEL of u3 : label is "D6LUT";
  attribute DONT_TOUCH of u3 : label is std.standard.true;
  attribute RLOC of u3 : label is "X0Y0";
  attribute box_type of u3 : label is "PRIMITIVE";
begin
  output <= \^output\;
u0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^output\,
      I1 => enable,
      O => O
    );
u1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => O,
      O => u1_n_0
    );
u2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => u1_n_0,
      I1 => enable,
      O => u2_n_0
    );
u3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => u2_n_0,
      O => \^output\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_tero_24 is
  port (
    output : out STD_LOGIC;
    enable : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_tero_24 : entity is "tero";
end puf_tero_array_0_1_tero_24;

architecture STRUCTURE of puf_tero_array_0_1_tero_24 is
  signal O : STD_LOGIC;
  signal \^output\ : STD_LOGIC;
  signal u1_n_0 : STD_LOGIC;
  signal u2_n_0 : STD_LOGIC;
  attribute BEL : string;
  attribute BEL of u0 : label is "A6LUT";
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of u0 : label is std.standard.true;
  attribute RLOC : string;
  attribute RLOC of u0 : label is "X0Y0";
  attribute box_type : string;
  attribute box_type of u0 : label is "PRIMITIVE";
  attribute BEL of u1 : label is "B6LUT";
  attribute DONT_TOUCH of u1 : label is std.standard.true;
  attribute RLOC of u1 : label is "X0Y0";
  attribute box_type of u1 : label is "PRIMITIVE";
  attribute BEL of u2 : label is "C6LUT";
  attribute DONT_TOUCH of u2 : label is std.standard.true;
  attribute RLOC of u2 : label is "X0Y0";
  attribute box_type of u2 : label is "PRIMITIVE";
  attribute BEL of u3 : label is "D6LUT";
  attribute DONT_TOUCH of u3 : label is std.standard.true;
  attribute RLOC of u3 : label is "X0Y0";
  attribute box_type of u3 : label is "PRIMITIVE";
begin
  output <= \^output\;
u0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^output\,
      I1 => enable,
      O => O
    );
u1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => O,
      O => u1_n_0
    );
u2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => u1_n_0,
      I1 => enable,
      O => u2_n_0
    );
u3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => u2_n_0,
      O => \^output\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_tero_25 is
  port (
    output : out STD_LOGIC;
    enable : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_tero_25 : entity is "tero";
end puf_tero_array_0_1_tero_25;

architecture STRUCTURE of puf_tero_array_0_1_tero_25 is
  signal O : STD_LOGIC;
  signal \^output\ : STD_LOGIC;
  signal u1_n_0 : STD_LOGIC;
  signal u2_n_0 : STD_LOGIC;
  attribute BEL : string;
  attribute BEL of u0 : label is "A6LUT";
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of u0 : label is std.standard.true;
  attribute RLOC : string;
  attribute RLOC of u0 : label is "X0Y0";
  attribute box_type : string;
  attribute box_type of u0 : label is "PRIMITIVE";
  attribute BEL of u1 : label is "B6LUT";
  attribute DONT_TOUCH of u1 : label is std.standard.true;
  attribute RLOC of u1 : label is "X0Y0";
  attribute box_type of u1 : label is "PRIMITIVE";
  attribute BEL of u2 : label is "C6LUT";
  attribute DONT_TOUCH of u2 : label is std.standard.true;
  attribute RLOC of u2 : label is "X0Y0";
  attribute box_type of u2 : label is "PRIMITIVE";
  attribute BEL of u3 : label is "D6LUT";
  attribute DONT_TOUCH of u3 : label is std.standard.true;
  attribute RLOC of u3 : label is "X0Y0";
  attribute box_type of u3 : label is "PRIMITIVE";
begin
  output <= \^output\;
u0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^output\,
      I1 => enable,
      O => O
    );
u1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => O,
      O => u1_n_0
    );
u2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => u1_n_0,
      I1 => enable,
      O => u2_n_0
    );
u3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => u2_n_0,
      O => \^output\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_tero_26 is
  port (
    output : out STD_LOGIC;
    enable : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_tero_26 : entity is "tero";
end puf_tero_array_0_1_tero_26;

architecture STRUCTURE of puf_tero_array_0_1_tero_26 is
  signal O : STD_LOGIC;
  signal \^output\ : STD_LOGIC;
  signal u1_n_0 : STD_LOGIC;
  signal u2_n_0 : STD_LOGIC;
  attribute BEL : string;
  attribute BEL of u0 : label is "A6LUT";
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of u0 : label is std.standard.true;
  attribute RLOC : string;
  attribute RLOC of u0 : label is "X0Y0";
  attribute box_type : string;
  attribute box_type of u0 : label is "PRIMITIVE";
  attribute BEL of u1 : label is "B6LUT";
  attribute DONT_TOUCH of u1 : label is std.standard.true;
  attribute RLOC of u1 : label is "X0Y0";
  attribute box_type of u1 : label is "PRIMITIVE";
  attribute BEL of u2 : label is "C6LUT";
  attribute DONT_TOUCH of u2 : label is std.standard.true;
  attribute RLOC of u2 : label is "X0Y0";
  attribute box_type of u2 : label is "PRIMITIVE";
  attribute BEL of u3 : label is "D6LUT";
  attribute DONT_TOUCH of u3 : label is std.standard.true;
  attribute RLOC of u3 : label is "X0Y0";
  attribute box_type of u3 : label is "PRIMITIVE";
begin
  output <= \^output\;
u0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^output\,
      I1 => enable,
      O => O
    );
u1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => O,
      O => u1_n_0
    );
u2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => u1_n_0,
      I1 => enable,
      O => u2_n_0
    );
u3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => u2_n_0,
      O => \^output\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_tero_27 is
  port (
    output : out STD_LOGIC;
    enable : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_tero_27 : entity is "tero";
end puf_tero_array_0_1_tero_27;

architecture STRUCTURE of puf_tero_array_0_1_tero_27 is
  signal O : STD_LOGIC;
  signal \^output\ : STD_LOGIC;
  signal u1_n_0 : STD_LOGIC;
  signal u2_n_0 : STD_LOGIC;
  attribute BEL : string;
  attribute BEL of u0 : label is "A6LUT";
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of u0 : label is std.standard.true;
  attribute RLOC : string;
  attribute RLOC of u0 : label is "X0Y0";
  attribute box_type : string;
  attribute box_type of u0 : label is "PRIMITIVE";
  attribute BEL of u1 : label is "B6LUT";
  attribute DONT_TOUCH of u1 : label is std.standard.true;
  attribute RLOC of u1 : label is "X0Y0";
  attribute box_type of u1 : label is "PRIMITIVE";
  attribute BEL of u2 : label is "C6LUT";
  attribute DONT_TOUCH of u2 : label is std.standard.true;
  attribute RLOC of u2 : label is "X0Y0";
  attribute box_type of u2 : label is "PRIMITIVE";
  attribute BEL of u3 : label is "D6LUT";
  attribute DONT_TOUCH of u3 : label is std.standard.true;
  attribute RLOC of u3 : label is "X0Y0";
  attribute box_type of u3 : label is "PRIMITIVE";
begin
  output <= \^output\;
u0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^output\,
      I1 => enable,
      O => O
    );
u1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => O,
      O => u1_n_0
    );
u2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => u1_n_0,
      I1 => enable,
      O => u2_n_0
    );
u3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => u2_n_0,
      O => \^output\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_tero_28 is
  port (
    output : out STD_LOGIC;
    enable : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_tero_28 : entity is "tero";
end puf_tero_array_0_1_tero_28;

architecture STRUCTURE of puf_tero_array_0_1_tero_28 is
  signal O : STD_LOGIC;
  signal \^output\ : STD_LOGIC;
  signal u1_n_0 : STD_LOGIC;
  signal u2_n_0 : STD_LOGIC;
  attribute BEL : string;
  attribute BEL of u0 : label is "A6LUT";
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of u0 : label is std.standard.true;
  attribute RLOC : string;
  attribute RLOC of u0 : label is "X0Y0";
  attribute box_type : string;
  attribute box_type of u0 : label is "PRIMITIVE";
  attribute BEL of u1 : label is "B6LUT";
  attribute DONT_TOUCH of u1 : label is std.standard.true;
  attribute RLOC of u1 : label is "X0Y0";
  attribute box_type of u1 : label is "PRIMITIVE";
  attribute BEL of u2 : label is "C6LUT";
  attribute DONT_TOUCH of u2 : label is std.standard.true;
  attribute RLOC of u2 : label is "X0Y0";
  attribute box_type of u2 : label is "PRIMITIVE";
  attribute BEL of u3 : label is "D6LUT";
  attribute DONT_TOUCH of u3 : label is std.standard.true;
  attribute RLOC of u3 : label is "X0Y0";
  attribute box_type of u3 : label is "PRIMITIVE";
begin
  output <= \^output\;
u0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^output\,
      I1 => enable,
      O => O
    );
u1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => O,
      O => u1_n_0
    );
u2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => u1_n_0,
      I1 => enable,
      O => u2_n_0
    );
u3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => u2_n_0,
      O => \^output\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_tero_29 is
  port (
    output : out STD_LOGIC;
    enable : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_tero_29 : entity is "tero";
end puf_tero_array_0_1_tero_29;

architecture STRUCTURE of puf_tero_array_0_1_tero_29 is
  signal O : STD_LOGIC;
  signal \^output\ : STD_LOGIC;
  signal u1_n_0 : STD_LOGIC;
  signal u2_n_0 : STD_LOGIC;
  attribute BEL : string;
  attribute BEL of u0 : label is "A6LUT";
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of u0 : label is std.standard.true;
  attribute RLOC : string;
  attribute RLOC of u0 : label is "X0Y0";
  attribute box_type : string;
  attribute box_type of u0 : label is "PRIMITIVE";
  attribute BEL of u1 : label is "B6LUT";
  attribute DONT_TOUCH of u1 : label is std.standard.true;
  attribute RLOC of u1 : label is "X0Y0";
  attribute box_type of u1 : label is "PRIMITIVE";
  attribute BEL of u2 : label is "C6LUT";
  attribute DONT_TOUCH of u2 : label is std.standard.true;
  attribute RLOC of u2 : label is "X0Y0";
  attribute box_type of u2 : label is "PRIMITIVE";
  attribute BEL of u3 : label is "D6LUT";
  attribute DONT_TOUCH of u3 : label is std.standard.true;
  attribute RLOC of u3 : label is "X0Y0";
  attribute box_type of u3 : label is "PRIMITIVE";
begin
  output <= \^output\;
u0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^output\,
      I1 => enable,
      O => O
    );
u1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => O,
      O => u1_n_0
    );
u2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => u1_n_0,
      I1 => enable,
      O => u2_n_0
    );
u3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => u2_n_0,
      O => \^output\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1_tero_array is
  port (
    outputs : out STD_LOGIC_VECTOR ( 255 downto 0 );
    enable : in STD_LOGIC;
    reset : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of puf_tero_array_0_1_tero_array : entity is "tero_array";
end puf_tero_array_0_1_tero_array;

architecture STRUCTURE of puf_tero_array_0_1_tero_array is
  signal enables : STD_LOGIC_VECTOR ( 15 to 15 );
  signal \gen_counter[15].c_n_16\ : STD_LOGIC;
  signal tero_to_counter_0 : STD_LOGIC;
  signal tero_to_counter_1 : STD_LOGIC;
  signal tero_to_counter_10 : STD_LOGIC;
  signal tero_to_counter_11 : STD_LOGIC;
  signal tero_to_counter_12 : STD_LOGIC;
  signal tero_to_counter_13 : STD_LOGIC;
  signal tero_to_counter_14 : STD_LOGIC;
  signal tero_to_counter_15 : STD_LOGIC;
  signal tero_to_counter_2 : STD_LOGIC;
  signal tero_to_counter_3 : STD_LOGIC;
  signal tero_to_counter_4 : STD_LOGIC;
  signal tero_to_counter_5 : STD_LOGIC;
  signal tero_to_counter_6 : STD_LOGIC;
  signal tero_to_counter_7 : STD_LOGIC;
  signal tero_to_counter_8 : STD_LOGIC;
  signal tero_to_counter_9 : STD_LOGIC;
begin
\gen_counter[0].c\: entity work.puf_tero_array_0_1_counter
     port map (
      \count_internal_reg[0]_0\ => \gen_counter[15].c_n_16\,
      output => tero_to_counter_0,
      outputs(15 downto 0) => outputs(15 downto 0)
    );
\gen_counter[10].c\: entity work.puf_tero_array_0_1_counter_0
     port map (
      \count_internal_reg[0]_0\ => \gen_counter[15].c_n_16\,
      output => tero_to_counter_10,
      outputs(15 downto 0) => outputs(175 downto 160)
    );
\gen_counter[11].c\: entity work.puf_tero_array_0_1_counter_1
     port map (
      \count_internal_reg[0]_0\ => \gen_counter[15].c_n_16\,
      output => tero_to_counter_11,
      outputs(15 downto 0) => outputs(191 downto 176)
    );
\gen_counter[12].c\: entity work.puf_tero_array_0_1_counter_2
     port map (
      \count_internal_reg[0]_0\ => \gen_counter[15].c_n_16\,
      output => tero_to_counter_12,
      outputs(15 downto 0) => outputs(207 downto 192)
    );
\gen_counter[13].c\: entity work.puf_tero_array_0_1_counter_3
     port map (
      \count_internal_reg[0]_0\ => \gen_counter[15].c_n_16\,
      output => tero_to_counter_13,
      outputs(15 downto 0) => outputs(223 downto 208)
    );
\gen_counter[14].c\: entity work.puf_tero_array_0_1_counter_4
     port map (
      \count_internal_reg[0]_0\ => \gen_counter[15].c_n_16\,
      output => tero_to_counter_14,
      outputs(15 downto 0) => outputs(239 downto 224)
    );
\gen_counter[15].c\: entity work.puf_tero_array_0_1_counter_5
     port map (
      enable => enable,
      enable_0 => \gen_counter[15].c_n_16\,
      output => tero_to_counter_15,
      outputs(15 downto 0) => outputs(255 downto 240),
      reset => reset
    );
\gen_counter[1].c\: entity work.puf_tero_array_0_1_counter_6
     port map (
      \count_internal_reg[0]_0\ => \gen_counter[15].c_n_16\,
      output => tero_to_counter_1,
      outputs(15 downto 0) => outputs(31 downto 16)
    );
\gen_counter[2].c\: entity work.puf_tero_array_0_1_counter_7
     port map (
      \count_internal_reg[0]_0\ => \gen_counter[15].c_n_16\,
      output => tero_to_counter_2,
      outputs(15 downto 0) => outputs(47 downto 32)
    );
\gen_counter[3].c\: entity work.puf_tero_array_0_1_counter_8
     port map (
      \count_internal_reg[0]_0\ => \gen_counter[15].c_n_16\,
      output => tero_to_counter_3,
      outputs(15 downto 0) => outputs(63 downto 48)
    );
\gen_counter[4].c\: entity work.puf_tero_array_0_1_counter_9
     port map (
      \count_internal_reg[0]_0\ => \gen_counter[15].c_n_16\,
      output => tero_to_counter_4,
      outputs(15 downto 0) => outputs(79 downto 64)
    );
\gen_counter[5].c\: entity work.puf_tero_array_0_1_counter_10
     port map (
      \count_internal_reg[0]_0\ => \gen_counter[15].c_n_16\,
      output => tero_to_counter_5,
      outputs(15 downto 0) => outputs(95 downto 80)
    );
\gen_counter[6].c\: entity work.puf_tero_array_0_1_counter_11
     port map (
      \count_internal_reg[0]_0\ => \gen_counter[15].c_n_16\,
      output => tero_to_counter_6,
      outputs(15 downto 0) => outputs(111 downto 96)
    );
\gen_counter[7].c\: entity work.puf_tero_array_0_1_counter_12
     port map (
      \count_internal_reg[0]_0\ => \gen_counter[15].c_n_16\,
      output => tero_to_counter_7,
      outputs(15 downto 0) => outputs(127 downto 112)
    );
\gen_counter[8].c\: entity work.puf_tero_array_0_1_counter_13
     port map (
      \count_internal_reg[0]_0\ => \gen_counter[15].c_n_16\,
      output => tero_to_counter_8,
      outputs(15 downto 0) => outputs(143 downto 128)
    );
\gen_counter[9].c\: entity work.puf_tero_array_0_1_counter_14
     port map (
      \count_internal_reg[0]_0\ => \gen_counter[15].c_n_16\,
      output => tero_to_counter_9,
      outputs(15 downto 0) => outputs(159 downto 144)
    );
\gen_tero[0].r\: entity work.puf_tero_array_0_1_tero
     port map (
      enable => enables(15),
      output => tero_to_counter_0,
      reset => reset,
      u0_0 => enable
    );
\gen_tero[10].r\: entity work.puf_tero_array_0_1_tero_15
     port map (
      enable => enables(15),
      output => tero_to_counter_10
    );
\gen_tero[11].r\: entity work.puf_tero_array_0_1_tero_16
     port map (
      enable => enables(15),
      output => tero_to_counter_11
    );
\gen_tero[12].r\: entity work.puf_tero_array_0_1_tero_17
     port map (
      enable => enables(15),
      output => tero_to_counter_12
    );
\gen_tero[13].r\: entity work.puf_tero_array_0_1_tero_18
     port map (
      enable => enables(15),
      output => tero_to_counter_13
    );
\gen_tero[14].r\: entity work.puf_tero_array_0_1_tero_19
     port map (
      enable => enables(15),
      output => tero_to_counter_14
    );
\gen_tero[15].r\: entity work.puf_tero_array_0_1_tero_20
     port map (
      enable => enables(15),
      output => tero_to_counter_15
    );
\gen_tero[1].r\: entity work.puf_tero_array_0_1_tero_21
     port map (
      enable => enables(15),
      output => tero_to_counter_1
    );
\gen_tero[2].r\: entity work.puf_tero_array_0_1_tero_22
     port map (
      enable => enables(15),
      output => tero_to_counter_2
    );
\gen_tero[3].r\: entity work.puf_tero_array_0_1_tero_23
     port map (
      enable => enables(15),
      output => tero_to_counter_3
    );
\gen_tero[4].r\: entity work.puf_tero_array_0_1_tero_24
     port map (
      enable => enables(15),
      output => tero_to_counter_4
    );
\gen_tero[5].r\: entity work.puf_tero_array_0_1_tero_25
     port map (
      enable => enables(15),
      output => tero_to_counter_5
    );
\gen_tero[6].r\: entity work.puf_tero_array_0_1_tero_26
     port map (
      enable => enables(15),
      output => tero_to_counter_6
    );
\gen_tero[7].r\: entity work.puf_tero_array_0_1_tero_27
     port map (
      enable => enables(15),
      output => tero_to_counter_7
    );
\gen_tero[8].r\: entity work.puf_tero_array_0_1_tero_28
     port map (
      enable => enables(15),
      output => tero_to_counter_8
    );
\gen_tero[9].r\: entity work.puf_tero_array_0_1_tero_29
     port map (
      enable => enables(15),
      output => tero_to_counter_9
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity puf_tero_array_0_1 is
  port (
    clock : in STD_LOGIC;
    reset : in STD_LOGIC;
    enable : in STD_LOGIC;
    outputs : out STD_LOGIC_VECTOR ( 255 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of puf_tero_array_0_1 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of puf_tero_array_0_1 : entity is "puf_tero_array_0_1,tero_array,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of puf_tero_array_0_1 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of puf_tero_array_0_1 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of puf_tero_array_0_1 : entity is "tero_array,Vivado 2022.2";
end puf_tero_array_0_1;

architecture STRUCTURE of puf_tero_array_0_1 is
  attribute x_interface_info : string;
  attribute x_interface_info of clock : signal is "xilinx.com:signal:clock:1.0 clock CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clock : signal is "XIL_INTERFACENAME clock, ASSOCIATED_RESET reset, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, INSERT_VIP 0";
  attribute x_interface_info of reset : signal is "xilinx.com:signal:reset:1.0 reset RST";
  attribute x_interface_parameter of reset : signal is "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
U0: entity work.puf_tero_array_0_1_tero_array
     port map (
      enable => enable,
      outputs(255 downto 0) => outputs(255 downto 0),
      reset => reset
    );
end STRUCTURE;
