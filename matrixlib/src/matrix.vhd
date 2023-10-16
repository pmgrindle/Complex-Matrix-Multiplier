------------------------------------------------------------------------------------
--
-- Based on a Design unit generated and copyrighted by Aldec IP Core Generator, version 6.3
-- Aldec Generation: Monday 2004-09-20, 10:47:28
-- Current Code Creation: 2/16/2023
--
------------------------------------------------------------------------------------
-- Details:
--		Type: Synchronous 4x4 Read/Write 8bit Complex Number Matrix
--		Word size: 16 bits (8 bits re, 8 bits im)
--		Memory depth: 16 words
--		Clock input CLK active high
--		Write enable input WE active high
------------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity matrix is
	port (
		WE : in std_logic;                           --write enable, 0 for read 1 for write
		CLK : in std_logic;                          --rising edge
		ADDRrdRow : in std_logic_vector(1 downto 0); --x location for WE=0
		ADDRrdCol : in std_logic_vector(1 downto 0); --y location for WE=0
		ADDRwrRow : in std_logic_vector(1 downto 0); --x location for WE=1
		ADDRwrCol : in std_logic_vector(1 downto 0); --y location for WE=1
		DATAre : in std_logic_vector(7 downto 0);    --8 bit real input component
		DATAim : in std_logic_vector(7 downto 0);	 --8 bit imaginary input component
		Qre : out std_logic_vector(7 downto 0);		 --8 bit real output component
		Qim : out std_logic_vector(7 downto 0)		 --8 bit imaginary output component
	);
end entity;


architecture matrix_arch of matrix is

--establish 4x4 matrix type of 16 bit vectors
--matrix elements consist of real and imaginary parts as single vector, 8 bits re then 8 bits im
type matrix_mem_type is array (3 downto 0, 3 downto 0) of std_logic_vector (15 downto 0);
--create matrix object of established matrix_mem_type
--!!!!SHOULD BE CREATED AS SOMETHING OTHER THAN SIGNAL!!!!
signal matrix_mem : matrix_mem_type;
--output signal to store retrieved memory values pre-splice
signal Q_OUT : std_logic_vector(15 downto 0);

begin
	process (CLK)
	begin
		if rising_edge(CLK) then
			if (WE = '1') then
				--concatenate real and imaginary, use address-write input signals to store in matrix signal
				matrix_mem(CONV_INTEGER(ADDRwrRow), CONV_INTEGER(ADDRwrCol)) <= DATAre & DATAim;
			end if;
		end if;
	end process;
	--use address-read input signals to locate matrix element from storage signal, assign to output singal 
	Q_OUT <= matrix_mem(CONV_INTEGER(ADDRrdRow), CONV_INTEGER(ADDRrdCol));
	--splice for real and imaginary, assign to output ports
	Qre <= Q_OUT(15 downto 8);
	Qim <= Q_OUT(7 downto 0);

end architecture;