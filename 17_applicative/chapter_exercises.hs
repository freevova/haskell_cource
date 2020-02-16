import Control.Applicative (liftA3)

stops :: String
stops = "pbtdkg"

vowels :: String
vowels = "aeiou"

combos :: [a] -> [b] -> [c] -> [(a, b, c)]
combos i1 i2 i3 = (,,) <$> i1 <*> i2 <*> i3
combos' i1 i2 i3 = liftA3 (,,) i1 i2 i3
