-----------------------------------------
-- Appendix D.2 - multiplier.vhd
-----------------------------------------

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

-- controlling entity that creates the two input matrices, one multiply output matrix, and multiplexes read-write-multiply
library IEEE;
library matrixlib;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use matrixlib.matrixpak.all;

entity multiplier is
	port (
		CLK : in std_logic;
		MSEL : in std_logic;
		CTRL : in std_logic_vector(1 downto 0);
		ADDRIN_rdRow : in std_logic_vector(1 downto 0);
		ADDRIN_rdCol : in std_logic_vector(1 downto 0);
		ADDRIN_wrRow : in std_logic_vector(1 downto 0);
		ADDRIN_wrCol : in std_logic_vector(1 downto 0);
		DATAIN_re : in std_logic_vector(19 downto 0);
		DATAIN_im : in std_logic_vector(19 downto 0);
		QOUT_re : out std_logic_vector(19 downto 0);
		QOUT_im : out std_logic_vector(19 downto 0)
	);
end multiplier;   


architecture mult_arch of multiplier is

-- establish signals for each matrix output so process can choose matrix to put on main Q line
-- create internal data-in signals to feed complexMult results into M3
signal Q_1re, Q_1im, Q_2re, Q_2im, Q_3re, Q_3im, M3DATAre, M3DATAim : std_logic_vector(19 downto 0);	
-- establish signals for reading M1 and M2 values so process can switch between the user read request and reading all values for mult
-- create internal location signals to target cells in M3 to send mult result data to
signal M1ADDRrdRow, M1ADDRrdCol, M2ADDRrdRow, M2ADDRrdCol, M3ADDRrdRow, M3ADDRrdCol, M3ADDRwrRow, M3ADDRwrCol : std_logic_vector(1 downto 0) := "00";
-- create internal write signals to multiplex the user write signal to when enabled
-- create internal write signal for putting data into M3
signal WE1, WE2, WE3: std_logic := '0';  
-- typewrap a 2 element array for complexMult output
type twoarr is array (1 downto 0) of integer;

--signal sumre, sumim : integer := 0;	
--signal complexResult : twoarr := (0, 0);	
--check signal for initial junk read cycle of mult
signal MULT_START, SUM_START, INC_DONE : boolean := false;


function complexMult(signal data1re, data1im, data2re, data2im : std_logic_vector(19 downto 0)) 
					return twoarr is
variable a, b, c, d, resultre, resultim: integer; --input and output component converstion storage
variable resultArr : twoarr; --2 element return array
begin 	
	--abstract the data pieces into formula pieces
	a := to_integer(unsigned(data1re));
	b := to_integer(unsigned(data1im));
	c := to_integer(unsigned(data2re));
	d := to_integer(unsigned(data2im));
	report "Variable a: " & integer'image(a);
	report "Variable b: " & integer'image(b);
	report "Variable c: " & integer'image(c);
	report "Variable d: " & integer'image(d); 
	--calculate real
	resultre := (a*c - b*d); 
	report "resultre " & integer'image(resultre);
	--calculate imaginary
	resultim := (a*d + b*c); 
	report "resultim " & integer'image(resultim);
	--store results in output array and return
	resultArr(0) := resultre;
	report integer'image(resultArr(0));
	resultArr(1) := resultim;
	report integer'image(resultArr(1));
	return resultArr;
end function complexMult;	


