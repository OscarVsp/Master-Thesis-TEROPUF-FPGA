library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tero_puf_block is
  port (
    clock : in STD_LOGIC;
    enable : in STD_LOGIC;
    pufbit_out : out STD_LOGIC;
    pufbit_valid : out STD_LOGIC;
    ref_counter_limit : in STD_LOGIC_VECTOR ( 15 downto 0 );
    reset : in STD_LOGIC;
    selection0 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    selection1 : in STD_LOGIC_VECTOR ( 4 downto 0 )
  );
end tero_puf_block;

architecture STRUCTURE of tero_puf_block is
component tero_array is
port (
    clock : in STD_LOGIC;
    reset : in STD_LOGIC;
    enable : in STD_LOGIC;
    outputs : out STD_LOGIC_VECTOR ( 31 downto 0 );
    selection : in STD_LOGIC_VECTOR ( 4 downto 0 )
);
end component tero_array;

signal ro_array_outputs_0, ro_array_outputs_1 : STD_LOGIC_VECTOR ( 31 downto 0 );

component muxer is
port (
    inputs : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sel_output : out STD_LOGIC;
    selection : in STD_LOGIC_VECTOR ( 4 downto 0 )
);
end component muxer;
  
signal selected_output_0, selected_output_1 : STD_LOGIC;
  
component counter is
port (
    clk : in STD_LOGIC;
    enable : in STD_LOGIC;
    count : out STD_LOGIC_VECTOR ( 31 downto 0 )
);
end component counter;
  
signal count0, count1, refcounter_count : STD_LOGIC_VECTOR ( 31 downto 0 );
  
component comparator is
generic(equality : std_logic := '0');
port (
    clock : in STD_LOGIC;
    enable : in STD_LOGIC;
    refcount : in STD_LOGIC_VECTOR ( 31 downto 0 );
    count0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    count1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    refcount_limit : in STD_LOGIC_VECTOR ( 15 downto 0 );
    result : out STD_LOGIC;
    finished : out STD_LOGIC
);
end component comparator;



begin

tero_array_0: component tero_array
     port map (
      clock => clock,
      enable => enable,
      outputs(31 downto 0) => ro_array_outputs_0(31 downto 0),
      reset => reset,
      selection(4 downto 0) => selection0(4 downto 0)
    );
tero_array_1: component tero_array
     port map (
      clock => clock,
      enable => enable,
      outputs(31 downto 0) => ro_array_outputs_1(31 downto 0),
      reset => reset,
      selection(4 downto 0) => selection1(4 downto 0)
    );

muxer_0: component muxer
     port map (
      inputs(31 downto 0) => ro_array_outputs_0(31 downto 0),
      sel_output => selected_output_0,
      selection(4 downto 0) => selection0(4 downto 0)
    );
muxer_1: component muxer
     port map (
      inputs(31 downto 0) => ro_array_outputs_1(31 downto 0),
      sel_output => selected_output_1,
      selection(4 downto 0) => selection1(4 downto 0)
    );

counter_0: component counter
     port map (
      clk => selected_output_0,
      count(31 downto 0) => count0(31 downto 0),
      enable => enable
    );
counter_1: component counter
     port map (
      clk => selected_output_1,
      count(31 downto 0) => count1(31 downto 0),
      enable => enable
    );

refcounter: component counter
     port map (
      clk => clock,
      count(31 downto 0) => refcounter_count(31 downto 0),
      enable => enable
    );


compa: component comparator
     generic map(equality => '0')
     port map (
      clock => clock,
      count0(31 downto 0) => count0(31 downto 0),
      count1(31 downto 0) => count1(31 downto 0),
      enable => enable,
      finished => pufbit_valid,
      refcount(31 downto 0) => refcounter_count(31 downto 0),
      refcount_limit(15 downto 0) => ref_counter_limit(15 downto 0),
      result => pufbit_out
    );


end STRUCTURE;
