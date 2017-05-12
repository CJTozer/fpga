-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.ulaw_types.all;

entity ulaw_encode is
  port(sample : in unsigned(13 downto 0);
       result : out unsigned(7 downto 0));
end;

architecture structural of ulaw_encode is
  signal sign              : unsigned(13 downto 0);
  signal sign_app_arg      : unsigned(13 downto 0);
  signal biased            : unsigned(13 downto 0);
  signal biased_case_alt   : unsigned(13 downto 0);
  signal biased_case_alt_0 : unsigned(13 downto 0);
  signal biased_app_arg    : unsigned(13 downto 0);
  signal x                 : signed(63 downto 0);
  signal case_alt          : unsigned(7 downto 0);
  signal case_scrut        : signed(63 downto 0);
  signal app_arg           : unsigned(13 downto 0);
  signal app_arg_0         : unsigned(13 downto 0);
  signal app_arg_1         : unsigned(13 downto 0);
  signal app_arg_2         : signed(63 downto 0);
  signal app_arg_3         : signed(63 downto 0);
  signal app_arg_4         : unsigned(13 downto 0);
  signal app_arg_5         : unsigned(13 downto 0);
  signal app_arg_6         : unsigned(13 downto 0);
  signal app_arg_7         : unsigned(13 downto 0);
  signal app_arg_8         : unsigned(13 downto 0);
  signal app_arg_9         : unsigned(13 downto 0);
begin
  sign <= sign_app_arg and to_unsigned(1,14);
  
  sign_app_arg <= shift_right(sample,to_integer(to_signed(13,64)));
  
  result <= case_alt;
  
  with (sign) select
    biased <= biased_case_alt when "00000000000001",
              biased_case_alt_0 when others;
  
  biased_case_alt <= biased_app_arg + to_unsigned(33,14);
  
  biased_case_alt_0 <= sample + to_unsigned(33,14);
  
  biased_app_arg <= sample xor to_unsigned(8191,14);
  
  x <= case_scrut;
  
  case_alt <= resize(app_arg,8);
  
  ulaw_encode_slookupthings1_case_scrut : entity ulaw_encode_slookupthings1
    port map
      (result => case_scrut
      ,x      => app_arg_8);
  
  app_arg <= app_arg_4 + app_arg_0;
  
  app_arg_0 <= app_arg_1 and to_unsigned(15,14);
  
  app_arg_1 <= shift_right(biased,to_integer(app_arg_2));
  
  app_arg_2 <= app_arg_3;
  
  app_arg_3 <= x + to_signed(1,64);
  
  app_arg_4 <= app_arg_7 + app_arg_5;
  
  app_arg_5 <= shift_left(app_arg_6,to_integer(to_signed(4,64)));
  
  ulaw_encode_slookupthings_app_arg_6 : entity ulaw_encode_slookupthings
    port map
      (result => app_arg_6
      ,x      => app_arg_8);
  
  app_arg_7 <= shift_left(sign,to_integer(to_signed(7,64)));
  
  app_arg_8 <= shift_right(app_arg_9,to_integer(to_signed(6,64)));
  
  app_arg_9 <= biased and to_unsigned(8128,14);
end;
