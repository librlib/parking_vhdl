----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2023 21:38:05
-- Design Name: 
-- Module Name: code_buff - Behavioral
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

entity code_buff is
    Port ( new_sw : in STD_LOGIC;
           new_digit : in STD_LOGIC_VECTOR (3 downto 0);
           m_tick_10ms : in STD_LOGIC;
           rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           curr_digit : out STD_LOGIC_VECTOR (3 downto 0);
           seg_select : out STD_LOGIC_VECTOR (1 downto 0));
end code_buff;

architecture Behavioral of code_buff is

    component counter_2b is
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               cnt : out STD_LOGIC_VECTOR (1 downto 0));
    end component;

    type arr6_4b is array (0 to 5) of std_logic_vector(3 downto 0);
    signal digits : arr6_4b := (others=>(others=>'0'));
    
    signal seg_select_sig : std_logic_vector (1 downto 0) := "00";

begin
    
    -- 2b counter for choosing the current 7-segment to display digit on
    cnt_seg_select : counter_2b port map(
        clk => clk,
        rst => rst,
        cnt => seg_select_sig
    );

    new_digit_proc : process(clk, rst, new_sw, new_digit)
    
        variable arr_curr_digit : integer := 0;
        
    begin
    
        if rst='1' then -- reset password entered so far
            digits <= (others=>(others=>'0'));
            
        elsif rising_edge(clk) then
            if new_sw='1' then -- New digit for the password
                if arr_curr_digit=5 then -- check if new password (end of previous one)
                    arr_curr_digit := 0;
                else
                    arr_curr_digit := arr_curr_digit + 1;
                end if;
                digits(arr_curr_digit) <= new_digit; -- store new digit in password buffer
            end if;
        end if;
        
    end process;
    
    curr_digit_process : process(clk, digits, seg_select_sig)
    begin
    
        
    
    end process;
    
    seg_select <= seg_select_sig; -- output digit for targeted 7-segment display

end Behavioral;
