LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;

ENTITY comparator IS
	GENERIC (
		equality : STD_LOGIC := '0';
		counter_size : INTEGER := 16;
		ref_counter_size : INTEGER := 16
	);
	PORT (
		clock, enable : IN STD_LOGIC;
		count_A, count_B : IN STD_LOGIC_VECTOR (counter_size - 1 DOWNTO 0);
		refcount, refcount_limit : IN STD_LOGIC_VECTOR (ref_counter_size - 1 DOWNTO 0);
		finished, result : OUT STD_LOGIC
	);
END comparator;

ARCHITECTURE Behavioral OF comparator IS

BEGIN

	PROCESS (clock, enable) BEGIN
		IF enable = '0' THEN
			finished <= '0';
			result <= '0';
		ELSIF rising_edge(clock) THEN
			IF refcount = refcount_limit THEN
				finished <= '1';
				IF count_B > count_A THEN
					result <= '0';
				ELSIF count_B < count_A THEN
					result <= '1';
				ELSE
					result <= equality;
				END IF;
			END IF;
		END IF;
	END PROCESS;

END Behavioral;