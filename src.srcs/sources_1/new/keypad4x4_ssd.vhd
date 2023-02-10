----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.02.2023 09:39:57
-- Design Name: 
-- Module Name: keypad4x4_ssd - Behavioral
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

entity keypad4x4_ssd is
    Port ( lines : in STD_LOGIC_VECTOR (3 downto 0);
           columns : out STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           leds_out : out STD_LOGIC_VECTOR (5 downto 0);
           hex_7seg : out std_logic_vector (7 downto 0);
           select_7seg : out STD_LOGIC_VECTOR (3 downto 0));
end keypad4x4_ssd;

architecture Behavioral of keypad4x4_ssd is

    component sequence_fsm is
        Port ( new_sw : in STD_LOGIC;
               rst : in std_logic;
               clk : in STD_LOGIC;
               letter : in STD_LOGIC_VECTOR (3 downto 0);
               leds_out : out STD_LOGIC_VECTOR (5 downto 0));
    end component;
    
    component tick_10ms is
        Port ( clk_in : in STD_LOGIC;
               clk_out : out STD_LOGIC);
    end component;
    
    component control_7seg is
        Port (new_sw : in STD_LOGIC;
              new_digit : in STD_LOGIC_VECTOR (3 downto 0);
              m_tick_10ms : in STD_LOGIC;
              rst : in STD_LOGIC;
              clk : in STD_LOGIC;
              hex_7seg : out std_logic_vector (7 downto 0);
              select_7seg : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component detect_sw is
        Port ( lines : in STD_LOGIC_VECTOR (3 downto 0);
               colnum : in STD_LOGIC_VECTOR (1 downto 0);
               clk : in STD_LOGIC;
               num_out : out STD_LOGIC_VECTOR (3 downto 0);
               bp_pressed : out STD_LOGIC);
    end component;
    
    component counter_2b is
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               cnt : out STD_LOGIC_VECTOR (1 downto 0));
    end component;
    
    component anti_rebond is
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               m_tick_10ms : in STD_LOGIC;
               lines : in STD_LOGIC_VECTOR (3 downto 0);
               lines_out : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component transcode2b_4 is
        Port ( code2b : in STD_LOGIC_VECTOR (1 downto 0);
               bitselect : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    signal new_sw, m_tick_10ms : std_logic := '0';
    signal new_digit, lines_stable : std_logic_vector (3 downto 0) := "0000";
    signal colnum : std_logic_vector (1 downto 0) := "00";

begin

    u1: sequence_fsm port map(
        new_sw => new_sw,
        letter => new_digit,
        rst => rst,
        clk => clk,
        leds_out => leds_out
    );
    
    u2: tick_10ms port map(
        clk_in => clk,
        clk_out => m_tick_10ms
    );
    
    u3: control_7seg port map(
        new_sw => new_sw,
        new_digit => new_digit,
        m_tick_10ms => m_tick_10ms,
        rst => rst,
        clk => clk,
        hex_7seg => hex_7seg,
        select_7seg =>select_7seg
    );
    
    u4: detect_sw port map(
        lines => lines_stable,
        colnum => colnum,
        clk => clk,
        num_out => new_digit,
        bp_pressed => new_sw
    );
    
    u5: counter_2b port map(
        clk => clk,
        rst => rst,
        cnt => colnum
    );
    
    u6: anti_rebond port map(
        clk => clk,
        rst => rst,
        m_tick_10ms => m_tick_10ms,
        lines => lines,
        lines_out => lines_stable
    );
    
    u7: transcode2b_4 port map(
        code2b => colnum,
        bitselect => columns
    );


end Behavioral;
