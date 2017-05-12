module Ulaw where

import CLaSH.Prelude

lookupthings x
 | x > 63 = 7
 | x > 31 = 6
 | x > 15 = 5
 | x > 7 = 4
 | x > 3 = 3
 | x > 1 = 2
 | x > 0 = 1
 | otherwise = 0

encode :: Unsigned 14 -> Unsigned 8
encode sample = let
    sign = (shiftR sample 13) .&. 0x01
    magnitude = if sign == 0x01 then (xor sample 0x1fff) else sample
    biased = magnitude + 33
    order = lookupthings (shiftR (biased .&. 0x1fc0) 6)
    significant = (shiftR biased (order + 1)) .&. 0xF
    output = (shiftL sign 7) + (shiftL order 4) + significant
  in
    resize output

topEntity :: Signal (Unsigned 14) -> Signal (Unsigned 8)
topEntity x = encode <$> x

testInput :: Signal (Unsigned 14)
testInput = stimuliGenerator $(listToVecTH [8129 :: Unsigned 14, 8193, 1254])

expectedOutput :: Signal (Unsigned 8) -> Signal Bool
expectedOutput = outputVerifier $(listToVecTH [127 :: Unsigned 8, 143, 84])
