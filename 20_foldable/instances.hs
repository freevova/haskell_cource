import Data.Monoid
import Data.Functor
-- IDENTITY
data Identity a = Identity a

instance Foldable Identity where
  foldr f z (Identity x) = f x z
  foldl f z (Identity x) = f z x
  foldMap f (Identity x) = f x


a1 = foldr (*) 1 (Identity 5)   -- => 5
a2 = foldl (*) 5 (Identity 5)   -- => 25

type PI = Product Integer
a3 = foldMap (*5) (Identity 100) :: PI    -- => Product {getProduct = 500}

-- MAYBE
data Optional a = Yep a | Nada
instance Foldable Optional where
  foldr _ z Nada = z
  foldr f z (Yep x) = f x z
  foldl _ z Nada = z
  foldl f z (Yep x) = f z x
  foldMap _ Nada = mempty
  foldMap f (Yep a) = f a

b1 = foldr (+) 1 Nothing                  -- => 1
b2 = foldMap (+1) Nothing :: Sum Integer  -- => Sum {getSum = 0}

b3 = foldr (+) 1 (Just 3)                 -- => 4
b4 = foldMap (+1) $ Just 3 :: Sum Integer -- => Sum {getSum = 4}
