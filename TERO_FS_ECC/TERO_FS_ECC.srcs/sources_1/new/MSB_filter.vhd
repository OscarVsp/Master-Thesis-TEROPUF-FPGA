----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2023 14:35:57
-- Design Name: 
-- Module Name: MSB_filter - Behavioral
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

entity MSB_filter is
generic (size_in : integer := 32;
        size_out_start : integer := 32;
        size_out_end : integer := 16);
    Port ( word_in : in std_logic_vector(size_in-1 downto 0);
           word_out : out std_logic_vector(size_out_start-size_out_end-1 downto 0)
    );
end MSB_filter;

architecture Behavioral of MSB_filter is

begin

word_out <= word_in(size_out_start-1 downto size_out_end);

end Behavioral;
