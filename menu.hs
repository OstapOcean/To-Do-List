module Menu
    where

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

import Common

import MenuManager

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

cmdMenu :: [String] -> IO ()
cmdMenu param = putStrLn (limiter ++ "Menu")
