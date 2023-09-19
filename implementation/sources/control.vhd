LIBRARY IEEE;select_A
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;

USE work.const.ALL;

ENTITY control IS
	Generic (cell_select_size : integer := 5);
	PORT (
		clock, reset, pufbit_valid, decoder_valid, sha256_valid: IN STD_LOGIC;
		write_finished, read_finished : IN STD_LOGIC;
		gen_state : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		select_A, select_B : OUT STD_LOGIC_VECTOR(cell_select_size-1 DOWNTO 0);
		enable_counting, sha256_start, decoder_reset, sha256_reset, write_out : OUT BIT;
		led_1 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END control;

ARCHITECTURE Behavioral OF control IS

	TYPE ControlState IS (AWAIT_INPUT, GEN_BITS, DECODE, SHA256, UART_OUT, FINISHED);

	SIGNAL state : ControlState;
	SIGNAL count : STD_LOGIC_VECTOR (9 DOWNTO 0);

	SIGNAL lfsr : STD_LOGIC_VECTOR(9 DOWNTO 0);

BEGIN

	select_A <= lfsr(4 DOWNTO 0);
	select_B <= lfsr(9 DOWNTO 5);

	PROCESS (clock, reset) BEGIN
		IF reset = '0' THEN
			enable_counting <= '0';
			decoder_reset <= '1';
			write_out <= '0';
			sha256_reset <= '1';
			sha256_start <= '0';
			state <= AWAIT_INPUT;
			count <= (OTHERS => '0');
			lfsr <= "0000000001";
			led_1 <= "000";
		ELSIF rising_edge(clock) THEN
			enable_counting <= '0';
			state <= state;
			decoder_reset <= '1';
			sha256_reset <= '1';
			sha256_start <= '0';
			write_out <= '0';

			led_1 <= "000";
			CASE state IS
				WHEN AWAIT_INPUT =>					--Wait for UART to have fully received some inputs
					led_1 <= "001"; -- Blue
					IF read_finished = '1' THEN
						state <= GEN_BITS;
					END IF;
				WHEN GEN_BITS =>					--Generate the RAW response
					led_1 <= "010"; -- Green
					IF pufbit_valid = '1' THEN
						enable_counting <= '0';
						IF (gen_state = "00" AND count = 1023 - 1) THEN		--If RAW requested -> wait for the 1023 bits and send back the response directly
							state <= UART_OUT;			
							write_out <= '1';
							count <= (OTHERS => '0');
							lfsr <= "0000000001";
						ELSIF (gen_state /= "00" AND count = k - 1) THEN	--If ECC or SHA requested -> wait only for k bits then send to decoder
							state <= DECODE;			
							count <= (OTHERS => '0');
							lfsr <= "0000000001";
						ELSE
							lfsr <= lfsr(8 DOWNTO 0) & (lfsr(9) XOR lfsr(6));
							count <= count + 1;
						END IF;
					ELSE
						enable_counting <= '1';
					END IF;
				WHEN DECODE =>						--Decode the RAW response with the received syndrome
					led_1 <= "100"; -- Red
					decoder_reset <= '0';
					IF decoder_valid = '1' THEN
						IF count = k - 1 THEN
							decoder_reset <= '1';
							count <= (OTHERS => '0');
							IF gen_state = "01" THEN		--If ECC requested -> Send back the decoded response
								state <= UART_OUT;
								write_out <= '1';
							ELSE							--If SHA requested -> Send the decoded response to the hasing block
								state <= SHA256;
								sha256_start <= '1';
							END IF;
						ELSE
							count <= count + 1;
						END IF;
					END IF;
				WHEN SHA256 =>						--Hash the decoded response
					led_1 <= "011"; -- Cyan
					sha256_reset <= '0';
					IF sha256_valid = '1' THEN
						state <= UART_OUT;
						write_out <= '1';
					END IF;
				WHEN UART_OUT =>					--Tell the UART block to send the response
					led_1 <= "101"; -- Pink
					IF write_finished = '1' THEN
						state <= AWAIT_INPUT;
					END IF;
				WHEN FINISHED =>
			END CASE;
		END IF;
	END PROCESS;

END Behavioral;