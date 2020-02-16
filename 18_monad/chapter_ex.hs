j :: Monad m => m (m a) -> m a
j = (>>= id)


l1 :: Monad m => (a -> b) -> m a -> m b
l1 f monad = do
  a <- monad
  return $ f(a)

l2 :: Monad m => (a -> b -> c) -> m a -> m b -> m c
l2 f m1 m2 = do
  x <- m1
  y <- m2
  return $ f x y

a :: Monad m => m a -> m (a -> b) -> m b
a m mf = do
  x <- m
  f <- mf
  return $ f x

meh :: Monad m => [a] -> (a -> m b) -> m [b]
meh x:xs f = do
  b <- f x
  return b





fun :: Int -> Maybe Int
fun a = Just (a + 1)

-- meh [1,2,3] fun -> Just [1,2,3]
