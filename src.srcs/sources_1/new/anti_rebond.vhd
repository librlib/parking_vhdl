----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2023 15:24:06
-- Design Name: 
-- Module Name: anti_rebond - Behavioral
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

entity anti_rebond is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           m_tick_10ms : in STD_LOGIC;
           lines : in STD_LOGIC_VECTOR (3 downto 0);
           lines_out : out STD_LOGIC_VECTOR (3 downto 0));
end anti_rebond;

architecture Behavioral of anti_rebond is

    component anti_rebond_fsm is
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               sw : in STD_LOGIC;
               m_tick : in STD_LOGIC;
               db : out STD_LOGIC);
    end component;

begin

    fsm_l1 : anti_rebond_fsm port map(
        clk => clk,
        rst => rst,
        sw => lines(0),
        m_tick => m_tick_10ms,
        db => lines_out(0)
    );
    
    fsm_l2 : anti_rebond_fsm port map(
        clk => clk,
        rst => rst,
        sw => lines(1),
        m_tick => m_tick_10ms,
        db => lines_out(1)
    );
    
    fsm_l3 : anti_rebond_fsm port map(
        clk => clk,
        rst => rst,
        sw => lines(2),
        m_tick => m_tick_10ms,
        db => lines_out(2)
    );
    
    fsm_l4 : anti_rebond_fsm port map(
        clk => clk,
        rst => rst,
        sw => lines(3),
        m_tick => m_tick_10ms,
        db => lines_out(3)
    );

end Behavioral;
