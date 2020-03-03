import Control.Monad
import Control.Monad.Trans.State
-- http://hackage.haskell.org/package/dlist
import qualified Data.DList as DL

fizzBuzz :: Integer -> String
fizzBuzz n | n `mod` 15 == 0 = "FizzBuzz"
           | n `mod` 5 == 0 = "Buzz"
           | n `mod` 3 == 0 = "Fizz"
           | otherwise = show n

main0 :: IO ()
main0 = mapM_ (putStrLn . fizzBuzz) [1..100]


fizzbuzzList :: [Integer] -> [String]
fizzbuzzList list = execState (mapM_ addResult list) []

addResult :: Integer -> State [String] ()
addResult n = do
  xs <- get
  let result = fizzBuzz n
  put (result : xs)

main1 :: IO ()
main1 = mapM_ putStrLn $ reverse $ fizzbuzzList [1..100]

fizzbuzzList1 :: [Integer] -> [String]
fizzbuzzList1 list =
  let dlist = execState (mapM_ addResult list) DL.empty
  -- convert back to normal list
  in DL.apply dlist []

-- addResult1 :: Integer -> State (DL.DList String) ()
-- addResult1 n = do
--   xs <- get
--   let result = fizzBuzz ndlist
--   -- snoc appends to the end, unlike
--   -- cons which adds to the front
--   put (DL.snoc xs result)
--
-- main2 :: IO ()
-- main2 = mapM_ putStrLn $ fizzbuzzList [1..100]
