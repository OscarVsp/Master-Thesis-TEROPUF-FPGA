library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.const.all;

entity uart is
	Port (
	clock : in STD_LOGIC;
	reset : in STD_LOGIC;
	dec_out, dec_valid : in std_logic;
	pufbit_out, pufbit_valid : in std_logic;
	sha256_out : in std_logic_vector(255 downto 0);
	sha256_valid : in std_logic;
	write_out : std_logic;

	wready, bvalid : in std_logic;
	bresp : in std_logic_vector(1 downto 0);
	arready, rvalid : in std_logic;
	rdata : in std_logic_vector(31 downto 0);
	rresp : in std_logic_vector(1 downto 0);

	awvalid, wvalid, bready : out std_logic;
	awaddr : out std_logic_vector(3 downto 0);
	wdata : out std_logic_vector(31 downto 0);
	arvalid, rready : out std_logic;
	araddr : out std_logic_vector(3 downto 0);

	write_finished, read_finished : out std_logic;
	gen_state_out : out std_logic_vector(1 downto 0);
	syndrome : out std_logic_vector(nk - 1 downto 0);
	
	led_0 : out std_logic_vector(2 downto 0);
	
	refcounter_limit : out std_logic_vector(15 downto 0)
	);
end uart;

architecture Behavioral of uart is

type DataState is (START_READ, READ_STARTED, AWAIT_RESPONSE, WRITE_STARTED);

signal state : DataState;
signal response : std_logic_vector(1023 - 1 downto 0);
signal bitcount : unsigned(11 - 1 downto 0);
signal gen_state : std_logic_vector(1 downto 0);    --"00" = provision, "01" = ECC, "10" = SHA
signal reading_syndrome : std_logic;
signal reading_refcounter_limit : std_logic;
signal syndrome_in : std_logic_vector(nk - 1 + 7 downto 0); -- +7 for unused bits in the last received byte
signal refcounter_limit_in : std_logic_vector(15 downto 0) := "0000000011001000";

begin

gen_state_out <= gen_state;
syndrome <= syndrome_in(nk - 1 downto 0);
refcounter_limit <= refcounter_limit_in(15 downto 0);

process (clock, reset) begin
	if reset = '0' then
		awaddr <= "0000";
		awvalid <= '0';
		wdata <= (others => '0');
		wvalid <= '0';
		bready <= '0';
		arvalid <= '0';
		rready <= '0';
		araddr <= "0000";
		write_finished <= '0';
		read_finished <= '0';
		gen_state <= "00";

		state <= START_READ;
		response <= (others => '0');
		bitcount <= (others => '0');
		reading_syndrome <= '0';
		reading_refcounter_limit <= '0';
		led_0 <= "000";
	elsif rising_edge(clock) then
		write_finished <= '0';
		read_finished <= '0';
		led_0 <= "000";

		case state is
		when START_READ =>
			araddr <= "0000";
			arvalid <= '1';
			rready <= '1';
			state <= READ_STARTED;
		when READ_STARTED =>
		    led_0 <= "001"; -- Blue
			if arready = '1' then
				arvalid <= '0';
			end if;
			if rvalid = '1' then
				rready <= '0';
				if rresp = "00" then
					if reading_syndrome = '1' then
						syndrome_in(to_integer(bitcount) + 7 downto to_integer(bitcount)) <= rdata(7 downto 0);
						if bitcount + 8 >= nk then
							bitcount <= (others => '0');
							reading_syndrome <= '0';
							read_finished <= '1';
							state <= AWAIT_RESPONSE;
						else
							bitcount <= bitcount + 8;
							-- read next byte
							araddr <= "0000";
							arvalid <= '1';
							rready <= '1';
						end if;
					elsif reading_refcounter_limit = '1' then
					    refcounter_limit_in(to_integer(bitcount) + 7 downto to_integer(bitcount)) <= rdata(7 downto 0);
						if bitcount + 8 >= 16 then
							bitcount <= (others => '0');
							reading_refcounter_limit <= '0';
							state <= START_READ;
						else
							bitcount <= bitcount + 8;
							-- read next byte
							araddr <= "0000";
							arvalid <= '1';
							rready <= '1';
						end if;
					elsif rdata(7 downto 0) = "01110000" then -- character 'p'
						-- provisioning (raw response)
						gen_state <= "00";
						read_finished <= '1';
						state <= AWAIT_RESPONSE;
					elsif rdata(7 downto 0) = "01110011" then -- character 's'
						-- use BCH decoding
						gen_state <= "01";
						-- read syndrome
						reading_syndrome <= '1';
						araddr <= "0000";
						arvalid <= '1';
						rready <= '1';
					elsif rdata(7 downto 0) = "01101011" then -- character 'k'
						-- use BCH decoding + sha256
						gen_state <= "10";
						-- read syndrome
						reading_syndrome <= '1';
						araddr <= "0000";
						arvalid <= '1';
						rready <= '1';
					elsif rdata(7 downto 0) = "01100011" then -- character 'c'
					    -- change value of refcounter limit
					    reading_refcounter_limit <= '1';
					    araddr <= "0000";
						arvalid <= '1';
						rready <= '1';
					else
						state <= START_READ;
					end if;
				else
					-- failed read, try again
					state <= START_READ;
				end if;
			end if;
		when AWAIT_RESPONSE =>
		    led_0 <= "010";   -- Green
			if gen_state = "00" then
			     if pufbit_valid = '1' then
				    response <= pufbit_out & response(1023 - 1 downto 1);
				 end if;
			elsif gen_state = "01" then
			     if dec_valid = '1' then
				    response <= response(1023 - 1 downto k) & dec_out & response(k - 1 downto 1);
				 end if;
		    elsif gen_state = "10" then
		         if sha256_valid = '1' then
				    response(255 downto 0) <= sha256_out;
				 end if;
			end if;
			if write_out = '1' then
				state <= WRITE_STARTED;
				awaddr <= "0100";
				awvalid <= '1';
				wdata(7 downto 0) <= response(7 downto 0);
				wvalid <= '1';
				bready <= '1';
			end if;
		when WRITE_STARTED =>
		    led_0 <= "100"; -- Red
			if wready = '1' then
				wdata <= (others => '0');
				wvalid <= '0'; 
				awaddr <= "0000";
				awvalid <= '0';
			end if;
			if bvalid = '1' then
				if bresp = "10" then
					-- failure, try again
					awaddr <= "0100";
					awvalid <= '1';
					wdata(7 downto 0) <= response(7 downto 0);
					wvalid <= '1';
					bready <= '1';
				else
					bready <= '0';
					if (gen_state = "00" and bitcount + 8 >= 1023)
					   or (gen_state = "01" and bitcount + 8 >= k)
					   or (gen_state = "10" and bitcount + 8 >= 256) then
                        state <= START_READ;
                        write_finished <= '1';
                        bitcount <= (others => '0');
                        response <= (others => '0');
                    else
                        awaddr <= "0100";
                        awvalid <= '1';
                        wdata(7 downto 0) <= response(15 downto 8);
                        wvalid <= '1';
                        bready <= '1';
                        response <= "00000000" & response(1023 - 1 downto 8);
                        bitcount <= bitcount + 8;
                    end if;
				end if;
			end if;
		end case;
	end if;
end process;

end Behavioral;
