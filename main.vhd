library ieee;
use ieee.std_logic_1164.all;

entity main is
	
	port (
			clk50: in std_logic; -- G21
			rst: in std_logic; -- D2
			input: in std_logic_vector(0 to 7); -- E3, H7, J7, G5, G4, H6, H5, J6
	
            trav: out std_logic; -- B1
            led_out: out std_logic_vector(7 downto 0) -- C2, C1, E1, F2, H1, J3, J2, J1
			display_dir_out: out std_logic_vector(7 downto 0); -- A18, F14, B17, A17, E15, B16, A16, D15
			display_esq_out: out std_logic_vector(7 downto 0);  -- G16, G15, D19, C19, B19, A19, F15, B18
	);
	
end entity;

architecture struct of main is
	signal clk: std_logic := '0';
	signal display_1: std_logic_vector(3 downto 0) := (others => '1');
	signal display_2: std_logic_vector(3 downto 0) := (others => '1');
	
begin
	 
	clock_div: entity work.clk_div(behavioral)
			port map(clk_in => clk50,
				    clk_out => clk);
						
	trava: entity work.trava(behavioral)
        generic map (
            senha => 3,
            tempo_para_desarme => 255
        )
        port map (
            clock => clk,
            reset => rst,
            input => input,
            segundos(7 downto 4) => display_2,
			segundos(3 downto 0) => display_1,
            trava => trav
        );

    display_esq: entity work.binto7seg(behavioral)
        port map (
            input => display_2,
            display => display_esq_out
        );

    display_dir: entity work.binto7seg(behavioral)
        port map (
            input => display_1,
            display => display_dir_out
        );
	led_out <= input;

end architecture;