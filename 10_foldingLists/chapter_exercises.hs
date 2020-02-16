stops = "pbtdkg"
vowels = "aeiou"

make3TuplesA sts vws = [(s1, v, s2) | s1 <- sts,
                                      s2 <- sts,
                                      v <- vws]

make3TuplesB sts vws = [(s1, v, s2) | s1 <- sts,
                                      s2 <- sts,
                                      v <- vws,
                                      s1 == 'p']

nounTuples ns vs = [(n1, v, n2) | n1 <- ns,
                                  n2 <- ns,
                                  v <- vs]


-- direct recursion, not using (&&)
myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x:xs) = if x == False then False else myAnd xs

-- direct recursion, using (&&)
myAnd' [] = True
myAnd' (x:xs) = x && myAnd xs

-- fold, not point-free
myAnd'' :: [Bool] -> Bool
myAnd'' list = foldr (\a b -> if a == False then False else b) True list

-- fold, both myAnd and the folding
-- function are point-free now
myAnd''' :: [Bool] -> Bool
myAnd''' = foldr (&&) True

-- 1.
myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) = if x == True then True else myOr xs

myOr' :: [Bool] -> Bool
myOr' [] = True
myOr' (x:xs) = x || myOr xs

myOr'' :: [Bool] -> Bool
myOr'' = foldr (\item acc -> if item == True then True else acc) False

myOr''' :: [Bool] -> Bool
myOr''' = foldr (||) False

-- 2.
myAny :: (a -> Bool) -> [a] -> Bool
myAny f [] = False
myAny f (x:xs) = if f x == True then True else myAny f xs

myAny' :: (a -> Bool) -> [a] -> Bool
myAny' f = foldr (\item acc -> if f item == True then True else acc) False

-- 3.
myElem :: Eq a => a -> [a] -> Bool
myElem num [] = False
myElem num (x:xs) = if x == num then True else myElem num xs

myElem' :: Eq a => a -> [a] -> Bool
myElem' num = foldr (\item acc -> item == num || acc) False

myElem'' :: Eq a => a -> [a] -> Bool
myElem'' num = any (\item -> num == item)

myElem''' :: Eq a => a -> [a] -> Bool
myElem''' num = any (== num)

-- 4.
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

myReverse' :: [a] -> [a]
myReverse' = foldl (flip (:)) []

-- 5.
myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr (\item acc -> (f item):acc) []

-- 6.
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f = foldr (\item acc -> if (f item) then item:acc else acc) []

-- 7.
squish :: [[a]] -> [a]
squish = foldr (\item acc -> item ++ acc) []

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr (\x y -> (f x) ++ y) []

squishMap' :: (a -> [b]) -> [a] -> [b]
squishMap' f = foldr ((++) . f) []

squishAgain :: [[a]] -> [a]
squishAgain = squishMap (\x -> x ++ [])

squishAgain' :: [[a]] -> [a]
squishAgain' = squishMap id

myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy f (x:xs) = foldl fn x xs
  where fn z1 z2 = if f z1 z2 == GT then z1 else z2

myMaximumBy' :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy' f (x:xs) = foldl fn x xs
  where fn a b
          | f a b == GT = a
          | otherwise = b

myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy f (x:xs) = foldl fn x xs
  where fn z1 z2 = if f z1 z2 == LT then z1 else z2

myMinimumBy' :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy' f (x:xs) = foldl fn x xs
  where fn a b
          | f a b == LT = a
          | otherwise = b
