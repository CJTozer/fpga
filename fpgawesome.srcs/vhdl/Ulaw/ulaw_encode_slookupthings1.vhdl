-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.ulaw_types.all;

entity ulaw_encode_slookupthings1 is
  port(x      : in unsigned(13 downto 0);
       result : out signed(63 downto 0));
end;

architecture structural of ulaw_encode_slookupthings1 is
  signal case_scrut   : boolean;
  signal case_scrut_0 : boolean;
  signal case_alt     : signed(63 downto 0);
  signal case_scrut_1 : boolean;
  signal case_alt_0   : signed(63 downto 0);
  signal case_scrut_2 : boolean;
  signal case_alt_1   : signed(63 downto 0);
  signal case_scrut_3 : boolean;
  signal case_alt_2   : signed(63 downto 0);
  signal case_scrut_4 : boolean;
  signal case_alt_3   : signed(63 downto 0);
  signal case_scrut_5 : boolean;
  signal case_alt_4   : signed(63 downto 0);
begin
  case_scrut <= x > to_unsigned(0,14);
  
  case_scrut_0 <= x > to_unsigned(1,14);
  
  case_alt <= to_signed(1,64) when case_scrut else
              to_signed(0,64);
  
  case_scrut_1 <= x > to_unsigned(3,14);
  
  case_alt_0 <= to_signed(2,64) when case_scrut_0 else
                case_alt;
  
  case_scrut_2 <= x > to_unsigned(7,14);
  
  case_alt_1 <= to_signed(3,64) when case_scrut_1 else
                case_alt_0;
  
  case_scrut_3 <= x > to_unsigned(15,14);
  
  case_alt_2 <= to_signed(4,64) when case_scrut_2 else
                case_alt_1;
  
  case_scrut_4 <= x > to_unsigned(31,14);
  
  case_alt_3 <= to_signed(5,64) when case_scrut_3 else
                case_alt_2;
  
  case_scrut_5 <= x > to_unsigned(63,14);
  
  case_alt_4 <= to_signed(6,64) when case_scrut_4 else
                case_alt_3;
  
  result <= to_signed(7,64) when case_scrut_5 else
            case_alt_4;
end;
