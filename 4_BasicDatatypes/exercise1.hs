awesome = ["Papuchon", "curry", ":)"]
also = ["Quake", "The Simons"]
allAwesome = [awesome, also]

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = x == (reverse x)

-- reverse_s :: [a] -> [a]
-- reverse_s str
--         | str == "" = str
--         | otherwise = reverse_s cs ++ [c]
--                     where (c:cs) = str
--
-- reverse_s s = case s of "" -> s
--                         c:cs -> reverse_s cs ++ [c]
--
