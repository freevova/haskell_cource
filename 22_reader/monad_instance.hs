foo :: (Functor f, Num a) => f a -> f a
foo r = fmap (+1) r

bar :: Foldable f => t -> f a -> (t, Int)
bar r t = (r, length t)

froot :: Num a => [a] -> ([a], Int)
froot r = (map (+1) r, length r)

barOne :: Foldable t => t a -> (t a, Int)
barOne r = (r, length r)

barPlus r = (foo r, length r)

frooty :: Num a => [a] -> ([a], Int)
frooty r = bar (foo r) r

frooty' :: Num a => [a] -> ([a], Int)
frooty' = \r -> bar (foo r) r


fooBind :: (t2 -> t1) -> (t1 -> t2 -> t) -> t2 -> t
fooBind m k = \r -> k (m r) r

fooBind :: (r -> a) -> (a -> r -> b) -> (r -> b)

(>>=) :: Monad m =>
m a -> (a -> (m b)) -> m b
(r -> a) -> (a -> (r -> b)) -> (r -> b)

-- instance
(>>=) :: Monad m => m a -> (a -> m b) -> m b
(>>=) :: (->) r a -> (a -> (->) r b) -> (->) r b
(>>=) :: (r -> a) -> (a -> r -> b) -> r -> b

(=<<) :: (a -> r -> b) -> (r -> a) -> (r -> b)
(<*>) :: (r -> a -> b) -> (r -> a) -> (r -> b)

return :: Monad m => a -> m a
return :: a -> (->) r a
return :: a -> r -> a

getDogRM :: Person -> Dog
getDogRM = do
  name <- dogName
  addy <- address
  return $ Dog name addy
