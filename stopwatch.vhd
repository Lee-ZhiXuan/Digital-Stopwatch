-- LeeZhiXuan(TP065525)
-- VLSI Assignment
-- Stopwatch module (top level)

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stopwatch is
	port(
		clk : in std_logic;
		enable : in std_logic;
		reset : in std_logic;
		count_disp : out std_logic_vector(5 downto 0);
		full_count : out std_logic;
		tens : inout std_logic_vector(3 downto 0);
		ones : inout std_logic_vector(3 downto 0);
		tens_7seg : out std_logic_vector(6 downto 0);
		ones_7seg : out std_logic_vector(6 downto 0)
	);
end stopwatch;

architecture structure of stopwatch is
	signal count : std_logic_vector(5 downto 0);
	
	-- Counter component
	component counter is
		port(
			clk : in std_logic;
			enable : in std_logic;
			reset : in std_logic;
			count : out std_logic_vector(5 downto 0);
			full_count : out std_logic
		);
	end component;
	
	-- Binary to BCD component
	component binary_to_bcd is
		port(
			count : in std_logic_vector(5 downto 0);
			tens : out std_logic_vector(3 downto 0);
			ones : out std_logic_vector(3 downto 0)
		);
	end component;
	
	-- BCD to 7-Segment component
	component bcd_to_7segment is
		port(
			tens : in std_logic_vector(3 downto 0);
			ones : in std_logic_vector(3 downto 0);
			tens_7seg : out std_logic_vector(6 downto 0);
			ones_7seg : out std_logic_vector(6 downto 0)
		);
	end component;
	
begin
	u1 : counter port map(
		clk => clk,
		enable => enable,
		reset => reset,
		count => count,
		full_count => full_count
	);
	
	u2 : binary_to_bcd port map(
		count => count,
		tens => tens,
		ones => ones
	);
	
	u3 : bcd_to_7segment port map(
		tens => tens,
		ones => ones,
		tens_7seg => tens_7seg,
		ones_7seg => ones_7seg
	);
	
	count_disp <= count;
end structure;
