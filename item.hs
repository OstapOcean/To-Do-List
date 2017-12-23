module Item
    where

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
 
import Data.List

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

data Item = Item {
                itemId   :: String,
                itemText :: String
            }
            
instance Eq Item where
    (Item a b) == (Item c d) = b == d
    
instance Ord Item where
    compare (Item a b) (Item c d) = compare b d

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

createItemsList :: [String] -> [Item]
createItemsList datas
                 | null datas = []
                 | otherwise  = createItemsListH datas 1 []
                       
createItemsListH :: [String] -> Int -> [Item] -> [Item]
createItemsListH datas cId items
                 | null datas = items
                 | itemText /= ""  = createItemsListH restData (cId + 1) (items ++ [createItem (show cId) itemText])
                 | otherwise = items
                     where
                         itemText  = head datas
                         restData  = tail datas

createItem :: String -> String -> Item
createItem itemIdPar itemTextPar = Item { itemId = itemIdPar, itemText = itemTextPar }

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

itemsToStrings :: [Item] -> [String]
itemsToStrings (item:items) = [(itemText item)] ++ (itemsToStrings items)
itemsToStrings []           = []

itemsToString :: [Item] -> String
itemsToString (items) = intercalate "\n" (itemsToStrings items)
