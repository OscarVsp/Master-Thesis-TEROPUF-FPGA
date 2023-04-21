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
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

ENTITY sha256 is
	 Port ( reset	 : in  STD_LOGIC;
			  clock	 : in  STD_LOGIC;
			  --input side signals
			  plain	 : in  STD_LOGIC_VECTOR(511 downto 0);
			  load : in  STD_LOGIC;
			  empty	: out STD_LOGIC;
			  --output side signals
			  digest	: out STD_LOGIC_VECTOR (255 downto 0);
			  ready	 : out STD_LOGIC);
end sha256;

ARCHITECTURE Behavioral of sha256 is

	type initT is array (0 to 7) of STD_LOGIC_VECTOR(31 downto 0);
	constant init : initT := (
		x"6a09e667", x"bb67ae85", x"3c6ef372", x"a54ff53a", x"510e527f", x"9b05688c", x"1f83d9ab", x"5be0cd19");
	type kT is array (0 to 63) of STD_LOGIC_VECTOR(31 downto 0);
	constant k : kT := (
		x"428a2f98", x"71374491", x"b5c0fbcf", x"e9b5dba5", x"3956c25b", x"59f111f1", x"923f82a4", x"ab1c5ed5",
		x"d807aa98", x"12835b01", x"243185be", x"550c7dc3", x"72be5d74", x"80deb1fe", x"9bdc06a7", x"c19bf174",
		x"e49b69c1", x"efbe4786", x"0fc19dc6", x"240ca1cc", x"2de92c6f", x"4a7484aa", x"5cb0a9dc", x"76f988da",
		x"983e5152", x"a831c66d", x"b00327c8", x"bf597fc7", x"c6e00bf3", x"d5a79147", x"06ca6351", x"14292967",
		x"27b70a85", x"2e1b2138", x"4d2c6dfc", x"53380d13", x"650a7354", x"766a0abb", x"81c2c92e", x"92722c85",
		x"a2bfe8a1", x"a81a664b", x"c24b8b70", x"c76c51a3", x"d192e819", x"d6990624", x"f40e3585", x"106aa070",
		x"19a4c116", x"1e376c08", x"2748774c", x"34b0bcb5", x"391c0cb3", x"4ed8aa4a", x"5b9cca4f", x"682e6ff3",
		x"748f82ee", x"78a5636f", x"84c87814", x"8cc70208", x"90befffa", x"a4506ceb", x"bef9a3f7", x"c67178f2");
	signal a,b,c,d,e,f,g,h,s0,s1,su0,su1,maj,ch,temp1,temp2 : STD_LOGIC_VECTOR(31 downto 0);
	type wT is array (15 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
	signal w : wT;
	signal wCNT, chunkCNT : STD_LOGIC_VECTOR(6 downto 0);
	signal intEnable : STD_LOGIC;

BEGIN

	fsm: process(clock)
	begin
		if rising_edge(clock) then
			if reset = '1' then
				chunkCNT <= "1000010";
				intEnable <= '0';
			else
				if chunkCNT = "1000010" then
					if load = '1' then
						chunkCNT <= "0000000";
						intEnable <= '1';
					end if;
				else
					chunkCNT <= chunkCNT + '1';
				end if;
				if chunkCNT = "1000000" then
					intEnable <= '0';
				end if;
			end if;
		end if;
	end process;
	
	ready <= '1' when chunkCNT = "1000001" else '0';
	empty <= '1' when chunkCNT = "1000010" else '0';
	
	extension_pipe: process(clock)
	begin
		if rising_edge(clock) then
			if reset = '1' then
				w(0) <= (others => '0');
				w(1) <= (others => '0');
				w(2) <= (others => '0');
				w(3) <= (others => '0');
				w(4) <= (others => '0');
				w(5) <= (others => '0');
				w(6) <= (others => '0');
				w(7) <= (others => '0');
				w(8) <= (others => '0');
				w(9) <= (others => '0');
				w(10) <= (others => '0');
				w(11) <= (others => '0');
				w(12) <= (others => '0');
				w(13) <= (others => '0');
				w(14) <= (others => '0');
				w(15) <= (others => '0');
			elsif load = '1' and intEnable = '0' then
				w(0) <= plain(31 downto 0);
				w(1) <= plain(63 downto 32);
				w(2) <= plain(95 downto 64);
				w(3) <= plain(127 downto 96);
				w(4) <= plain(159 downto 128);
				w(5) <= plain(191 downto 160);
				w(6) <= plain(223 downto 192);
				w(7) <= plain(255 downto 224);
				w(8) <= plain(287 downto 256);
				w(9) <= plain(319 downto 288);
				w(10) <= plain(351 downto 320);
				w(11) <= plain(383 downto 352);
				w(12) <= plain(415 downto 384);
				w(13) <= plain(447 downto 416);
				w(14) <= plain(479 downto 448);
				w(15) <= plain(511 downto 480);
			elsif intEnable = '1' then
				w <= w(14 downto 0) & (w(15) + s0 + w(6) + s1);
			end if;
		end if;
	end process;
	--extension_pipe asynchron circuitry
	s0 <= (w(14)(6 downto 0) & w(14)(31 downto 7)) xor (w(14)(17 downto 0) & w(14)(31 downto 18)) xor ("000" & w(14)(31 downto 3));
	s1 <= (w(1)(16 downto 0) & w(1)(31 downto 17)) xor (w(1)(18 downto 0) & w(1)(31 downto 19)) xor ("0000000000" & w(1)(31 downto 10));
	--end of extension_pipe asynchron circuitry

	main_loop_pipe: process(clock)
	begin
		if rising_edge(clock) then
			if reset = '1' then
				a <= (others => '0');
				b <= (others => '0');
				c <= (others => '0');
				d <= (others => '0');
				e <= (others => '0');
				f <= (others => '0');
				g <= (others => '0');
				h <= (others => '0');
			elsif (load = '1' and intEnable = '0') or chunkCNT = "1000000" then
				a <= a + init(0);
				b <= b + init(1);
				c <= c + init(2);
				d <= d + init(3);
				e <= e + init(4);
				f <= f + init(5);
				g <= g + init(6);
				h <= h + init(7);
			elsif intEnable = '1' then
				h <= g;
				g <= f;
				f <= e;
				e <= d + temp1;
				d <= c;
				c <= b;
				b <= a;
				a <= temp2;
			end if;
		end if;
	end process;
	--main_loop_pipe asynchron circuitry
	su1 <= (e(5 downto 0) & e(31 downto 6)) xor (e(10 downto 0) & e(31 downto 11)) xor (e(24 downto 0) & e(31 downto 25));
	ch <= (e and f) xor ((not e) and g);
	temp1 <= h + su1 + ch + k(CONV_INTEGER(chunkCNT(5 downto 0))) + w(15);
	su0 <= (a(1 downto 0) & a(31 downto 2)) xor (a(12 downto 0) & a(31 downto 13)) xor (a(21 downto 0) & a(31 downto 22));
	maj <= (a and (b xor c)) xor (b and c);
	temp2 <= temp1 + su0 + maj;
	--end of main_loop_pipe asynchron circuitry

	digest <= a & b & c & d & e & f & g & h;

end Behavioral;