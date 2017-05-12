-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.mac_types.all;

entity mac_topentity_smact is
  port(acc    : in signed(8 downto 0);
       ds     : in mac_types.tup2;
       result : out mac_types.tup2_0);
end;

architecture structural of mac_topentity_smact is
  signal app_arg   : signed(8 downto 0);
  signal app_arg_0 : signed(8 downto 0);
  signal app_arg_1 : signed(8 downto 0);
  signal app_arg_2 : signed(8 downto 0);
  signal case_alt  : mac_types.tup2_0;
  signal x         : signed(3 downto 0);
  signal y         : signed(3 downto 0);
begin
  app_arg <= resize(x,9);
  
  app_arg_0 <= resize(y,9);
  
  app_arg_1 <= resize(app_arg * app_arg_0, 9);
  
  app_arg_2 <= acc + app_arg_1;
  
  case_alt <= (tup2_0_sel0 => app_arg_2
              ,tup2_0_sel1 => acc);
  
  x <= ds.tup2_sel0;
  
  y <= ds.tup2_sel1;
  
  result <= case_alt;
end;
