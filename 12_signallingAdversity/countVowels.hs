import Data.Char (toLower)

countVowels :: String -> Integer
countVowels = foldr process 0
  where process item acc
          | elem (toLower item) "aeiou" = acc + 1
          | otherwise = acc

test1 = countVowels "the cow" == 2
test2 = countVowels "Mikolajczak" == 4

assert = test1 && test2
