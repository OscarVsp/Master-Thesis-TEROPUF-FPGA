library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tero_array is
    generic (select_size : integer := 5);
	Port (
		clock : in std_logic;
		reset : in std_logic;
		enable : in STD_LOGIC;
		outputs : out STD_LOGIC_VECTOR (2**select_size - 1 downto 0);
		selection : in std_logic_vector (select_size - 1 downto 0)
	);
end tero_array;


architecture Behavioral of tero_array is

component tero_8 is
	Port (
		enable : in STD_LOGIC;
		output : out STD_LOGIC
	);
end component tero_8;

signal enables : std_logic_vector (2**select_size - 1 downto 0) := (others => '0');

begin

process (clock, reset) begin
	if reset = '0' then
		enables <= (others => '0');
	elsif rising_edge(clock) then
		if enable = '1' then
			enables(to_integer(unsigned(selection))) <= '1';
		else
			enables <= (others => '0');
		end if;
	end if;
end process;

gen_tero: for i in 0 to 2**select_size - 1 generate
	r: tero_8 port map (
		enable => enables(i),
		output => outputs(i)
	);
end generate;

end Behavioral;

