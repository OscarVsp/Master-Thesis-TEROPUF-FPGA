LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY sha256_block IS
  PORT (
    clock, reset, decoder_out, decoder_valid, start : IN STD_LOGIC;
    sha256_out : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
    sha256_valid : OUT STD_LOGIC;
  );
END sha256_block;

ARCHITECTURE STRUCTURE OF sha256_block IS

  SIGNAL padded_block : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL empty : STD_LOGIC;

  COMPONENT sha256_pad
    PORT (
      dec_out, dec_valid, reset, clock: IN STD_LOGIC;
      padded_block : OUT STD_LOGIC_VECTOR(511 DOWNTO 0))
    ;
  END COMPONENT;

  COMPONENT sha256
    PORT (
      reset, clock, load : IN STD_LOGIC;
      clock : IN STD_LOGIC;
      plain : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
      empty, ready : OUT STD_LOGIC;
      digest : OUT STD_LOGIC_VECTOR (255 DOWNTO 0);
    );
  END COMPONENT;
BEGIN

  pad : sha256_pad PORT MAP(
    reset => reset,
    clock => clock,
    dec_out => decoder_out,
    padded_block => padded_block,
    dec_valid => decoder_valid
  );

  sha : sha256 PORT MAP(
    reset => reset,
    clock => clock,
    plain => padded_block,
    load => start,
    digest => sha256_out,
    ready => sha256_valid,
    empty => empty
  );
END STRUCTURE;