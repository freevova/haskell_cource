newtype Word' = Word' String deriving (Eq, Show)

vowels :: String
vowels = "aeiou"

isVowel :: Char -> Bool
isVowel c = (toLower c) `elem` vowels

countVowels :: String -> Int
countVowels str = foldr (\a b -> if isVowel a then b + 1 else b) 0 str

mkWord :: String -> Maybe Word'
mkWord str = case compare numVowels numConsonants of
               GT -> Nothing
               _ -> Just (Word' str)
  where
    numVowels = countVowels str
    numConsonants = (length str) - numVowels
