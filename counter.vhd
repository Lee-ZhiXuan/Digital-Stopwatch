-- LeeZhiXuan(TP065525)
-- VLSI Assignment
-- Counter component

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
	port(
		clk : in std_logic;
		enable : in std_logic;
		reset : in std_logic;
		count : out std_logic_vector(5 downto 0);
		full_count : out std_logic
	);
end counter;

architecture behavioral of counter is
	signal i : unsigned(5 downto 0) := "000000";
begin
	process(clk, reset)
	begin	
		-- Test for reset condition
		if reset = '1' then
			i <= "000000";
		
		-- Iterate if rising edge of clock
		elsif rising_edge(clk) then
		
			-- Test for full 60 seconds
			if enable = '1' then
				if i = "111100" then
					i <= "000000";
					full_count <= '1';
				else
					i <= i + 1; -- Iterate if not full 60 seconds
					full_count <= '0';
				end if;
			end if;
		end if;
	end process;
	
	count <= std_logic_vector(i);
end behavioral;
