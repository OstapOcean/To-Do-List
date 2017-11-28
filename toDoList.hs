main = do
    readStr
    
    
readStr = do
    str <- getLine
    return $ func str

func :: [Char] -> [Char]
func (cmd) | cmd == "add" = "Added"
           | cmd == "remove" = "Removed"
           | otherwise = "Incorrect command"