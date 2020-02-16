class Functor f => Applicative f where
  pure :: a -> f a
  (<*>) :: f (a -> b) -> f a -> f b


-- fmap
(<$>) :: Functor f => (a -> b) -> f a -> f b
(<*>) :: Applicative f => f (a -> b) -> f a -> f b

liftA :: Applicative f => (a -> b) -> f a -> f b
liftA2 :: Applicative f => (a -> b -> c) -> f a -> f b -> f c
liftA3 :: Applicative f => (a -> b -> c -> d) -> f a -> f b -> f c -> f d


($) :: (a -> b) ->  a -> b
(<$>) :: (a -> b) -> f a -> f b
(<*>) :: f (a -> b) -> f a -> f b


-- Applicative functors are monoidal functors
mappend :: f f f
$ :: (a -> b) a b
(<*>) :: f (a -> b) -> f a -> f b


-- Because for :i (,)  ... instance Monoid a => Applicative ((,) a)
("Woo", (+1)) <*> (" Hoo!", 0) => ("Woo Hoo!", 1)


import Data.Monoid
(Sum 2, (+1)) <*> (Sum 0, 0)       => (Sum {getSum = 2},1)
(Product 3, (+9))<*>(Product 2, 8) => (Product {getProduct = 6},17)
(All True, (+1))<*>(All False, 0)  => (All {getAll = False},1)
