library ieee;
use ieee.std_logic_1164.all;

entity tb_binto7seg is
end entity;

architecture testbench of tb_binto7seg is

    signal input: std_logic_vector(3 downto 0) := (others => '0');
    signal display: std_logic_vector(7 downto 0);

begin
    bin2seg: entity work.binto7seg(behavioral)
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
        assert (display = "11000000") report "Test Case 0 failed" severity error; -- C0

        -- Test Case 1: Input 1
        input <= "0001";
        wait for 10 ns;
        assert (display = "11111001") report "Test Case 1 failed" severity error; -- F9

        -- Test Case 2: Input 2
        input <= "0010";
        wait for 10 ns;
        assert (display = "10100100") report "Test Case 2 failed" severity error; -- A4

        -- Test Case 3: Input 3
        input <= "0011";
        wait for 10 ns;
        assert (display = "10110000") report "Test Case 3 failed" severity error; -- B0

        -- Test Case 4: Input 4
        input <= "0100";
        wait for 10 ns;
        assert (display = "10011001") report "Test Case 4 failed" severity error; -- 99

        -- Test Case 5: Input 5
        input <= "0101";
        wait for 10 ns;
        assert (display = "10010010") report "Test Case 5 failed" severity error; -- 92

        -- Test Case 6: Input 6
        input <= "0110";
        wait for 10 ns;
        assert (display = "10000010") report "Test Case 6 failed" severity error; -- 82

        -- Test Case 7: Input 7
        input <= "0111";
        wait for 10 ns;
        assert (display = "11111000") report "Test Case 7 failed" severity error; -- F8

        -- Test Case 8: Input 8
        input <= "1000";
        wait for 10 ns;
        assert (display = "10000000") report "Test Case 8 failed" severity error; -- 80

        -- Test Case 9: Input 9
        input <= "1001";
        wait for 10 ns;
        assert (display = "10010000") report "Test Case 9 failed" severity error; -- 90

        -- Test Case 10: Input A
        input <= "1010";
        wait for 10 ns;
        assert (display = "10001000") report "Test Case 10 (A) failed" severity error; -- 88

        -- Test Case 11: Input b
        input <= "1011";
        wait for 10 ns;
        assert (display = "10000011") report "Test Case 11 (b) failed" severity error; -- 83

        -- Test Case 12: Input C
        input <= "1100";
        wait for 10 ns;
        assert (display = "11000110") report "Test Case 12 (C) failed" severity error; -- C6

        -- Test Case 13: Input d
        input <= "1101";
        wait for 10 ns;
        assert (display = "10100001") report "Test Case 13 (d) failed" severity error; -- A1

        -- Test Case 14: Input E
        input <= "1110";
        wait for 10 ns;
        assert (display = "10000110") report "Test Case 14 (E) failed" severity error; -- 86

        -- Test Case 15: Input F
        input <= "1111";
        wait for 10 ns;
        assert (display = "10001110") report "Test Case 15 (F) failed" severity error; -- 8E

        wait;
    end process;

end architecture;