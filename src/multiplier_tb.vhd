-----------------------------------------
-- Appendix D.4 - multiplier_tb.vhd
-----------------------------------------

---------------------------------------------------------------------------------------------------
--
-- Title       : TestBench for ram
-- Design      : example
-- Author      : Aldec
-- Company     : Aldec
--
---------------------------------------------------------------------------------------------------
--
-- File        : $dsn\src\ram_tb.vhd
-- Generated   : 9/20/2004, 10:54 AM
-- From        : $dsn\src\ram.vhd
-- By          : Active-HDL Built-in Test Bench Generator ver. 1.2s
--
---------------------------------------------------------------------------------------------------
--
-- Description : TestBench for ram	 
	-- https://adrianstoll.com/post/complex-matrix-product-calculator/
--
---------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity mult_tb is
end mult_tb;

architecture TB_ARCHITECTURE of mult_tb is
	-- Component declaration of the tested unit
	component multiplier
	port(
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
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal CLK : std_logic;
	signal MSEL : std_logic;
	signal CTRL : std_logic_vector(1 downto 0);
	signal ADDRIN_rdRow : std_logic_vector(1 downto 0);
	signal ADDRIN_rdCol : std_logic_vector(1 downto 0);
	signal ADDRIN_wrRow : std_logic_vector(1 downto 0);
	signal ADDRIN_wrCol : std_logic_vector(1 downto 0);
	signal DATAIN_re : std_logic_vector(19 downto 0);
	signal DATAIN_im : std_logic_vector(19 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal QOUT_re : std_logic_vector(19 downto 0);
	signal QOUT_im : std_logic_vector(19 downto 0);

	--Signal is used to stop clock signal generators
	signal END_SIM: BOOLEAN:=FALSE;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	MatrixMult : multiplier
		port map (
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

	--Below VHDL code is an inserted .\compile\ram.vhs
	--User can modify it ....

STIMULUS: process
begin  -- of stimulus process
--wait for <time to next event>; -- <current time>

	-----------------------
	-- INITIALIZE MEMORY --
	--M1
	MSEL <= '0';
	CTRL <= "01";
	ADDRIN_rdRow <= "00";
	ADDRIN_rdCol <= "00";
	--START_SIM <= true; 
	wait for 20 ns;
	ADDRIN_wrRow <= "00";
	ADDRIN_wrCol <= "00";
	DATAIN_re <= "00000000000011010011";
	DATAIN_im <= "00000000000011001000";
     wait for 20 ns; --0 fs
	ADDRIN_wrRow <= "00";
	ADDRIN_wrCol <= "01";
	DATAIN_re <= "00000000000011010101";
	DATAIN_im <= "00000000000000011110";
	wait for 20 ns; --20 ns
	ADDRIN_wrRow <= "00";
	ADDRIN_wrCol <= "10";
	DATAIN_re <= "00000000000000100011";
	DATAIN_im <= "00000000000000011010";
	wait for 20 ns; --20 ns
	ADDRIN_wrRow <= "00";
	ADDRIN_wrCol <= "11";
	DATAIN_re <= "00000000000000100000";
	DATAIN_im <= "00000000000001010011";
	wait for 20 ns; --20 ns 
	ADDRIN_wrRow <= "01";
	ADDRIN_wrCol <= "00";
	DATAIN_re <= "00000000000001100011";
	DATAIN_im <= "00000000000011000011";
	wait for 20 ns; --20 ns 
	ADDRIN_wrRow <= "01";
	ADDRIN_wrCol <= "01";
	DATAIN_re <= "00000000000010111010";
	DATAIN_im <= "00000000000000110011";
	wait for 20 ns; --20 ns 
	ADDRIN_wrRow <= "01";
	ADDRIN_wrCol <= "10";
	DATAIN_re <= "00000000000011100110";
	DATAIN_im <= "00000000000011100100";
	wait for 20 ns; --20 ns 
	ADDRIN_wrRow <= "01";
	ADDRIN_wrCol <= "11";
	DATAIN_re <= "00000000000000110100";
	DATAIN_im <= "00000000000010000001";
	wait for 20 ns; --20 ns 
	ADDRIN_wrRow <= "10";
	ADDRIN_wrCol <= "00";
	DATAIN_re <= "00000000000001000101";
	DATAIN_im <= "00000000000010010100";
	wait for 20 ns; --20 ns 
	ADDRIN_wrRow <= "10";
	ADDRIN_wrCol <= "01";
	DATAIN_re <= "00000000000000100000";
	DATAIN_im <= "00000000000010111001";
	wait for 20 ns; --20 ns 
	ADDRIN_wrRow <= "10";
	ADDRIN_wrCol <= "10";
	DATAIN_re <= "00000000000011100001";
	DATAIN_im <= "00000000000010110100";
	wait for 20 ns; --20 ns 
	ADDRIN_wrRow <= "10";
	ADDRIN_wrCol <= "11";
	DATAIN_re <= "00000000000001010101";
	DATAIN_im <= "00000000000011100100";
	wait for 20 ns; --20 ns  
	ADDRIN_wrRow <= "11";
	ADDRIN_wrCol <= "00";
	DATAIN_re <= "00000000000001001111";
	DATAIN_im <= "00000000000000100001";
	wait for 20 ns; --20 ns 
	ADDRIN_wrRow <= "11";
	ADDRIN_wrCol <= "01";
	DATAIN_re <= "00000000000010011010";
	DATAIN_im <= "00000000000010010000";
	wait for 20 ns; --20 ns 
	ADDRIN_wrRow <= "11";
	ADDRIN_wrCol <= "10";
	DATAIN_re <= "00000000000011110000";
	DATAIN_im <= "00000000000010000001";
	wait for 20 ns; --20 ns 
	ADDRIN_wrRow <= "11";
	ADDRIN_wrCol <= "11";
	DATAIN_re <= "00000000000010110111";
	DATAIN_im <= "00000000000000010000";
	wait for 20 ns; --20 ns 
	----M2
	MSEL <= '1';
	wait for 20 ns;
	ADDRIN_wrRow <= "00";
	ADDRIN_wrCol <= "00";
	DATAIN_re <= "00000000000000110101";
	DATAIN_im <= "00000000000010110110";
    wait for 20 ns; --0 fs
	 
	ADDRIN_wrRow <= "00";
	ADDRIN_wrCol <= "01";
	DATAIN_re <= "00000000000010011111";
	DATAIN_im <= "00000000000000111010";
	wait for 20 ns; --20 ns
	
	ADDRIN_wrRow <= "00";
	ADDRIN_wrCol <= "10";
	DATAIN_re <= "00000000000010101110";
	DATAIN_im <= "00000000000011011111";
	wait for 20 ns; --20 ns
	
	ADDRIN_wrRow <= "00";
	ADDRIN_wrCol <= "11";
	DATAIN_re <= "00000000000001001011";
	DATAIN_im <= "00000000000010100000";
	wait for 20 ns; --20 ns 
	
	ADDRIN_wrRow <= "01";
	ADDRIN_wrCol <= "00";
	DATAIN_re <= "00000000000011010011";
	DATAIN_im <= "00000000000010101001";
	wait for 20 ns; --20 ns 
	
	ADDRIN_wrRow <= "01";
	ADDRIN_wrCol <= "01";
	DATAIN_re <= "00000000000010111010";
	DATAIN_im <= "00000000000001011110";
	wait for 20 ns; --20 ns 
	
	ADDRIN_wrRow <= "01";
	ADDRIN_wrCol <= "10";
	DATAIN_re <= "00000000000010000111";
	DATAIN_im <= "00000000000000000101";
	wait for 20 ns; --20 ns 
	
	ADDRIN_wrRow <= "01";
	ADDRIN_wrCol <= "11";
	DATAIN_re <= "00000000000010111011";
	DATAIN_im <= "00000000000010110011";
	wait for 20 ns; --20 ns 
	
	ADDRIN_wrRow <= "10";
	ADDRIN_wrCol <= "00";
	DATAIN_re <= "00000000000000100111";
	DATAIN_im <= "00000000000001000000";
	wait for 20 ns; --20 ns 
	
	ADDRIN_wrRow <= "10";
	ADDRIN_wrCol <= "01";
	DATAIN_re <= "00000000000010001101";
	DATAIN_im <= "00000000000011011010";
	wait for 20 ns; --20 ns 
	
	ADDRIN_wrRow <= "10";
	ADDRIN_wrCol <= "10";
	DATAIN_re <= "00000000000001101110";
	DATAIN_im <= "00000000000000100111";
	wait for 20 ns; --20 ns 
	
	ADDRIN_wrRow <= "10";
	ADDRIN_wrCol <= "11";
	DATAIN_re <= "00000000000010111110";
	DATAIN_im <= "00000000000011000100";
	wait for 20 ns; --20 ns 
	
	ADDRIN_wrRow <= "11";
	ADDRIN_wrCol <= "00";
	DATAIN_re <= "00000000000011000101";
	DATAIN_im <= "00000000000011101100";
	wait for 20 ns; --20 ns 
	
	ADDRIN_wrRow <= "11";
	ADDRIN_wrCol <= "01";
	DATAIN_re <= "00000000000011111001";
	DATAIN_im <= "00000000000011101011";
	wait for 20 ns; --20 ns 
	
	ADDRIN_wrRow <= "11";
	ADDRIN_wrCol <= "10";
	DATAIN_re <= "00000000000001011011";
	DATAIN_im <= "00000000000001011000";
	wait for 20 ns; --20 ns 
	
	ADDRIN_wrRow <= "11";
	ADDRIN_wrCol <= "11";
	DATAIN_re <= "00000000000001101111";
	DATAIN_im <= "00000000000000000110";
	wait for 20 ns; --20 ns 
	-------------------------
	-- END OF INITIALIZING --
	--       MEMORY        --
	-------------------
	-- START READING --
	CTRL <= "00";
	wait for 20ns;
	DATAIN_re <= "00000000000000000000";	
	DATAIN_im <= "00000000000000000000";
	ADDRIN_wrRow <= "00";	 
	ADDRIN_wrCol <= "00"; 
	--M1
	MSEL <= '0';
	ADDRIN_rdRow <= "00";
	ADDRIN_rdCol <= "00";
    wait for 20 ns; --0 fs
	ADDRIN_rdRow <= "01";
	ADDRIN_rdCol <= "00";
	wait for 20 ns; --20 ns
	ADDRIN_rdRow <= "10";
	ADDRIN_rdCol <= "00";
	wait for 20 ns; --20 ns
	ADDRIN_rdRow <= "11";
	ADDRIN_rdCol <= "00";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "00";
	ADDRIN_rdCol <= "01";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "01";
	ADDRIN_rdCol <= "01";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "10";
	ADDRIN_rdCol <= "01";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "11";
	ADDRIN_rdCol <= "01";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "00";
	ADDRIN_rdCol <= "10";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "01";
	ADDRIN_rdCol <= "10";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "10";
	ADDRIN_rdCol <= "10";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "11";
	ADDRIN_rdCol <= "10";
	wait for 20 ns; --20 ns  
	ADDRIN_rdRow <= "00";
	ADDRIN_rdCol <= "11";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "01";
	ADDRIN_rdCol <= "11";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "10";
	ADDRIN_rdCol <= "11";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "11";
	ADDRIN_rdCol <= "11";
	wait for 20 ns; --20 ns  
	--M2
	MSEL <= '1';
	ADDRIN_rdRow <= "00";
	ADDRIN_rdCol <= "00";
    wait for 20 ns; --0 fs
	ADDRIN_rdRow <= "01";
	ADDRIN_rdCol <= "00";
	wait for 20 ns; --20 ns
	ADDRIN_rdRow <= "10";
	ADDRIN_rdCol <= "00";
	wait for 20 ns; --20 ns
	ADDRIN_rdRow <= "11";
	ADDRIN_rdCol <= "00";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "00";
	ADDRIN_rdCol <= "01";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "01";
	ADDRIN_rdCol <= "01";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "10";
	ADDRIN_rdCol <= "01";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "11";
	ADDRIN_rdCol <= "01";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "00";
	ADDRIN_rdCol <= "10";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "01";
	ADDRIN_rdCol <= "10";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "10";
	ADDRIN_rdCol <= "10";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "11";
	ADDRIN_rdCol <= "10";
	wait for 20 ns; --20 ns  
	ADDRIN_rdRow <= "00";
	ADDRIN_rdCol <= "11";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "01";
	ADDRIN_rdCol <= "11";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "10";
	ADDRIN_rdCol <= "11";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "11";
	ADDRIN_rdCol <= "11";
	wait for 20 ns; --20 ns 
	
	-- MULTIPLY --
	CTRL <= "10";
	MSEL <= '0';
	--ADDRIN_rdRow <= "ZZ";
	--ADDRIN_rdCol <= "ZZ";
	--MSEL <= 'Z';
	-- 20 ns wait per element, 16 element matrix
	wait for 750 ns;  
	ADDRIN_rdRow <= "00";
	ADDRIN_rdCol <= "00";
    wait for 20 ns; --0 fs
	ADDRIN_rdRow <= "01";
	ADDRIN_rdCol <= "00";
	wait for 20 ns; --20 ns
	ADDRIN_rdRow <= "10";
	ADDRIN_rdCol <= "00";
	wait for 20 ns; --20 ns
	ADDRIN_rdRow <= "11";
	ADDRIN_rdCol <= "00";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "00";
	ADDRIN_rdCol <= "01";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "01";
	ADDRIN_rdCol <= "01";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "10";
	ADDRIN_rdCol <= "01";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "11";
	ADDRIN_rdCol <= "01";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "00";
	ADDRIN_rdCol <= "10";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "01";
	ADDRIN_rdCol <= "10";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "10";
	ADDRIN_rdCol <= "10";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "11";
	ADDRIN_rdCol <= "10";
	wait for 20 ns; --20 ns  
	ADDRIN_rdRow <= "00";
	ADDRIN_rdCol <= "11";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "01";
	ADDRIN_rdCol <= "11";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "10";
	ADDRIN_rdCol <= "11";
	wait for 20 ns; --20 ns 
	ADDRIN_rdRow <= "11";
	ADDRIN_rdCol <= "11";
	wait for 20 ns; --20 ns
	--------------------
	-- WRITE AND READ --
--	WE <= '1';
--	ADDRIN_wr <= "0001111";
--	DATAIN_re <= "11111111";
--	DATAIN_im <= "11111111";
--	wait for 20 ns; --1300 ns
--	wait for 20 ns; --1320 ns
--	WE <= '0';
--	DATAIN_re <= "ZZZZZZZZ";
--	DATAIN_im <= "ZZZZZZZZ";
--	ADDRIN_rd <= "0001111";
--	------------------1320 ns
--	wait for 20 ns; --1330 ns
	END_SIM <= TRUE;
--	end of stimulus events
	wait;
end process; -- end of stimulus process
	
CLOCK_CLK : process
begin
	--if START_SIM = true then
		if END_SIM = FALSE then
			CLK <= '0';
			wait for 5 ns; --0 fs
		else
			wait;
		end if;
		if END_SIM = FALSE then
			CLK <= '1';
			wait for 5 ns; --5 ns
		else
			wait;
		end if;
	--end if;
end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_mult of mult_tb is
	for TB_ARCHITECTURE
		for MatrixMult : multiplier
			use entity work.multiplier(mult_arch);
		end for;
	end for;
end TESTBENCH_FOR_mult;

