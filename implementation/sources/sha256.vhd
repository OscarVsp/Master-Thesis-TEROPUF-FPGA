--Implementation based upon https://csrc.nist.gov/csrc/media/publications/fips/180/2/archive/2002-08-01/documents/fips180-2.pdf

--MIT License
--
--Copyright (c) 2018 Balazs Valer Fekete
--
--Permission is hereby granted, free of charge, to any person obtaining a copy
--of this software and associated documentation files (the "Software"), to deal
--in the Software without restriction, including without limitation the rights
--to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
--copies of the Software, and to permit persons to whom the Software is
--furnished to do so, subject to the following conditions:
--
--The above copyright notice and this permission notice shall be included in all
--copies or substantial portions of the Software.
--
--THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
--AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
--OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
--SOFTWARE.

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY sha256 IS
	PORT (
		reset : IN STD_LOGIC;
		clock : IN STD_LOGIC;
		--input side signals
		plain : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
		load : IN STD_LOGIC;
		empty : OUT STD_LOGIC;
		--output side signals
		digest : OUT STD_LOGIC_VECTOR (255 DOWNTO 0);
		ready : OUT STD_LOGIC);
END sha256;

ARCHITECTURE Behavioral OF sha256 IS

	TYPE initT IS ARRAY (0 TO 7) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
	CONSTANT init : initT := (
		x"6a09e667", x"bb67ae85", x"3c6ef372", x"a54ff53a", x"510e527f", x"9b05688c", x"1f83d9ab", x"5be0cd19");
	TYPE kT IS ARRAY (0 TO 63) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
	CONSTANT k : kT := (
		x"428a2f98", x"71374491", x"b5c0fbcf", x"e9b5dba5", x"3956c25b", x"59f111f1", x"923f82a4", x"ab1c5ed5",
		x"d807aa98", x"12835b01", x"243185be", x"550c7dc3", x"72be5d74", x"80deb1fe", x"9bdc06a7", x"c19bf174",
		x"e49b69c1", x"efbe4786", x"0fc19dc6", x"240ca1cc", x"2de92c6f", x"4a7484aa", x"5cb0a9dc", x"76f988da",
		x"983e5152", x"a831c66d", x"b00327c8", x"bf597fc7", x"c6e00bf3", x"d5a79147", x"06ca6351", x"14292967",
		x"27b70a85", x"2e1b2138", x"4d2c6dfc", x"53380d13", x"650a7354", x"766a0abb", x"81c2c92e", x"92722c85",
		x"a2bfe8a1", x"a81a664b", x"c24b8b70", x"c76c51a3", x"d192e819", x"d6990624", x"f40e3585", x"106aa070",
		x"19a4c116", x"1e376c08", x"2748774c", x"34b0bcb5", x"391c0cb3", x"4ed8aa4a", x"5b9cca4f", x"682e6ff3",
		x"748f82ee", x"78a5636f", x"84c87814", x"8cc70208", x"90befffa", x"a4506ceb", x"bef9a3f7", x"c67178f2");
	SIGNAL a, b, c, d, e, f, g, h, s0, s1, su0, su1, maj, ch, temp1, temp2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	TYPE wT IS ARRAY (15 DOWNTO 0) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL w : wT;
	SIGNAL wCNT, chunkCNT : STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL intEnable : STD_LOGIC;

