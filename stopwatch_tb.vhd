-- LeeZhiXuan(TP065525)
-- VLSI Assignment
-- Stopwatch testbench

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stopwatch_tb is
end stopwatch_tb;

architecture behavioral of stopwatch_tb is

	-- Input signals
	signal clk : std_logic := '0';
	signal enable : std_logic := '0';
	signal reset : std_logic := '0';
	
	-- Output signals
	signal count_disp : std_logic_vector(5 downto 0);
	signal full_count : std_logic;
	signal tens : std_logic_vector(3 downto 0);
	signal ones : std_logic_vector(3 downto 0);
	signal tens_7seg : std_logic_vector(6 downto 0);
	signal ones_7seg : std_logic_vector(6 downto 0);
	
	-- Constant clock signal
	constant clk_period : time := 1000 ms;
	
	component stopwatch
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
	end component;
	
begin
	-- Instantiate stopwatch 
	uut : stopwatch 
		port map(
			clk => clk,
			enable => enable,
			reset => reset,
			count_disp => count_disp,
			full_count => full_count,
			tens => tens,
			ones => ones,
			tens_7seg => tens_7seg,
			ones_7seg => ones_7seg
		);
	
	-- Clock generation
	clk_process : process
	begin
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
	end process;
	
	-- Tests
	stim_proc : process
	begin	
		-- Reset
		reset <= '1';
		wait for clk_period;
		
		-- Start stopwatch
		reset <= '0';
		enable <= '1';
		wait for 5 * clk_period; -- Run for 5 seconds
		
		-- Pause stopwatch
		enable <= '0';
		wait for 2 * clk_period; -- Pause for 2 seconds
		
		-- Resume stopwatch
		enable <= '1';
		wait for 4.5 * clk_period; -- Run for 5 seconds
		
		-- Reset stopwatch
		reset <= '1';
		wait for clk_period;
		
		-- Restart stopwatch
		reset <= '0';
		wait for 70 * clk_period; -- Run for more than 60 seconds
		
		wait;
	end process;
end behavioral;
