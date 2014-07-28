addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z


factorial :: Integer -> Integer
factorial n  = product [1..n]

--we can do this recursively too, but that's actually for later.
--factorial :: Int -> Int
--factorial 0 = 1
--factorial n = n * (factorial (n - 1))

--factorial2 :: Integer -> Integer
--factorial2 0 = 1
--factorial2 n = n * (factorial2 (n - 1))

circumference :: Float -> Float
circumference r = 2 * pi * r

circumference' :: Double -> Double
circumference' r = 2 * pi * r
