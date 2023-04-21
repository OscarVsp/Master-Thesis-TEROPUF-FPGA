library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.const.all;

entity uart is
	Port (
	clock : in STD_LOGIC;
	reset : in STD_LOGIC;
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
	tero_responses : in std_logic_vector(255 downto 0);

	enable : out std_logic;
	refcounter_limit : out std_logic_vector(15 downto 0)
	);
end uart;

architecture Behavioral of uart is

type DataState is (START_READ, READ_STARTED, AWAIT_RESPONSE, WRITE_STARTED);

signal state : DataState;
signal response : std_logic_vector(255 downto 0);
signal bitcount : unsigned(12 - 1 downto 0);
signal refcounter_limit_in : std_logic_vector(15 downto 0) := "0000000011001000";
signal reading_refcounter_limit : std_logic;

begin

refcounter_limit <= refcounter_limit_in;

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
		enable <= '0';


		state <= START_READ;
		response <= (others => '0');
		bitcount <= (others => '0');
		
		reading_refcounter_limit <= '0';
	elsif rising_edge(clock) then

		case state is
		when START_READ =>
			araddr <= "0000";
			arvalid <= '1';
			rready <= '1';
			state <= READ_STARTED;
		when READ_STARTED =>
			if arready = '1' then
				arvalid <= '0';
			end if;
			if rvalid = '1' then
				rready <= '0';
				if rresp = "00" then
				    if reading_refcounter_limit = '1' then
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
			            enable <= '1';
						state <= AWAIT_RESPONSE;
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
			if write_out = '1' then
			    enable <= '0';
				state <= WRITE_STARTED;
				response <= tero_responses;
				awaddr <= "0100";
				awvalid <= '1';
				wdata(7 downto 0) <= response(7 downto 0);
				wvalid <= '1';
				bready <= '1';
			end if;
		when WRITE_STARTED =>
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
					if bitcount + 1  >= 2*16 then
					    state <= START_READ;
                        bitcount <= (others => '0');
                        response <= (others => '0');
                    else
                        awaddr <= "0100";
                        awvalid <= '1';
                        wdata(7 downto 0) <= response(15 downto 8);
                        wvalid <= '1';
                        bready <= '1';
                        response <= "00000000" & response(255 downto 8);
                        bitcount <= bitcount + 1;
                    end if;
				end if;
			end if;
		end case;
	end if;
end process;

end Behavioral;
