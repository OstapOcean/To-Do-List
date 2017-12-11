import Data.Char
import Data.String
import Data.List.Split

dataPath = "/Users/Ostap/IT/GitHub/To-Do-List/data.txt"

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --


toInt :: String -> Int
toInt (number) = read number :: Int


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --


data Item = Item {
                itemId   :: Int,
                itemText :: String
            }


 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --


data Cmd = Cmd {
               cmdId          :: Int,
               cmdName        :: String,
               cmdDescription :: String,
               cmdFunc        :: [String] -> IO ()
           }
          
cmds :: [Cmd]
cmds = [
        Cmd 1 "show"   "Show point"    cmdPrint
--        Cmd 2 "add"    "Add new point" cmdInsert,
--        Cmd 3 "edit"   "Edit point"    cmdUpdate,
--        Cmd 4 "delete" "Delete point"  cmdDelete,
--        Cmd 5 "help"   "Show help"     cmdHelp,
--        Cmd 6 "exit"   "Close program" cmdExit
       ]

cmdPrint :: [String] -> IO ()
cmdPrint (param) | null param      = getAll >>= putStrLn
                 | fParam == ""    = getAll >>= putStrLn
                 | fParam == "all" = getAll >>= putStrLn
                 where
                 fParam = head param

--cmdInsert :: [String] -> IO ()
--cmdInsert (param) | null param || param == "all" = putStrLn "All"
--
--cmdUpdate :: [String] -> IO ()
--cmdUpdate (param) | null param || param == "all" = putStrLn "All"
--
--cmdDelete :: [String] -> IO ()
--cmdDelete (param) | null param || param == "all" = putStrLn "All"
--
--cmdHelp :: [String] -> IO ()
--cmdHelp (param) | null param || param == "all" = putStrLn "All"
--
--cmdExit :: [String] -> IO ()
--cmdExit (param) | null param || param == "all" = putStrLn "All"



getAll :: IO String
getAll = readFF

parseData :: IO [String]
parseData = fmap(splitOn "\n")(getAll)

createPointsList :: [String] -> [Item] -> [String]
createPointsList (datas, pointsList) | null datas = pointsList
                                     | otherwise = Item toInt(head datas) tail(head datas) : pointsList

--get :: Int -> IO String
--get (pointId) | fPointId == "" = "Empty list"
--              | otherwise = fmap(show searchPoint)(parseData)
--              where
--              fPointId = fmap(head)(parseData)

--searchPoint :: Int -> [String] -> String
--searchPoint pointId points | null points = "Not found"
--                              | cPointId == pointId = head tail points
--                              | otherwise = searchPoint pointId points
--                              where
--                              cPointId = head points
                              

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --


createMenuPoint :: Cmd -> String
createMenuPoint (cmd) = show(cmdId cmd) ++ ". " ++ cmdDescription cmd ++ " (" ++ cmdName cmd ++ ")"

printMenuPoints :: [Cmd] -> IO ()
printMenuPoints (cmds) = do
                         putStrLn(createMenuPoint (head cmds))
                         if not (null (tail cmds))
                         then printMenuPoints (tail cmds)
                         else putStr ""

printNextCmdMsg :: IO ()
printNextCmdMsg = putStrLn "Enter menu point or command:"

printCmdMarker :: IO ()
printCmdMarker = putStr "> "

printEmptyLine :: IO ()
printEmptyLine = putStrLn ""
  
  
 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
  
  
main :: IO ()
main = do
       printMenuPoints cmds
       printEmptyLine
       printNextCmdMsg
       printCmdMarker
       str <- readFC
--       putStrLn(exec (parseCmd str))
       putStrLn(str)
  
  
 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --      


readFF :: IO String
readFF = readFile dataPath

readFC :: IO String
readFC = getLine
            
parseCmd :: String -> [String]
parseCmd (cmdStr) = splitOn " " cmdStr
            
--exec :: [String] -> String
--exec (inCmd) = 
--             where cmd = head inCmd
                    