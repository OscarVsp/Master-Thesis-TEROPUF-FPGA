LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

--Used for Debuging only

ENTITY dual_word_mux IS
    GENERIC (word_size : INTEGER := 16);
    PORT (
        input_word_A : IN STD_LOGIC_VECTOR(word_size - 1 DOWNTO 0);
        input_word_B : IN STD_LOGIC_VECTOR(word_size - 1 DOWNTO 0);
        output_word : OUT STD_LOGIC_VECTOR(word_size - 1 DOWNTO 0);
        selection : IN STD_LOGIC
    );
END dual_word_mux;

ARCHITECTURE Behavioral OF dual_word_mux IS

BEGIN

    PROCESS (selection) BEGIN
        IF selection = '0' THEN
            output_word <= input_word_A;
        ELSE
            output_word <= input_word_B;
        END IF;
    END PROCESS;
END Behavioral;