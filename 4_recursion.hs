maximum' :: (Ord a) => [a] -> a
maximum' [] = error "Maximum of empty list"
maximum' [x] = x
maximum' (x:xs)
    | x > maxTail = x
    | otherwise = maxTail
    where maxTail = maximum' xs
--alternatives:
--worst case exponential growth, e.g. list is sorted in ascending order
--maximum' (x:xs) = if x > maximum' xs then x else maximum' xs
--using if-else instead of guards. guards probably look nicer
--maximum' (x:xs) = if x > m then x else m
--    where m = maximum' xs
--using the _as pattern_
--maximum' (x:xs) = if x > m@(maximum' xs) then x else m
--using the max function
--maximum' (x:xs) = max x (maximum' xs)
--using a let expression
--maximum' (x:xs) = let m = maximum' xs in if x > m then x else m


replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
    | n <= 0 = []
    | otherwise = x:(replicate' (n - 1) x)

take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
    | n <= 0 = []
take' _ [] = []
take' n (x:xs) = x : take' (n - 1) xs

reverse' :: [a] -> [a]
reverse' [] = []
-- not necessary; not always the case though
--reverse' [x] = [x]
reverse' (x:xs) = reverse' xs ++ [x]

repeat' :: a -> [a]
repeat' x = x:repeat' x

zip' :: [a] -> [b] -> [(a,b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = [(x, y)] ++ zip' xs ys

elem' :: (Eq a) => a -> [a] -> Bool
elem' a [] = False
elem' a (x:xs)
    | a == x = True
    | otherwise = a `elem'` xs

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
--quicksort (x:xs) = quicksort (l_partition x xs) ++ [x] ++ quicksort (r_partition x xs)
--    where l_partition l ls = [a | a <- ls, a < l]
--          r_partition l ls = [a | a <- ls, a >= l]
quicksort (x:xs) = quicksort [x' | x' <- xs, x' < x] ++ [x] ++ quicksort [x' | x' <- xs, x' >= x]
