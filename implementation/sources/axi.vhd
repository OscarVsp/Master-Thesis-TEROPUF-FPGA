LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

USE work.const.ALL;

ENTITY axi IS
	GENERIC (
		ref_counter_size : integer := 16;
		default_ref_limit_counter : integer := 200
	);
	PORT (
		clock, reset : IN STD_LOGIC;
		dec_out, dec_valid : IN STD_LOGIC;
		pufbit_out, pufbit_valid : IN STD_LOGIC;
		sha256_out : IN STD_LOGIC_VECTOR(255 DOWNTO 0);
		sha256_valid : IN STD_LOGIC;
		write_out : STD_LOGIC;

		wready, bvalid : IN STD_LOGIC;
		bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		arready, rvalid : IN STD_LOGIC;
		rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

		awvalid, wvalid, bready : OUT STD_LOGIC;
		awaddr : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		arvalid, rready : OUT STD_LOGIC;
		araddr : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);

		write_finished, read_finished : OUT STD_LOGIC;
		gen_state_out : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		syndrome : OUT STD_LOGIC_VECTOR(nk - 1 DOWNTO 0);

		led_0 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);	--Debug only

		refcounter_limit : OUT STD_LOGIC_VECTOR(ref_counter_size-1 DOWNTO 0)
	);
END axi;

ARCHITECTURE Behavioral OF axi IS

	TYPE DataState IS (START_READ, READ_STARTED, AWAIT_RESPONSE, WRITE_STARTED);

	SIGNAL state : DataState;
	SIGNAL response : STD_LOGIC_VECTOR(1023 - 1 DOWNTO 0);
	SIGNAL bitcount : unsigned(11 - 1 DOWNTO 0);
	SIGNAL gen_state : STD_LOGIC_VECTOR(1 DOWNTO 0); --"00" = provision, "01" = ECC, "10" = SHA
	SIGNAL reading_syndrome, reading_refcounter_limit : STD_LOGIC;
	SIGNAL syndrome_in : STD_LOGIC_VECTOR(nk - 1 + 7 DOWNTO 0); -- +7 for unused bits in the last received byte
	SIGNAL refcounter_limit_in : STD_LOGIC_VECTOR(ref_counter_size-1 DOWNTO 0) := std_logic_vector(to_unsigned(default_ref_limit_counter, ref_counter_size));

