list = [Right 1, Right 2, Left 1, Right 3, Left 2]

lefts' :: [Either a b] -> [a]
lefts' = foldr process []
  where process (Left item) acc = item:acc
        process (Right _) acc = acc

rights' :: [Either a b] -> [b]
rights' = foldr process []
  where process (Left _) acc = acc
        process (Right item) acc = item:acc


partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' = foldr process ([], [])
  where process (Left left) (l1, l2) = (left:l1, l2)
        process (Right right) (l1, l2) = (l1, right:l2)

eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' fun (Left _) = Nothing
eitherMaybe' fun (Right item) = Just $ fun $ item
