multThree :: Int -> Int -> Int -> Int
-- multThree :: Int -> (Int -> (Int -> Int))
multThree x y z = x * y * z

compareWithHundred :: Int -> Ordering
-- compareWithHundred x = compare 100 x
-- can be rewritten as
compareWithHundred = compare 100


divideByTen :: (Floating a) => a -> a
-- brackets around a partially applied infix function indicate a section
divideByTen = (/ 10)

dividesTen :: (Floating a) => a -> a
dividesTen = (10 /)

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
  where g x y = f y x
-- flip' f y x = f x y

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map f xs

quicksort2 :: (Ord a) => [a] -> [a]
quicksort2 [] = []
quicksort2 (x:xs) =
  let smallerThanOrEqual = filter (<= x) xs
      largerThan = filter (> x) xs
  in quicksort2 smallerThanOrEqual ++ [x] ++ quicksort2 largerThan

largestDivisible :: Integer
largestDivisible = head (filter p [100000, 99999..])
  where p x = x `mod` 3829 == 0

chain :: Integer -> [Integer]
chain 1 = [1]
chain n
  | even n = n:chain (n `div` 2) 
  | odd n = n:chain (n*3 + 1)

numLongChains :: Int
--numLongChains = length (filter isLong (map chain [1..100]))
--  where isLong xs = length xs > 15
numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))

sum' :: (Num a) => [a] -> a
--sum' xs = foldl (\acc x -> acc + x) 0 xs
--by looking at the structure of the function we can simplify this function
--rule of thumb is probably that if you don't touch an argument, you can probably remove it from both sides of the definition
sum' = foldl (+) 0

foldl' :: (a -> b -> a) -> a -> [b] -> a
foldl' _ initial [] = initial
foldl' f initial (x:xs) = foldl' f (f initial x) xs

foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' _ initial [] = initial
foldr' f initial (x:xs) = f x (foldr' f initial xs)
--foldr' f initial (x:xs) = foldr' f (f x initial) xs
--foldr' f initial xs++[x] = foldr' f (f x initial) xs


sum2 :: (Num a) => [a] -> a
sum2 = foldl (+) 0

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x:acc) []
--reverse' xs = foldr (\x acc -> acc ++ [x]) xs []

and' :: [Bool] -> Bool
and' xs = foldr (&&) True xs

sqrtSums :: Int
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1

oddSquareSum :: Integer
--oddSquareSum = sum (takeWhile (<10000) (filter odd (map (^2) [1..])))
oddSquareSum = sum . takeWhile (<10000) . filter odd . map (^2) $ [1..]

