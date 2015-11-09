main = do
  putStr "Hey, "
  putStr "I'm "
  putStrLn "Andy!"

main2 = do
  putChar 't'
  putChar 'e'
  putChar 'h'

{-putStr :: String -> IO ()
putStr [] = return ()
putStr (x:xs) = do
  putChar x
  putStr xs-}

main3 = do
  print True
  print 2
  print "haha"
  print 3.2
  print [3,4,3]
