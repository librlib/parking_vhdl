----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.02.2023 10:39:17
-- Design Name: 
-- Module Name: keypad4x4_ssd_tb - Behavioral
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

entity keypad4x4_ssd_tb is
--  Port ( );
end keypad4x4_ssd_tb;

architecture Behavioral of keypad4x4_ssd_tb is

    component keypad4x4_ssd is
        Port ( lines : in STD_LOGIC_VECTOR (3 downto 0);
               columns : out STD_LOGIC_VECTOR (3 downto 0);
               clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               leds_out : out STD_LOGIC_VECTOR (5 downto 0);
               hex_7seg : out std_logic_vector (7 downto 0);
               select_7seg : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal clk, rst : std_logic := '0';
    signal lines, columns, select_7seg : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal leds_out : STD_LOGIC_VECTOR (5 downto 0) := "000000";
    signal hex_7seg : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    
    -- The correct code (each hex value has a line/column code)
    constant digitStar_lines : std_logic_vector(3 downto 0) := "0001";
    constant digitStar_cols : std_logic_vector(3 downto 0) := "1000";
    
    constant digit1_lines : std_logic_vector(3 downto 0) := "1000";
    constant digit1_cols : std_logic_vector(3 downto 0) := "1000";
    
    constant digit2_lines : std_logic_vector(3 downto 0) := "1000";
    constant digit2_cols : std_logic_vector(3 downto 0) := "0100";
    
    constant digit3_lines : std_logic_vector(3 downto 0) := "1000";
    constant digit3_cols : std_logic_vector(3 downto 0) := "0010";
    
    constant digit4_lines : std_logic_vector(3 downto 0) := "0100";
    constant digit4_cols : std_logic_vector(3 downto 0) := "1000";
    
    constant digitHashtg_lines : std_logic_vector(3 downto 0) := "0001";
    constant digitHashtg_cols : std_logic_vector(3 downto 0) := "1110";
    
    type arr4_4b is array (0 to 3) of std_logic_vector(3 downto 0);
    signal lines_arr : arr4_4b := (others=>(others=>'0'));

begin

    uut: keypad4x4_ssd port map(
        lines => lines,
        columns => columns,
        clk => clk,
        rst => rst,
        leds_out => leds_out,
        hex_7seg => hex_7seg,
        select_7seg => select_7seg
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
    
    -- Generates 'lines' input from the array of lines ('lines_arr')
    lines_proc : process(clk,columns)
    begin
    
        if rising_edge(clk) then
            if columns(0)='1' then
                lines <= lines_arr(1);
            elsif columns(1)='1' then
                lines <= lines_arr(2);
            elsif columns(2)='1' then
                lines <= lines_arr(3);
            elsif columns(3)='1' then
                lines <= lines_arr(0);
            end if;
        end if;
    
    end process;
    
    -- Updates the list of lines
    change_lines_proc : process
    begin
        
        lines_arr(1) <= "0100"; -- '8' (l2/c1)
        wait for 40 ms;
        lines_arr(1) <= "0000";
        wait;
    
        -- Example with the correct code
            -- Enter the first digit (no bouncing)
            
            
        
    end process;

end Behavioral;
