library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library unisim;
use unisim.vcomponents.all;


entity tero_8 is
    Port ( enable : in STD_LOGIC;
           output : out STD_LOGIC);
end tero_8;

architecture Behavioral of tero_8 is

attribute DONT_TOUCH : boolean;
attribute BEL : string;
attribute RLOC : string;

attribute DONT_TOUCH of u0 : label is true;
attribute DONT_TOUCH of u1 : label is true;
attribute DONT_TOUCH of u2 : label is true;
attribute DONT_TOUCH of u3 : label is true;
attribute DONT_TOUCH of u4 : label is true;
attribute DONT_TOUCH of u5 : label is true;
attribute DONT_TOUCH of u6 : label is true;
attribute DONT_TOUCH of u7 : label is true;
attribute BEL of u0 : label is "A6LUT";
attribute BEL of u1 : label is "B6LUT";
attribute BEL of u2 : label is "C6LUT";
attribute BEL of u3 : label is "D6LUT";
attribute BEL of u4 : label is "A6LUT";
attribute BEL of u5 : label is "B6LUT";
attribute BEL of u6 : label is "C6LUT";
attribute BEL of u7 : label is "D6LUT";
attribute RLOC of u0 : label is "X0Y0";
attribute RLOC of u1 : label is "X0Y0";
attribute RLOC of u2 : label is "X0Y0";
attribute RLOC of u3 : label is "X0Y0";
attribute RLOC of u4 : label is "X1Y0";
attribute RLOC of u5 : label is "X1Y0";
attribute RLOC of u6 : label is "X1Y0";
attribute RLOC of u7 : label is "X1Y0";

signal chain : std_logic_vector(7 downto 0);

begin

u0 : LUT2 generic map (INIT => "1000") -- and port for enable
port map (O => chain(0), I0 => chain(7), I1 => enable);

u1 : LUT1 generic map (INIT => "01") -- inverter
port map (O => chain(1), I0 => chain(0));

u2 : LUT1 generic map (INIT => "01") -- inverter
port map (O => chain(2), I0 => chain(1));

u3 : LUT1 generic map (INIT => "01") -- inverter
port map (O => chain(3), I0 => chain(2));

u4 : LUT2 generic map (INIT => "1000") -- and port for enable
port map (O => chain(4), I0 => chain(3), I1 => enable);

u5 : LUT1 generic map (INIT => "01") -- inverter
port map (O => chain(5), I0 => chain(4));

u6 : LUT1 generic map (INIT => "01") -- inverter
port map (O => chain(6), I0 => chain(5));

u7 : LUT1 generic map (INIT => "01") -- inverter
port map (O => chain(7), I0 => chain(6));

output <= chain(3);

end Behavioral;
