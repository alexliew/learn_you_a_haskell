import Control.Applicative

myAction :: IO String
{-myAction = do
  a <- getLine
  b <- getLine
  return $ a ++ b-}


--equivalently
myAction = (++) <$> getLine <*> getLine

main = do
  a <- myAction
  putStrLn $ "The two lines concatenated together: " ++ a
