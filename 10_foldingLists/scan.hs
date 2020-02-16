scanr (+) 0 [1..3]
  [1 + (2 + (3 + 0)), 2 + (3 + 0), 3 + 0, 0]
  [6, 5, 3, 0]

scanl (+) 0 [1..3]
  [0, 0 + 1,0 + 1 + 2, 0 + 1 + 2 + 3]
  [0, 1, 3, 6]


scanl' :: (a -> b -> a) -> a -> [b] -> [a]
scanl' f q ls =
  q : (case ls of
        [] -> []
        x:xs -> scanl f (f q x) xs
      )

fibs = 1 : scanl (+) 1 fibs
fibsN x = fibs !! x

-- 1.
take20 = take 20 fibs
takeLessThen100 = foldr (\item acc -> if item < 100 then item:acc else acc) [] fibs
takeLessThen100 = [ x | x <- fibs, x < 100 ]
factorial = scanl (*) 1 [2..]


