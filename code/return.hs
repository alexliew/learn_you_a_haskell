main = do
  return ()
  return "HAHAHAH"
  line <- getLine
  return "blah blha blha"
  return 4
  putStrLn line


main2 = do
  a <- return "hell"
  b <- return "yeah"
  putStrLn $ a ++ " " ++ b

main3 = do
  getLine
