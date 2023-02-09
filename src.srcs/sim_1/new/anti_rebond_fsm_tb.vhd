----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2023 14:55:46
-- Design Name: 
-- Module Name: anti_rebond_fsm_tb - Behavioral
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

entity anti_rebond_fsm_tb is
--  Port ( );
end anti_rebond_fsm_tb;

architecture Behavioral of anti_rebond_fsm_tb is

    component anti_rebond_fsm is
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               sw : in STD_LOGIC;
               m_tick : in STD_LOGIC;
               db : out STD_LOGIC);
    end component;
    
    signal clk,rst,sw,m_tick,db : std_logic := '0';

begin

    uut1: anti_rebond_fsm port map(
        clk => clk,
        rst => rst,
        sw => sw,
        m_tick => m_tick,
        db => db
    );

    clk_proc : process -- 100Mhz clock
        begin
            clk <= '1';
            wait for 5 ns;
            clk <= '0';
            wait for 5 ns;
        end process;
        
    rst_proc : process
    begin
        rst <= '0';
        wait for 135 ms; -- Reset when sw supposed to be on
        rst <= '1';
        wait for 10 ms;
        rst <= '0';
        wait;
    end process;
    
    m_tick_proc : process
    begin
        m_tick <= '1';
        wait for 10 ns;
        m_tick <= '0';
        wait for 10 ms - 10 ns;    
    end process;
    
    sw_proc : process
    begin
        wait for 15 ns;
    
        sw <= '1';
        wait for 1 ms;
        sw <= '0';
        wait for 1 ms;
        
        sw <= '1';
        wait for 5 ms;
        sw <= '0';
        wait for 5 ms;
        
        sw <= '1';
        wait for 10 ms;
        sw <= '0';
        wait for 10 ms;
        
        sw <= '1';
        wait for 15 ms;
        sw <= '0';
        wait for 15 ms;
        
        sw <= '1';
        wait for 20 ms;
        sw <= '0';
        wait for 20 ms;
        
        sw <= '1';
        wait for 30 ms;
        sw <= '0';
        wait for 30 ms;
    end process;

end Behavioral;
