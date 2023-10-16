-----------------------------------------
-- Appendix D.2 - matrixlib.vhd
-----------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package matrixpak is

component matrix is 
	port(WE : in std_logic;                           --write enable, 0 for read 1 for write
		CLK : in std_logic;                          --rising edge
		ADDRrdRow : in std_logic_vector(1 downto 0); --x location for WE=0
		ADDRrdCol : in std_logic_vector(1 downto 0); --y location for WE=0
		ADDRwrRow : in std_logic_vector(1 downto 0); --x location for WE=1
		ADDRwrCol : in std_logic_vector(1 downto 0); --y location for WE=1
		DATAre : in std_logic_vector(19 downto 0);    --8 bit real input component
		DATAim : in std_logic_vector(19 downto 0);	 --8 bit imaginary input component
		Qre : out std_logic_vector(19 downto 0);		 --8 bit real output component
		Qim : out std_logic_vector(19 downto 0)		 --8 bit imaginary output component
		);
end component matrix;

end package matrixpak;