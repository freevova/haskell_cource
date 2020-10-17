-- This is not a functor as it has kind *

data FixMePls = FixMe | Pls deriving (Eq, Show)
instance Functor FixMePls where
  fmap = error "it doesn't matter, it won't compile"

-- This is right:
data FixMePls a = FixMe | Pls a deriving (Eq, Show)

instance Functor FixMePls where
  fmap _ FixMe   = FixMe
  fmap f (Pls a) = Pls (f a)

-- But it is the mistake to write this, as it has wrong type:
instance Functor (FixMePls a) where
  fmap _ FixMe   = FixMe
  fmap f (Pls a) = Pls (f a)
