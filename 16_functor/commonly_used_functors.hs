-- Prelude> :t const
-- const :: a -> b -> a
-- Prelude> replaceWithP = const 'p'
-- Prelude> replaceWithP 10000
-- 'p'
-- Prelude> replaceWithP "woohoo"
-- 'p'
-- Prelude> replaceWithP (Just 10)
-- 'p'
--
-- -- data Maybe a = Nothing | Just a
-- Prelude> fmap replaceWithP (Just 10)
-- Just 'p'
-- Prelude> fmap replaceWithP Nothing
-- Nothing
-- -- data [] a = [] | a : [a]
-- Prelude>
--  fmap replaceWithP [1, 2, 3, 4, 5]
-- "ppppp"
-- Prelude>
--  fmap replaceWithP "Ave"
-- "ppp"
-- Prelude>
--  fmap (+1) []
-- []
-- Prelude>
--  fmap replaceWithP []
-- ""
-- -- data (,) a b = (,) a b
-- Prelude> fmap replaceWithP (10, 20)
-- (10,'p')
-- Prelude> fmap replaceWithP (10, "woo")
-- (10,'p')
