module FileIO (getStrFF, getAllFF, insertTF, clearF)
    where
    
 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

import Data.List.Split

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

dataPath = "/Users/Ostap/IT/GitHub/To-Do-List/data.txt"

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

readAllFF :: IO String
readAllFF = readFile dataPath

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

getStrFF :: IO String
getStrFF = readAllFF

getAllFF :: IO [String]
getAllFF = fmap splitData getStrFF

splitData :: String -> [String]
splitData datas = splitOn "\n" datas

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

writeTF :: String -> IO ()
writeTF datas = writeFile dataPath datas

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

insertTF :: String -> IO ()
insertTF datas = writeTF datas

clearF :: IO ()
clearF = writeFile dataPath ""
