-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.ulaw_types.all;

entity ulaw_topentity_0 is
  port(arg    : in unsigned(15 downto 0);
       result : out unsigned(7 downto 0));
end;

architecture structural of ulaw_topentity_0 is
begin
  ulaw_encode_result : entity ulaw_encode
    port map
      (result => result
      ,sample => arg);
end;
