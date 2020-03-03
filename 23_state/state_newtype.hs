-- newtype Reader r a = Reader { runReader :: r -> a }
-- newtype State s a = State { runState :: s -> (a, s) }

-- random :: (Random a) => StdGen -> (a, StdGen)
-- State { runState :: s -> (a, s) }
--
-- randomR :: (...) => (a, a) -> g -> (a, g)
-- State { runState :: s -> (a, s) }

module RandomExample where

import Control.Applicative (liftA3)
import Control.Monad (replicateM)
import Control.Monad.Trans.State
import System.Random

-- Six-sided die
data Die =
  DieOne
  | DieTwo
  | DieThree
  | DieFour
  | DieFive
  | DieSix
  deriving (Eq, Show)

intToDie :: Int -> Die
intToDie n =
  case n of
    1 -> DieOne
    2 -> DieTwo
    3 -> DieThree
    4 -> DieFour
    5 -> DieFive
    6 -> DieSix
    -- Use 'error'
    -- _extremely_ sparingly.
    x ->
      error $
        "intToDie got non 1-6 integer: "
        ++ show x

rollDieThreeTimes :: (Die, Die, Die)
rollDieThreeTimes = do
  let s = mkStdGen 0
      (d1, s1) = randomR (1, 6) s
      (d2, s2) = randomR (1, 6) s1
      (d3, _) = randomR (1, 6) s2
  (intToDie d1, intToDie d2, intToDie d3)


-- with State
rollDie :: State StdGen Die
rollDie = state $ do
  (n, s) <- randomR (1, 6)
  return (intToDie n, s)

-- state :: Monad m => (s -> (a, s)) -> StateT s m a

rollDie' :: State StdGen Die
rollDie' = intToDie <$> state (randomR (1, 6))

rollDieThreeTimes' :: State StdGen (Die, Die, Die)
rollDieThreeTimes' = liftA3 (,,) rollDie rollDie rollDie

main = evalState rollDieThreeTimes' (mkStdGen 0)  -- => (DieSix,DieSix,DieFour)
main' = evalState rollDieThreeTimes' (mkStdGen 1) -- => (DieSix,DieFive,DieTwo)

-- Seems appropriate?
-- repeat :: a -> [a]

infiniteDie :: State StdGen [Die]
infiniteDie = repeat <$> rollDie

main''' = take 6 $ evalState infiniteDie (mkStdGen 0) -- => [DieSix,DieSix,DieSix,DieSix,DieSix,DieSix]

-- replicateM :: Monad m => Int -> m a -> m [a]
nDie :: Int -> State StdGen [Die]
nDie n = replicateM n rollDie

main2 = evalState (nDie 5) (mkStdGen 0)  -- =>[DieSix,DieSix,DieFour,DieOne,DieFive]
main2' = evalState (nDie 5) (mkStdGen 1) -- => [DieSix,DieFive,DieTwo,DieSix,DieFive]

rollsToGetTwenty :: StdGen -> Int
rollsToGetTwenty g = go 0 0 g
  where
    go :: Int -> Int -> StdGen -> Int
    go sum count gen
      | sum >= 20 = count
      | otherwise =
        let (die, nextGen) = randomR (1, 6) gen
        in go (sum + die)
              (count + 1) nextGen

r1 = rollsToGetTwenty (mkStdGen 0)    -- => 5
r2 = rollsToGetTwenty (mkStdGen 0)    -- => 5
r3 = (rollsToGetTwenty . mkStdGen) <$> randomIO

rollsToGetN :: Int -> StdGen -> Int
rollsToGetN range g = go 0 0 g
  where
    go :: Int -> Int -> StdGen -> Int
    go sum count gen
      | sum >= 20 = count
      | count >= range = count
      | otherwise =
        let (die, nextGen) = randomR (1, 6) gen
        in go (sum + die)
              (count + 1) nextGen
