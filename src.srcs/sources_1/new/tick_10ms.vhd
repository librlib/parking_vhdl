----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.02.2023 22:45:41
-- Design Name: 
-- Module Name: tick_10ms - Behavioral
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

entity tick_10ms is
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end tick_10ms;

architecture Behavioral of tick_10ms is

    signal cnt  : unsigned(19 downto 0)  := (others => '0');
    signal clk_out_sig : std_logic := '0';

begin

    clk_gen : process(clk_in)
    begin
    
        if ( rising_edge(clk_in) ) then
            if ( cnt=X"F423F" ) then -- go to 1million for 10ms period
                cnt <= (others => '0'); -- reset counter
                clk_out_sig <= '1';
            else
                cnt <= cnt + 1; -- increment counter
                clk_out_sig <= '0';
            end if;
        end if;
        
    end process;
    
    clk_out <= clk_out_sig;

end Behavioral;
