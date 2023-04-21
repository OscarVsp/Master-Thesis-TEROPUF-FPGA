library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;

entity comparator is
    Port (
		clock : in std_logic;
		enable : in std_logic;
		refcount : in STD_LOGIC_VECTOR (15 downto 0);
		refcount_limit : in STD_LOGIC_VECTOR (15 downto 0);
		finished : out std_logic
	);
end comparator;

architecture Behavioral of comparator is

begin

process(clock, enable) begin
	if enable = '0' then
		finished <= '0';
	elsif rising_edge(clock) then
		if refcount(15 downto 0) = refcount_limit then
			finished <= '1';
		end if;
	end if;
end process;

end Behavioral;
