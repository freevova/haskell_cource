import Data.Functor.Identity

traverse (Identity . (+1)) [1, 2]               -- => Identity [2,3]
runIdentity $ traverse (Identity . (+1)) [1, 2] -- => [2,3]

edgeMap :: Traversable t => (a -> b) -> t a -> t b
edgeMap f t = runIdentity $ traverse (Identity . f) t

edgeMap (+1) [1..5]                             -- => [2,3,4,5,6]


import Data.Monoid
import Data.Functor.Constant
xs' = [1, 2, 3, 4, 5]
xs = xs' :: [Sum Integer]
traverse (Constant . (+1)) xs                   -- => Constant (Sum {getSum = 20})

foldMap' :: (Traversable t, Monoid a) => (a1 -> a) -> t a1 -> a
foldMap' f t = getConstant $ traverse (Constant . f) t

foldMap :: (Foldable t, Monoid m) => (a -> m) -> t a -> m
