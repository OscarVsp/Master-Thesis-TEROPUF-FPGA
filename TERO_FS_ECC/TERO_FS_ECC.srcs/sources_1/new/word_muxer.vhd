----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2023 15:16:15
-- Design Name: 
-- Module Name: word_muxer - Behavioral
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

entity word_muxer is
    Port ( word_a : in STD_LOGIC_VECTOR (15 downto 0);
           word_b : in STD_LOGIC_VECTOR (15 downto 0);
           word_out : out STD_LOGIC_VECTOR (15 downto 0);
           selection : in STD_LOGIC);
end word_muxer;

architecture Behavioral of word_muxer is

begin

process(selection) begin

if selection = '1' then
    word_out <= word_a;
else
    word_out <= word_b;
end if;
end process;


end Behavioral;
