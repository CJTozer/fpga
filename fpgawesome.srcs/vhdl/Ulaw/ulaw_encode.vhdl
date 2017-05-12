-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.ulaw_types.all;

entity ulaw_encode is
  port(sample : in unsigned(15 downto 0);
       result : out unsigned(7 downto 0));
end;

architecture structural of ulaw_encode is
  signal app_arg            : unsigned(15 downto 0);
  signal app_arg_0          : unsigned(15 downto 0);
  signal app_arg_1          : unsigned(15 downto 0);
  signal app_arg_2          : unsigned(15 downto 0);
  signal app_arg_3          : unsigned(15 downto 0);
  signal app_arg_4          : unsigned(15 downto 0);
  signal case_scrut         : boolean;
  signal case_alt           : unsigned(7 downto 0);
  signal case_alt_0         : unsigned(7 downto 0);
  signal arg                : unsigned(15 downto 0);
  signal magnitude_case_alt : unsigned(15 downto 0);
  signal magnitude          : unsigned(15 downto 0);
  signal sign_app_arg       : unsigned(15 downto 0);
  signal sign               : unsigned(15 downto 0);
begin
  app_arg <= magnitude + to_unsigned(132,16);
  
  app_arg_0 <= shift_right(app_arg,to_integer(to_signed(10,64)));
  
  app_arg_1 <= arg or app_arg_0;
  
  app_arg_2 <= not app_arg_1;
  
  app_arg_3 <= arg or (shift_right((to_unsigned(32635,16) + to_unsigned(132,16)),to_integer(to_signed(10,64))));
  
  app_arg_4 <= not app_arg_3;
  
  case_scrut <= magnitude > to_unsigned(32635,16);
  
  case_alt <= resize(app_arg_2,8);
  
  case_alt_0 <= resize(app_arg_4,8);
  
  arg <= sign or (shift_left(to_unsigned(7,16),to_integer(to_signed(4,64))));
  
  result <= case_alt_0 when case_scrut else
            case_alt;
  
  magnitude_case_alt <= unsigned(std_logic_vector(-(signed(std_logic_vector(sample)))));
  
  with (sign) select
    magnitude <= magnitude_case_alt when x"0001",
                 sample when others;
  
  sign_app_arg <= shift_right(sample,to_integer(to_signed(8,64)));
  
  sign <= sign_app_arg and to_unsigned(128,16);
end;
