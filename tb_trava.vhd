library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity trava_tb is
end entity;

architecture testbench of trava_tb is

    -- Component declaration for the Unit Under Test (UUT)
    component trava is
        generic (
            senha : natural := 123; -- Senha padrão para destravamento
            tempo_para_desarme : natural := 10 -- Tempo padrão para destravamento
        );
        port (
            clock: in std_logic; -- Entrada de clock 1hz para contagem do tempo
            reset: in std_logic; -- Reset do tempo
            input: in std_logic_vector(7 downto 0); -- Chaves para destravar
            segundos: out std_logic_vector(7 downto 0); -- Tempo para desbloqueio
            trava: out std_logic -- Sinal de led: 1 para travado, 0 para destravado
        );
    end component;

    -- Signals to connect to the UUT
    signal clock: std_logic := '0';
    signal reset: std_logic := '0';
    signal input: std_logic_vector(7 downto 0) := (others => '0');
    signal segundos: std_logic_vector(7 downto 0);
    signal trava: std_logic;

    -- Clock period definition
    constant clock_period : time := 1 sec;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: trava
        generic map (
            senha => 123,
            tempo_para_desarme => 10
        )
        port map (
            clock => clock,
            reset => reset,
            input => input,
            segundos => segundos,
            trava => trava
        );

    -- Clock process definitions
    clock_process :process
    begin
        while true loop
            clock <= '0';
            wait for clock_period/2;
            clock <= '1';
            wait for clock_period/2;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize Inputs
        reset <= '1';
        wait for clock_period;
        reset <= '0';
        wait for clock_period;

        -- Test Case 1: Check initial state after reset
        assert (trava = '1') report "Initial state failed" severity error;

        -- Test Case 2: Wait for timer to decrement
        wait for 10 * clock_period;
        assert (segundos = "00000000") report "Timer decrement failed" severity error;

        -- Test Case 3: Input correct password
        input <= "01111011"; -- 123 in binary
        wait for clock_period;
        assert (trava = '0') report "Password correct failed" severity error;

        -- Test Case 4: Input incorrect password
        input <= "00000001"; -- Incorrect password
        wait for clock_period;
        assert (trava = '1') report "Password incorrect failed" severity error;

        -- Test Case 5: Check timer stops decrementing when unlocked
        input <= "01111011"; -- Correct password again
        wait for clock_period;
        assert (trava = '0') report "Unlock failed" severity error;
        wait for 5 * clock_period;
        assert (segundos = "00000010") report "Timer should not decrement when unlocked" severity error;

        -- Finish simulation
        wait;
    end process;

end architecture;