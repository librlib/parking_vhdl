----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.02.2023 22:48:12
-- Design Name: 
-- Module Name: tick_10ms_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tick_10ms_tb is
--  Port ( );
end tick_10ms_tb;

architecture Behavioral of tick_10ms_tb is

    component tick_10ms is
        Port ( clk_in : in STD_LOGIC;
               clk_out : out STD_LOGIC);
    end component;
        
    signal clk_in, clk_out : std_logic := '0';

begin

    uut1: tick_10ms port map(clk_in => clk_in, clk_out => clk_out);
    
    process
    begin
        clk_in <= '1';
        wait for 5 ns;
        clk_in <= '0';
        wait for 5 ns;
    end process;


end Behavioral;
