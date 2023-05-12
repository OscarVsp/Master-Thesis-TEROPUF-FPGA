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
attribute LOCK_PINS : string;

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
attribute LOCK_PINS of u0 : label is "I0:A2,I1:A4";
attribute LOCK_PINS of u1 : label is "I0:A5";
attribute LOCK_PINS of u2 : label is "I0:A6";
attribute LOCK_PINS of u3 : label is "I0:A4";
attribute LOCK_PINS of u4 : label is "I0:A2,I1:A4";
attribute LOCK_PINS of u5 : label is "I0:A5";
attribute LOCK_PINS of u6 : label is "I0:A6";
attribute LOCK_PINS of u7 : label is "I0:A4";


signal internal_loop : std_logic_vector(7 downto 0);



begin

u0 : LUT2 generic map (INIT => "1000") -- and port for enable
port map (O => internal_loop(0), I0 => internal_loop(7), I1 => enable);

u1 : LUT1 generic map (INIT => "01") -- inverter
port map (O => internal_loop(1), I0 => internal_loop(0));

u2 : LUT1 generic map (INIT => "01") -- inverter
port map (O => internal_loop(2), I0 => internal_loop(1));

u3 : LUT1 generic map (INIT => "01") -- inverter
port map (O => internal_loop(3), I0 => internal_loop(2));

u4 : LUT2 generic map (INIT => "1000") -- and port for enable
port map (O => internal_loop(4), I0 => internal_loop(3), I1 => enable);

u5 : LUT1 generic map (INIT => "01") -- inverter
port map (O => internal_loop(5), I0 => internal_loop(4));

u6 : LUT1 generic map (INIT => "01") -- inverter
port map (O => internal_loop(6), I0 => internal_loop(5));

u7 : LUT1 generic map (INIT => "01") -- inverter
port map (O => internal_loop(7), I0 => internal_loop(6));

output <= internal_loop(3);

end Behavioral;
