module Help
    where

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

import Common

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

cmdHelp :: [String] -> IO ()
cmdHelp param = do
                putStrLn (limiter ++ "To execute command enter or command's number or name (in square brackets).")
                putStrLn (limiter ++ "After command identifier enter parametres.")
                putStrLn (limiter ++ "As params enter point number or new value.")
                putStrLn (limiter ++ "For show and delete commands you can enter param \"all\".")
