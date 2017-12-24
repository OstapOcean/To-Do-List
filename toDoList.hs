module ToDoList
    where

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

import Common

import MenuManager

import Cmd
import CmdManager

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

toDoList :: IO ()
toDoList = do
           printEmptyLine
           putStrLn " -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --"
           printEmptyLine
           printMenu cmds
           printEmptyLine
           
           main

main :: IO ()
main = do
       printNextCmdMsg
       printCmdMarker
       str <- readFC
       printEmptyLine
       
       putStrLn "┌────────────────────────────────────────"
       printLimiter
       printEmptyLine
              
       exec (splitCmd str)
       
       printLimiter
       printEmptyLine
       putStrLn "└────────────────────────────────────────"
       printEmptyLine
       
       putStrLn " -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --"
       printEmptyLine
       
       mainH str
           
mainH :: String -> IO ()
mainH cmd
      | cmd == "menu" || cmd == "0" = do
                                      printMenu cmds
                                      printEmptyLine
                                      main
      | cmd == "exit" || cmd == "7" = putStrLn ""
      | otherwise = main

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

printNextCmdMsg :: IO ()
printNextCmdMsg = putStrLn "Enter menu point or command:"

printCmdMarker :: IO ()
printCmdMarker = putStr cmdMarker

printEmptyLine :: IO ()
printEmptyLine = putStrLn ""

printLimiter :: IO ()
printLimiter = putStr limiter

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

readFC :: IO String
readFC = getLine

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

exec :: [String] -> IO ()
exec fullCmd = execH fullCmd cmds
             
execH :: [String] -> [Cmd] -> IO ()
execH fullCmd cmds
      | null cmds = putStrLn (limiter ++ "Commands not found.")
      | cmd == cmdName cCmd = cmdFunc cCmd cmdParams
      | cmd == cmdId   cCmd = cmdFunc cCmd cmdParams
      | otherwise = execH fullCmd (tail cmds)
      where
        cmd       = head fullCmd
        cCmd      = head cmds
        cmdParams = tail fullCmd
