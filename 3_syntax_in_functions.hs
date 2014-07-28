lucky :: (Integral a) => a -> String
lucky 7 = "Lucky Number Seven!"
lucky x = "Sorry pal, you're out of luck!"

sayMe :: (Integral a) => a -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5"
--this seems as bad as if statements but whatever

factorial :: (Integral a) => a -> a
factorial 0 = 1
--functions apparently bind tighter than operators
factorial n = n * factorial (n - 1)

charName :: Char -> String
charName 'a' = "Albert"
charName 'b' = "Broseph"
charName 'c' = "Cecil"
--pattern matching can fail if we don't cover all cases

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
--since the arguments are tuples, we can use fst and snd to get the respective values
--the constraints here specify that all the tuples have the same type; to be more general, we could probably do (Num a, Num b) => (a, b) -> (a, b) -> (a, b)?
--addVectors a b = (fst a + fst b, snd a + snd b)
--can use pattern matching in function definition:
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

first :: (a, b, c) -> a
--underscores will match but won't bind values
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z

head' :: [a] -> a
--head' [] = error "Can't call head on an empty list!"
--head' (x:_) = x
--using case expression in place of pattern matching; pattern matching is actually syntactic sugar for case expressions
head' xs = case xs of [] -> error "Can't call head on an empty list"
                      (x:_) -> x

tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "The list is long. The first two elements are: " ++ show x ++ " and " ++ show y

length' :: [a] -> Int
length' [] = 0
length' (_:xs) = 1 + length' xs

sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

capital :: String -> String
capital "" = "Empty string, whoops!"
--using name@(expression) is an _as pattern_
--as patterns are one way to reduce repeated calculations
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

--RealFloat is a typeclass that encompasses real floating point numbers, e.g. Float and Double
--bmiTell :: (RealFloat a) => a -> String
--introduction of the guard pattern. used when behaviour is conditional on the _value_ of a variable rather than its pattern
--bmiTell bmi
--    | bmi <= 18.5 = "You're underweight"
--    | bmi <= 25.0 = "You're normal"
--    | bmi <= 30.0 = "You're fat"
--    | otherwise = "You're a whale"

--bmiTell :: (RealFloat a) => a -> a -> String
--bmiTell weight height
--    | weight / height ^ 2 <= 18.5 = "You're underweight"
--    | weight / height ^ 2 <= 25.0 = "You're supposedly normal"
--    | weight / height ^ 2 <= 30.0 = "You're fat"
--    | otherwise = "You're a whale"

bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | bmi <= 18.5 = "You're underweight"
    | bmi <= 25.0 = "You're supposedly normal"
    | bmi <= 30.0 = "You're fat"
    | otherwise = "You're a whale"
    --where statements are another way to avoid repeated calculation
    where bmi = weight / height ^ 2

--excessive version
--bmiTell weight height
--    | bmi <= skinny = "You're underweight, you emo, you!"
--    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
--    | bmi <= fat    = "You're fat! Lose some weight, fatty!"
--    | otherwise     = "You're a whale, congratulations!"
--    where bmi = weight / height ^ 2
--          skinny = 18.5
--          normal = 25.0
--          fat = 30.0

--pattern matching in where statement!
--bmiTell weight height
--    | bmi <= skinny = "You're underweight, you emo, you!"
--    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
--    | bmi <= fat    = "You're fat! Lose some weight, fatty!"
--    | otherwise     = "You're a whale, congratulations!"
--    where bmi = weight / height ^ 2
--          (skinny, normal, fat) = (18.5, 25.0, 30.0)

max' :: (Ord a) => a -> a -> a
max' a b
    | a > b = a
    | otherwise = b
--guards written inline; ugly.
--max' a b | a > b = a | otherwise = b

compare' :: (Ord a) => a -> a -> Ordering
a `compare'` b
    | a > b = GT
    | a == b = EQ
    | a < b = LT

initials :: String -> String -> String
--initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
--    where (f:_) = firstname
--          (l:_) = lastname
--this is also the same as:
--initials firstname lastname
--    | True = [f] ++ ". " ++ [l] ++ "."
--    where (f:_) = firstname
--          (l:_) = lastname
initials (f:_) (l:_) = [f] ++ ". " ++ [l] ++ "."

calcBmis :: (RealFloat a) => [(a, a)] -> [a]
--calcBmis xs = [bmi w h | (w, h) <- xs]
--    where bmi weight height = weight / height ^ 2
--redone with let expression
--calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]
--the let expression is visible to the output expression (because there is no followup _in_; this makes its scope the one it is currently in) and everything that comes after it
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi >= 25.0]


cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^ 2
    in sideArea + 2 * topArea

describeList :: [a] -> String
--case expressions allow pattern matching to be done anywhere
--describeList xs = "The list is " ++ case xs of [] -> "empty."
--                                               [x] -> "a singleton list"
--                                               xs -> "a longer list"
--describeList xs = "The list is " ++ what xs
--    where what [] = "empty."
--          what [x] = "a singleton list"
--          what xs = "a longer list"

describeList xs = "The list is " ++ what
    where what = case xs of [] -> "empty"
                            [x] -> "a singleton list"
                            xs -> "a longer list"

--alternatively, normal pattern matching incurs repetition of most of the sentence:
--describeList [] = "The list is empty"
--describeList [x] -> "The list is a singleton list"
--describeList xs -> "The list is a longer list"
