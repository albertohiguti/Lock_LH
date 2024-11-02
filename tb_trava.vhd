library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_trava is
end entity;

architecture testbench of tb_trava is

    signal clock: std_logic := '0';
    signal reset: std_logic := '0';
    signal input: std_logic_vector(7 downto 0) := (others => '0');
    signal segundos: std_logic_vector(7 downto 0);
    signal trav: std_logic;

    constant clock_period : time := 1 sec;

begin
    uut: entity work.trava(behavioral)
        generic map (
            senha => 123,
            tempo_para_desarme => 10
        )
        port map (
            clock => clock,
            reset => reset,
            input => input,
            segundos => segundos,
            trava => trav
        );
    -- Clock process definitions
    clock_process :process
        begin
            for i in 1 to 5 loop
                clock <= '0';
                wait for clock_period/2;
                clock <= '1';
                wait for clock_period/2;
            end loop;
        end process;

    -- Stimulus process
    stim_proc: process
        variable segundos_restantes: integer;
    begin
        -- Initialize Inputs
        reset <= '1';
        input <= (others => '0');
        wait for clock_period;
        reset <= '0';
        wait for clock_period;

        -- Test Case 1: Check initial state after reset
        assert (trav = '1') report "Initial state failed" severity error;

        -- Test Case 2: Input correct password
        input <= "01111011"; -- 123 in binary
        wait for clock_period;
        assert (trav = '0') report "Password correct failed" severity error;

        -- Test Case 3: Input incorrect password
        input <= "00000001"; -- Incorrect password
        wait for clock_period;
        assert (trav = '1') report "Password incorrect failed" severity error;

        -- Test Case 4: Check timer stops decrementing when unlocked
        input <= "01111011"; -- Correct password again
        wait for clock_period;
        assert (trav = '0') report "Unlock failed" severity error;
        segundos_restantes := to_integer(unsigned(segundos));
        wait for 2 * clock_period;
        assert (segundos = std_logic_vector(to_unsigned(segundos_restantes, 8))) report "Timer should not decrement when unlocked" severity error;
        
        -- Test Case 5: Check timer resumes decrementing when locked
        input <= "00000001"; -- Incorrect password
        wait for clock_period;
        assert (trav = '1') report "Lock failed" severity error;
        segundos_restantes := to_integer(unsigned(segundos));
        wait for 2 * clock_period;
        assert (segundos = std_logic_vector(to_unsigned(segundos_restantes - 2, 8))) report "Timer should decrement when locked" severity error;

        -- Test Case 6: Wait for timer to decrement
        wait for 5 * clock_period;
        assert (segundos = "00000000") report "Timer decrement failed" severity error;
        
        wait;
    end process;

end architecture;