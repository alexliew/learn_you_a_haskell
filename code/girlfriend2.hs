import System.IO

main = do
  withFile "girlfriend.txt" ReadMode (\handle -> do
    contents <- hGetContents handle
    putStr contents)

--implementation of withFile
-- withFile :: FilePath -> IOMode -> (Handle -> IO a) -> IO a
-- withFile name mode f = bracket (openFile name mode)
--  (\handle -> hClose handle)
--  (\handle -> f handle)
--  won't the exception handling function return IO (), which is not of type IO a? hClose IO returns IO ()

main = do
  --readFile takes care of closing the file. does haskell's lazy evaluation apply to IO? is the file only closed when contents is evaluated?
  contents <- readFile "girlfriend.txt"
  putStr contents