begin
	M1 : entity work.matrix port map(WE1, CLK, M1ADDRrdRow, M1ADDRrdCol, ADDRIN_wrRow, ADDRIN_wrCol, DATAIN_re, DATAIN_im, Q_1re, Q_1im);
	M2 : entity work.matrix port map(WE2, CLK, M2ADDRrdRow, M2ADDRrdCol, ADDRIN_wrRow, ADDRIN_wrCol, DATAIN_re, DATAIN_im, Q_2re, Q_2im);
	M3 : entity work.matrix port map(WE3, CLK, M3ADDRrdRow, M3ADDRrdCol, M3ADDRwrRow, M3ADDRwrCol, M3DATAre, M3DATAim, Q_3re, Q_3im);
	M3ADDRrdRow <= ADDRIN_rdRow;
	M3ADDRrdCol <= ADDRIN_rdCol;
	
	process (CLK) is
		variable sumre, sumim : integer := 0; 
		variable complexResult : twoarr := (0,0);
		variable MULT_DONE : boolean; 
		variable i, j, k : integer := 0;
		--R1_DEL, R2_DEL, W_DEL
		
		procedure readMatrix is
		begin
			WE1 <= '0';
			WE2 <= '0';
			--if not R1_DEL then
			M1ADDRrdRow <= ADDRIN_rdRow;
			M1ADDRrdCol <= ADDRIN_rdCol;
			M2ADDRrdRow <= ADDRIN_rdRow;
			M2ADDRrdCol <= ADDRIN_rdCol;
			MULT_DONE := false;
				--R1_DEL := true;
				--R2_DEL := false;
				--W_DEL := false;
			--else 
			if(MSEL = '1') then
				QOUT_re <= Q_2re;
				QOUT_im <= Q_2im;
			else
				QOUT_re <= Q_1re;	
				QOUT_im <= Q_1im;
			end if;
				--R1_DEL := false;
			--end if;
		end procedure; 
		
		procedure writeMatrix is
		begin
			MULT_DONE := false;
			--R1_DEL := false;
			--R2_DEL := false;
			--W_DEL := false;
			if MSEL = '1' then
				WE1 <= '0';
				WE2 <= '1';
			else		   
				WE2 <= '0';
				WE1 <= '1';
			end if;
		end procedure; 
		
		procedure multMatrix is
		begin 
			report "Variable i: " & integer'image(i);
			report "Variable j: " & integer'image(j);
			report "Variable k: " & integer'image(k);
			--only write to M3
			WE1 <= '0';
			WE2 <= '0';
		 	WE3 <= '1';	
			--run mult procedure each clock cycle until M1 and M2 have been fully read through
			--M1: n by m where n and m = 4, M2: m by p where m and p = 4
			if not MULT_DONE then
				if MULT_START = true then
					--collect re+im sums of the complex products across each read of M1 and M2
					--complexMult returns concatenated 8bit each re&im, so split down the middle for each sum
					complexResult :=  complexMult(Q_1re, Q_1im, Q_2re, Q_2im);
					report "complex result 0: " & integer'image(complexResult(0));
					report "complex result 1: " & integer'image(complexResult(1));
					sumre := sumre + complexResult(0);
					report "sumre: " & integer'image(sumre);
					sumim := sumim + complexResult(1);		
					report "sumim: " & integer'image(sumim);	
				end if;
				if not INC_DONE then
				--only add to sums if junk cycle completed
				--run through 4 k's per j
				--k runs from 0 to m-1 and m=4		
					if k < 3 then 
						--only start incrementing after junk cycle
						if MULT_START = true then
							k := k + 1;	
						--indicate junk cycle completed
						else
							MULT_START <= true;
						end if;
						if k = 3 then
							--target the i,j of M3 for writing
							--assign the value in code 1 cycle early so vhdl assigns signal in time for data writing
							M3ADDRwrRow <= std_logic_vector(to_unsigned(i, 2));
							M3ADDRwrCol <= std_logic_vector(to_unsigned(j, 2));
						end if;
					else
						--write complex product sum to re+im input buffers of M3
						M3DATAre <= std_logic_vector(to_signed(sumre, 20));
						M3DATAim <= std_logic_vector(to_signed(sumim, 20));
						--clear k and sum for future cycles
						k := 0;
						sumre := 0;
						sumim := 0;
						--run through 4 j's per i
						--this means 4k's * 4j's = 16 k's per i
						--j runs from 0 to p-1 and p=4
						if j < 3 then
							j := j + 1;
						else
							--clear j for future cycles
							j := 0;
							--4 i's for the algo
							--i runs from 0 to n-1 and n=4
							if i < 3 then
								i := i + 1;
							else
								--clear i for future cycles
								i := 0;
								--finished multiplying, keep procedure from going further 
								INC_DONE <= true;
							end if;
						end if;		
					end if;
				else
					MULT_DONE := true;
					MULT_START <= false;
					INC_DONE <= false;
				end if;
			end if;
			--iteratively read M1 and M2 from the i, j, k values
			M1ADDRrdRow <= std_logic_vector(to_unsigned(i, 2));
			M1ADDRrdCol <= std_logic_vector(to_unsigned(k, 2));
			M2ADDRrdRow <= std_logic_vector(to_unsigned(k, 2));
			M2ADDRrdCol <= std_logic_vector(to_unsigned(j, 2));
			--assign M3 mult output to entity Q lines
			QOUT_re <= Q_3re;
			QOUT_im <= Q_3im;
		end procedure;
		
	begin
		if rising_edge(CLK) then
			if CTRL = "00" then
				readMatrix;
			elsif CTRL = "01" then
				writeMatrix;
			elsif CTRL = "10" then
				multMatrix;
			end if;	 
		end if;
	end process;			

end architecture;