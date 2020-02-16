traverse :: (Applicative f, Traversable t) => (a -> f b) -> t a -> f (t b)

-- a little bit similar with fmap
fmap :: (a -> b) -> f a -> f b
(=<<) :: (a -> m b) -> m a -> m b
traverse :: (a -> f b) -> t a -> f (t b)
mapM :: Monad m => (a -> m b) -> [a] -> m [b]

sequence :: Monad m => [m a] -> m [a]
-- contrast with
sequenceA :: (Applicative f, Traversable t) => t (f a) -> f (t a)

fmap Just [1, 2, 3]                         -- => [Just 1,Just 2,Just 3]
sequenceA $ fmap Just [1, 2, 3]             -- => Just [1,2,3]
sequenceA . fmap Just $ [1, 2, 3]           -- => Just [1,2,3]
traverse Just [1, 2, 3]                     -- => Just [1,2,3]
