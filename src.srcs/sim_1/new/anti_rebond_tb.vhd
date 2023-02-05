----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.02.2023 20:22:52
-- Design Name: 
-- Module Name: anti_rebond_tb - Behavioral
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

entity anti_rebond_tb is
--  Port ( );
end anti_rebond_tb;

architecture Behavioral of anti_rebond_tb is

    component anti_rebond is
        Port ( clk : in STD_LOGIC;
               sw : in STD_LOGIC;
               m_tick : in STD_LOGIC;
               db : out STD_LOGIC);
    end component;
    
    signal clk, sw, m_tick, db : std_logic;

begin

    uut1: anti_rebond port map(
        clk => clk,
        sw => sw,
        m_tick => m_tick,
        db => db
    );
    
    process
    begin
    
        -- Test pour des rebonds de durée inférieur à 20ms
        
    
    end process;
    
end Behavioral;
