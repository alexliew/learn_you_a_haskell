phoneBook = [
  ("betty", "555-2938"),
  ("bonnie", "452-2928"),
  ("patsy", "493-2928"),
  ("lucille", "205-2928"),
  ("wendy", "939-8282"),
  ("penny", "853-2492")]

findKey :: (Eq k) => k -> [(k, v)] -> Maybe v
{-findKey key [] = Nothing
findKey key ((k,v):xs) = 
  | key == x = Just v
  | otherwise = findKey xs-}
--findKey key dict = snd . head . filter (\(k, v) -> key == k) $ dict
findKey key xs = foldr (\(k, v) res -> if k == key then Just v else res) Nothing xs
