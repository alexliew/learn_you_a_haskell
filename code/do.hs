foo :: Maybe String
{-foo = Just 3 >>= (\x ->
      Just "!" >>= (\y ->
      Just (show x ++ y)))-}
--with do
foo = do
  x <- Just 3
  y <- Just "!"
  Just (show x ++ y)


--you can pattern match in do notation!
justH :: Maybe Char
justH = do
  (x:xs) <- Just "Hello"
  return x

--a do expression that will fail
wopwop :: Maybe Char
wopwop = do
  (x:xs) <- Just ""
  return x


sevensOnly :: [Int]
sevensOnly = do
  x <- [1..50]
  guard ('7' `elem` show x)
  return x
