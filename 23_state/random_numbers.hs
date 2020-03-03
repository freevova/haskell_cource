import System.Random

r1 = mkStdGen 0 -- => 1 1
-- :t mkStdGen 0   => mkStdGen 0 :: StdGen

sg = mkStdGen 0
-- :t next sg      => next sg :: (Int, StdGen)

r2 = next sg    -- => (2147482884,40014 40692)
r3 = next sg    -- => (2147482884,40014 40692)

r4 = snd (next sg)    -- => 40014 40692
newSg = snd (next sg) -- => newSg :: StdGen
r5 = next newSg       -- => (2092764894,1601120196 1655838864)


random newSg :: (Int, StdGen)    -- => (138890298504988632,439883729 1872071452)
random newSg :: (Double, StdGen) -- => (0.41992072972993366,439883729 1872071452)

randomR (0, 3) newSg :: (Int, StdGen)    -- => (1,1601120196 1655838864)
randomR (0, 3) newSg :: (Double, StdGen) -- => (1.259762189189801,439883729 1872071452)
