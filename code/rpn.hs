solveRPN :: String -> Double
solveRPN = calc [] . words

calc :: [Double] -> [String] -> Double
calc (x:xs) [] = x
calc (top:stack) (t:tokens)
  | isOp t =
      let a = top
          b = head stack
          op = getOp t
      in calc ((op a b):tail stack) tokens
  | otherwise =
      let number = read t :: Double 
      in calc (number:top:stack) tokens


isOp :: [Char] -> Bool
isOp t = t == "*" || t == "+" || t == "-"


getOp :: (Num a) => [Char] -> (a -> a -> a)
getOp t
  | t == "*" = (*)
  | t == "+" = (+)
  | t == "-" = (-)


main = do
  putStrLn "Enter RPN equation:"
  eqn <- getLine
  putStrLn $ "Result is " ++ (show $ solveRPN eqn)
