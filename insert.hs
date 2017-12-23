module Insert
    where

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

import Common

import Item
import ItemManager

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

cmdInsert :: [String] -> IO ()
cmdInsert param 
          | null param = putStrLn (limiter ++ "Empty point text.")
          | otherwise = insert (unwords param)
