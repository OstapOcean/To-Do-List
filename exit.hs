module Exit
    where

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

import Common

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

cmdExit :: [String] -> IO ()
cmdExit param = putStrLn (limiter ++ "Exit")
