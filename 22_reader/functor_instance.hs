newtype Reader r a = Reader { runReader :: r -> a }

instance Functor (Reader r) where
fmap :: (a -> b) -> Reader r a -> Reader r b
fmap f (Reader ra) = Reader $ \r -> f (ra r)

-- same as (.)
compose :: (b -> c) -> (a -> b) -> (a -> c)
compose f g = \x -> f (g x)

-- see it?
-- \r -> f (ra r)
-- \x -> f (g x)
