newtype CharList = CharList { getCharList :: [Char] } deriving (Eq, Show)

newtype Pair b a = Pair { getPair :: (a, b) }

instance Functor (Pair c) where
--fmap :: (a -> b) -> f a -> f b
--fmap :: (a -> b) -> (Pair c) a -> (Pair c) b
  fmap f (Pair (x, y)) = Pair (f x, y)

--data CoolBool = CoolBool { getCoolBool :: Bool }
newtype CoolBool = CoolBool { getCoolBool :: Bool }

--since newtypes only have 1 value constructor, we don't need to
--evaluate the passed value to pattern match at all.
--helloMe 'c' or some other non CoolBool type still fails though
--so there's at least some type checking going on
helloMe :: CoolBool -> String
helloMe (CoolBool _) = "hello"
--the example below fails when trying to evaluate (show x)
--helloMe (CoolBool x) = "hello" ++ (show x)

