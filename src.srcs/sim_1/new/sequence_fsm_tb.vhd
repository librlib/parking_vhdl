----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2023 19:43:41
-- Design Name: 
-- Module Name: sequence_fsm_tb - Behavioral
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

entity sequence_fsm_tb is
--  Port ( );
end sequence_fsm_tb;

architecture Behavioral of sequence_fsm_tb is

    component sequence_fsm is
        Port ( new_sw : in STD_LOGIC;
               rst : in std_logic;
               clk : in STD_LOGIC;
               letter : in STD_LOGIC_VECTOR (3 downto 0);
               leds_out : out STD_LOGIC_VECTOR (5 downto 0));
    end component;
    
    signal new_sw,rst,clk: std_logic := '0';
    signal letter : std_logic_vector (3 downto 0) := "0000";
    signal leds_out : std_logic_vector (5 downto 0) := "000000";
    
    constant digitStar : std_logic_vector(3 downto 0) := "1111";
    constant digit1 : std_logic_vector(3 downto 0) := "0001";
    constant digit2 : std_logic_vector(3 downto 0) := "0010";
    constant digit3 : std_logic_vector(3 downto 0) := "0011";
    constant digit4 : std_logic_vector(3 downto 0) := "0100";
    constant digitHashtg : std_logic_vector(3 downto 0) := "1110";

begin

    uut: sequence_fsm port map(
        new_sw=>new_sw, rst=>rst, clk=>clk, letter=>letter, leds_out=>leds_out
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

    process
    begin
        
        -- Test of a good code
        new_sw <= '1';
            letter <= digitStar;
            wait for 10 ns;
            new_sw <= '0';
            wait for 35 ms;
        new_sw <= '1';
            letter <= digit1;
            wait for 10 ns;
            new_sw <= '0';
            wait for 35 ms;
        new_sw <= '1';
            letter <= digit2;
            wait for 10 ns;
            new_sw <= '0';
            wait for 35 ms;
        new_sw <= '1';
            letter <= digit3;
            wait for 10 ns;
            new_sw <= '0';
            wait for 35 ms;
        new_sw <= '1';
            letter <= digit4;
            wait for 10 ns;
            new_sw <= '0';
            wait for 35 ms;
        new_sw <= '1';
            letter <= digitHashtg;
            wait for 10 ns;
            new_sw <= '0';
            wait for 35 ms;
        
        wait for 50 ms;
        
        -- Test of a good code
        new_sw <= '1';
            letter <= digitStar;
            wait for 10 ns;
            new_sw <= '0';
            wait for 35 ms;
        new_sw <= '1';
            letter <= "1111";
            wait for 10 ns;
            new_sw <= '0';
            wait for 35 ms;
        new_sw <= '1';
            letter <= digit2;
            wait for 10 ns;
            new_sw <= '0';
            wait for 35 ms;
        new_sw <= '1';
            letter <= "1111";
            wait for 10 ns;
            new_sw <= '0';
            wait for 35 ms;
        new_sw <= '1';
            letter <= digit4;
            wait for 10 ns;
            new_sw <= '0';
            wait for 35 ms;
        new_sw <= '1';
            letter <= "1111";
            wait for 10 ns;
            new_sw <= '0';
            wait for 35 ms;
        
        wait;
    end process;

end Behavioral;
