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

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY sha256_block_tb IS
END sha256_block_tb;
 
ARCHITECTURE behavior OF sha256_block_tb IS 
 
	 -- Component Declaration for the Unit Under Test (UUT)
 
COMPONENT sha256_block
	port (
    clock : in std_logic;
    reset : in std_logic;
    decoder_out : in std_logic;
    decoder_valid : in std_logic;
    sha265_key : out std_logic_vector(255 downto 0);
    sha_finished : out std_logic; 
    sha_start : in std_logic);
END COMPONENT;
	 


	--Inputs
	signal decoder_out : std_logic  := '0';
	signal reset : std_logic := '0';
	signal sha_start : std_logic := '0';
	signal clock : std_logic := '0';
	signal decoder_valid : std_logic := '0';


 	--Outputs
	signal sha_finished : std_logic := '0';
	signal sha265_key : std_logic_vector(255 downto 0);
	signal testPassed: std_logic;
	
	-- Clock period definitions
	constant clock_period : time := 1 ns;
	
	--standard"s test vector's result
	constant hash2b : std_logic_vector(255 downto 0) := x"ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad";
 
BEGIN
 
-- Instantiate the Unit Under Test (UUT)
uut: sha256_block PORT MAP (
    reset => reset,
    clock => clock,
    decoder_out => decoder_out,
    decoder_valid => decoder_valid,
    sha265_key => sha265_key,
    sha_finished => sha_finished,
    sha_start => sha_start
);
      
  

	-- Clock process definitions
	clock_process :process
	begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
	end process;
 

	-- Stimulus process
	stim_proc: process
	begin		
		reset <= '1';
		wait for clock_period;
		reset <= '0';
		--test vector from standard
		decoder_valid <= '1';
		decoder_out <= '1';
		for i in 0 to 85 loop
		  wait for clock_period;
		  decoder_out <= '0';
		  wait for clock_period;
		  decoder_out <= '1';
		end loop;
		decoder_valid <= '0';
		wait for clock_period;
		sha_start <= '1';
		wait for clock_period;
		sha_start <= '0';
		--test vector from standard
		for i in 0 to 85 loop
		  wait for clock_period;
		  decoder_out <= '0';
		  wait for clock_period;
		  decoder_out <= '1';
		end loop;
		decoder_valid <= '0';
		wait for clock_period;
		sha_start <= '1';
		wait for clock_period;
		sha_start <= '0';		
		wait for clock_period*10;
		wait;
	end process;


END;