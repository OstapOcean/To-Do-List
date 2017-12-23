module Common
    where
    
 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

cmdMarker :: String
cmdMarker = "> "

limiter :: String
limiter = "│ "
    
 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

toInt :: String -> Int
toInt number = read number :: Int
