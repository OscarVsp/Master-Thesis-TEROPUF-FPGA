library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity word_muxer is
    generic (word_size : integer := 16);
    Port ( input_word_0 : in STD_LOGIC_VECTOR(word_size - 1 downto 0);
           input_word_1 : in STD_LOGIC_VECTOR(word_size - 1 downto 0);
           output_word : out STD_LOGIC_VECTOR(word_size - 1 downto 0);
           selection : in STD_LOGIC
    );
end word_muxer;

architecture Behavioral of word_muxer is

begin

process (selection) begin
    if selection = '0' then
        output_word <= input_word_0;
    else
        output_word <= input_word_1;
    end if;
end process;
end Behavioral;
