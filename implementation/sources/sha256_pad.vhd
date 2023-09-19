LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE work.const.ALL;

ENTITY sha256_pad IS
  PORT (
    dec_out, dec_valid, reset, clock : IN STD_LOGIC;
    padded_block : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
  );
END sha256_pad;

ARCHITECTURE Behavioral OF sha256_pad IS

  SIGNAL dec_response : STD_LOGIC_VECTOR(k - 1 DOWNTO 0);

BEGIN

  padded_block(511 DOWNTO 341) <= dec_response;
  padded_block(340) <= '1';
  padded_block(339 DOWNTO 8) <= (OTHERS => '0');
  padded_block(7 DOWNTO 0) <= "10101011";

  PROCESS (clock, reset) BEGIN
    IF reset = '1' THEN
      dec_response <= (OTHERS => '0');
    ELSIF rising_edge(clock) THEN
      IF dec_valid = '1' THEN
        dec_response <= dec_out & dec_response(k - 1 DOWNTO 1);
      END IF;
    END IF;
  END PROCESS;
END Behavioral;