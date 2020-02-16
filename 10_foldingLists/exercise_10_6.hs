module Test where
import Data.Time
import Data.Maybe
-- read about Data.List.NonEmpty
-- read about TypView
import Debug.Trace
import Data.List
-- trace
-- traceId
-- traceShow
-- traceShowId
--
myLength :: Show a => [a] -> Int
myLength xs = foldl' f 0 xs
  where
    f acc a =
      trace "> inside of f" $
      trace "> acc is: " $
      traceShow acc $
      trace "> a is: " $
      traceShow a $
      1 + acc

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [ DbDate (UTCTime (fromGregorian 1911 5 1) (secondsToDiffTime 34123))
  , DbNumber 9001
  , DbString "Hello, world!"
  , DbDate (UTCTime (fromGregorian 1921 5 1) (secondsToDiffTime 34123))
  ]


filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate database = foldr fun [] database
  where fun (DbDate time) acc = time:acc
        fun _ acc = acc

filterDbDate' :: [DatabaseItem] -> [UTCTime]
filterDbDate' database = [x | DbDate x <- database]

filterDbDate'' :: [DatabaseItem] -> [UTCTime]
filterDbDate'' database = catMaybes $ map toMaybe database
  where toMaybe x = case x of
                    DbDate utcTime -> Just utcTime
                    _ -> Nothing

filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber database = foldr fun [] database
  where fun (DbNumber int) acc = int:acc
        fun _ acc = acc

mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = fun . filterDbDate
  where fun (x:xs) = foldr (\item acc -> if item > acc then item else acc) x xs

sumDb :: [DatabaseItem] -> Integer
sumDb = fun . filterDbNumber
  where fun list = foldr (\item acc -> acc + item) 0 list

avgDb :: [DatabaseItem] -> Double
avgDb database = (fromIntegral . sum $ list) / (fromIntegral . length $ list)
  where list = filterDbNumber database

