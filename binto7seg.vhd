library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity binto7seg is
    port (
        input: in std_logic_vector(3 downto 0); -- Valor binario a ser mostrado
        display: out std_logic_vector(7 downto 0) -- Leds do Display de 7 seg.
    );
end entity;

architecture behavioral of binto7seg is
    type display_array is array (0 to 15) of std_logic_vector(7 downto 0);
    constant display_table: display_array := (
        "11000000", -- 0
        "11111001", -- 1
        "10100100", -- 2
        "10110000", -- 3
        "10011001", -- 4
        "10010010", -- 5
        "10000010", -- 6
        "11111000", -- 7
        "10000000", -- 8
        "10010000", -- 9
        "10001000", -- A
        "10000011", -- b
        "11000110", -- C
        "10100001", -- d
        "10000110", -- E
        "10001110"  -- F
    );
begin
    process (input)
    begin
        display <= display_table(to_integer(unsigned(input)));
    end process;
end architecture;
