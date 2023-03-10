----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2023 15:37:22
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
               rst : in STD_LOGIC;
               m_tick_10ms : in STD_LOGIC;
               lines : in STD_LOGIC_VECTOR (3 downto 0);
               lines_out : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal clk,rst,m_tick : std_logic := '0';
    signal lines,lines_out : std_logic_vector (3 downto 0) := "0000";

begin

    uut1: anti_rebond port map(
        clk => clk,
        rst => rst,
        lines => lines,
        m_tick_10ms => m_tick,
        lines_out => lines_out
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
    
        lines <= "1111";
        wait for 1 ms;
        lines <= "0000";
        wait for 1 ms;
        
        lines <= "1111";
        wait for 5 ms;
        lines <= "0000";
        wait for 5 ms;
        
        lines <= "1111";
        wait for 10 ms;
        lines <= "0000";
        wait for 10 ms;
        
        lines <= "1111";
        wait for 15 ms;
        lines <= "0000";
        wait for 15 ms;
        
        lines <= "1111";
        wait for 20 ms;
        lines <= "0000";
        wait for 20 ms;
        
        lines <= "1111";
        wait for 30 ms;
        lines <= "0000";
        wait for 30 ms;
    end process;

end Behavioral;
