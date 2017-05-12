library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package ulaw_types is
  type array_of_unsigned_14 is array (integer range <>) of unsigned(13 downto 0);
  type tup2 is record
    tup2_sel0 : unsigned(0 downto 0);
    tup2_sel1 : unsigned(13 downto 0);
  end record;
  type tup2_0 is record
    tup2_0_sel0 : unsigned(7 downto 0);
    tup2_0_sel1 : boolean;
  end record;
  type array_of_unsigned_8 is array (integer range <>) of unsigned(7 downto 0);
  type tup2_1 is record
    tup2_1_sel0 : unsigned(0 downto 0);
    tup2_1_sel1 : ulaw_types.tup2_0;
  end record;
  function toSLV (u : in unsigned) return std_logic_vector;
  function toSLV (value :  ulaw_types.array_of_unsigned_14) return std_logic_vector;
  function toSLV (p : ulaw_types.tup2) return std_logic_vector;
  function toSLV (b : in boolean) return std_logic_vector;
  function fromSLV (sl : in std_logic_vector) return boolean;
  function tagToEnum (s : in signed) return boolean;
  function dataToTag (b : in boolean) return signed;
  function toSLV (p : ulaw_types.tup2_0) return std_logic_vector;
  function toSLV (value :  ulaw_types.array_of_unsigned_8) return std_logic_vector;
  function toSLV (s : in signed) return std_logic_vector;
  function toSLV (p : ulaw_types.tup2_1) return std_logic_vector;
end;

package body ulaw_types is
  function toSLV (u : in unsigned) return std_logic_vector is
  begin
    return std_logic_vector(u);
  end;
  function toSLV (value :  ulaw_types.array_of_unsigned_14) return std_logic_vector is
    alias ivalue    : ulaw_types.array_of_unsigned_14(1 to value'length) is value;
    variable result : std_logic_vector(1 to value'length * 14);
  begin
    for i in ivalue'range loop
      result(((i - 1) * 14) + 1 to i*14) := toSLV(ivalue(i));
    end loop;
    return result;
  end;
  function toSLV (p : ulaw_types.tup2) return std_logic_vector is
  begin
    return (toSLV(p.tup2_sel0) & toSLV(p.tup2_sel1));
  end;
  function toSLV (b : in boolean) return std_logic_vector is
  begin
    if b then
      return "1";
    else
      return "0";
    end if;
  end;
  function fromSLV (sl : in std_logic_vector) return boolean is
  begin
    if sl = "1" then
      return true;
    else
      return false;
    end if;
  end;
  function tagToEnum (s : in signed) return boolean is
  begin
    if s = to_signed(0,64) then
      return false;
    else
      return true;
    end if;
  end;
  function dataToTag (b : in boolean) return signed is
  begin
    if b then
      return to_signed(1,64);
    else
      return to_signed(0,64);
    end if;
  end;
  function toSLV (p : ulaw_types.tup2_0) return std_logic_vector is
  begin
    return (toSLV(p.tup2_0_sel0) & toSLV(p.tup2_0_sel1));
  end;
  function toSLV (value :  ulaw_types.array_of_unsigned_8) return std_logic_vector is
    alias ivalue    : ulaw_types.array_of_unsigned_8(1 to value'length) is value;
    variable result : std_logic_vector(1 to value'length * 8);
  begin
    for i in ivalue'range loop
      result(((i - 1) * 8) + 1 to i*8) := toSLV(ivalue(i));
    end loop;
    return result;
  end;
  function toSLV (s : in signed) return std_logic_vector is
  begin
    return std_logic_vector(s);
  end;
  function toSLV (p : ulaw_types.tup2_1) return std_logic_vector is
  begin
    return (toSLV(p.tup2_1_sel0) & toSLV(p.tup2_1_sel1));
  end;
end;
