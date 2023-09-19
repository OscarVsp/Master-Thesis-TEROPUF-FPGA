LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.const.ALL;

ENTITY nexys_main_block IS
    GENERIC (
        cell_select_size : INTEGER := 5;
        counter_size : INTEGER := 16;
        ref_counter_size : INTEGER := 16;
        default_ref_limit_counter : INTEGER := 200
    );
    PORT (
        clock, reset : IN STD_LOGIC;

        --AXI
        wready, bvalid : IN STD_LOGIC;
        bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        arready, rvalid : IN STD_LOGIC;
        rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        awvalid, wvalid, bready : OUT STD_LOGIC;
        awaddr : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        arvalid, rready : OUT STD_LOGIC;
        araddr : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);

        --DEBUG
        debuging_sw : IN STD_LOGIC;
        debuging_output_0, debuging_output_1 : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
        debuging_output_array : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)

    );
END nexys_main_block;

ARCHITECTURE STRUCTURE OF nexys_main_block IS

    COMPONENT control IS
        GENERIC (cell_select_size : INTEGER := 5);
        PORT (
            clock, reset, pufbit_valid, decode_valid, sha256_valid : IN STD_LOGIC;
            write_finished, read_finished : IN STD_LOGIC;
            gen_state : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            select_A, select_B : OUT STD_LOGIC_VECTOR(cell_select_size - 1 DOWNTO 0);
            enable_counting, sha256_start, sha256_reset, write_out : OUT STD_LOGIC;
            decoder_reset : OUT BIT
            led_1 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
        );
    END COMPONENT control;

    COMPONENT axi IS
        GENERIC (
            ref_counter_size : INTEGER := 16;
            default_ref_limit_counter : INTEGER := 200
        );
        PORT (
            clock, reset : IN STD_LOGIC;
            dec_out, dec_valid : IN STD_LOGIC;
            pufbit_out, pufbit_valid : IN STD_LOGIC;
            sha256_out : IN STD_LOGIC_VECTOR(255 DOWNTO 0);
            sha256_valid : IN STD_LOGIC;
            write_out : STD_LOGIC;

            wready, bvalid : IN STD_LOGIC;
            bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            arready, rvalid : IN STD_LOGIC;
            rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

            awvalid, wvalid, bready : OUT STD_LOGIC;
            awaddr : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
            arvalid, rready : OUT STD_LOGIC;
            araddr : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);

            write_finished, read_finished : OUT STD_LOGIC;
            gen_state_out : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
            syndrome : OUT STD_LOGIC_VECTOR(nk - 1 DOWNTO 0);

            led_0 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0); --Debug only

            refcounter_limit : OUT STD_LOGIC_VECTOR(ref_counter_size - 1 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT tero_puf_block IS
        GENERIC (
            select_size : INTEGER := 5;
            counter_size : INTEGER := 16;
            ref_counter_size : INTEGER := 16
        );
        PORT (
            clock, enable, reset : IN STD_LOGIC;
            selection_A, selection_B : IN STD_LOGIC_VECTOR (select_size - 1 DOWNTO 0);
            ref_counter_limit : IN STD_LOGIC_VECTOR (ref_counter_size - 1 DOWNTO 0);
            pufbit_out, pufbit_valid : OUT STD_LOGIC
        );
    END COMPONENT tero_puf_block;

    COMPONENT decoder_block IS
        PORT (
            pufbit_out, pufbit_valid, clock, reset, decode_reset : IN STD_LOGIC;
            syndrome_in : IN STD_LOGIC_VECTOR(nk - 1 DOWNTO 0);
            decoder_valid, decoder_out : OUT BIT
        );
    END COMPONENT decoder_block;

    COMPONENT sha256_block IS
        PORT (
            clock, reset, decoder_out, decoder_valid, start : IN STD_LOGIC;
            sha256_out : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
            sha256_valid : OUT STD_LOGIC;
        );
    END COMPONENT sha256_block;

    COMPONENT debug_block IS
        PORT (
            enable_counting, pufbit_valid, decoder_valid, sha256_valid, sha256_start, decoder_reset, sha256_reset : IN STD_LOGIC;
            clock, reset, debuging_sw, write_finished, read_finished, write_out : IN STD_LOGIC;
            gen_state : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
            ref_counter_limit : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            debuging_output : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT debug_block;

    SIGNAL pufbit_valid, decoder_valid, sha256_valid, write_finished, read_finished, enable_puf, sha256_start, sha256_reset, write_out : STD_LOGIC;
    SIGNAL dec_out, pufbit_out : STD_LOGIC;
    SIGNAL sha256_out : STD_LOGIC_VECTOR(255 DOWNTO 0);
    SIGNAL gen_state : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL select_A, select_B : OUT STD_LOGIC_VECTOR(cell_select_size - 1 DOWNTO 0);
    SIGNAL syndrome : STD_LOGIC_VECTOR(nk - 1 DOWNTO 0);
    SIGNAL refcounter_limit : STD_LOGIC_VECTOR(ref_counter_size - 1 DOWNTO 0);
    SIGNAL decoder_reset : BIT;


BEGIN

    ctrl : COMPONENT control
        GENERIC MAP(
            select_size => cell_select_size
        )
        PORT MAP(
            clock => clock, reset => reset, pufbit_valid => pufbit_valid, decoder_valid => decoder_valid, sha256_valid => sha256_valid,
            write_finished => write_finished, V => read_finished, gen_state => gen_state,
            select_A => select_A, select_B => select_B, enable_counting => enable_puf,
            sha256_start => sha256_start, decoder_reset => decoder_reset, sha256_reset => sha256_reset, write_out => write_out,
            led_1 => debuging_output_1
        );

    axi_com : COMPONENT axi
        GENERIC MAP(
            ref_counter_size => ref_counter_size;
            default_ref_limit_counter => default_ref_limit_counter
        )
        PORT MAP(
            clock => clock, reset => reset, dec_out => dec_out, dec_valid => decode_valid, pufbit_out => pufbit_out, pufbit_valid => pufbit_valid,
            sha256_out => sha256_out, sha256_valid => sha256_valid, write_out => write_out,
            wready => wready, bvalid => bvalid, bresp => bresp, arready => arready, rvalid => rvalid, rdata => rdata, rresp => rresp,
            awvalid => awvalid, wvalid => wvalid, bready => bready, awaddr => awaddr, wdata => wdata, arvalid => arvalid, rready => rready, araddr => araddr,
            write_finished => write_finished, read_finished => read_finished, gen_state_out => gen_state, syndrome => syndrome, refcounter_limit => refcounter_limit,
            led_0 => debuging_output_0
        );

    puf : COMPONENT tero_puf_block
        GENERIC MAP(
            select_size => cell_select_size, counter_size => counter_size, ref_counter_size => ref_counter_size
        )
        PORT MAP(
            clock => clock, reset => reset, enable => enable_puf, selection_A => select_A, selection_B => select_B, ref_counter_limit => ref_counter_limit,
            pufbit_out => pufbit_out, pufbit_valid => pufbit_valid
        )

    decoder : COMPONENT decoder_block
        PORT MAP(
            clock => clock, reset => reset, decoder_reset => decoder_reset, pufbit_out => pufbit_out, pufbit_valid => pufbit_valid, syndrome_in => syndrome,
            decoder_valid => decoder_valid, decoder_out => dec_out
        )

    sha : COMPONENT sha256_block 
        PORT MAP(
            clock => clock, reset => sha256_reset, decoder_out => dec_out, decoder_valid => decoder_valid, start => sha256_start,
            sha256_out => sha256_out, sha256_valid => sha256_valid
        )

    debug : COMPONENT debug_block
        PORT MAP(
            clock => clock, reset -> reset, enable_counting => enable_puf, pufbit_valid => pufbit_valid, decoder_valid  => decoder_valid, sha256_valid => sha256_valid,
            sha256_start => sha256_start, decoder_reset => decoder_reset, sha256_reset => sha256_reset, debuging_sw => debuging_sw, write_finished => write_finished, write_finished => write_finished,
            write_out => write_out, gen_state => gen_state, ref_counter_limit => ref_counter_limit, debuging_output => debuging_output_array
        )


    END STRUCTURE;