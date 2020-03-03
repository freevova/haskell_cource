import Control.Applicative

boop = (*2)
doop = (+10)

bip :: Integer -> Integer
bip = boop . doop

bloop :: Integer -> Integer
bloop = fmap boop doop

-- fmap boop doop x == (*2) ((+10) x)
-- when this x comes along, it's the
-- first necessary argument to (+10)
-- then the result for that is the
-- first necessary argument to (*2)

bbop :: Integer -> Integer
bbop = (+) <$> boop <*> doop
-- ((+) <$> (*2) <*> (+10)) 3
-- First the fmap
-- (*2) :: Num a => a -> a
-- (+) :: Num a => a -> a -> a
-- (+) <$> (*2) :: Num a => a -> a -> a

duwop :: Integer -> Integer
duwop = liftA2 (+) boop doop


boopDoop :: Integer -> Integer
boopDoop = do
  a <- boop
  b <- doop
  return (a + b)

x1 = ((+) . (*2)) 5 3        -- => 13
x2 = ((+) <$> (*2)) 5 3      -- => 13
-- ((+) . (*2)) == \ x -> (+) (2 * x)

-- ((+) . (*2)) 5 3
-- (\ x -> (+) (2 * x)) 5 3
-- (\ 5 -> (+) (2 * 5)) 3
-- ((+) 10) 3


-- ((+) <$> (*2) <*> (+10)) :: Num b => b -> b
-- ((+) <$> (*2) <*> (+10)) 3
-- (3*2) + (3+10)
-- 6 + 13
