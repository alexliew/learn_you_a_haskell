import Control.Monad
import Data.Char

{-
main = forever $ do
  l <- getLine
  putStrLn $ map toUpper l
-}

{-main = do
  -- getContents :: IO String
  -- getContents is lazy - stops when it encounters the EOF character
  contents <- getContents
  -- putStr $ map toUpper contents
  putStr (shortLinesOnly contents) -}

-- interact :: (String -> String) -> IO ()
main = interact shortLinesOnly

shortLinesOnly :: String -> String
shortLinesOnly = unlines . filter (\line -> length line < 10) . lines
