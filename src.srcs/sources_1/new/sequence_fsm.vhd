----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2023 18:23:53
-- Design Name: 
-- Module Name: sequence_fsm - Behavioral
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

entity sequence_fsm is
    Port ( new_sw : in STD_LOGIC;
           rst : in std_logic;
           clk : in STD_LOGIC;
           letter : in STD_LOGIC_VECTOR (3 downto 0);
           leds_out : out STD_LOGIC_VECTOR (5 downto 0));
end sequence_fsm;

architecture Behavioral of sequence_fsm is

    type states is (empty,
                    star,d1,d2,d3,d4,hashtg,
                    nstar,nd1,nd2,nd3,nd4,nhashtg);
    signal current_state, next_state: states;
    
    -- Buffering leds (only change states when code fully entered)
    signal leds_out_buffer : std_logic_vector (5 downto 0);
    
    -- Code for accessing the car park
    constant digitStar : std_logic_vector(3 downto 0) := "1111";
    constant digit1 : std_logic_vector(3 downto 0) := "0001";
    constant digit2 : std_logic_vector(3 downto 0) := "0010";
    constant digit3 : std_logic_vector(3 downto 0) := "0011";
    constant digit4 : std_logic_vector(3 downto 0) := "0100";
    constant digitHashtg : std_logic_vector(3 downto 0) := "1110";
    

begin

     --State Register:
    SR_PROC : process (clk)
    begin
    
        if rst='1' then
            current_state <= empty;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    
    end process;
    
    --Combinational for Next State and Logic for Output:
    CLNSO_PROC : process (new_sw, letter, current_state)
    begin
        next_state <= current_state;    
    case current_state is
        
        when empty =>
            leds_out <= leds_out_buffer;
            if new_sw='1' then
                if letter=digitStar then
                    next_state <= star;
                else
                    next_state <= nstar;
                end if;
            else
                next_state <= empty;
            end if;    
        
        when star =>
            leds_out_buffer(0) <= '1';
            if new_sw='1' then
                if letter=digit1 then
                    next_state <= d1;
                else
                    next_state <= nd1;
                end if;
            else
                next_state <= star;
            end if;
            
        when nstar =>
            leds_out_buffer(0) <= '0';
            if new_sw='1' then
                if letter=digit1 then
                    next_state <= d1;
                else
                    next_state <= nd1;
                end if;
            else
                next_state <= nstar;
            end if;
            
        when d1 =>
            leds_out_buffer(1) <= '1';
            if new_sw='1' then
                if letter=digit2 then
                    next_state <= d2;
                else
                    next_state <= nd2;
                end if;
            else
                next_state <= d1;
            end if;
         
         when nd1 =>
            leds_out_buffer(1) <= '0';
            if new_sw='1' then
                if letter=digit2 then
                    next_state <= d2;
                else
                    next_state <= nd2;
                end if;
            else
                next_state <= nd1;
            end if;   
        
         when d2 =>
            leds_out_buffer(2) <= '1';
            if new_sw='1' then
                if letter=digit3 then
                    next_state <= d3;
                else
                    next_state <= nd3;
                end if;
            else
                next_state <= d2;
            end if;
            
         when nd2 =>
            leds_out_buffer(2) <= '0';
            if new_sw='1' then
                if letter=digit3 then
                    next_state <= d3;
                else
                    next_state <= nd3;
                end if;
            else
                next_state <= nd2;
            end if;
            
         when d3 =>
            leds_out_buffer(3) <= '1';
            if new_sw='1' then
                if letter=digit4 then
                    next_state <= d4;
                else
                    next_state <= nd4;
                end if;
            else
                next_state <= d3;
            end if;
         
         when nd3 =>
            leds_out_buffer(3) <= '0';
            if new_sw='1' then
                if letter=digit4 then
                    next_state <= d4;
                else
                    next_state <= nd4;
                end if;
            else
                next_state <= nd3;
            end if;
            
         when d4 =>
            leds_out_buffer(4) <= '1';
            if new_sw='1' then
                if letter=digitHashtg then
                    next_state <= hashtg;
                else
                    next_state <= nhashtg;
                end if;
            else
                next_state <= d4;
            end if;
            
         when nd4 =>
            leds_out_buffer(4) <= '0';
            if new_sw='1' then
                if letter=digitHashtg then
                    next_state <= hashtg;
                else
                    next_state <= nhashtg;
                end if;
            else
                next_state <= nd4;
            end if;
            
         when hashtg =>
            leds_out_buffer(5) <= '1';
            next_state <= empty;
            
         when nhashtg =>
            leds_out_buffer(5) <= '0';
            next_state <= empty;
         
        
    end case;
    end process;
    
    

end Behavioral;
