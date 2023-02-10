----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.02.2023 00:47:26
-- Design Name: 
-- Module Name: control_7seg_tb - Behavioral
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

entity control_7seg_tb is
--  Port ( );
end control_7seg_tb;

architecture Behavioral of control_7seg_tb is

    component control_7seg is
        Port (new_sw : in STD_LOGIC;
              new_digit : in STD_LOGIC_VECTOR (3 downto 0);
              m_tick_10ms : in STD_LOGIC;
              rst : in STD_LOGIC;
              clk : in STD_LOGIC;
              hex_7seg : out std_logic_vector (7 downto 0);
              select_7seg : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal new_sw, m_tick_10ms, rst, clk : std_logic := '0';
    signal hex_7seg : std_logic_vector (7 downto 0) := (others => '0');
    signal new_digit, select_7seg : std_logic_vector (3 downto 0) := "0000";

begin

    uut: control_7seg port map(
        new_sw=>new_sw, rst=>rst, clk=>clk, new_digit=>new_digit, m_tick_10ms=>m_tick_10ms, hex_7seg=>hex_7seg, select_7seg=>select_7seg
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
        wait for 60 ms;
        rst <= '1';
        wait for 20 ms;
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
            new_digit <= "1111";
            wait for 10 ns;
            new_sw <= '0';
            wait for 35 ms;
        new_sw <= '1';
            new_digit <= "1101";
            wait for 10 ns;
            new_sw <= '0';
            wait for 35 ms;
        new_sw <= '1';
            new_digit <= "1111";
            wait for 10 ns;
            new_sw <= '0';
            wait for 35 ms;
        new_sw <= '1';
            new_digit <= "1100";
            wait for 10 ns;
            new_sw <= '0';
            wait for 35 ms;
    
    end process;

end Behavioral;
