library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;

USE work.const.all;

entity control is
    Port (
        clock : in std_logic;
        reset : in std_logic;
        pufbit_valid : in std_logic;
        decode_valid : in std_logic;
        sha256_valid : in std_logic;
        gen_state : in std_logic_vector(1 downto 0); 
        write_finished, read_finished : in std_logic;
        enable_counting : out std_logic;
        number0, number1 : out std_logic_vector(4 downto 0);
        decode_reset : out bit;
        sha256_start : out std_logic;
        sha256_reset : out std_logic;
        
	    led_1 : out std_logic_vector(2 downto 0);
        write_out : out std_logic
    );
end control;

architecture Behavioral of control is

type ControlState is (AWAIT_INPUT, GEN_BITS, DECODE, SHA256, UART_OUT, FINISHED);

signal state : ControlState;
signal count : std_logic_vector (9 downto 0);

signal lfsr : std_logic_vector(9 downto 0);

begin

number0 <= lfsr(4 downto 0);
number1 <= lfsr(9 downto 5);

process(clock, reset) begin
	if reset = '0' then
		enable_counting <= '0';
		decode_reset <= '1';
		write_out <= '0';

		state <= AWAIT_INPUT;
		count <= (others => '0');
		lfsr <= "0000000001";
		led_1 <= "000";
	elsif rising_edge(clock) then
		enable_counting <= '0';
		state <= state;
		decode_reset <= '1';
		sha256_reset <= '1';
		sha256_start <= '0';
		write_out <= '0';
		
		led_1 <= "000";
		case state is
		when AWAIT_INPUT =>
		    led_1 <= "001";   -- Blue
			if read_finished = '1' then
				state <= GEN_BITS;
			end if;
		when GEN_BITS =>
		    led_1 <= "010";   -- Green
			if pufbit_valid = '1' then
				enable_counting <= '0';
				if (gen_state = "00" and count = 1023 - 1) then
                   state <= UART_OUT;
                   write_out <= '1';
                   count <= (others => '0');
                   lfsr <= "0000000001";
				elsif (gen_state /= "00" and count = k - 1) then
                   state <= DECODE;
                   count <= (others => '0');
                   lfsr <= "0000000001";
                else
                   lfsr <= lfsr(8 downto 0) & (lfsr(9) xor lfsr(6));
                   count <= count + 1;
				end if;
			else
				enable_counting <= '1';
			end if;
		when DECODE =>
		    led_1 <= "100";   -- Red
			decode_reset <= '0';
			if decode_valid = '1' then
				if count = k - 1 then
					decode_reset <= '1';
					count <= (others => '0');
					if gen_state = "01" then
                        state <= UART_OUT;
                        write_out <= '1';
                    else
                        state <= SHA256;
                        sha256_start <= '1';
                    end if;
				else
					count <= count + 1;
				end if;
			end if;
		when SHA256 =>
		    led_1 <= "011"; -- Cyan
		    sha256_reset <= '0';
		    if sha256_valid = '1' then
		        state <= UART_OUT;
                write_out <= '1';
            end if;
		when UART_OUT =>
		    led_1 <= "101";   -- Pink
			if write_finished = '1' then
				state <= AWAIT_INPUT;
			end if;
		when FINISHED =>
		end case;
	end if;
end process;

end Behavioral;
