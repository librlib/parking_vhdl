----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.02.2023 17:34:14
-- Design Name: 
-- Module Name: anti_rebond - Behavioral
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

entity anti_rebond is
    Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC;
           db : out STD_LOGIC);
end anti_rebond;

architecture Behavioral of anti_rebond is

    -- Internal signals
    signal m_tick : std_logic := '0'; -- Bit for 10ms clock

begin

-- Beginning of the FSM



end Behavioral;
