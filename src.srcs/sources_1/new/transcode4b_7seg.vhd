----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2023 21:39:34
-- Design Name: 
-- Module Name: transcode4b_7seg - Behavioral
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

entity transcode4b_7seg is
    Port ( hex_in : in STD_LOGIC_VECTOR (3 downto 0);
           seg7_out : out STD_LOGIC_VECTOR (7 downto 0));
end transcode4b_7seg;

architecture Behavioral of transcode4b_7seg is

begin

    -- Representation is : DP-g-f-e-d-c-b-a
    seg7_out <= x"3F" when hex_in="0000" else -- 0
                x"06" when hex_in="0001" else -- 1
                x"5B" when hex_in="0010" else -- 2
                x"4F" when hex_in="0011" else -- 3
                x"66" when hex_in="0100" else -- 4
                x"6D" when hex_in="0101" else -- 5
                x"7D" when hex_in="0110" else -- 6
                x"07" when hex_in="0111" else -- 7
                x"7F" when hex_in="1000" else -- 8
                x"6F" when hex_in="1001" else -- 9
                x"77" when hex_in="1010" else -- a
                x"7C" when hex_in="1011" else -- b
                x"39" when hex_in="1100" else -- c
                x"5E" when hex_in="1101" else -- d
                x"79" when hex_in="1110" else -- e
                x"71" when hex_in="1111";     -- f

end Behavioral;
