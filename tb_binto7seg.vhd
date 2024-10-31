library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_binto7seg is
end entity;

architecture testbench of tb_binto7seg is

    -- Component declaration for the Unit Under Test (UUT)
    component binto7seg is
        port (
            input: in std_logic_vector(3 downto 0); -- 4 pinos de entrada
            display: out std_logic_vector(7 downto 0) -- 8 pinos de saída
        );
    end component;

    -- Signals to connect to the UUT
    signal input: std_logic_vector(3 downto 0) := (others => '0');
    signal display: std_logic_vector(7 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: binto7seg
        port map (
            input => input,
            display => display
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test Case 0: Input 0
        input <= "0000";
        wait for 10 ns;
        assert (display = "11000000") report "Test Case 0 failed" severity error;

        -- Test Case 1: Input 1
        input <= "0001";
        wait for 10 ns;
        assert (display = "11111001") report "Test Case 1 failed" severity error;

        -- Test Case 2: Input 2
        input <= "0010";
        wait for 10 ns;
        assert (display = "10100100") report "Test Case 2 failed" severity error;

        -- Test Case 3: Input 3
        input <= "0011";
        wait for 10 ns;
        assert (display = "10110000") report "Test Case 3 failed" severity error;

        -- Test Case 4: Input 4
        input <= "0100";
        wait for 10 ns;
        assert (display = "10011001") report "Test Case 4 failed" severity error;

        -- Test Case 5: Input 5
        input <= "0101";
        wait for 10 ns;
        assert (display = "10010010") report "Test Case 5 failed" severity error;

        -- Test Case 6: Input 6
        input <= "0110";
        wait for 10 ns;
        assert (display = "10000010") report "Test Case 6 failed" severity error;

        -- Test Case 7: Input 7
        input <= "0111";
        wait for 10 ns;
        assert (display = "11111000") report "Test Case 7 failed" severity error;

        -- Test Case 8: Input 8
        input <= "1000";
        wait for 10 ns;
        assert (display = "10000000") report "Test Case 8 failed" severity error;

        -- Test Case 9: Input 9
        input <= "1001";
        wait for 10 ns;
        assert (display = "10010000") report "Test Case 9 failed" severity error;

        -- Test Case 10: Input A
        input <= "1010";
        wait for 10 ns;
        assert (display = "10001000") report "Test Case 10 (A) failed" severity error;

        -- Test Case 11: Input b
        input <= "1011";
        wait for 10 ns;
        assert (display = "10000011") report "Test Case 11 (b) failed" severity error;

        -- Test Case 12: Input C
        input <= "1100";
        wait for 10 ns;
        assert (display = "11000110") report "Test Case 12 (C) failed" severity error;

        -- Test Case 13: Input d
        input <= "1101";
        wait for 10 ns;
        assert (display = "10100001") report "Test Case 13 (d) failed" severity error;

        -- Test Case 14: Input E
        input <= "1110";
        wait for 10 ns;
        assert (display = "10000110") report "Test Case 14 (E) failed" severity error;

        -- Test Case 15: Input F
        input <= "1111";
        wait for 10 ns;
        assert (display = "10001110") report "Test Case 15 (F) failed" severity error;

        -- Finish simulation
        wait;
    end process;

end architecture;