----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2023 16:10:21
-- Design Name: 
-- Module Name: transcode2b_4 - Behavioral
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

entity transcode2b_4 is
    Port ( code2b : in STD_LOGIC_VECTOR (1 downto 0);
           bitselect : out STD_LOGIC_VECTOR (3 downto 0));
end transcode2b_4;

architecture Behavioral of transcode2b_4 is

begin

    with code2b select
    bitselect <= "0001" when "00",
                 "0010" when "01",
                 "0100" when "10",
                 "1000" when others;

end Behavioral;
