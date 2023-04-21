library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.const.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sha256_pad is
  Port (
    dec_out : in std_logic;
    dec_valid : in std_logic;
    reset : in std_logic;
    clock : in std_logic;
    padded_block : out std_logic_vector(511 downto 0))
  ;
end sha256_pad;

architecture Behavioral of sha256_pad is

signal dec_response : std_logic_vector(k-1 downto 0);



begin

padded_block(511 downto 341) <= dec_response;
padded_block(340) <= '1';
padded_block(339 downto 8) <= (others => '0');
padded_block(7 downto 0) <= "10101011";

process (clock, reset) begin
    if reset = '1' then
        dec_response <= (others => '0');
    elsif rising_edge(clock) then
        if dec_valid = '1' then
            dec_response <= dec_out & dec_response(k - 1 downto 1);
        end if;
    end if;
end process;
end Behavioral;
