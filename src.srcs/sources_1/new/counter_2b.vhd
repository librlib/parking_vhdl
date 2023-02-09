----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2023 16:20:22
-- Design Name: 
-- Module Name: counter_2b - Behavioral
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

entity counter_2b is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           cnt : out STD_LOGIC_VECTOR (1 downto 0));
end counter_2b;

architecture Behavioral of counter_2b is

    signal cnt_un: unsigned (1 downto 0) := "00";

begin

    process(clk,rst) 
    begin
        if rst='1' then
            cnt_un <= "00";
        elsif rising_edge(clk) then
            if cnt_un="11" then
                cnt_un <= "00";
            else
                cnt_un <= cnt_un + 1;
            end if;
        end if;
    end process;

    cnt <= std_logic_vector(cnt_un);

end Behavioral;
