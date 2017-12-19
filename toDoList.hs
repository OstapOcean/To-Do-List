import Data.Char
import Data.String
import Data.List.Split

dataPath = "/Users/Ostap/IT/GitHub/To-Do-List/data.txt"

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --


toInt :: String -> Int
toInt number = read number :: Int


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --


data Item = Item {
                itemId   :: String,
                itemText :: String
            }

data Cmd = Cmd {
               cmdId          :: String,
               cmdName        :: String,
               cmdDescription :: String,
               cmdFunc        :: [String] -> IO ()
           }


 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

          
cmds :: [Cmd]
cmds = [
        Cmd "1" "show"   "Show point"    cmdPrint,
        Cmd "2" "add"    "Add new point" cmdInsert,
--        Cmd "3" "edit"   "Edit point"    cmdUpdate,
--        Cmd "4" "delete" "Delete point"  cmdDelete,
--        Cmd "5" "help"   "Show help"     cmdHelp,
        Cmd "6" "exit"   "Close program" cmdExit
       ]

cmdPrint :: [String] -> IO ()
cmdPrint param 
        | null param      = getAll >>= printItems
        | fParam == ""    = getAll >>= printItems
        | fParam == "all" = getAll >>= printItems
        | otherwise       = get fParam >>= printItems
            where
               fParam = head param

cmdInsert :: [String] -> IO ()
cmdInsert param 
          | null param = 

--cmdUpdate :: [String] -> IO ()
--cmdUpdate (param) | null param || param == "all" = putStrLn "All"
--
--cmdDelete :: [String] -> IO ()
--cmdDelete (param) | null param || param == "all" = putStrLn "All"
--
--cmdHelp :: [String] -> IO ()
--cmdHelp (param) | null param || param == "all" = putStrLn "All"

cmdExit :: [String] -> IO ()
cmdExit param
        | null param = putStrLn "Exit"
        | otherwise  = putStrLn "Exit"



 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --


getAll :: IO [Item]
getAll = fmap (createPointsList) (fmap splitData readFF)  

splitData :: String -> [String]
splitData datas = splitOn "\n" datas

createPointsList :: [String] -> [Item]
createPointsList datas = createPointsListH datas []
                       
createPointsListH :: [String] -> [Item] -> [Item]
createPointsListH datas pointsList
                  | null datas = pointsList
                  | otherwise = createPointsListH (tail(tail datas)) (pointsList ++ [Item { itemId = head datas, itemText = head(tail datas) }])
                  
pointsToString :: [Item] -> [String]
pointsToString [] = []
pointsToString (point:points) = (itemId point) : (pointsToString points)


 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --


printItems :: [Item] -> IO ()
printItems items = mapM_ printItem (items)

printItem :: Item -> IO ()
printItem item = putStrLn (itemId item ++ ". " ++ (itemText item))


 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

get :: String -> IO [Item]
get pointId = fmap (searchPoint pointId) getAll

searchPoint :: String -> [Item] -> [Item]
searchPoint pointId points = filter (\x -> itemId x == pointId) points
                              

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --


createMenuPoint :: Cmd -> String
createMenuPoint (cmd) = cmdId cmd ++ ". " ++ cmdDescription cmd ++ " (" ++ cmdName cmd ++ ")"

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
       putStrLn " -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --"
       printEmptyLine
       printMenuPoints cmds
       printEmptyLine
       printNextCmdMsg
       printCmdMarker
       str <- readFC
       printEmptyLine
       exec (splitCmd str)
       if str == "6" || str == "exit"
           then putStrLn ""
           else mainH
               
mainH :: IO ()
mainH = do
        str <- readFC
        printEmptyLine
        main
  
  
 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --      


readFF :: IO String
readFF = readFile dataPath

readFC :: IO String
readFC = getLine
            
splitCmd :: String -> [String]
splitCmd cmdStr = splitOn " " cmdStr
            
exec :: [String] -> IO ()
exec fullCmd = execH fullCmd cmds
             
execH :: [String] -> [Cmd] -> IO ()
execH fullCmd cmds
      | null cmds = putStrLn "Commands not found"
      | cmd == cmdName cCmd = cmdFunc cCmd cmdParams
      | cmd == cmdId   cCmd = cmdFunc cCmd cmdParams
      | otherwise = execH fullCmd (tail cmds)
      where
        cmd       = head fullCmd
        cCmd      = head cmds
        cmdParams = tail fullCmd


 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --      


writeTF :: [Item] -> IO ()
writeTF datas = writeFile dataPath (unlines (todo_listToFString todo_list))

       
 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --      

                    
--quicksort :: Ord a => [a] -> [a]
--quicksort []     = []
--quicksort (x:xs) = (quicksort lesser) ++ [x] ++ (quicksort greater)
--    where
--        lesser  = filter (< x) xs
--greater = filter (>= x) xs