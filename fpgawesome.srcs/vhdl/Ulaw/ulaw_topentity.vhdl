-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.ulaw_types.all;

entity ulaw_topentity is
  port(input_0  : in unsigned(15 downto 0);
       output_0 : out unsigned(7 downto 0));
end;

architecture structural of ulaw_topentity is
begin
  ulaw_topentity_0_inst : entity ulaw_topentity_0
    port map
      (arg    => input_0
      ,result => output_0);
end;
