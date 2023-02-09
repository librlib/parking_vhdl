----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2023 16:24:13
-- Design Name: 
-- Module Name: counter_2b_tb - Behavioral
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

entity counter_2b_tb is
--  Port ( );
end counter_2b_tb;

architecture Behavioral of counter_2b_tb is

    component counter_2b is
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               cnt : out STD_LOGIC_VECTOR (1 downto 0));
    end component;
    
    signal clk, rst: std_logic := '0';
    signal cnt : std_logic_vector (1 downto 0) := "00";

begin

    uut: counter_2b port map(clk=>clk,rst=>rst,cnt=>cnt);

    clk_proc: process
    begin
        clk <= '1';
        wait for 5 ns;
        clk <= '0';
        wait for 5 ns;
    end process;
    
    rst_process : process
    begin
        rst <= '0';
        wait;
    end process;

end Behavioral;
