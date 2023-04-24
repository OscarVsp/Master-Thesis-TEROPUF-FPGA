library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE WORK.const.ALL;


entity decoder_block is
Port (
    pufbit_out, pufbit_valid, clock, reset, decode_reset : in STD_LOGIC;
	syndrome_in : in std_logic_vector(nk - 1 downto 0);
	decoder_valid, decoder_out: OUT BIT
 );
end decoder_block;

architecture STRUCTURE of decoder_block is


signal clock_bit, reset_bit : bit;

COMPONENT sink IS
Port (
	pufbit_out : in STD_LOGIC;
	pufbit_valid : in STD_LOGIC;
	clock : in STD_LOGIC;
	reset : in STD_LOGIC;
	decode_reset : in std_logic;
	syndrome_in : in std_logic_vector(nk - 1 downto 0);
	decode_input : out bit);
end COMPONENT;

signal decoder_in : bit;

COMPONENT dec IS
PORT (
    clk, reset, din: IN BIT;
	vdout, dout: OUT BIT);
END component;

begin

s: sink PORT MAP(
    pufbit_out => pufbit_out,
    pufbit_valid => pufbit_valid,
    clock => clock,
    reset => reset,
    decode_reset => decode_reset,
    syndrome_in => syndrome_in,
    decode_input => decoder_in
);

d: dec PORT MAP(
    clk => clock_bit,
    reset => reset_bit,
    din => decoder_in,
    vdout => decoder_valid,
    dout => decoder_out
);

process (clock) begin
    clock_bit <= to_bit(clock);
end process;

process (reset) begin
    reset_bit <= to_bit(reset);
end process;


end STRUCTURE;
