module Print
    where

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

import Item
import ItemManager

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

cmdPrint :: [String] -> IO ()
cmdPrint param 
        | null param      = getAll >>= printItems
        | fParam == ""    = getAll >>= printItems
        | fParam == "all" = getAll >>= printItems
        | otherwise       = get fParam >>= printItem
            where
               fParam = head param
