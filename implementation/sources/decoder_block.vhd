LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.const.ALL;

ENTITY decoder_block IS
    PORT (
        pufbit_out, pufbit_valid, clock, reset, decoder_reset : IN STD_LOGIC;
        syndrome_in : IN STD_LOGIC_VECTOR(nk - 1 DOWNTO 0);
        decoder_valid, decoder_out : OUT STD_LOGIC
    );
END decoder_block;

ARCHITECTURE STRUCTURE OF decoder_block IS

    COMPONENT sink IS
        PORT (
            clock, reset, decoder_reset, pufbit_out, pufbit_valid : IN STD_LOGIC;
            syndrome_in : IN STD_LOGIC_VECTOR(nk - 1 DOWNTO 0);
            decode_input : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL decoder_in : STD_LOGIC;

    COMPONENT dec IS
        PORT (
            clk, reset, din : IN STD_LOGIC;
            vdout, dout : OUT STD_LOGIC);
    END COMPONENT;

BEGIN

    s : COMPONENT sink PORT MAP(
        pufbit_out => pufbit_out,
        pufbit_valid => pufbit_valid,
        clock => clock,
        reset => reset,
        decoder_reset => decoder_reset,
        syndrome_in => syndrome_in,
        decode_input => decoder_in
    );

    d : COMPONENT dec PORT MAP(
        clk => clock,
        reset => reset,
        din => decoder_in,
        vdout => decoder_valid,
        dout => decoder_out
    );
END STRUCTURE;