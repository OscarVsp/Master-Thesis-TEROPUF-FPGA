library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library unisim;
use unisim.vcomponents.all;


entity tero_4 is
    Port ( enable : in STD_LOGIC;
           output : out STD_LOGIC);
end tero_4;

architecture Behavioral of tero_4 is

attribute DONT_TOUCH : boolean;
attribute BEL : string;
attribute RLOC : string;
attribute LOCK_PINS : string;

attribute DONT_TOUCH of u0 : label is true;
attribute DONT_TOUCH of u1 : label is true;
attribute DONT_TOUCH of u2 : label is true;
attribute DONT_TOUCH of u3 : label is true;
attribute BEL of u0 : label is "A6LUT";
attribute BEL of u1 : label is "B6LUT";
attribute BEL of u2 : label is "C6LUT";
attribute BEL of u3 : label is "D6LUT";
attribute RLOC of u0 : label is "X0Y0";
attribute RLOC of u1 : label is "X0Y0";
attribute RLOC of u2 : label is "X0Y0";
attribute RLOC of u3 : label is "X0Y0";
attribute LOCK_PINS of u0 : label is "I0:A2,I1:A4";
attribute LOCK_PINS of u1 : label is "I0:A5";
attribute LOCK_PINS of u2 : label is "I0:A6";
attribute LOCK_PINS of u3 : label is "I0:A4";

signal chain : std_logic_vector(3 downto 0);

begin

u0 : LUT2 generic map (INIT => "1000") -- and port for enable
port map (O => chain(0), I0 => chain(3), I1 => enable);

u1 : LUT1 generic map (INIT => "01") -- inverter
port map (O => chain(1), I0 => chain(0));

u2 : LUT2 generic map (INIT => "1000") -- and port for enable
port map (O => chain(2), I0 => chain(1), I1 => enable);

u3 : LUT1 generic map (INIT => "01") -- inverter
port map (O => chain(3), I0 => chain(2));


output <= chain(3);

end Behavioral;
