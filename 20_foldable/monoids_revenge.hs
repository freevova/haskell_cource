import Data.Monoid
import Data.Functor

class Foldable (t :: * -> *) where
  fold :: Monoid m => t m -> m
  foldMap :: Monoid m => (a -> m) -> t a -> m

foldr (+) 0 [1..5]                -- => 15
foldr (++) "" ["hello", " julie"] -- => "hello julie"

fold map Sum [1..5]             -- Sum {getSum = 15}
fold [1, 2, 3, 4, 5] :: Product Integer
fold ["hello", " julie"]        -- => "hello julie"

foldMap Sum [1, 2, 3, 4]        -- => Sum {getSum = 10}
foldMap Product [1, 2, 3, 4]    -- => Product {getProduct = 24}
foldMap All [True, False, True] -- => All {getAll = False}
foldMap Any [(3 == 4), (9 > 5)] -- => Any {getAny = True}

xs = [Just 1, Nothing, Just 5]
foldMap First xs                -- => First {getFirst = Just 1}
foldMap Last xs                 -- => Last {getLast = Just 5}

-- 5 * 10 * 15
foldMap (*5) map Product [1..3] -- => Product {getProduct = 750}
-- 5 + 10 + 15
foldMap (*5) map Sum [1..3]     -- => Sum {getSum = 30}

foldr (*) 3 map Sum [2..4]      -- => Sum {getSum = 72}
foldr (*) 3 map Product [2..4]  -- => Product {getProduct = 72}

fm = foldMap (*5)
fm (Just 100) :: Product Integer -- => Product {getProduct = 500}
fm (Just 5) :: Sum Integer       -- => Sum {getSum = 25}
fm Nothing :: Sum Integer        -- => Sum {getSum = 0}
fm Nothing :: Product Integer    -- => Product {getProduct = 1}
