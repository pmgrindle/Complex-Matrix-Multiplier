-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : memory_example
-- Author      : Paul Grindle
-- Company     : Unemployment, Inc.
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\pgrin\Documents\active_hdl_student\memory_example\compile\matrix.vhd
-- Generated   : Fri May  5 15:22:36 2023
-- From        : C:\Users\pgrin\Documents\active_hdl_student\memory_example\src\matrix.bde
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
use ieee.NUMERIC_STD.all;

entity matrix is
  port(
       WE : in STD_LOGIC;
       CLK : in STD_LOGIC;
       ADDRrdRow : in STD_LOGIC_VECTOR(1 downto 0);
       ADDRrdCol : in STD_LOGIC_VECTOR(1 downto 0);
       ADDRwrRow : in STD_LOGIC_VECTOR(1 downto 0);
       ADDRwrCol : in STD_LOGIC_VECTOR(1 downto 0);
       DATAre : in STD_LOGIC_VECTOR(19 downto 0);
       DATAim : in STD_LOGIC_VECTOR(19 downto 0);
       Qre : out STD_LOGIC_VECTOR(19 downto 0);
       Qim : out STD_LOGIC_VECTOR(19 downto 0)
  );
end matrix;

architecture matrix_arch of matrix is

---- Architecture declarations -----
--Added by Active-HDL. Do not change code inside this section.
type matrix_mem_type is array (3 downto 0,3 downto 0) of STD_LOGIC_VECTOR(39 downto 0);
--End of extra code.


---- Signal declarations used on the diagram ----

signal matrix_mem : matrix_mem_type;
signal Q_OUT : STD_LOGIC_VECTOR(39 downto 0);

begin

---- Processes ----

process (CLK)
                       begin
                         if rising_edge(CLK) then
                            if (WE = '1') then
                               matrix_mem(to_integer(unsigned(ADDRwrRow)),to_integer(unsigned(ADDRwrCol))) <= DATAre & DATAim;
                            end if;
                         end if;
                       end process;
                      

---- User Signal Assignments ----
Q_OUT <= matrix_mem(to_integer(unsigned(ADDRrdRow)),to_integer(unsigned(ADDRrdCol)));
Qre <= Q_OUT(39 downto 20);

---- Terminal assignment ----

    -- Output\buffer terminals
	Qim(0) <= Q_OUT(0);
	Qim(1) <= Q_OUT(1);
	Qim(10) <= Q_OUT(10);
	Qim(11) <= Q_OUT(11);
	Qim(12) <= Q_OUT(12);
	Qim(13) <= Q_OUT(13);
	Qim(14) <= Q_OUT(14);
	Qim(15) <= Q_OUT(15);
	Qim(16) <= Q_OUT(16);
	Qim(17) <= Q_OUT(17);
	Qim(18) <= Q_OUT(18);
	Qim(19) <= Q_OUT(19);
	Qim(2) <= Q_OUT(2);
	Qim(3) <= Q_OUT(3);
	Qim(4) <= Q_OUT(4);
	Qim(5) <= Q_OUT(5);
	Qim(6) <= Q_OUT(6);
	Qim(7) <= Q_OUT(7);
	Qim(8) <= Q_OUT(8);
	Qim(9) <= Q_OUT(9);


end matrix_arch;
