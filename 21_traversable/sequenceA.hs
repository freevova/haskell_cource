-- Compare
a1 = sum [1, 2, 3]                          -- => 6
a2 = fmap sum [Just 1, Just 2, Just 3]      -- => [1,2,3]
a3 = (fmap . fmap) sum Just [1, 2, 3]       -- => Just 6
a4 = fmap product [Just 1, Just 2, Nothing] -- => [1,2,1]

-- To:
b1 = fmap Just [1, 2, 3]                                 -- => [Just 1,Just 2,Just 3]
b2 = sequenceA $ fmap Just [1, 2, 3]                     -- => Just [1,2,3]
b3 = sequenceA [Just 1, Just 2, Just 3]                  -- => Just [1,2,3]
b4 = sequenceA [Just 1, Just 2, Nothing]                 -- => Nothing
b5 = fmap sum $ sequenceA [Just 1, Just 2, Just 3]       -- => Just 6
b6 = fmap product (sequenceA [Just 1, Just 2, Nothing])  -- => Nothing


import Data.Maybe
xs = [Just 1, Just 2, Just 3]
xsn = [Just 1, Just 2, Nothing]
xsn' = xs ++ [Nothing]

catMaybes xs                                -- => [1,2,3]
catMaybes xsn                               -- => [1,2]
sum $ catMaybes xsn'                        -- => 6
fmap sum $ sequenceA xsn'                   -- => Nothing
