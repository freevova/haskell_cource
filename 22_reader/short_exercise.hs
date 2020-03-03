import Data.Char

cap :: [Char] -> [Char]
cap xs = map toUpper xs

rev :: [Char] -> [Char]
rev xs = reverse xs

composed :: [Char] -> [Char]
composed = rev . cap

fmapped :: [Char] -> [Char]
fmapped = rev <$> cap

tupled :: [Char] -> ([Char], [Char])
tupled = do
  a <- rev
  b <- cap
  return (a,b)

tupled' :: [Char] -> ([Char], [Char])
tupled' = (,) <$> rev <*> cap

tupled'' :: [Char] -> ([Char], [Char])
tupled'' = rev >>= \a ->
                cap >>= \b ->
                                 return (a,b)

-- Prelude> composed "Julie"
-- "EILUJ"
-- Prelude> fmapped "Chris"
-- "SIRHC"
--
-- Prelude> tupled "Julie"
-- ("JULIE","eiluJ")
-- -- or
-- Prelude> tupled' "Julie"
-- ("eiluJ","JULIE")
