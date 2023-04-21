library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tero_array is
    generic (select_size : integer := 4);
	Port (
		clock : in std_logic;
		reset : in std_logic;
		enable : in STD_LOGIC;
		outputs : out STD_LOGIC_VECTOR ((2**select_size)*16 - 1 downto 0)
	);
end tero_array;


architecture Behavioral of tero_array is

component tero is
	Port (
		enable : in STD_LOGIC;
		output : out STD_LOGIC
	);
end component tero;

component counter is
	generic (size : integer := 16);
    Port ( clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           count : out std_logic_vector(size-1 downto 0)
    );
end component counter;

signal enables : std_logic_vector (2**select_size - 1 downto 0) := (others => '0');
signal tero_to_counter : std_logic_vector (2**select_size - 1 downto 0) := (others => '0');

begin

process (clock, reset) begin
	if reset = '0' then
		enables <= (others => '0');
	else
		enables <= (others => enable);
	end if;
end process;

gen_tero: for i in 0 to 2**select_size - 1 generate
	r: tero port map (
		enable => enables(i),
		output => tero_to_counter(i)
	);
end generate;

gen_counter: for i in 0 to 2**select_size - 1 generate
	c: counter
	port map (
		clk => tero_to_counter(i),
		enable => enables(i),
		count => outputs(15+16*i downto 16*i)
	);
end generate;

end Behavioral;

