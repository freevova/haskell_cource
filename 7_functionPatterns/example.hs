module Test where
import Data.List
import Data.Function (on)

addGiveGuard :: Int -> Int -> Int
addGiveGuard x y
  | x > y = x + 5
  | otherwise = y + 5

unsortedList = [("a", 5),("b", 62),("c", 2),("d", 45)]
sortedList = map fst $ sortBy (flip compare `on` snd) unsortedList
-- sortedList = map fst (sortBy (flip compare `on` snd) unsortedList)


