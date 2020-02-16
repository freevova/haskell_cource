import Data.List (intercalate)

notThe :: String -> Maybe String
notThe "the" = Nothing
notThe string = Just string

replaceThe :: String -> String
replaceThe = intercalate " " . map process . words
  where process string = case notThe string of
                           Just string -> string
                           Nothing -> "a"

isRight = replaceThe "the cow loves us" == "a cow loves us"
