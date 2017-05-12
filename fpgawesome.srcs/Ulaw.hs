module Ulaw where

import CLaSH.Prelude

encode :: Unsigned 14 -> Unsigned 8
encode sample = let
    sign = (shiftR sample 8) .&. 0x80
    magnitude = if sign == 1 then -sample else sample
    clipped = if magnitude > 32635 then 32635 else magnitude
    biased = clipped + 0x84
    exponent = 7
    mantissa = (shiftR biased (fromIntegral (exponent + 3)))
    output = complement (sign .|. (shiftL exponent 4) .|. mantissa)
  in
    resize output

topEntity :: Signal (Unsigned 14) -> Signal (Unsigned 8)
topEntity x = encode <$> x

testInput :: Signal (Unsigned 14)
testInput = stimuliGenerator $(listToVecTH [0b11110 :: Unsigned 14, 0b1111100000000])

expectedOutput :: Signal (Unsigned 8) -> Signal Bool
expectedOutput = outputVerifier $(listToVecTH [0b1111 :: Unsigned 8, 0b1111111])
