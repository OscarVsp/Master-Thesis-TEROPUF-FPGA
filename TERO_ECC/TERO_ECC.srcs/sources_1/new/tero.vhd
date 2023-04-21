library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library unisim;
use unisim.vcomponents.all;


entity tero is
    Port ( enable : in STD_LOGIC;
           output : out STD_LOGIC);
end tero;

architecture Behavioral of tero is

attribute DONT_TOUCH : boolean;
attribute BEL : string;
attribute RLOC : string;

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

---

signal chain : std_logic_vector(7 downto 0);

begin

u0 : LUT6_2
generic map (
    INIT => X"0F0F0F0F88888888") -- and port for enable | inverter
port map (
    O6 => chain(1), -- Inverter output
    O5 => chain(0), -- And output
    I0 => chain(7), -- And input 1  
    I1 => enable,   -- And input 2  
    I2 => chain(0), -- Inverter input
    I3 => 'X',
    I4 => 'X',
    I5 => 'X'
);

u1 : LUT6_2
generic map (
    INIT => X"3333333355555555") -- inverter | inverter
port map (
    O6 => chain(3), -- Inverter 2 output
    O5 => chain(2), -- Inverter 1 output
    I0 => chain(1), -- Inverter 1 input
    I1 => chain(2), -- Inverter 2 input
    I2 => 'X',
    I3 => 'X',
    I4 => 'X',
    I5 => 'X'
);

u2 : LUT6_2
generic map (
    INIT => X"0F0F0F0F88888888") -- and port for enable | inverter
port map (
    O6 => chain(5), -- Inverter output
    O5 => chain(4), -- And output
    I0 => chain(3), -- And input 1
    I1 => enable,   -- And input 2    
    I2 => chain(4), -- Inverter input
    I3 => 'X',
    I4 => 'X',
    I5 => 'X'
);

u3 : LUT6_2
generic map (
    INIT => X"3333333355555555") -- inverter | inverter
port map (
    O6 => chain(7), -- Inverter 2 output
    O5 => chain(6), -- Inverter 1 output
    I0 => chain(5), -- Inverter 1 input
    I1 => chain(6), -- Inverter 2 input
    I2 => 'X',
    I3 => 'X',
    I4 => 'X',
    I5 => 'X'
);

---

--signal chain : std_logic_vector(3 downto 0);

--begin

--u0 : LUT2 generic map (INIT => "1000") -- and port for enable
--port map (O => chain(0), I0 => chain(3), I1 => enable);

--u1 : LUT1 generic map (INIT => "01") -- inverter
--port map (O => chain(1), I0 => chain(0));

--u2 : LUT2 generic map (INIT => "1000") -- and port for enable
--port map (O => chain(2), I0 => chain(1), I1 => enable);

--u3 : LUT1 generic map (INIT => "01") -- inverter
--port map (O => chain(3), I0 => chain(2));

-----

output <= chain(3);

end Behavioral;
