replicate' :: Int -> a -> [a]
replicate' n x
  | n <= 0 = []
  | otherwise = x : replicate' (n - 1)  x

take' :: Int -> [a] -> [a]
take' n _
  | n <= 0 = []
take' _ [] = []
take' n (x:xs) = x : take' (n - 1) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse xs ++ [x]

repeat' :: a -> [a]
repeat' x = x : repeat' x

zip' :: [a] -> [b] -> [(a, b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x, y) : zip' xs ys

elem' :: (Eq a) => a -> [a] -> Bool
elem' a [] = False
elem' a (x:xs) 
  | a == x = True
  | otherwise = elem' a xs

-- pattern matching, case expressions and guards
-- pattern matching only works in function definition
-- guards can be used to evaluate Boolean conditions
-- case expressions can be used anywhere, normal pattern matching is just syntactic sugar for case expressions

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = 
  let smallerOrEqual = [a | a <- xs, a <= x]
      largerThan = [a | a <- xs, a > x]
  in quicksort smallerOrEqual ++ [x] ++ quicksort largerThan