BEGIN

	gen_state_out <= gen_state;
	syndrome <= syndrome_in(nk - 1 DOWNTO 0);
	refcounter_limit <= refcounter_limit_in(15 DOWNTO 0);

	PROCESS (clock, reset) BEGIN
		IF reset = '0' THEN
			awaddr <= "0000";
			awvalid <= '0';
			wdata <= (OTHERS => '0');
			wvalid <= '0';
			bready <= '0';
			arvalid <= '0';
			rready <= '0';
			araddr <= "0000";
			write_finished <= '0';
			read_finished <= '0';
			gen_state <= "00";

			state <= START_READ;
			response <= (OTHERS => '0');
			bitcount <= (OTHERS => '0');
			reading_syndrome <= '0';
			reading_refcounter_limit <= '0';
			refcounter_limit_in <= std_logic_vector(to_unsigned(default_ref_limit_counter, ref_counter_size));
			led_0 <= "000";
		ELSIF rising_edge(clock) THEN
			write_finished <= '0';
			read_finished <= '0';
			led_0 <= "000";

			CASE state IS
				WHEN START_READ =>					--Restart the reading loop
					araddr <= "0000";
					arvalid <= '1';
					rready <= '1';
					state <= READ_STARTED;
				WHEN READ_STARTED =>				--Read the input
					led_0 <= "001"; -- Blue
					IF arready = '1' THEN
						arvalid <= '0';
					END IF;
					IF rvalid = '1' THEN
						rready <= '0';
						IF rresp = "00" THEN
							IF reading_syndrome = '1' THEN				--If reading syndrome state -> read syndrome bits
								syndrome_in(to_integer(bitcount) + 7 DOWNTO to_integer(bitcount)) <= rdata(7 DOWNTO 0);
								IF bitcount + 8 >= nk THEN
									bitcount <= (OTHERS => '0');
									reading_syndrome <= '0';
									read_finished <= '1';
									state <= AWAIT_RESPONSE;				--When syndrome is fully received -> Wait for the response
								ELSE
									bitcount <= bitcount + 8;
									araddr <= "0000";
									arvalid <= '1';
									rready <= '1';
								END IF;
							ELSIF reading_refcounter_limit = '1' THEN	--If reading counter limit state -> read refcounter limit
								refcounter_limit_in(to_integer(bitcount) + 7 DOWNTO to_integer(bitcount)) <= rdata(7 DOWNTO 0);
								IF bitcount + 8 >= ref_counter_size THEN
									bitcount <= (OTHERS => '0');
									reading_refcounter_limit <= '0';
									state <= START_READ;					--Restart the reading loop
								ELSE
									bitcount <= bitcount + 8;
									araddr <= "0000";
									arvalid <= '1';
									rready <= '1';
								END IF;
							ELSIF rdata(7 DOWNTO 0) = "01110000" THEN 	-- character 'p' -> RAW response requested
								gen_state <= "00";
								read_finished <= '1';
								state <= AWAIT_RESPONSE;					--Wait for PUF block response
							ELSIF rdata(7 DOWNTO 0) = "01110011" THEN 	-- character 's' -> ECC response requested
								gen_state <= "01";
								reading_syndrome <= '1';					--Read the syndrome
								araddr <= "0000";
								arvalid <= '1';
								rready <= '1';
							ELSIF rdata(7 DOWNTO 0) = "01101011" THEN 	-- character 'k' -> SHA2-256 requested
								gen_state <= "10";
								reading_syndrome <= '1';					--Read the syndrome
								araddr <= "0000";
								arvalid <= '1';
								rready <= '1';
							ELSIF rdata(7 DOWNTO 0) = "01100011" THEN -- character 'c' -> Set refcounter limit
								reading_refcounter_limit <= '1';			--Read the refcounter limit
								araddr <= "0000";
								arvalid <= '1';
								rready <= '1';
							ELSE
								state <= START_READ;
							END IF;
						ELSE
							-- failed read, try again
							state <= START_READ;
						END IF;
					END IF;
				WHEN AWAIT_RESPONSE =>
					led_0 <= "010"; -- Green
					IF gen_state = "00" THEN					--If RAW requested -> Wait for the RAW response to be available
						IF pufbit_valid = '1' THEN
							response <= pufbit_out & response(1023 - 1 DOWNTO 1);
						END IF;
					ELSIF gen_state = "01" THEN					--If ECC requested -> Wait for the ECC response to be available
						IF dec_valid = '1' THEN
							response <= response(1023 - 1 DOWNTO k) & dec_out & response(k - 1 DOWNTO 1);
						END IF;
					ELSIF gen_state = "10" THEN					--If SHA requested -> Wait for the SHA response to be available
						IF sha256_valid = '1' THEN
							response(255 DOWNTO 0) <= sha256_out;
						END IF;
					END IF;
					IF write_out = '1' THEN						--Wait for control signal to send back the requested response
						state <= WRITE_STARTED;
						awaddr <= "0100";
						awvalid <= '1';
						wdata(7 DOWNTO 0) <= response(7 DOWNTO 0);
						wvalid <= '1';
						bready <= '1';
					END IF;
				WHEN WRITE_STARTED =>							--Send back the requested response
					led_0 <= "100"; -- Red
					IF wready = '1' THEN
						wdata <= (OTHERS => '0');
						wvalid <= '0';
						awaddr <= "0000";
						awvalid <= '0';
					END IF;
					IF bvalid = '1' THEN
						IF bresp = "10" THEN
							-- failure, try again
							awaddr <= "0100";
							awvalid <= '1';
							wdata(7 DOWNTO 0) <= response(7 DOWNTO 0);
							wvalid <= '1';
							bready <= '1';
						ELSE
							bready <= '0';
							IF (gen_state = "00" AND bitcount + 8 >= 1023)				--Size of the response depend on the case (RAW, ECC or SHA)
								OR (gen_state = "01" AND bitcount + 8 >= k)
								OR (gen_state = "10" AND bitcount + 8 >= 256) THEN
								state <= START_READ;
								write_finished <= '1';
								bitcount <= (OTHERS => '0');
								response <= (OTHERS => '0');
							ELSE
								awaddr <= "0100";
								awvalid <= '1';
								wdata(7 DOWNTO 0) <= response(15 DOWNTO 8);
								wvalid <= '1';
								bready <= '1';
								response <= "00000000" & response(1023 - 1 DOWNTO 8);
								bitcount <= bitcount + 8;
							END IF;
						END IF;
					END IF;
			END CASE;
		END IF;
	END PROCESS;

END Behavioral;