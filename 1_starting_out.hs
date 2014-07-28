doubleMe x = x + x

doubleUs x y = x * 2 + y * 2

doubleUs2 x y = doubleMe x + doubleMe y

doubleSmalls x =  if x > 100 then x else x * 2

doubleSmalls' x = (if x > 100 then x else x * 2) + 20

conanO'Brien = "It's a-me, Conan O'Brien!"


length' xs = sum [1 | _ <- xs]

--removeNonUpperCase :: [Char] -> [Char]
--equivalent to:
removeNonUpperCase :: String -> String
removeNonUpperCase st = [c | c <- st, c `elem` ['A'..'Z']]

--we can use the fact that characters are Ordered too
removeNonUpperCase2 :: String -> String
removeNonUpperCase2 st = [c | c <- st, c >= 'A', c <= 'Z']


