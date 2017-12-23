module Update
    where

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

import Item
import ItemManager

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

cmdUpdate :: [String] -> IO ()
cmdUpdate param
          | null param = putStrLn "Empty point index."
          | otherwise  = putStrLn "cmdUpdate - otherwise"
              where
                  fParam = head param
                  rParam = tail param
