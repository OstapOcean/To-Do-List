module MenuManager (printMenu)
    where

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

import Cmd

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

printMenu :: [Cmd] -> IO ()
printMenu cmds = do
                 putStrLn(createMenuPoint (head cmds))
                 if not (null (tail cmds))
                 then printMenu (tail cmds)
                 else putStr ""

createMenuPoint :: Cmd -> String
createMenuPoint (cmd) = cmdId cmd ++ ". " ++ cmdDescription cmd ++ " [" ++ cmdName cmd ++ "]"
