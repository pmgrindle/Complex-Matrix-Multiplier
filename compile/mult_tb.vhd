-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : memory_example
-- Author      : Paul Grindle
-- Company     : Unemployment, Inc.
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\pgrin\Documents\active_hdl_student\memory_example\compile\mult_tb.vhd
-- Generated   : Fri May  5 15:22:38 2023
-- From        : C:\Users\pgrin\Documents\active_hdl_student\memory_example\src\mult_tb.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library ieee;
use ieee.std_logic_1164.all;

entity mult_tb is 
end mult_tb;

architecture TB_ARCHITECTURE of mult_tb is

---- Component declarations -----

component multiplier
  port(
       CLK : in STD_LOGIC;
       MSEL : in STD_LOGIC;
       CTRL : in STD_LOGIC_VECTOR(1 downto 0);
       ADDRIN_rdRow : in STD_LOGIC_VECTOR(1 downto 0);
       ADDRIN_rdCol : in STD_LOGIC_VECTOR(1 downto 0);
       ADDRIN_wrRow : in STD_LOGIC_VECTOR(1 downto 0);
       ADDRIN_wrCol : in STD_LOGIC_VECTOR(1 downto 0);
       DATAIN_re : in STD_LOGIC_VECTOR(19 downto 0);
       DATAIN_im : in STD_LOGIC_VECTOR(19 downto 0);
       QOUT_re : out STD_LOGIC_VECTOR(19 downto 0);
       QOUT_im : out STD_LOGIC_VECTOR(19 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal CLK : STD_LOGIC;
signal END_SIM : BOOLEAN := FALSE;
signal MSEL : STD_LOGIC;
signal ADDRIN_rdCol : STD_LOGIC_VECTOR(1 downto 0);
signal ADDRIN_rdRow : STD_LOGIC_VECTOR(1 downto 0);
signal ADDRIN_wrCol : STD_LOGIC_VECTOR(1 downto 0);
signal ADDRIN_wrRow : STD_LOGIC_VECTOR(1 downto 0);
signal CTRL : STD_LOGIC_VECTOR(1 downto 0);
signal DATAIN_im : STD_LOGIC_VECTOR(19 downto 0);
signal DATAIN_re : STD_LOGIC_VECTOR(19 downto 0);
signal QOUT_im : STD_LOGIC_VECTOR(19 downto 0);
signal QOUT_re : STD_LOGIC_VECTOR(19 downto 0);

begin

---- Processes ----

CLOCK_CLK : process
                       begin
                         if END_SIM = FALSE then
                            CLK <= '0';
                            wait for 5 ns;
                         else 
                            wait;
                         end if;
                         if END_SIM = FALSE then
                            CLK <= '1';
                            wait for 5 ns;
                         else 
                            wait;
                         end if;
                       end process;
                      

STIMULUS : process
                       begin
                         MSEL <= '0';
                         CTRL <= "01";
                         ADDRIN_rdRow <= "00";
                         ADDRIN_rdCol <= "00";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "00";
                         ADDRIN_wrCol <= "00";
                         DATAIN_re <= "00000000000011010011";
                         DATAIN_im <= "00000000000011001000";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "00";
                         ADDRIN_wrCol <= "01";
                         DATAIN_re <= "00000000000011010101";
                         DATAIN_im <= "00000000000000011110";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "00";
                         ADDRIN_wrCol <= "10";
                         DATAIN_re <= "00000000000000100011";
                         DATAIN_im <= "00000000000000011010";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "00";
                         ADDRIN_wrCol <= "11";
                         DATAIN_re <= "00000000000000100000";
                         DATAIN_im <= "00000000000001010011";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "01";
                         ADDRIN_wrCol <= "00";
                         DATAIN_re <= "00000000000001100011";
                         DATAIN_im <= "00000000000011000011";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "01";
                         ADDRIN_wrCol <= "01";
                         DATAIN_re <= "00000000000010111010";
                         DATAIN_im <= "00000000000000110011";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "01";
                         ADDRIN_wrCol <= "10";
                         DATAIN_re <= "00000000000011100110";
                         DATAIN_im <= "00000000000011100100";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "01";
                         ADDRIN_wrCol <= "11";
                         DATAIN_re <= "00000000000000110100";
                         DATAIN_im <= "00000000000010000001";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "10";
                         ADDRIN_wrCol <= "00";
                         DATAIN_re <= "00000000000001000101";
                         DATAIN_im <= "00000000000010010100";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "10";
                         ADDRIN_wrCol <= "01";
                         DATAIN_re <= "00000000000000100000";
                         DATAIN_im <= "00000000000010111001";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "10";
                         ADDRIN_wrCol <= "10";
                         DATAIN_re <= "00000000000011100001";
                         DATAIN_im <= "00000000000010110100";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "10";
                         ADDRIN_wrCol <= "11";
                         DATAIN_re <= "00000000000001010101";
                         DATAIN_im <= "00000000000011100100";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "11";
                         ADDRIN_wrCol <= "00";
                         DATAIN_re <= "00000000000001001111";
                         DATAIN_im <= "00000000000000100001";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "11";
                         ADDRIN_wrCol <= "01";
                         DATAIN_re <= "00000000000010011010";
                         DATAIN_im <= "00000000000010010000";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "11";
                         ADDRIN_wrCol <= "10";
                         DATAIN_re <= "00000000000011110000";
                         DATAIN_im <= "00000000000010000001";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "11";
                         ADDRIN_wrCol <= "11";
                         DATAIN_re <= "00000000000010110111";
                         DATAIN_im <= "00000000000000010000";
                         wait for 20 ns;
                         MSEL <= '1';
                         wait for 20 ns;
                         ADDRIN_wrRow <= "00";
                         ADDRIN_wrCol <= "00";
                         DATAIN_re <= "00000000000000110101";
                         DATAIN_im <= "00000000000010110110";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "00";
                         ADDRIN_wrCol <= "01";
                         DATAIN_re <= "00000000000010011111";
                         DATAIN_im <= "00000000000000111010";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "00";
                         ADDRIN_wrCol <= "10";
                         DATAIN_re <= "00000000000010101110";
                         DATAIN_im <= "00000000000011011111";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "00";
                         ADDRIN_wrCol <= "11";
                         DATAIN_re <= "00000000000001001011";
                         DATAIN_im <= "00000000000010100000";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "01";
                         ADDRIN_wrCol <= "00";
                         DATAIN_re <= "00000000000011010011";
                         DATAIN_im <= "00000000000010101001";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "01";
                         ADDRIN_wrCol <= "01";
                         DATAIN_re <= "00000000000010111010";
                         DATAIN_im <= "00000000000001011110";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "01";
                         ADDRIN_wrCol <= "10";
                         DATAIN_re <= "00000000000010000111";
                         DATAIN_im <= "00000000000000000101";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "01";
                         ADDRIN_wrCol <= "11";
                         DATAIN_re <= "00000000000010111011";
                         DATAIN_im <= "00000000000010110011";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "10";
                         ADDRIN_wrCol <= "00";
                         DATAIN_re <= "00000000000000100111";
                         DATAIN_im <= "00000000000001000000";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "10";
                         ADDRIN_wrCol <= "01";
                         DATAIN_re <= "00000000000010001101";
                         DATAIN_im <= "00000000000011011010";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "10";
                         ADDRIN_wrCol <= "10";
                         DATAIN_re <= "00000000000001101110";
                         DATAIN_im <= "00000000000000100111";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "10";
                         ADDRIN_wrCol <= "11";
                         DATAIN_re <= "00000000000010111110";
                         DATAIN_im <= "00000000000011000100";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "11";
                         ADDRIN_wrCol <= "00";
                         DATAIN_re <= "00000000000011000101";
                         DATAIN_im <= "00000000000011101100";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "11";
                         ADDRIN_wrCol <= "01";
                         DATAIN_re <= "00000000000011111001";
                         DATAIN_im <= "00000000000011101011";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "11";
                         ADDRIN_wrCol <= "10";
                         DATAIN_re <= "00000000000001011011";
                         DATAIN_im <= "00000000000001011000";
                         wait for 20 ns;
                         ADDRIN_wrRow <= "11";
                         ADDRIN_wrCol <= "11";
                         DATAIN_re <= "00000000000001101111";
                         DATAIN_im <= "00000000000000000110";
                         wait for 20 ns;
                         CTRL <= "00";
                         wait for 20 ns;
                         DATAIN_re <= "00000000000000000000";
                         DATAIN_im <= "00000000000000000000";
                         ADDRIN_wrRow <= "00";
                         ADDRIN_wrCol <= "00";
                         MSEL <= '0';
                         ADDRIN_rdRow <= "00";
                         ADDRIN_rdCol <= "00";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "01";
                         ADDRIN_rdCol <= "00";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "10";
                         ADDRIN_rdCol <= "00";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "11";
                         ADDRIN_rdCol <= "00";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "00";
                         ADDRIN_rdCol <= "01";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "01";
                         ADDRIN_rdCol <= "01";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "10";
                         ADDRIN_rdCol <= "01";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "11";
                         ADDRIN_rdCol <= "01";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "00";
                         ADDRIN_rdCol <= "10";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "01";
                         ADDRIN_rdCol <= "10";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "10";
                         ADDRIN_rdCol <= "10";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "11";
                         ADDRIN_rdCol <= "10";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "00";
                         ADDRIN_rdCol <= "11";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "01";
                         ADDRIN_rdCol <= "11";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "10";
                         ADDRIN_rdCol <= "11";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "11";
                         ADDRIN_rdCol <= "11";
                         wait for 20 ns;
                         MSEL <= '1';
                         ADDRIN_rdRow <= "00";
                         ADDRIN_rdCol <= "00";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "01";
                         ADDRIN_rdCol <= "00";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "10";
                         ADDRIN_rdCol <= "00";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "11";
                         ADDRIN_rdCol <= "00";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "00";
                         ADDRIN_rdCol <= "01";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "01";
                         ADDRIN_rdCol <= "01";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "10";
                         ADDRIN_rdCol <= "01";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "11";
                         ADDRIN_rdCol <= "01";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "00";
                         ADDRIN_rdCol <= "10";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "01";
                         ADDRIN_rdCol <= "10";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "10";
                         ADDRIN_rdCol <= "10";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "11";
                         ADDRIN_rdCol <= "10";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "00";
                         ADDRIN_rdCol <= "11";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "01";
                         ADDRIN_rdCol <= "11";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "10";
                         ADDRIN_rdCol <= "11";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "11";
                         ADDRIN_rdCol <= "11";
                         wait for 20 ns;
                         CTRL <= "10";
                         MSEL <= '0';
                         wait for 750 ns;
                         ADDRIN_rdRow <= "00";
                         ADDRIN_rdCol <= "00";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "01";
                         ADDRIN_rdCol <= "00";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "10";
                         ADDRIN_rdCol <= "00";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "11";
                         ADDRIN_rdCol <= "00";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "00";
                         ADDRIN_rdCol <= "01";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "01";
                         ADDRIN_rdCol <= "01";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "10";
                         ADDRIN_rdCol <= "01";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "11";
                         ADDRIN_rdCol <= "01";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "00";
                         ADDRIN_rdCol <= "10";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "01";
                         ADDRIN_rdCol <= "10";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "10";
                         ADDRIN_rdCol <= "10";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "11";
                         ADDRIN_rdCol <= "10";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "00";
                         ADDRIN_rdCol <= "11";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "01";
                         ADDRIN_rdCol <= "11";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "10";
                         ADDRIN_rdCol <= "11";
                         wait for 20 ns;
                         ADDRIN_rdRow <= "11";
                         ADDRIN_rdCol <= "11";
                         wait for 20 ns;
                         END_SIM <= TRUE;
                         wait;
                       end process;
                      

----  Component instantiations  ----

MatrixMult : multiplier
  port map(
       CLK => CLK,
       MSEL => MSEL,
       CTRL => CTRL,
       ADDRIN_rdRow => ADDRIN_rdRow,
       ADDRIN_rdCol => ADDRIN_rdCol,
       ADDRIN_wrRow => ADDRIN_wrRow,
       ADDRIN_wrCol => ADDRIN_wrCol,
       DATAIN_re => DATAIN_re,
       DATAIN_im => DATAIN_im,
       QOUT_re => QOUT_re,
       QOUT_im => QOUT_im
  );


end TB_ARCHITECTURE;
