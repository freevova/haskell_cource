module Example where

splitBy :: String -> Char -> [String]
splitBy str char = go (dropWhile (==char) str) []
  where go s arr
          | length s == 0 = arr
          | otherwise = go (dropWhile (==char) . dropWhile (/=char) $ s) (arr ++ [(takeWhile (/=char) s)])
-- 1.
myWords :: String -> [String]
myWords str = splitBy str ' '

-- 2.
firstSen = "Tyger Tyger, burning bright\n"
secondSen = "In the forests of the night\n"
thirdSen = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful\
\ symmetry?"
sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen

-- Implement this
myLines :: String -> [String]
myLines str = splitBy str '\n'

shouldEqual =
  [ "Tyger Tyger, burning bright"
  , "In the forests of the night"
  , "What immortal hand or eye"
  , "Could frame thy fearful symmetry?" ]

main :: IO ()
main = print $ "Are they equal? " ++ show (myLines sentences == shouldEqual)
