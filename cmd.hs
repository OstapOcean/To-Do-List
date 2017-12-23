module Cmd
    where

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

data Cmd = Cmd {
               cmdId          :: String,
               cmdName        :: String,
               cmdDescription :: String,
               cmdFunc        :: [String] -> IO ()
           }
