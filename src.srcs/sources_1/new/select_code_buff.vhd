----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2023 22:08:49
-- Design Name: 
-- Module Name: select_code_buff - Behavioral
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

entity select_code_buff is
    Port ( new_sw : in STD_LOGIC;
           m_tick_10ms : in std_logic;
           clk : in std_logic;
           rst : in std_logic;
           new_digit : in STD_LOGIC_VECTOR (3 downto 0);
           digit_select : in STD_LOGIC_VECTOR (1 downto 0);
           curr_digit : in STD_LOGIC_VECTOR (7 downto 0));
end select_code_buff;

architecture Behavioral of select_code_buff is

    type arr6_4b is array (0 to 5) of std_logic_vector(3 downto 0);
    signal digits : arr6_4b := (others=>(others=>'0'));

begin

    new_digit_proc: process(clk, rst, new_digit, new_sw)
    begin
        if rst='1' then
            digits <= (others=>(others=>'0')); -- reset code in memory
        elsif rising_edge(clk) then
            
        end if;
    end process;

end Behavioral;
