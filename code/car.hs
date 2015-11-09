--data Car = Car String String Int deriving (Show)

data Car = Car {
  company :: String
  , model :: String
  , year :: Int
  } deriving (Show)
