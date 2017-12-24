module CmdManager
    where

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

import Data.List.Split

import Cmd
import Print
import Insert
import Delete
import Sort
import Menu
import Help
import Exit

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

cmds :: [Cmd]
cmds = [
        Cmd "0" "menu"   "Show menu"     cmdMenu,
        Cmd "1" "show"   "Show point"    cmdPrint,
        Cmd "2" "add"    "Add new point" cmdInsert,
--        Cmd "3" "edit"   "Edit point"    cmdUpdate,
        Cmd "4" "delete" "Delete point"  cmdDelete,
        Cmd "5" "sort"   "Sort points"   cmdSort,
        Cmd "6" "help"   "Show help"     cmdHelp,
        Cmd "7" "exit"   "Close program" cmdExit
       ]

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
 
splitCmd :: String -> [String]
splitCmd cmdStr = splitOn " " cmdStr
