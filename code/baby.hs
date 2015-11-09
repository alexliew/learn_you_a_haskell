doubleMe x = x + x

doubleUs x y = x * 2 + y * 2
doubleUs2 x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100
  then x
  else x * 2

doubleSmallNumber' x = (if x > 100 then x else x*2) + 1

conanO'Brien = "It's a-me, Conan O'Brien!"


factorial :: Integer -> Integer
factorial n = product [1..n]

circumference :: Float -> Float
circumference r = 2 * pi * r

circumference' :: Double -> Double
circumference' r = 2 * pi * r
