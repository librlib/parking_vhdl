----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.02.2023 22:39:49
-- Design Name: 
-- Module Name: anti_rebond_fsm - Behavioral
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

entity anti_rebond_fsm is
    Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC;
           m_tick : in STD_LOGIC;
           db : out STD_LOGIC);
end anti_rebond_fsm;

architecture Behavioral of anti_rebond_fsm is

    type states is (zero, wait1_1, wait1_2, wait1_3, one, wait0_1, wait0_2, wait0_3);
    signal current_state, next_state: states;
    
    signal db_out : std_logic := '0';

begin

    --State Register:
    SR_PROC : process (clk)
    begin
    
        if rising_edge(clk) then
            current_state <= next_state;
        end if;
    
    end process;
    
    --Combinational for Next State and Logic for Output:
    CLNSO_PROC : process (clk)
    begin
        
    case current_state is
        when zero =>
            db_out <= '0';
            if ( sw='1' ) then
                next_state <= wait1_1;
            end if;
        when wait1_1 =>
            db_out <= '0';
            if ( sw='0' ) then
                next_state <= zero;
            elsif ( m_tick='1' ) then
                next_state <= wait1_2;
            end if;
        when wait1_2 =>
            db_out <= '0';
            if ( sw='0' ) then
                next_state <= zero;
            elsif ( m_tick='1' ) then
                next_state <= wait1_3;
            end if;
        when wait1_3 =>
            db_out <= '0';
            if ( sw='0' ) then
                next_state <= zero;
            elsif ( m_tick='1' ) then
                next_state <= one;
            end if;
            
        when one =>
            db_out <= '1';
            if ( sw='0' ) then
                next_state <= wait0_1;
            end if;
        when wait0_1 =>
            db_out <= '1';
            if ( sw='1' ) then
                next_state <= one;
            elsif ( m_tick='1' ) then
                next_state <= wait0_2;
            end if;
        when wait0_2 =>
            db_out <= '1';
            if ( sw='1' ) then
                next_state <= one;
            elsif ( m_tick='1' ) then
                next_state <= wait0_3;
            end if;
        when wait0_3 =>
            db_out <= '1';
            if ( sw='1' ) then
                next_state <= one;
            elsif ( m_tick='1' ) then
                next_state <= wait0_2;
            end if;
    end case;
        
    end process;
    
    db <= db_out;

end Behavioral;
