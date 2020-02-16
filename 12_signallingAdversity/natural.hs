data Nat = Zero | Succ Nat deriving (Eq, Show)

natToInteger :: Nat -> Integer
natToInteger Zero = 0
natToInteger (Succ n) = 1 + natToInteger n

integerToNat :: Integer -> Maybe Nat
integerToNat n
  | n < 0 = Nothing
  | otherwise = Just (getNat n)
  where
    getNat 0 = Zero
    getNat n = Succ (getNat $ n - 1)

test1 = natToInteger Zero == 0
test2 = natToInteger (Succ Zero) == 1
test3 = natToInteger (Succ (Succ Zero)) == 2

test4 = integerToNat 0 == Just Zero
test5 = integerToNat 1 == Just (Succ Zero)
test6 = integerToNat 2 == Just (Succ (Succ Zero))
test7 = integerToNat (-1) == Nothing

assertation = test1 && test2 && test3 && test4 && test5 && test6 && test7
