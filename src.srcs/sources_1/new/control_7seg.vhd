----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.02.2023 00:36:24
-- Design Name: 
-- Module Name: control_7seg - Behavioral
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

entity control_7seg is
    Port (new_sw : in STD_LOGIC;
          new_digit : in STD_LOGIC_VECTOR (3 downto 0);
          m_tick_10ms : in STD_LOGIC;
          rst : in STD_LOGIC;
          clk : in STD_LOGIC;
          hex_7seg : out std_logic_vector (7 downto 0);
          select_7seg : out STD_LOGIC_VECTOR (3 downto 0));
end control_7seg;

architecture Behavioral of control_7seg is

    component code_buff is
        Port ( new_sw : in STD_LOGIC;
               new_digit : in STD_LOGIC_VECTOR (3 downto 0);
               m_tick_10ms : in STD_LOGIC;
               rst : in STD_LOGIC;
               clk : in STD_LOGIC;
               curr_digit : out std_logic_vector (3 downto 0);
               seg_select : out STD_LOGIC_VECTOR (1 downto 0));
    end component;
    
    component transcode2b_4 is
        Port ( code2b : in STD_LOGIC_VECTOR (1 downto 0);
               bitselect : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component transcode4b_7seg is
        Port ( hex_in : in STD_LOGIC_VECTOR (3 downto 0);
               seg7_out : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    signal curr_digit : std_logic_vector (3 downto 0) := "0000";
    signal seg_select : std_logic_vector (1 downto 0) := "00";

begin

    code_buff_unit : code_buff port map(
        new_sw=>new_sw, rst=>rst, clk=>clk, new_digit=>new_digit, m_tick_10ms=>m_tick_10ms, curr_digit=>curr_digit, seg_select=>seg_select
    );
    
    hex_7seg_unit : transcode4b_7seg port map(
        hex_in => curr_digit,
        seg7_out => hex_7seg
    );
    
    select_7seg_unit : transcode2b_4 port map(
        code2b => seg_select,
        bitselect => select_7seg
    );


end Behavioral;
