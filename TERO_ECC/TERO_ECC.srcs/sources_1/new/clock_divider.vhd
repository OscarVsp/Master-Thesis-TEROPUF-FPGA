----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2023 09:37:28
-- Design Name: 
-- Module Name: clock_divider - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_divider is
    generic (size : integer := 16);
    Port ( clock_in : in STD_LOGIC;
           clock_out : out STD_LOGIC);
end clock_divider;

architecture Behavioral of clock_divider is

component counter is
    generic (size : integer := 32);
    Port ( clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           count : out std_logic_vector(size-1 downto 0)
    );
end component;

signal count : std_logic_vector (size-1 downto 0);

begin

clock_out <= count(size-1);

counter_0: component counter
    generic map(size=>size)
    port map (
        clk => clock_in,
        count(size-1 downto 0) => count(size-1 downto 0),
        enable => '1'
    );

end Behavioral;
