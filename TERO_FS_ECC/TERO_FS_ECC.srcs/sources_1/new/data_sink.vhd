library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_sink is
    Port ( inputs : in unsigned (1023 downto 0);
    led : out std_logic );
end data_sink;

architecture Behavioral of data_sink is

begin

process(inputs) begin
    if (to_integer(inputs) = 0) then
        led <= '1';
    else
        led <= '0';
    end if; 
end process;


end Behavioral;
