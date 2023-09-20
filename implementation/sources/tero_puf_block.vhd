LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY tero_puf_block IS
	GENERIC (
		select_size : INTEGER := 5;
		counter_size : INTEGER := 16;
		ref_counter_size : INTEGER := 16
	);
	PORT (
		clock, enable, reset : IN STD_LOGIC;
		selection_A, selection_B : IN STD_LOGIC_VECTOR (select_size - 1 DOWNTO 0);
		refcounter_limit : IN STD_LOGIC_VECTOR (ref_counter_size - 1 DOWNTO 0);
		pufbit_out, pufbit_valid : OUT STD_LOGIC
	);
END tero_puf_block;

ARCHITECTURE STRUCTURE OF tero_puf_block IS

	COMPONENT tero_array IS
		GENERIC (select_size : INTEGER := 5);
		PORT (
			clock : IN STD_LOGIC;
			reset : IN STD_LOGIC;
			enable : IN STD_LOGIC;
			selection : IN STD_LOGIC_VECTOR (select_size - 1 DOWNTO 0);
			outputs : OUT STD_LOGIC_VECTOR (2 ** select_size - 1 DOWNTO 0)
		);
	END COMPONENT tero_array;

	COMPONENT muxer IS
		GENERIC (select_size : INTEGER := 5);
		PORT (
			inputs : IN STD_LOGIC_VECTOR (2 ** select_size - 1 DOWNTO 0);
			selection : IN STD_LOGIC_VECTOR (select_size - 1 DOWNTO 0);
			sel_output : OUT STD_LOGIC
		);
	END COMPONENT muxer;

	COMPONENT counter IS
		GENERIC (size : INTEGER := 16);
		PORT (
			clk : IN STD_LOGIC;
			enable : IN STD_LOGIC;
			count : OUT STD_LOGIC_VECTOR (size - 1 DOWNTO 0)
		);
	END COMPONENT counter;

	COMPONENT comparator IS
		GENERIC (
			equality : STD_LOGIC := '0';
			counter_size : INTEGER := 16;
		    ref_counter_size : INTEGER := 16
		);
		PORT (
			clock : IN STD_LOGIC;
			enable : IN STD_LOGIC;
			count_A : IN STD_LOGIC_VECTOR (counter_size - 1 DOWNTO 0);
			count_B : IN STD_LOGIC_VECTOR (counter_size - 1 DOWNTO 0);
			refcount : IN STD_LOGIC_VECTOR (ref_counter_size - 1 DOWNTO 0);
			refcount_limit : IN STD_LOGIC_VECTOR (ref_counter_size - 1 DOWNTO 0);
			result : OUT STD_LOGIC;
			finished : OUT STD_LOGIC
		);
	END COMPONENT comparator;

	SIGNAL array_outputs_A, array_outputs_B : STD_LOGIC_VECTOR (2 ** select_size - 1 DOWNTO 0);
	SIGNAL selected_output_A, selected_output_B : STD_LOGIC;
	SIGNAL count_A, count_B : STD_LOGIC_VECTOR (counter_size - 1 DOWNTO 0);
	SIGNAL refcounter_count : STD_LOGIC_VECTOR (ref_counter_size - 1 DOWNTO 0);

BEGIN

	tero_array_A : COMPONENT tero_array
		GENERIC MAP(select_size => select_size)
		PORT MAP(
			clock => clock,
			enable => enable,
			reset => reset,
			selection(4 DOWNTO 0) => selection_A(4 DOWNTO 0),
			outputs(2 ** select_size - 1 DOWNTO 0) => array_outputs_A(2 ** select_size - 1 DOWNTO 0)
		);
	tero_array_B : COMPONENT tero_array
		GENERIC MAP(select_size => select_size)
		PORT MAP(
			clock => clock,
			enable => enable,
			reset => reset,
			selection(4 DOWNTO 0) => selection_B(4 DOWNTO 0),
			outputs(2 ** select_size - 1 DOWNTO 0) => array_outputs_B(2 ** select_size - 1 DOWNTO 0)
		);

	muxer_A : COMPONENT muxer
		GENERIC MAP(select_size => select_size)
		PORT MAP(
			inputs(2 ** select_size - 1 DOWNTO 0) => array_outputs_A(2 ** select_size - 1 DOWNTO 0),
			selection(select_size - 1 DOWNTO 0) => selection_A(select_size - 1 DOWNTO 0),
			sel_output => selected_output_A
		);
	muxer_B : COMPONENT muxer
		GENERIC MAP(select_size => select_size)
		PORT MAP(
			inputs(2 ** select_size - 1 DOWNTO 0) => array_outputs_B(2 ** select_size - 1 DOWNTO 0),
			selection(select_size - 1 DOWNTO 0) => selection_B(select_size - 1 DOWNTO 0),
			sel_output => selected_output_B
		);

	counter_A : COMPONENT counter
		GENERIC MAP(size => counter_size)
		PORT MAP(
			clk => selected_output_A,
			enable => enable,
			count(counter_size - 1 DOWNTO 0) => count_A(counter_size - 1 DOWNTO 0)
		);
	counter_B : COMPONENT counter
		GENERIC MAP(size => counter_size)
		PORT MAP(
			clk => selected_output_B,
			enable => enable,
			count(counter_size - 1 DOWNTO 0) => count_B(counter_size - 1 DOWNTO 0)
		);

	refcounter : COMPONENT counter
		GENERIC MAP(size => ref_counter_size)
		PORT MAP(
			clk => clock,
			enable => enable,
			count(ref_counter_size - 1 DOWNTO 0) => refcounter_count(ref_counter_size - 1 DOWNTO 0)
		);
	compa : COMPONENT comparator
		GENERIC MAP(
			equality => '0',
			counter_size => counter_size,
			ref_counter_size => ref_counter_size
		)
		PORT MAP(
			clock => clock,
			enable => enable,
			count_A(counter_size - 1 DOWNTO 0) => count_A(counter_size - 1 DOWNTO 0),
			count_B(counter_size - 1 DOWNTO 0) => count_B(counter_size - 1 DOWNTO 0),
			refcount(ref_counter_size - 1 DOWNTO 0) => refcounter_count(ref_counter_size - 1 DOWNTO 0),
			refcount_limit(ref_counter_size - 1 DOWNTO 0) => refcounter_limit(ref_counter_size - 1 DOWNTO 0),
			finished => pufbit_valid,
			result => pufbit_out
		);
END STRUCTURE;