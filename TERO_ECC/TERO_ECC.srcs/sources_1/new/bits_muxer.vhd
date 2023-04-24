----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2023 09:48:42
-- Design Name: 
-- Module Name: bits_muxer - Behavioral
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

entity bits_muxer is
    Port ( selection : in STD_LOGIC;
           input_bit_0 : in STD_LOGIC;
           input_bit_1 : in STD_LOGIC;
           output_bit : out STD_LOGIC);
end bits_muxer;

architecture Behavioral of bits_muxer is

begin

process (selection) begin
    if selection = '0' then
        output_bit <= input_bit_0;
    else
        output_bit <= input_bit_1;
    end if;
end process;

end Behavioral;
