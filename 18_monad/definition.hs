class Applicative m => Monad m where
  (>>=) :: m a -> (a -> m b) -> m b
  (>>) :: m a -> m b -> m b
  return :: a -> m a


fmap f xs = xs >>= return . f

fmap :: (a -> b) -> f a -> f b
(<*>) :: f (a -> b) -> f a -> f b
(=<<) :: (a -> f b) -> f a -> f b
(>>=) :: m a -> (a -> m b) -> m b

(.) :: (b -> c) -> (a -> b) -> a -> c
(>=>) :: Monad m => (a -> m b) -> (b -> m c) -> a -> m c
