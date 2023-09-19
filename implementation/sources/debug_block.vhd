LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.const.ALL;

--Used for debug only

ENTITY debug_block IS
    PORT (
        enable_counting, pufbit_valid, decoder_valid, sha256_valid, sha256_start, decoder_reset, sha256_reset : IN STD_LOGIC;
        clock, reset, debuging_sw, write_finished, read_finished, write_out : IN STD_LOGIC;
        gen_state : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        ref_counter_limit : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        debuging_output : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END debug_block;

ARCHITECTURE STRUCTURE OF debug_block IS

COMPONENT dual_word_mux IS

GENERIC (word_size : INTEGER := 16);
PORT (
    input_word_A : IN STD_LOGIC_VECTOR(word_size - 1 DOWNTO 0);
    input_word_B : IN STD_LOGIC_VECTOR(word_size - 1 DOWNTO 0);
    output_word : OUT STD_LOGIC_VECTOR(word_size - 1 DOWNTO 0);
    selection : IN STD_LOGIC
);
END COMPONENT dual_word_mux;

SIGNAL debug_array : STD_LOGIC_VECTOR(15 DOWNTO 0)

BEGIN

    debug_array(0) <= enable_counting;
    debug_array(1) <= pufbit_valid;
    debug_array(2) <= decoder_valid;
    debug_array(3) <= sha256_valid;
    debug_array(4) <= sha256_start;
    debug_array(5) <= decoder_reset;
    debug_array(6) <= sha256_reset;
    debug_array(7) <= write_finished;
    debug_array(8) <= read_finished;
    debug_array(9) <= write_out;
    debug_array(10) <= clock;
    debug_array(11) <= reset;
    debug_array(12) <= gen_state(1);
    debug_array(13) <= gen_state(0);
    debug_array(14) <= '1';
    debug_array(15) <= '1';

    word_mux : COMPONENT dual_word_mux
        GENERIC MAP (word_size => 16)
        PORT MAP(
            input_word_A => debug_array,
            input_word_B => ref_counter_limit,
            selection => debuging_sw, 
            output_word => debuging_output
        )

END STRUCTURE;