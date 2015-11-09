import Tree

instance Functor Tree where
  fmap f EmptyTree = EmptyTree
  fmap f (Node a left right) = Node (f a) (fmap f left) (fmap f right)

{-
data Either a b = Left a | Right b
instance Functor (Either a) where
  fmap f (Right x) = Right (f x)
  fmap f (Left x) = Left x
-}

{-
instance Functor (Map k) where
  fmap f (Map k v) = Map k (f v)
-}
