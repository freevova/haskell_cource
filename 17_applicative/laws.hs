-- 1. Identity
pure id <*> v = v
pure id <*> [1..5]

-- 2. Composition
pure (.) <*> u <*> v <*> w = u <*> (v <*> w)

pure (.)
  <*> [(+1)]
  <*> [(*2)]
  <*> [1, 2, 3] == [3,5,6]
[(+1)] <*> ([(*2)] <*> [1, 2, 3]) == [3,5,6]

-- 3. Homomorphism
pure f <*> pure x = pure (f x)
pure (+1) <*> pure 1
pure (+1) <*> pure 1 :: Either a Int

-- 4. Interchange
u <*> pure y = pure ($ y) <*> u

(Just (+2) <*> pure 2) == (pure ($ 2) <*> Just (+2))
[(+1), (*2)] <*> pure 1 == pure ($ 1) <*> [(+1), (*2)]
