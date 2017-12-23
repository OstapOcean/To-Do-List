module Delete
    where

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

import Common

import Item
import ItemManager

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

cmdDelete :: [String] -> IO ()
cmdDelete param
          | null param      = putStrLn (limiter ++ "Empty point index.")
          | fParam == "all" = deleteAll
          | otherwise       = delete fParam
          where
               fParam = head param
