isThe :: String -> Bool
isThe str = str == "the"

beginsWithVowel :: String -> Bool
beginsWithVowel "" = False
beginsWithVowel (s:str) = elem s "aeiou"

firstHasVowel :: [String] -> Bool
firstHasVowel [] = False
firstHasVowel (x:_) = beginsWithVowel x

getIncrement :: [String] -> Integer
getIncrement (x:xs)
  | isThe x && firstHasVowel xs = 1
  | otherwise = 0

countTheBeforeVowel :: String -> Integer
countTheBeforeVowel "" = 0
countTheBeforeVowel str = process . getIncrement $ ws
  where ws = words str
        process n = n + (countTheBeforeVowel . unwords . drop 1 $ ws)

isRight1 = countTheBeforeVowel "the cow" == 0
isRight2 = countTheBeforeVowel "the evil cow" == 1
isRight3 = countTheBeforeVowel "is the evil, the cow, the apple" == 2

assert = isRight1 && isRight2 && isRight3
