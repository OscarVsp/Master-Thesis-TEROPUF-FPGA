LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

USE WORK.const.ALL;

ENTITY sink IS
	PORT (
		clock, reset, decoder_reset, pufbit_out, pufbit_valid : IN STD_LOGIC;
		syndrome_in : IN STD_LOGIC_VECTOR(nk - 1 DOWNTO 0);
		decode_input : OUT STD_LOGIC
	);
END sink;

ARCHITECTURE Behavioral OF sink IS

	SIGNAL response : STD_LOGIC_VECTOR(k - 1 DOWNTO 0);
	SIGNAL syndrome : STD_LOGIC_VECTOR(nk - 1 DOWNTO 0);
	SIGNAL count : unsigned(m - 1 DOWNTO 0);
	SIGNAL output_response : STD_LOGIC;

BEGIN

	PROCESS (clock, reset) BEGIN
		IF reset = '0' THEN
			decode_input <= '0';

			response <= (OTHERS => '0');
			syndrome <= (OTHERS => '0');
			count <= (OTHERS => '0');
			output_response <= '1';
		ELSIF rising_edge(clock) THEN
			IF pufbit_valid = '1' THEN
				response <= pufbit_out & response(k - 1 DOWNTO 1);
				decode_input <= response(1);
			END IF;

			IF decoder_reset = '0' THEN
				IF output_response = '1' THEN
					response <= '0' & response(k - 1 DOWNTO 1);
					decode_input <= response(1);
					IF count = k - 1 THEN
						output_response <= '0';
						count <= (OTHERS => '0');
						decode_input <= syndrome(0);
					ELSE
						count <= count + 1;
					END IF;
				ELSE
					syndrome <= '0' & syndrome(nk - 1 DOWNTO 1);
					decode_input <= syndrome(1);
				END IF;
			ELSE
				output_response <= '1';
				syndrome <= syndrome_in;
			END IF;
		END IF;
	END PROCESS;

END Behavioral;