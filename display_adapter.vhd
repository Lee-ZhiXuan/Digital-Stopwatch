-- LeeZhiXuan(TP065525)
-- VLSI Assignment
-- Binary to BCD component

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity binary_to_bcd is
	port(
		count : in std_logic_vector(5 downto 0);
		tens : out std_logic_vector(3 downto 0);
		ones : out std_logic_vector(3 downto 0)
	);
end binary_to_bcd;

architecture behavioral of binary_to_bcd is
begin
	process(count)
		-- Variable initialisation
		variable int_count : integer := 0;
		variable int_tens : integer := 0;
		variable int_ones : integer := 0;
		
	begin
		-- Binary to integer
		int_count := to_integer(unsigned(count));
		
		-- Integer to BCD
		int_tens := int_count / 10;
		int_ones := int_count mod 10;
		
		-- BCD to Binary
		tens <= std_logic_vector(to_unsigned(int_tens, 4));
		ones <= std_logic_vector(to_unsigned(int_ones, 4));
	end process;
end behavioral;
