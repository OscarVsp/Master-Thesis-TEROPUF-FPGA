LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY muxer IS
    GENERIC (select_size : INTEGER := 5);
    PORT (
        inputs : IN STD_LOGIC_VECTOR(2 ** select_size - 1 DOWNTO 0);
        sel_output : OUT STD_LOGIC;
        selection : IN STD_LOGIC_VECTOR(select_size - 1 DOWNTO 0)
    );
END muxer;

ARCHITECTURE Behavioral OF muxer IS

BEGIN

    sel_output <= inputs(to_integer(unsigned(selection)));

END Behavioral;