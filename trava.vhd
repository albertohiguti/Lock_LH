library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity trava is
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
end entity;

architecture behavioral of trava is

begin
    process(clock, reset)

	variable timer: natural range 0 to 255;
    
    begin
        if reset = '1' then
            timer := tempo_para_desarme;
            trava <= '1'; -- Bloqueado
        elsif rising_edge(clock) then
            if timer > 0 then
                if unsigned(input) = senha then
                    trava <= '0'; -- Desbloqueado
                else
                    trava <= '1'; -- Bloqueado
                    timer := timer - 1;
                end if;
            else
                trava <= '1'; -- Bloqueado
            end if;
        end if;

        -- Atualiza o valor de segundos com o valor do timer
        segundos <= std_logic_vector(to_unsigned(timer, 8));

    end process;
    
end architecture;