data Wrap f a = Wrap (f a) deriving (Eq, Show)

instance Functor f => Functor (Wrap f) where
  fmap f (Wrap fa) = Wrap (fmap f fa)

Prelude> fmap (+1) (Wrap (Just 1))
  Wrap (Just 2)
Prelude> fmap (+1) (Wrap [1, 2, 3])
  Wrap [2,3,4]

Prelude> n = 1 :: Integer
Prelude> fmap (+1) (Wrap n)

Couldn't match expected type ‘f b’
with actual type ‘Integer’
Relevant bindings include
it :: Wrap f b (bound at <interactive>:8:1)
In the first argument of ‘Wrap’, namely ‘n’
In the second argument of ‘fmap’,
namely ‘(Wrap n)’
