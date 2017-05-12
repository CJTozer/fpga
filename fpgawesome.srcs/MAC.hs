module MAC where

import CLaSH.Prelude

ma :: Signed 9 -> (Signed 9,  Signed 9) -> Signed 9
ma acc (x,y) = acc + x * y

macT acc (x,y) = (acc',o)
  where
    acc' = ma acc (resize x, resize y)
    o    = acc

mac = mealy macT 0

topEntity :: Signal (Signed 4, Signed 4) -> Signal (Signed 9)
topEntity = mac

--testInput :: Signal (Signed 4,Signed 4)
--testInput = stimuliGenerator $(listToVecTH [(1,1) :: (Signed 4,Signed 4),(2,2),(3,3),(4,4)])

--expectedOutput :: Signal (Signed 9) -> Signal Bool
--expectedOutput = outputVerifier $(listToVecTH [0 :: Signed 9,1,5,14])
