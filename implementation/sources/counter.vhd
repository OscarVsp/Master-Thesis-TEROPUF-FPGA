LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY counter IS
    GENERIC (size : INTEGER := 16);
    PORT (
        clk : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        count : OUT STD_LOGIC_VECTOR(size - 1 DOWNTO 0)
    );
END counter;

ARCHITECTURE Behavioral OF counter IS

    SIGNAL count_internal : STD_LOGIC_VECTOR(size - 1 DOWNTO 0);

BEGIN

    count <= count_internal;

    PROCESS (clk, enable)
    BEGIN
        IF enable = '0' THEN
            count_internal <= (OTHERS => '0');
        ELSIF rising_edge(clk) THEN
            count_internal <= count_internal + 1;
        END IF;
    END PROCESS;

END Behavioral;