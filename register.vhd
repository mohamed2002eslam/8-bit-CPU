----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:59:40 12/30/2022 
-- Design Name: 
-- Module Name:    register - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity reg is 
port(
	clk : in std_logic;
	rst : in std_logic;
	out_en : in std_logic;
	load	: in std_logic;
	input	: in std_logic_vector(7 downto 0);
	output 	: out std_logic_vector(7 downto 0);
	output_alu : out std_logic_vector(7 downto 0)
);

end entity;


architecture Behavioral of reg is

signal stored_value : std_logic_vector(7 downto 0):=(others=>'Z');

begin

process(clk,rst)
begin
	if rst = '1' then
		stored_value<=(others=>'Z');
	elsif rising_edge(clk) then
		if load = '1' then
			stored_value <= input;
		end if;	
	end if;
end process;


output<= stored_value when out_en = '1' else (others=>'Z');
output_alu<=stored_value;


end Behavioral;

