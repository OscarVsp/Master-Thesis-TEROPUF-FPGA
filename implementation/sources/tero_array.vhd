LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY tero_array IS
	GENERIC (select_size : INTEGER := 5);
	PORT (
		clock : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		enable : IN STD_LOGIC;
		outputs : OUT STD_LOGIC_VECTOR (2 ** select_size - 1 DOWNTO 0);
		selection : IN STD_LOGIC_VECTOR (select_size - 1 DOWNTO 0)
	);
END tero_array;
ARCHITECTURE Behavioral OF tero_array IS

	COMPONENT tero_4 IS -- tero_4 or tero_8
		PORT (
			enable : IN STD_LOGIC;
			output : OUT STD_LOGIC
		);
	END COMPONENT tero_4;

	SIGNAL enables : STD_LOGIC_VECTOR (2 ** select_size - 1 DOWNTO 0) := (OTHERS => '0');

BEGIN

	PROCESS (clock, reset) BEGIN
		IF reset = '0' THEN
			enables <= (OTHERS => '0');
		ELSIF rising_edge(clock) THEN
			IF enable = '1' THEN
				enables(to_integer(unsigned(selection))) <= '1'; --enable only the selected cell
			ELSE
				enables <= (OTHERS => '0');
			END IF;
		END IF;
	END PROCESS;

	gen_tero : FOR i IN 0 TO 2 ** select_size - 1 GENERATE
		r : tero_4 PORT MAP(-- tero_4 or tero_8
			enable => enables(i),
			output => outputs(i)
		);
	END GENERATE;

END Behavioral;