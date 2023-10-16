-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : memory_example
-- Author      : Paul Grindle
-- Company     : Unemployment, Inc.
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\pgrin\Documents\active_hdl_student\memory_example\compile\multiplier.vhd
-- Generated   : Fri May  5 15:22:37 2023
-- From        : C:\Users\pgrin\Documents\active_hdl_student\memory_example\src\multiplier.bde
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
library matrixlib;
use matrixlib.matrixpak.all;

entity multiplier is
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
end multiplier;

architecture mult_arch of multiplier is

---- Component declarations -----

component matrix
  port(
       WE : in STD_LOGIC;
       CLK : in STD_LOGIC;
       ADDRrdRow : in STD_LOGIC_VECTOR(1 downto 0);
       ADDRrdCol : in STD_LOGIC_VECTOR(1 downto 0);
       ADDRwrRow : in STD_LOGIC_VECTOR(1 downto 0);
       ADDRwrCol : in STD_LOGIC_VECTOR(1 downto 0);
       DATAre : in STD_LOGIC_VECTOR(7 downto 0);
       DATAim : in STD_LOGIC_VECTOR(7 downto 0);
       Qre : out STD_LOGIC_VECTOR(7 downto 0);
       Qim : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;

---- Architecture declarations -----
function complexMult (signal data1re : std_logic_vector(19 downto 0);signal data1im : std_logic_vector(19 downto 0);signal data2re : std_logic_vector(19 downto 0);signal data2im : std_logic_vector(19 downto 0)) return twoarr is 
                       variable a : integer;
                       variable b : integer;
                       variable c : integer;
                       variable d : integer;
                       variable resultre : integer;
                       variable resultim : integer;
                       variable resultArr : twoarr;
                     begin
                       a := to_integer(unsigned(data1re));
                       b := to_integer(unsigned(data1im));
                       c := to_integer(unsigned(data2re));
                       d := to_integer(unsigned(data2im));
                       report "Variable a: " & integer'image(a);
                       report "Variable b: " & integer'image(b);
                       report "Variable c: " & integer'image(c);
                       report "Variable d: " & integer'image(d);
                       resultre := (a * c - b * d);
                       report "resultre " & integer'image(resultre);
                       resultim := (a * d + b * c);
                       report "resultim " & integer'image(resultim);
                       resultArr(0) := resultre;
                       report integer'image(resultArr(0));
                       resultArr(1) := resultim;
                       report integer'image(resultArr(1));
                       return resultArr;
                     end function complexMult;
--Added by Active-HDL. Do not change code inside this section.
type twoarr is array (1 downto 0) of INTEGER;
--End of extra code.


---- Signal declarations used on the diagram ----

signal INC_DONE : BOOLEAN := false;
signal MULT_START : BOOLEAN := false;
signal SUM_START : BOOLEAN := false;
signal WE1 : STD_LOGIC := '0';
signal WE2 : STD_LOGIC := '0';
signal WE3 : STD_LOGIC := '0';
signal M1ADDRrdCol : STD_LOGIC_VECTOR(1 downto 0) := "00";
signal M1ADDRrdRow : STD_LOGIC_VECTOR(1 downto 0) := "00";
signal M2ADDRrdCol : STD_LOGIC_VECTOR(1 downto 0) := "00";
signal M2ADDRrdRow : STD_LOGIC_VECTOR(1 downto 0) := "00";
signal M3ADDRrdCol : STD_LOGIC_VECTOR(1 downto 0) := "00";
signal M3ADDRrdRow : STD_LOGIC_VECTOR(1 downto 0) := "00";
signal M3ADDRwrCol : STD_LOGIC_VECTOR(1 downto 0) := "00";
signal M3ADDRwrRow : STD_LOGIC_VECTOR(1 downto 0) := "00";
signal M3DATAim : STD_LOGIC_VECTOR(19 downto 0);
signal M3DATAre : STD_LOGIC_VECTOR(19 downto 0);
signal Q_1im : STD_LOGIC_VECTOR(19 downto 0);
signal Q_1re : STD_LOGIC_VECTOR(19 downto 0);
signal Q_2im : STD_LOGIC_VECTOR(19 downto 0);
signal Q_2re : STD_LOGIC_VECTOR(19 downto 0);
signal Q_3im : STD_LOGIC_VECTOR(19 downto 0);
signal Q_3re : STD_LOGIC_VECTOR(19 downto 0);

begin

---- Processes ----

process (CLK)
                         variable sumre : integer := 0;
                         variable sumim : integer := 0;
                         variable complexResult : twoarr := (0, 0);
                         variable MULT_DONE : boolean;
                         variable i : integer := 0;
                         variable j : integer := 0;
                         variable k : integer := 0;
                         procedure readMatrix is 
                         begin
                           WE1 <= '0';
                           WE2 <= '0';
                           M1ADDRrdRow <= ADDRIN_rdRow;
                           M1ADDRrdCol <= ADDRIN_rdCol;
                           M2ADDRrdRow <= ADDRIN_rdRow;
                           M2ADDRrdCol <= ADDRIN_rdCol;
                           MULT_DONE := false;
                           if (MSEL = '1') then
                              QOUT_re <= Q_2re;
                              QOUT_im <= Q_2im;
                           else 
                              QOUT_re <= Q_1re;
                              QOUT_im <= Q_1im;
                           end if;
                         end procedure readMatrix;
                         procedure writeMatrix is 
                         begin
                           MULT_DONE := false;
                           if MSEL = '1' then
                              WE1 <= '0';
                              WE2 <= '1';
                           else 
                              WE2 <= '0';
                              WE1 <= '1';
                           end if;
                         end procedure writeMatrix;
                         procedure multMatrix is 
                         begin
                           report "Variable i: " & integer'image(i);
                           report "Variable j: " & integer'image(j);
                           report "Variable k: " & integer'image(k);
                           WE1 <= '0';
                           WE2 <= '0';
                           WE3 <= '1';
                           if not MULT_DONE then
                              if MULT_START = true then
                                 complexResult := complexMult(Q_1re,Q_1im,Q_2re,Q_2im);
                                 report "complex result 0: " & integer'image(complexResult(0));
                                 report "complex result 1: " & integer'image(complexResult(1));
                                 sumre := sumre + complexResult(0);
                                 report "sumre: " & integer'image(sumre);
                                 sumim := sumim + complexResult(1);
                                 report "sumim: " & integer'image(sumim);
                              end if;
                              if not INC_DONE then
                                 if k < 3 then
                                    if MULT_START = true then
                                       k := k + 1;
                                    else 
                                       MULT_START <= true;
                                    end if;
                                    if k = 3 then
                                       M3ADDRwrRow <= std_logic_vector(to_unsigned(i,2));
                                       M3ADDRwrCol <= std_logic_vector(to_unsigned(j,2));
                                    end if;
                                 else 
                                    M3DATAre <= std_logic_vector(to_signed(sumre,20));
                                    M3DATAim <= std_logic_vector(to_signed(sumim,20));
                                    k := 0;
                                    sumre := 0;
                                    sumim := 0;
                                    if j < 3 then
                                       j := j + 1;
                                    else 
                                       j := 0;
                                       if i < 3 then
                                          i := i + 1;
                                       else 
                                          i := 0;
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
                           M1ADDRrdRow <= std_logic_vector(to_unsigned(i,2));
                           M1ADDRrdCol <= std_logic_vector(to_unsigned(k,2));
                           M2ADDRrdRow <= std_logic_vector(to_unsigned(k,2));
                           M2ADDRrdCol <= std_logic_vector(to_unsigned(j,2));
                           QOUT_re <= Q_3re;
                           QOUT_im <= Q_3im;
                         end procedure multMatrix;
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
                      

---- User Signal Assignments ----
M3ADDRrdRow <= ADDRIN_rdRow;
M3ADDRrdCol <= ADDRIN_rdCol;

----  Component instantiations  ----

M1 : matrix
  port map(
       WE => WE1,
       CLK => CLK,
       ADDRrdRow => M1ADDRrdRow,
       ADDRrdCol => M1ADDRrdCol,
       ADDRwrRow => ADDRIN_wrRow,
       ADDRwrCol => ADDRIN_wrCol,
       DATAre(7) => DATAIN_re(19),
       DATAre(6) => DATAIN_re(18),
       DATAre(5) => DATAIN_re(17),
       DATAre(4) => DATAIN_re(16),
       DATAre(3) => DATAIN_re(15),
       DATAre(2) => DATAIN_re(14),
       DATAre(1) => DATAIN_re(13),
       DATAre(0) => DATAIN_re(12),
       DATAim(7) => DATAIN_im(19),
       DATAim(6) => DATAIN_im(18),
       DATAim(5) => DATAIN_im(17),
       DATAim(4) => DATAIN_im(16),
       DATAim(3) => DATAIN_im(15),
       DATAim(2) => DATAIN_im(14),
       DATAim(1) => DATAIN_im(13),
       DATAim(0) => DATAIN_im(12),
       Qre(7) => Q_1re(19),
       Qre(6) => Q_1re(18),
       Qre(5) => Q_1re(17),
       Qre(4) => Q_1re(16),
       Qre(3) => Q_1re(15),
       Qre(2) => Q_1re(14),
       Qre(1) => Q_1re(13),
       Qre(0) => Q_1re(12),
       Qim(7) => Q_1im(19),
       Qim(6) => Q_1im(18),
       Qim(5) => Q_1im(17),
       Qim(4) => Q_1im(16),
       Qim(3) => Q_1im(15),
       Qim(2) => Q_1im(14),
       Qim(1) => Q_1im(13),
       Qim(0) => Q_1im(12)
  );

M2 : matrix
  port map(
       WE => WE2,
       CLK => CLK,
       ADDRrdRow => M2ADDRrdRow,
       ADDRrdCol => M2ADDRrdCol,
       ADDRwrRow => ADDRIN_wrRow,
       ADDRwrCol => ADDRIN_wrCol,
       DATAre(7) => DATAIN_re(19),
       DATAre(6) => DATAIN_re(18),
       DATAre(5) => DATAIN_re(17),
       DATAre(4) => DATAIN_re(16),
       DATAre(3) => DATAIN_re(15),
       DATAre(2) => DATAIN_re(14),
       DATAre(1) => DATAIN_re(13),
       DATAre(0) => DATAIN_re(12),
       DATAim(7) => DATAIN_im(19),
       DATAim(6) => DATAIN_im(18),
       DATAim(5) => DATAIN_im(17),
       DATAim(4) => DATAIN_im(16),
       DATAim(3) => DATAIN_im(15),
       DATAim(2) => DATAIN_im(14),
       DATAim(1) => DATAIN_im(13),
       DATAim(0) => DATAIN_im(12),
       Qre(7) => Q_2re(19),
       Qre(6) => Q_2re(18),
       Qre(5) => Q_2re(17),
       Qre(4) => Q_2re(16),
       Qre(3) => Q_2re(15),
       Qre(2) => Q_2re(14),
       Qre(1) => Q_2re(13),
       Qre(0) => Q_2re(12),
       Qim(7) => Q_2im(19),
       Qim(6) => Q_2im(18),
       Qim(5) => Q_2im(17),
       Qim(4) => Q_2im(16),
       Qim(3) => Q_2im(15),
       Qim(2) => Q_2im(14),
       Qim(1) => Q_2im(13),
       Qim(0) => Q_2im(12)
  );

M3 : matrix
  port map(
       WE => WE3,
       CLK => CLK,
       ADDRrdRow => M3ADDRrdRow,
       ADDRrdCol => M3ADDRrdCol,
       ADDRwrRow => M3ADDRwrRow,
       ADDRwrCol => M3ADDRwrCol,
       DATAre(7) => M3DATAre(19),
       DATAre(6) => M3DATAre(18),
       DATAre(5) => M3DATAre(17),
       DATAre(4) => M3DATAre(16),
       DATAre(3) => M3DATAre(15),
       DATAre(2) => M3DATAre(14),
       DATAre(1) => M3DATAre(13),
       DATAre(0) => M3DATAre(12),
       DATAim(7) => M3DATAim(19),
       DATAim(6) => M3DATAim(18),
       DATAim(5) => M3DATAim(17),
       DATAim(4) => M3DATAim(16),
       DATAim(3) => M3DATAim(15),
       DATAim(2) => M3DATAim(14),
       DATAim(1) => M3DATAim(13),
       DATAim(0) => M3DATAim(12),
       Qre(7) => Q_3re(19),
       Qre(6) => Q_3re(18),
       Qre(5) => Q_3re(17),
       Qre(4) => Q_3re(16),
       Qre(3) => Q_3re(15),
       Qre(2) => Q_3re(14),
       Qre(1) => Q_3re(13),
       Qre(0) => Q_3re(12),
       Qim(7) => Q_3im(19),
       Qim(6) => Q_3im(18),
       Qim(5) => Q_3im(17),
       Qim(4) => Q_3im(16),
       Qim(3) => Q_3im(15),
       Qim(2) => Q_3im(14),
       Qim(1) => Q_3im(13),
       Qim(0) => Q_3im(12)
  );


end mult_arch;
