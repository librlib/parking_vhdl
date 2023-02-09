----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.02.2023 11:01:07
-- Design Name: 
-- Module Name: detect_sw - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity detect_sw is
    Port ( lines : in STD_LOGIC_VECTOR (3 downto 0);
           colnum : in STD_LOGIC_VECTOR (1 downto 0);
           clk : in STD_LOGIC;
           num_out : out STD_LOGIC_VECTOR (3 downto 0);
           bp_pressed : out STD_LOGIC);
end detect_sw;

architecture Behavioral of detect_sw is

    signal num : std_logic_vector (3 downto 0) := "0000";
    signal bp_press : std_logic := '0';
    -- bp_pressed: matrix of all buttons status previous clk cycle (used to count sw press once)
    signal bp_press_matrix : std_logic_vector (15 downto 0) := (others => '0');
    

begin

    process(clk,colnum,lines)
        
    begin
        if rising_edge(clk) then
            if bp_press='1' then -- Must be down at least one clk cycle
                bp_press <= '0'; -- Reset output indicator
            else -- Scan for new button press
            
                if colnum="00" then -- Column selection 0
                
                    -- Line selection 0 (line active and sw newly pressed)
                    if ( lines(0)='1' and bp_press_matrix(0)='0') then
                        num <= "0001"; -- 1
                        bp_press <= '1'; -- indicate sw pressed
                        bp_press_matrix(0) <= '1'; -- current sw now being pressed
                    elsif lines(0)='0' then -- line inactive (sw not pressed)
                        bp_press_matrix(0) <= '0'; -- current sw reset state (not pressed)
                    end if;
                    
                    -- Line selection 1 (line active and sw newly pressed)
                    if ( lines(1)='1' and bp_press_matrix(4)='0') then
                        num <= "0100"; -- 4
                        bp_press <= '1'; -- indicate sw pressed
                        bp_press_matrix(4) <= '1'; -- current sw now being pressed
                    elsif lines(1)='0' then -- line inactive (sw not pressed)
                        bp_press_matrix(4) <= '0'; -- current sw reset state (not pressed)
                    end if;
                    
                    -- Line selection 2 (line active and sw newly pressed)
                    if ( lines(2)='1' and bp_press_matrix(8)='0') then
                        num <= "0111"; -- 7
                        bp_press <= '1'; -- indicate sw pressed
                        bp_press_matrix(8) <= '1'; -- current sw now being pressed
                    elsif lines(2)='0' then -- line inactive (sw not pressed)
                        bp_press_matrix(8) <= '0'; -- current sw reset state (not pressed)
                    end if;
                    
                    -- Line selection 3 (line active and sw newly pressed)
                    if ( lines(3)='1' and bp_press_matrix(12)='0') then
                        num <= "1111"; -- F
                        bp_press <= '1'; -- indicate sw pressed
                        bp_press_matrix(12) <= '1'; -- current sw now being pressed
                    elsif lines(3)='0' then -- line inactive (sw not pressed)
                        bp_press_matrix(12) <= '0'; -- current sw reset state (not pressed)
                    end if;
                    
                    
                elsif colnum="01" then -- Column selection 1
                
                    -- Line selection 0 (line active and sw newly pressed)
                    if ( lines(0)='1' and bp_press_matrix(1)='0') then
                        num <= "0010"; -- 2
                        bp_press <= '1'; -- indicate sw pressed
                        bp_press_matrix(1) <= '1'; -- current sw now being pressed
                    elsif lines(0)='0' then -- line inactive (sw not pressed)
                        bp_press_matrix(1) <= '0'; -- current sw reset state (not pressed)
                    end if;
                    
                    -- Line selection 1 (line active and sw newly pressed)
                    if ( lines(1)='1' and bp_press_matrix(5)='0') then
                        num <= "0101"; -- 5
                        bp_press <= '1'; -- indicate sw pressed
                        bp_press_matrix(5) <= '1'; -- current sw now being pressed
                    elsif lines(1)='0' then -- line inactive (sw not pressed)
                        bp_press_matrix(5) <= '0'; -- current sw reset state (not pressed)
                    end if;
                    
                    -- Line selection 2 (line active and sw newly pressed)
                    if ( lines(2)='1' and bp_press_matrix(9)='0') then
                        num <= "1000"; -- 8
                        bp_press <= '1'; -- indicate sw pressed
                        bp_press_matrix(9) <= '1'; -- current sw now being pressed
                    elsif lines(2)='0' then -- line inactive (sw not pressed)
                        bp_press_matrix(9) <= '0'; -- current sw reset state (not pressed)
                    end if;
                    
                    -- Line selection 3 (line active and sw newly pressed)
                    if ( lines(3)='1' and bp_press_matrix(13)='0') then
                        num <= "0000"; -- 0
                        bp_press <= '1'; -- indicate sw pressed
                        bp_press_matrix(13) <= '1'; -- current sw now being pressed
                    elsif lines(3)='0' then -- line inactive (sw not pressed)
                        bp_press_matrix(13) <= '0'; -- current sw reset state (not pressed)
                    end if;
                
                elsif colnum="10" then -- Column selection 2
                
                    -- Line selection 0 (line active and sw newly pressed)
                    if ( lines(0)='1' and bp_press_matrix(2)='0') then
                        num <= "0011"; -- 3
                        bp_press <= '1'; -- indicate sw pressed
                        bp_press_matrix(2) <= '1'; -- current sw now being pressed
                    elsif lines(0)='0' then -- line inactive (sw not pressed)
                        bp_press_matrix(2) <= '0'; -- current sw reset state (not pressed)
                    end if;
                    
                    -- Line selection 1 (line active and sw newly pressed)
                    if ( lines(1)='1' and bp_press_matrix(6)='0') then
                        num <= "0110"; -- 6
                        bp_press <= '1'; -- indicate sw pressed
                        bp_press_matrix(6) <= '1'; -- current sw now being pressed
                    elsif lines(1)='0' then -- line inactive (sw not pressed)
                        bp_press_matrix(6) <= '0'; -- current sw reset state (not pressed)
                    end if;
                    
                    -- Line selection 2 (line active and sw newly pressed)
                    if ( lines(2)='1' and bp_press_matrix(10)='0') then
                        num <= "1001"; -- 9
                        bp_press <= '1'; -- indicate sw pressed
                        bp_press_matrix(10) <= '1'; -- current sw now being pressed
                    elsif lines(2)='0' then -- line inactive (sw not pressed)
                        bp_press_matrix(10) <= '0'; -- current sw reset state (not pressed)
                    end if;
                    
                    -- Line selection 3 (line active and sw newly pressed)
                    if ( lines(3)='1' and bp_press_matrix(14)='0') then
                        num <= "1110"; -- E
                        bp_press <= '1'; -- indicate sw pressed
                        bp_press_matrix(14) <= '1'; -- current sw now being pressed
                    elsif lines(3)='0' then -- line inactive (sw not pressed)
                        bp_press_matrix(14) <= '0'; -- current sw reset state (not pressed)
                    end if;
                
                elsif colnum="11" then -- Column selection 3
                    
                    -- Line selection 0 (line active and sw newly pressed)
                    if ( lines(0)='1' and bp_press_matrix(3)='0') then
                        num <= "1010"; -- A
                        bp_press <= '1'; -- indicate sw pressed
                        bp_press_matrix(3) <= '1'; -- current sw now being pressed
                    elsif lines(0)='0' then -- line inactive (sw not pressed)
                        bp_press_matrix(3) <= '0'; -- current sw reset state (not pressed)
                    end if;
                    
                    -- Line selection 1 (line active and sw newly pressed)
                    if ( lines(1)='1' and bp_press_matrix(7)='0') then
                        num <= "1011"; -- B
                        bp_press <= '1'; -- indicate sw pressed
                        bp_press_matrix(7) <= '1'; -- current sw now being pressed
                    elsif lines(1)='0' then -- line inactive (sw not pressed)
                        bp_press_matrix(7) <= '0'; -- current sw reset state (not pressed)
                    end if;
                    
                    -- Line selection 2 (line active and sw newly pressed)
                    if ( lines(2)='1' and bp_press_matrix(11)='0') then
                        num <= "1100"; -- C
                        bp_press <= '1'; -- indicate sw pressed
                        bp_press_matrix(11) <= '1'; -- current sw now being pressed
                    elsif lines(2)='0' then -- line inactive (sw not pressed)
                        bp_press_matrix(11) <= '0'; -- current sw reset state (not pressed)
                    end if;
                    
                    -- Line selection 3 (line active and sw newly pressed)
                    if ( lines(3)='1' and bp_press_matrix(15)='0') then
                        num <= "1101"; -- D
                        bp_press <= '1'; -- indicate sw pressed
                        bp_press_matrix(15) <= '1'; -- current sw now being pressed
                    elsif lines(3)='0' then -- line inactive (sw not pressed)
                        bp_press_matrix(15) <= '0'; -- current sw reset state (not pressed)
                    end if;
                    
                end if;
            end if;
        
        end if;
    end process;
    
    -- Assigning output pins to internal signals
    num_out <= num;
    bp_pressed <= bp_press;

end Behavioral;
