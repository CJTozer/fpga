-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.ulaw_types.all;

entity ulaw_testbench is
  port(done : out boolean);
end;

architecture structural of ulaw_testbench is
  signal finished : boolean;
  signal arg      : unsigned(15 downto 0);
  signal result   : unsigned(7 downto 0);
begin
  done <= finished;
  
  totest : entity ulaw_topentity_0
    port map
      (arg    => arg
      ,result => result);
  
  arg <= unsigned'(0 to 15 => 'X');
  
  finished <=
  -- pragma translate_off
              false,
  -- pragma translate_on
              true
  -- pragma translate_off
              after 100 ns
  -- pragma translate_on
              ;
end;
