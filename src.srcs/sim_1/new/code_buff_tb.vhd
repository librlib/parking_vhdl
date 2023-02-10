----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2023 23:26:23
-- Design Name: 
-- Module Name: code_buff_tb - Behavioral
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

entity code_buff_tb is
--  Port ( );
end code_buff_tb;

architecture Behavioral of code_buff_tb is

    component code_buff is
        Port ( new_sw : in STD_LOGIC;
               new_digit : in STD_LOGIC_VECTOR (3 downto 0);
               m_tick_10ms : in STD_LOGIC;
               rst : in STD_LOGIC;
               clk : in STD_LOGIC;
               curr_digit : out STD_LOGIC_VECTOR (3 downto 0);
               seg_select : out STD_LOGIC_VECTOR (1 downto 0));
    end component;
    
    signal new_sw, m_tick_10ms, rst, clk : std_logic := '0';
    signal seg_select : std_logic_vector (1 downto 0) := "00";
    signal new_digit, curr_digit : std_logic_vector (3 downto 0) := "0000";

begin

    uut: code_buff port map(
        new_sw=>new_sw, rst=>rst, clk=>clk, new_digit=>new_digit, m_tick_10ms=>m_tick_10ms, curr_digit=>curr_digit, seg_select=>seg_select
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
        wait;
    end process;
    
    m_tick_proc : process -- pulse with 10ms period
    begin
        m_tick_10ms <= '1';
        wait for 10 ns;
        m_tick_10ms <= '0';
        wait for 10 ms - 10 ns;
    end process;
    
    process
    begin
    
        -- Enter 6 letters
        new_sw <= '1';
            new_digit <= "1111";
            wait for 10 ns;
            new_sw <= '0';
            wait for 35 ms;
        new_sw <= '1';
            new_digit <= "1110";
            wait for 10 ns;
            new_sw <= '0';
            wait for 35 ms;
        new_sw <= '1';
            new_digit <= "1101";
            wait for 10 ns;
            new_sw <= '0';
            wait for 35 ms;
        new_sw <= '1';
            new_digit <= "1100";
            wait for 10 ns;
            new_sw <= '0';
            wait for 35 ms;
        new_sw <= '1';
            new_digit <= "1011";
            wait for 10 ns;
            new_sw <= '0';
            wait for 35 ms;
        new_sw <= '1';
            new_digit <= "1010";
            wait for 10 ns;
            new_sw <= '0';
            wait for 35 ms;
        
    
    end process;

end Behavioral;
