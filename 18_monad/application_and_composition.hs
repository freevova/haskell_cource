import           Control.Monad (join, (>=>))

-- Prelude> join $ putStrLn <$> getLine
-- blah
-- blah
-- Prelude> :t join $ putStrLn <$> getLine
-- join $ putStrLn <$> getLine :: IO ()

mcomp :: Monad m => (b -> m c) -> (a -> m b) -> a -> m c
-- 1. doesn't work
-- mcomp f g a = f (g a)

-- 2. does work
-- mcomp f g a = join (f <$> (g a))

-- 3. does work
mcomp f g a = g a >>= f

sayHi :: String -> IO String
sayHi greeting = do
  putStrLn greeting
  getLine

readM :: Read a => String -> IO a
readM = return . read

getAge :: String -> IO Int
getAge = sayHi >=> readM

askForAge :: IO Int
askForAge = getAge "Hello! How old are you? "
