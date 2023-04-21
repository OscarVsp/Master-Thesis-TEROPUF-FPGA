LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY sha256_block IS
port (
    clock : in std_logic;
    reset : in std_logic;
    decoder_out : in std_logic;
    decoder_valid : in std_logic;
    sha256_out : out std_logic_vector(255 downto 0);
    sha256_valid : out std_logic; 
    start : in std_logic);
END sha256_block;
 
ARCHITECTURE STRUCTURE OF sha256_block IS

signal padded_block : std_logic_vector(511 downto 0);
signal empty : std_logic;

COMPONENT sha256_pad
Port ( 
    dec_out : in std_logic;
    dec_valid : in std_logic;
    reset : in std_logic;
    clock : in std_logic;
    padded_block : out std_logic_vector(511 downto 0))
  ;
END COMPONENT;

COMPONENT sha256
Port ( 
    reset	 : in  STD_LOGIC;
    clock	 : in  STD_LOGIC;
    --input side signals
    plain	 : in  STD_LOGIC_VECTOR(511 downto 0);
    load : in  STD_LOGIC;
    empty	: out STD_LOGIC;
    --output side signals
    digest	: out STD_LOGIC_VECTOR (255 downto 0);
    ready	 : out STD_LOGIC)
  ;
END COMPONENT; 
BEGIN
 
pad: sha256_pad PORT MAP (
    reset => reset,
    clock => clock,
    dec_out => decoder_out,
    padded_block => padded_block,
    dec_valid => decoder_valid
);
      
sha: sha256 PORT MAP (
    reset => reset,
    clock => clock,
    plain => padded_block,
    load => start,
    digest => sha256_out,
    ready => sha256_valid,
    empty => empty
);
END STRUCTURE;