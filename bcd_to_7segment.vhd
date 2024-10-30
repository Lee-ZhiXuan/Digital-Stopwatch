-- LeeZhiXuan(TP065525)
-- VLSI Assignment
-- BCD to 7-Segment Decoder component

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd_to_7segment is
	port(
		tens : in std_logic_vector(3 downto 0);
		ones : in std_logic_vector(3 downto 0);
		tens_7seg : out std_logic_vector(6 downto 0);
		ones_7seg : out std_logic_vector(6 downto 0)
	);
end bcd_to_7segment;

architecture behavioral of bcd_to_7segment is
begin
	process(tens)
    begin
        case tens is
            when "0000" => tens_7seg <= "0000001"; -- 0
            when "0001" => tens_7seg <= "1001111"; -- 1
            when "0010" => tens_7seg <= "0010010"; -- 2
            when "0011" => tens_7seg <= "0000110"; -- 3
            when "0100" => tens_7seg <= "1001100"; -- 4
            when "0101" => tens_7seg <= "0100100"; -- 5
            when "0110" => tens_7seg <= "0100000"; -- 6
            when "0111" => tens_7seg <= "0001111"; -- 7
            when "1000" => tens_7seg <= "0000000"; -- 8
            when "1001" => tens_7seg <= "0000100"; -- 9
            when others => tens_7seg <= "1111111"; -- Display off
        end case;
    end process;
	 
	 process(ones)
    begin
        case ones is
            when "0000" => ones_7seg <= "0000001"; -- 0
            when "0001" => ones_7seg <= "1001111"; -- 1
            when "0010" => ones_7seg <= "0010010"; -- 2
            when "0011" => ones_7seg <= "0000110"; -- 3
            when "0100" => ones_7seg <= "1001100"; -- 4
            when "0101" => ones_7seg <= "0100100"; -- 5
            when "0110" => ones_7seg <= "0100000"; -- 6
            when "0111" => ones_7seg <= "0001111"; -- 7
            when "1000" => ones_7seg <= "0000000"; -- 8
            when "1001" => ones_7seg <= "0000100"; -- 9
            when others => ones_7seg <= "1111111"; -- Display off
        end case;
    end process;
end behavioral;
