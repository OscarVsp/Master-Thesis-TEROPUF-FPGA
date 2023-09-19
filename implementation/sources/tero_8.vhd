LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
LIBRARY unisim;
USE unisim.vcomponents.ALL;

ENTITY tero_8 IS
    PORT (
        enable : IN STD_LOGIC;
        output : OUT STD_LOGIC
    );
END tero_8;

ARCHITECTURE Behavioral OF tero_8 IS

    ATTRIBUTE DONT_TOUCH : BOOLEAN; --Disable Vivado automatique optimisation
    ATTRIBUTE DONT_TOUCH OF u0 : LABEL IS true;
    ATTRIBUTE DONT_TOUCH OF u1 : LABEL IS true;
    ATTRIBUTE DONT_TOUCH OF u2 : LABEL IS true;
    ATTRIBUTE DONT_TOUCH OF u3 : LABEL IS true;
    ATTRIBUTE DONT_TOUCH OF u4 : LABEL IS true;
    ATTRIBUTE DONT_TOUCH OF u5 : LABEL IS true;
    ATTRIBUTE DONT_TOUCH OF u6 : LABEL IS true;
    ATTRIBUTE DONT_TOUCH OF u7 : LABEL IS true;

    ATTRIBUTE RLOC : STRING; --Keep all LUT in the same CLB
    ATTRIBUTE RLOC OF u0 : LABEL IS "X0Y0";
    ATTRIBUTE RLOC OF u1 : LABEL IS "X0Y0";
    ATTRIBUTE RLOC OF u2 : LABEL IS "X0Y0";
    ATTRIBUTE RLOC OF u3 : LABEL IS "X0Y0";
    ATTRIBUTE RLOC OF u4 : LABEL IS "X1Y0";
    ATTRIBUTE RLOC OF u5 : LABEL IS "X1Y0";
    ATTRIBUTE RLOC OF u6 : LABEL IS "X1Y0";
    ATTRIBUTE RLOC OF u7 : LABEL IS "X1Y0";

    ATTRIBUTE BEL : STRING; --Fix the LUT usage of the slice           
    ATTRIBUTE BEL OF u0 : LABEL IS "A6LUT";
    ATTRIBUTE BEL OF u1 : LABEL IS "B6LUT";
    ATTRIBUTE BEL OF u2 : LABEL IS "C6LUT";
    ATTRIBUTE BEL OF u3 : LABEL IS "D6LUT";
    ATTRIBUTE BEL OF u4 : LABEL IS "A6LUT";
    ATTRIBUTE BEL OF u5 : LABEL IS "B6LUT";
    ATTRIBUTE BEL OF u6 : LABEL IS "C6LUT";
    ATTRIBUTE BEL OF u7 : LABEL IS "D6LUT";

    ATTRIBUTE LOCK_PINS : STRING; --Fix the PIN usage of each LUT
    ATTRIBUTE LOCK_PINS OF u0 : LABEL IS "I0:A2,I1:A4";
    ATTRIBUTE LOCK_PINS OF u1 : LABEL IS "I0:A5";
    ATTRIBUTE LOCK_PINS OF u2 : LABEL IS "I0:A6";
    ATTRIBUTE LOCK_PINS OF u3 : LABEL IS "I0:A4";
    ATTRIBUTE LOCK_PINS OF u4 : LABEL IS "I0:A2,I1:A4";
    ATTRIBUTE LOCK_PINS OF u5 : LABEL IS "I0:A5";
    ATTRIBUTE LOCK_PINS OF u6 : LABEL IS "I0:A6";
    ATTRIBUTE LOCK_PINS OF u7 : LABEL IS "I0:A4";
    SIGNAL internal_loop : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN

    u0 : LUT2
    GENERIC MAP(INIT => "1000") -- AND
    PORT MAP(
        O => internal_loop(0),
        I0 => internal_loop(7),
        I1 => enable
    );

    u1 : LUT1
    GENERIC MAP(INIT => "01") -- INV
    PORT MAP(
        O => internal_loop(1),
        I0 => internal_loop(0)
    );

    u2 : LUT1
    GENERIC MAP(INIT => "01") -- INV
    PORT MAP(
        O => internal_loop(2),
        I0 => internal_loop(1)
    );

    u3 : LUT1
    GENERIC MAP(INIT => "01") -- INV
    PORT MAP(
        O => internal_loop(3),
        I0 => internal_loop(2)
    );

    u4 : LUT2
    GENERIC MAP(INIT => "1000") -- AND
    PORT MAP(
        O => internal_loop(4),
        I0 => internal_loop(3),
        I1 => enable
    );

    u5 : LUT1
    GENERIC MAP(INIT => "01") -- INV
    PORT MAP(
        O => internal_loop(5),
        I0 => internal_loop(4)
    );

    u6 : LUT1
    GENERIC MAP(INIT => "01") -- INV
    PORT MAP(
        O => internal_loop(6),
        I0 => internal_loop(5)
    );

    u7 : LUT1
    GENERIC MAP(INIT => "01") -- INV
    PORT MAP(
        O => internal_loop(7),
        I0 => internal_loop(6)
    );

    output <= internal_loop(3);

END Behavioral;