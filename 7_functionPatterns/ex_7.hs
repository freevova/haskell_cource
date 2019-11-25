module Ex where
  import Data.List
-- 1.
  tensDigit :: Integral a => a -> a
  tensDigit x = d
    where xLast = x `div` 10
          d = xLast `mod` 10

  tensDigit' :: Integral a => a -> a
  tensDigit' x = b
    where (a, _) = x `divMod` 10
          (_, b) = a `divMod` 10

  tensDigit'' :: Integral a => a -> a
  tensDigit'' x = snd . f . fst . f $ x
    where f x1 = x1 `divMod` 10

  hunsD :: Integral a => a -> a
  hunsD x = d
    where xLast = x `div` 100
          d = xLast `mod` 10

-- 2.
  sum' :: (Eq a, Num a) => a -> a
  sum' 1 = 1
  sum' n = n + sum' (n - 1)
  -- sum' 5 => 1 + 2 + 3 + 4 + 5

  sum'' :: (Eq a, Num a) => a -> a
  sum'' n = f n 1
    where f 1 acc = acc
          f n acc = f (n - 1) (acc + n)

-- 3.
  mul' :: (Integral a) => a -> a -> a
  mul' _ 0 = 0
  mul' x y = x + mul' x (y - 1)

  mul'' :: (Integral a) => a -> a -> a
  mul'' _ 0 = 0
  mul'' x y
    | y == 0 = 0
    | otherwise = x + mul' x (y - 1)

  -- mul' 2 3 => 6

-- 4.
  mc n
    | n > 100 = n - 10
    | otherwise = mc . mc $ n + 11
-- 5.
--
  numberToWord '1' = "one"
  numberToWord '2' = "two"
  numberToWord '3' = "three"
  numberToWord '4' = "four"
  numberToWord '5' = "five"

  wordNumber number = intersperse "-" (map numberToWord (show number))
