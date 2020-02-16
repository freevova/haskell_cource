import Data.Char (ord, chr, isUpper)

shiftChar :: Int -> Char -> Char
shiftChar n c = go n c
  where
    aAndZOrds = if isUpper c then (ord 'A', ord 'Z') else (ord 'a', ord 'z')
    go inc char =
      chr (fst aAndZOrds +
        mod (ord char + inc - fst aAndZOrds) (snd aAndZOrds - fst aAndZOrds + 1)
      )

distAtoChar :: Char -> Int
distAtoChar c
  | isUpper c = ord c - ord 'A'
  | otherwise = ord c - ord 'a'

encodeWord :: Int -> String -> String -> String
encodeWord keyStartPos key word = doEncoding
  where
    encodeChar keyChar char = shiftChar (distAtoChar keyChar) char
    keyCharAt n = key !! (mod n (length key))
    doEncoding = map (\x -> encodeChar (keyCharAt (x + keyStartPos)) (word !! x))
                  [0..(length word - 1)]

viginere :: String -> String -> String
viginere key strToEncode = unwords doEncoding
  where
    ws = words strToEncode
    sumChars n = length . concat $ take n ws
    doEncoding = map (\x -> encodeWord (sumChars x) key (ws !! x))
                  [0..(length ws - 1)]
