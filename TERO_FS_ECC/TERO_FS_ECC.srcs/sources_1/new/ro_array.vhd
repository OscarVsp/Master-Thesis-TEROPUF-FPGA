library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ro_array is
	generic (
	    array_size : integer := 64;
	    counter_size : integer := 16
	);
	Port (
		clock : in std_logic;
		reset : in std_logic;
		enable : in STD_LOGIC;
		outputs : out STD_LOGIC_VECTOR (array_size*counter_size - 1 downto 0)
	);
end ro_array;

architecture Behavioral of ro_array is

signal enable_r : STD_LOGIC := '0';

component ro is
	Port (
		enable : in STD_LOGIC;
		output : out STD_LOGIC
	);
end component ro;

signal intermediate : std_logic_vector(array_size - 1 downto 0) := (others => '0');

component counter is
	Port (
	    clock : in std_logic ;
		enable : in STD_LOGIC;
		count : out std_logic_vector(15 downto 0)
	);
end component counter;



begin

process (clock, reset) begin
	if reset = '0' then
		enable_r <= '0';
	elsif rising_edge(clock) then
	    enable_r <= enable;
	end if;
end process;

gen_ro: for i in 0 to array_size - 1 generate
	r: ro port map (
		enable => enable,
		output => intermediate(i)
	);
end generate;

gen_counter: for i in 0 to array_size - 1 generate
	c: counter port map (
	    clock => intermediate(i),
		enable => enable,
		count => outputs(counter_size*(i+1) - 1 downto counter_size*i)
	);
end generate;

end Behavioral;
