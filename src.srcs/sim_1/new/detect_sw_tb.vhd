----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.02.2023 22:58:46
-- Design Name: 
-- Module Name: detect_sw_tb - Behavioral
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

entity detect_sw_tb is
--  Port ( );
end detect_sw_tb;

architecture Behavioral of detect_sw_tb is

    component detect_sw is
        Port ( lines : in STD_LOGIC_VECTOR (3 downto 0);
               colnum : in STD_LOGIC_VECTOR (1 downto 0);
               clk : in STD_LOGIC;
               num_out : out STD_LOGIC_VECTOR (3 downto 0);
               bp_pressed : out STD_LOGIC);
    end component;
    
    signal clk,bp_pressed : std_logic := '0';
    signal num_out : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal colnum : std_logic_vector (1 downto 0) := "00";
    signal lines : std_logic_vector (3 downto 0) := "0000";
    

begin

    uut: detect_sw port map(
        lines => lines,
        colnum => colnum,
        clk => clk,
        num_out => num_out,
        bp_pressed => bp_pressed
        
    );

    clk_proc : process -- 100Mhz clock
    begin
        clk <= '1';
        wait for 5 ns;
        clk <= '0';
        wait for 5 ns;
    end process;
    
    colnum_proc : process -- Counter process for the column number (colnum)
        
        -- Indicates if every line was previously being on
        variable curr_num: unsigned (3 downto 0) := "0000"; 
    
    begin
    
        colnum <= "00";
            lines <= "0001";
            wait for 30 ms;
            lines <= "0010";
            wait for 30 ms;
            lines <= "0100";
            wait for 30 ms;
            lines <= "1000";
            wait for 30 ms;
        colnum <= "01";
            lines <= "0001";
            wait for 30 ms;
            lines <= "0010";
            wait for 30 ms;
            lines <= "0100";
            wait for 30 ms;
            lines <= "1000";
            wait for 30 ms;
       colnum <= "10";
           lines <= "0001";
           wait for 30 ms;
           lines <= "0010";
           wait for 30 ms;
           lines <= "0100";
           wait for 30 ms;
           lines <= "1000";
           wait for 30 ms;
       colnum <= "11";
           lines <= "0001";
           wait for 30 ms;
           lines <= "0010";
           wait for 30 ms;
           lines <= "0100";
           wait for 30 ms;
           lines <= "1000";
           wait for 30 ms;
    
    end process;

end Behavioral;
