----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2023 16:12:53
-- Design Name: 
-- Module Name: transcode2b_4_tb - Behavioral
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

entity transcode2b_4_tb is
--  Port ( );
end transcode2b_4_tb;

architecture Behavioral of transcode2b_4_tb is

    component transcode2b_4 is
        Port ( code2b : in STD_LOGIC_VECTOR (1 downto 0);
               bitselect : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal code2b: STD_LOGIC_VECTOR (1 downto 0);
    signal bitselect: STD_LOGIC_VECTOR (3 downto 0);

begin

    uut: transcode2b_4 port map ( code2b=>code2b, bitselect=>bitselect );
    
    process
    begin
        code2b <= "00";
        wait for 1 ms;
        code2b <= "01";
        wait for 1 ms;
        code2b <= "10";
        wait for 1 ms;
        code2b <= "11";
        wait for 1 ms;
        wait;
    end process;

end Behavioral;
