library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity debug_leds_sink is
    Port ( enable_counting : in STD_LOGIC;
           pufbit_valid : in STD_LOGIC;
           decoder_valid : in STD_LOGIC;
           sha256_valid : in STD_LOGIC;
           sha256_start : in STD_LOGIC;
           decoder_reset : in STD_LOGIC;
           sha256_reset : in STD_LOGIC;
           write_finished : in STD_LOGIC;
           read_finished : in STD_LOGIC;
           write_out : in STD_LOGIC;
           clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           gen_state : in std_logic_vector (1 downto 0);
           output_word : out STD_LOGIC_VECTOR(16 - 1 downto 0)
    );
end debug_leds_sink;

architecture STRUCTURE of debug_leds_sink is

begin

output_word(0) <= enable_counting;
output_word(1) <= pufbit_valid;
output_word(2) <= decoder_valid;
output_word(3) <= sha256_valid;
output_word(4) <= sha256_start;
output_word(5) <= decoder_reset;
output_word(6) <= sha256_reset;
output_word(7) <= write_finished;
output_word(8) <= read_finished;
output_word(9) <= write_out;
output_word(10) <= clock;
output_word(11) <= reset;
output_word(12) <= gen_state(1);
output_word(13) <= gen_state(0);
output_word(14) <= '1';
output_word(15) <= '1';

end STRUCTURE;