BEGIN

	fsm : PROCESS (clock)
	BEGIN
		IF rising_edge(clock) THEN
			IF reset = '1' THEN
				chunkCNT <= "1000010";
				intEnable <= '0';
			ELSE
				IF chunkCNT = "1000010" THEN
					IF load = '1' THEN
						chunkCNT <= "0000000";
						intEnable <= '1';
					END IF;
				ELSE
					chunkCNT <= chunkCNT + '1';
				END IF;
				IF chunkCNT = "1000000" THEN
					intEnable <= '0';
				END IF;
			END IF;
		END IF;
	END PROCESS;

	ready <= '1' WHEN chunkCNT = "1000001" ELSE
		'0';
	empty <= '1' WHEN chunkCNT = "1000010" ELSE
		'0';

	extension_pipe : PROCESS (clock)
	BEGIN
		IF rising_edge(clock) THEN
			IF reset = '1' THEN
				w(0) <= (OTHERS => '0');
				w(1) <= (OTHERS => '0');
				w(2) <= (OTHERS => '0');
				w(3) <= (OTHERS => '0');
				w(4) <= (OTHERS => '0');
				w(5) <= (OTHERS => '0');
				w(6) <= (OTHERS => '0');
				w(7) <= (OTHERS => '0');
				w(8) <= (OTHERS => '0');
				w(9) <= (OTHERS => '0');
				w(10) <= (OTHERS => '0');
				w(11) <= (OTHERS => '0');
				w(12) <= (OTHERS => '0');
				w(13) <= (OTHERS => '0');
				w(14) <= (OTHERS => '0');
				w(15) <= (OTHERS => '0');
			ELSIF load = '1' AND intEnable = '0' THEN
				w(0) <= plain(31 DOWNTO 0);
				w(1) <= plain(63 DOWNTO 32);
				w(2) <= plain(95 DOWNTO 64);
				w(3) <= plain(127 DOWNTO 96);
				w(4) <= plain(159 DOWNTO 128);
				w(5) <= plain(191 DOWNTO 160);
				w(6) <= plain(223 DOWNTO 192);
				w(7) <= plain(255 DOWNTO 224);
				w(8) <= plain(287 DOWNTO 256);
				w(9) <= plain(319 DOWNTO 288);
				w(10) <= plain(351 DOWNTO 320);
				w(11) <= plain(383 DOWNTO 352);
				w(12) <= plain(415 DOWNTO 384);
				w(13) <= plain(447 DOWNTO 416);
				w(14) <= plain(479 DOWNTO 448);
				w(15) <= plain(511 DOWNTO 480);
			ELSIF intEnable = '1' THEN
				w <= w(14 DOWNTO 0) & (w(15) + s0 + w(6) + s1);
			END IF;
		END IF;
	END PROCESS;
	--extension_pipe asynchron circuitry
	s0 <= (w(14)(6 DOWNTO 0) & w(14)(31 DOWNTO 7)) XOR (w(14)(17 DOWNTO 0) & w(14)(31 DOWNTO 18)) XOR ("000" & w(14)(31 DOWNTO 3));
	s1 <= (w(1)(16 DOWNTO 0) & w(1)(31 DOWNTO 17)) XOR (w(1)(18 DOWNTO 0) & w(1)(31 DOWNTO 19)) XOR ("0000000000" & w(1)(31 DOWNTO 10));
	--end of extension_pipe asynchron circuitry

	main_loop_pipe : PROCESS (clock)
	BEGIN
		IF rising_edge(clock) THEN
			IF reset = '1' THEN
				a <= (OTHERS => '0');
				b <= (OTHERS => '0');
				c <= (OTHERS => '0');
				d <= (OTHERS => '0');
				e <= (OTHERS => '0');
				f <= (OTHERS => '0');
				g <= (OTHERS => '0');
				h <= (OTHERS => '0');
			ELSIF (load = '1' AND intEnable = '0') OR chunkCNT = "1000000" THEN
				a <= a + init(0);
				b <= b + init(1);
				c <= c + init(2);
				d <= d + init(3);
				e <= e + init(4);
				f <= f + init(5);
				g <= g + init(6);
				h <= h + init(7);
			ELSIF intEnable = '1' THEN
				h <= g;
				g <= f;
				f <= e;
				e <= d + temp1;
				d <= c;
				c <= b;
				b <= a;
				a <= temp2;
			END IF;
		END IF;
	END PROCESS;
	--main_loop_pipe asynchron circuitry
	su1 <= (e(5 DOWNTO 0) & e(31 DOWNTO 6)) XOR (e(10 DOWNTO 0) & e(31 DOWNTO 11)) XOR (e(24 DOWNTO 0) & e(31 DOWNTO 25));
	ch <= (e AND f) XOR ((NOT e) AND g);
	temp1 <= h + su1 + ch + k(CONV_INTEGER(chunkCNT(5 DOWNTO 0))) + w(15);
	su0 <= (a(1 DOWNTO 0) & a(31 DOWNTO 2)) XOR (a(12 DOWNTO 0) & a(31 DOWNTO 13)) XOR (a(21 DOWNTO 0) & a(31 DOWNTO 22));
	maj <= (a AND (b XOR c)) XOR (b AND c);
	temp2 <= temp1 + su0 + maj;
	--end of main_loop_pipe asynchron circuitry

	digest <= a & b & c & d & e & f & g & h;

END Behavioral;