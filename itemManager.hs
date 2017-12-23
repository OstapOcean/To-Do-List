module ItemManager (getAll, get, insert, deleteAll, delete, printItems, printItem, sort)
    where
    
 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

import Control.Monad (when)

import Common

import FileIO
import Item

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

getAll :: IO [Item]
getAll = fmap createItemsList getAllFF

get :: String -> IO Item
get itemId = fmap (searchItem itemId) getAll

searchItem :: String -> [Item] -> Item
searchItem itemIdPar points 
           | null result = createItem "" ""
           | otherwise   = head result
               where 
                   result = filter (\x -> itemId x == itemIdPar) points

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

printItems :: [Item] -> IO ()
printItems items
           | null items = putStrLn (limiter ++ "List is empty.")
           | otherwise = mapM_ printItem (items)

printItem :: Item -> IO ()
printItem item = putStrLn (limiter ++ itemId item ++ ". " ++ (itemText item))

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

insert :: String -> IO ()
insert itemStr = do
                     items <- getAll
                 
                     let lastId  = getLastId items
                     let newItem = createItem lastId itemStr
                 
                     let newItems = items ++ [newItem]
                 
                     when (length newItems > 0) $
                        insertTF (itemsToString newItems)
                         
                     putStrLn (limiter ++ "Point \"" ++ itemStr ++ "\" added with index " ++ lastId ++ ".")
                 
getLastId :: [Item] -> String
getLastId items 
          | null items = "1"
          | otherwise = show (toInt (itemId (last items)) + 1)

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

--update :: String -> String -> IO ()
--replaceNth n newVal (x:xs)
--     | n == 0 = newVal:xs
--     | otherwise = x:replaceNth (n-1) newVal xs

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

deleteAll :: IO ()
deleteAll = do 
            clearF
            putStrLn (limiter ++ "All points were deleted.")
            
delete :: String -> IO ()
delete itemIdPar = do
                    items <- getAll
                    let deletedItem = filter (\x -> itemId x == itemIdPar) items
                    let rest        = filter (\x -> itemId x /= itemIdPar) items

                    when (length rest > 0) $
                        insertTF (itemsToString rest)

                    if not (null deletedItem)
                    then putStrLn (limiter ++ "Point \"" ++ (itemText (head deletedItem)) ++ "\" was deleted.")
                    else putStrLn (limiter ++ "Point with this index not found.")

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

sort :: IO ()
sort = do 
       sortedItems <- (fmap sorting getAll)
       let a = sortedItems
       when (length a > 0) $
           insertTF (itemsToString a)
       putStrLn (limiter ++ "All points were sorted.")

sorting :: Ord a => [a] -> [a]
sorting []     = []
sorting (x:xs) = (sorting lesser) ++ [x] ++ (sorting greater)
    where
        lesser  = filter (<  x) xs
        greater = filter (>= x) xs
        
 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

saveItems :: [Item] -> IO ()
saveItems items = insertTF (itemsToString items)
