{-# language InstanceSigs #-}
newtype Moi s a = Moi { runMoi :: s -> (a, s) }

instance Functor (Moi s) where
  fmap :: (a -> b) -> Moi s a -> Moi s b
  fmap f (Moi g) = Moi (\s -> let (a, s1) = g s
                                 in (f a, s1))

instance Applicative (Moi s) where
  pure :: a -> Moi s a
  pure a = Moi $ \s -> (a, s)

  (<*>) :: Moi s (a -> b) -> Moi s a -> Moi s b
  (Moi f) <*> (Moi g) =
    Moi $ \s -> let (x1, s1) = g s
                    (f1, s2) = f s1
                 in (f1 x1, s2)

instance Monad (Moi s) where
  return = pure
  (>>=) :: Moi s a -> (a -> Moi s b) -> Moi s b
  (>>=) (Moi f) sab =
    Moi $ \s -> let (a, s1) = f s
                 in runMoi (sab a) s1

test1 = runMoi ((+1) <$> (Moi $ \s -> (0, s))) 0                     -- => (1,0)
test2 = runMoi ((Moi $ \s -> ((+3), s)) <*> (Moi $ \s -> (0, s))) 0  -- => (1,0)
l = \a -> Moi $ \s -> ((a + 1), s)
test3 = runMoi ((Moi $ \s -> (0, s)) >>= l) 0                        -- => (1,0)
