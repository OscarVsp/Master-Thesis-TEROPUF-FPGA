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
           output_word : out STD_LOGIC_VECTOR(16 - 1 downto 0)
    );
end debug_leds_sink;

architecture STRUCTURE of debug_leds_sink is

begin

output_word <= enable_counting & pufbit_valid & decoder_valid & sha256_valid & sha256_start & decoder_reset & sha256_reset & write_finished & read_finished & write_out & clock & reset & "0000";

end STRUCTURE;
