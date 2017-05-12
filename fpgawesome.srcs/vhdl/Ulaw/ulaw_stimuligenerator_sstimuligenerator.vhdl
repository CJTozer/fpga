-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.ulaw_types.all;

entity ulaw_stimuligenerator_sstimuligenerator is
  port(-- clock
       system1000      : in std_logic;
       -- asynchronous reset: active low
       system1000_rstn : in std_logic;
       result          : out unsigned(13 downto 0));
end;

architecture structural of ulaw_stimuligenerator_sstimuligenerator is
  signal y              : unsigned(13 downto 0);
  signal result_0       : ulaw_types.tup2;
  signal tup_app_arg    : unsigned(0 downto 0);
  signal result_1       : unsigned(13 downto 0);
  signal tup_case_scrut : boolean;
  signal tup_case_alt   : unsigned(0 downto 0);
  signal tup_app_arg_0  : signed(63 downto 0);
  signal x              : unsigned(0 downto 0);
  signal wild           : signed(63 downto 0);
  signal x_app_arg      : unsigned(0 downto 0);
  signal wild_app_arg   : signed(63 downto 0);
  signal x_0            : unsigned(0 downto 0);
begin
  result <= y;
  
  y <= result_0.tup2_sel1;
  
  result_0 <= (tup2_sel0 => tup_app_arg
              ,tup2_sel1 => result_1);
  
  tup_app_arg <= tup_case_alt when tup_case_scrut else
                 x;
  
  -- index begin
  indexvec : block 
  signal vec : ulaw_types.array_of_unsigned_14(0 to 1);
  signal vec_index : integer range 0 to 2-1;
  begin
    vec <= ulaw_types.array_of_unsigned_14'(to_unsigned(30,14),to_unsigned(7936,14));
    vec_index <= to_integer(tup_app_arg_0)
    -- pragma translate_off
                 mod 2
    -- pragma translate_on
                 ;
    result_1 <= vec(vec_index);
  end block;
  -- index end
  
  tup_case_scrut <= x < (resize(unsigned(std_logic_vector(((to_signed(2,64) - to_signed(1,64))))),1));
  
  tup_case_alt <= x + to_unsigned(1,1);
  
  tup_app_arg_0 <= wild;
  
  -- register begin
  ulaw_stimuligenerator_sstimuligenerator_register : process(system1000,system1000_rstn)
  begin
    if system1000_rstn = '0' then
      x <= to_unsigned(0,1);
    elsif rising_edge(system1000) then
      x <= x_app_arg;
    end if;
  end process;
  -- register end
  
  wild <= wild_app_arg;
  
  x_app_arg <= x_0;
  
  wild_app_arg <= signed(std_logic_vector(resize(x,64)));
  
  x_0 <= result_0.tup2_sel0;
end;
