module FoldExample where

import qualified Data.Foldable as F
import Data.Monoid
import Tree

instance F.Foldable Tree where
  foldMap _ EmptyTree = mempty
  foldMap f (Node x l r) = F.foldMap f l `mappend`
                           f x  `mappend`
                           F.foldMap f r

testTree :: Tree Int
testTree = Node 5
             (Node 3
               (Node 1 EmptyTree EmptyTree)
               (Node 6 EmptyTree EmptyTree)
             )
             (Node 9
               (Node 8 EmptyTree EmptyTree)
               (Node 10 EmptyTree EmptyTree)
             )

