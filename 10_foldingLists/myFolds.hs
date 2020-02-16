-- Right associate fun
foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' f z [] = z
foldr' f z (x:xs) = f x (foldr f z xs)

-- Left associate fun
foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' f acc [] = acc
foldl' f acc (x:xs) = foldl f (f acc x) xs

foldr'' f z xs = foldl (flip f) z (reverse xs)

foldr (+) 0 [1..5] -- => 15
scanr (+) 0 [1..5] -- => [15,14,12,9,5,0]
foldl (+) 0 [1..5] -- => 15
scanl (+) 0 [1..5] -- => [0,1,3,6,10,15]

-- 1.
  foldr (*) 1 [1..5]
  -- same as:
  foldl (flip (*)) 1 [1..5]
  foldl (*) 1 [1..5]

-- 2. Write out the evaluation steps for
  foldl (*) 1 [1..3] -- => (((1 * 1) * 2) * 3)
  foldr (*) 1 [1..3] -- => (1 * (2 * (3 * 1)))
  foldl (flip (*)) 1 [1..3] -- => (1 * (2 * (3 * 1)))

-- 3. One difference between foldr and foldl is:
-- c) foldr, but not foldl, associates to the right

-- 4. Folds are catamorphisms, which means they are generally used to
-- a) reduce structure

-- 5. Fix errors
foldr (++) "" ["woot", "WOOT", "woot"]
foldr max 'a' "fear is the little death"
foldr (&&) True [False, True]
foldr (||) False [False, True]
foldl ((++) . show) "" [1..5]
foldr (flip const) 'a' [1..5]
foldl const 0 "tacos"
foldr (flip const) 0 "burritos"
foldl const 'z' [1..5]
