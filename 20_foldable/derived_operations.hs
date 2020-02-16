import Data.Monoid
import Data.Functor

-- toList :: t a -> [a]
-- | List of elements of a structure, from left to right.
a1 = toList (Just 1)                -- => [1]

xs = [Just 1, Just 2, Just 3]
a2 = map toList xs                  -- => [[1],[2],[3]]
a3 = concatMap toList xs            -- => [1,2,3]

xs' = [Just 1, Just 2, Nothing]
a4 = concatMap toList xs'           -- => [1,2]
a5 = toList (1, 2)                  -- => [2]

-- null :: t a -> Bool
-- | Test whether the structure is empty.
b1 = null (Left 3)                  -- => True
b2 = null []                        -- => True
b3 = null Nothing                   -- => True
b4 = null (1, 2)                    -- => False
xs'' = [Just 1, Just 2, Nothing]
b2 = fmap null xs''                 -- => [False,False,True]

-- length :: t a -> Int
-- | Returns the size/length of a finite structure as an 'Int'.
c1 = length (1, 2)                  -- => 1

cxs = [(1, 2), (3, 4), (5, 6)]
c2 = length cxs                     -- => 3
c3 = fmap length cxs                -- => [1,1,1]
c4 = fmap length Just [1, 2, 3]     -- => 1

-- elem :: Eq a => a -> t a -> Bool
-- | Does the element occur in the structure?
d1 = elem 2 (Just 3)                -- => False
d2 = elem True (Left False)         -- => False
d3 = elem True (Left True)          -- => False
d4 = elem True (Right False)        -- => False
d5 = elem True (Right True)         -- => True
dxs = [Right 1,Right 2,Right 3]
d6 = fmap (elem 3) dxs              -- => [False,False,True]

-- maximum :: Ord a => t a -> a
-- | The largest element of a non-empty structure.

-- minimum :: Ord a => t a -> a
-- | The least element of a non-empty structure.
--
e1 = maximum [10, 12, 33, 5]        -- => 33

exs = [Just 2, Just 10, Just 4]
e2 = fmap maximum exs               -- => [2,10,4]
e3 = fmap maximum (Just [3, 7, 10, 2])    -- => Just 10
e4 = minimum "julie"                      -- => 'e'
e5 = fmap minimum (Just "julie")          -- => Just 'e'

exs' = map Just "jul"
e6 = exs'                                 -- => [Just 'j',Just 'u',Just 'l']
e7 = fmap minimum exs'                    -- => "jul"

exs'' = [Just 4, Just 3, Nothing]
e8 = fmap minimum xs                      -- =>
-- [4,3,*** Exception:
-- minimum: empty structure
-- Prelude> minimum (Left 3)
-- *** Exception: minimum: empty structure

-- sum :: (Foldable t, Num a) => t a -> a
-- product :: (Foldable t, Num a) => t a -> a
f1 = sum (7, 5)                           -- => 5
f2 = fmap sum [(7, 5), (3, 4)]            -- => [5,4]
f3 = fmap sum (Just [1, 2, 3, 4, 5])      -- => Just 15
f4 = product Nothing                      -- => 1
f5 = fmap product (Just [])               -- => Just 1
f6 = fmap product (Right [1, 2, 3])       -- => Right 6
