-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.mac_types.all;

entity mac_mealy is
  port(w2              : in mac_types.tup2;
       -- clock
       system1000      : in std_logic;
       -- asynchronous reset: active low
       system1000_rstn : in std_logic;
       result          : out signed(8 downto 0));
end;

architecture structural of mac_mealy is
  signal y         : signed(8 downto 0);
  signal result_0  : mac_types.tup2_0;
  signal x         : signed(8 downto 0);
  signal x_app_arg : signed(8 downto 0);
  signal x_0       : signed(8 downto 0);
begin
  result <= y;
  
  y <= result_0.tup2_0_sel1;
  
  mac_topentity_smact_result_0 : entity mac_topentity_smact
    port map
      (result => result_0
      ,acc    => x
      ,ds     => w2);
  
  -- register begin
  mac_mealy_register : process(system1000,system1000_rstn)
  begin
    if system1000_rstn = '0' then
      x <= to_signed(0,9);
    elsif rising_edge(system1000) then
      x <= x_app_arg;
    end if;
  end process;
  -- register end
  
  x_app_arg <= x_0;
  
  x_0 <= result_0.tup2_0_sel0;
end;
