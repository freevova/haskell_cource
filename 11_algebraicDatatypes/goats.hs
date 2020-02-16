-- newtype Goats = Goats Int deriving (Eq, Show)
-- newtype Cows = Cows Int deriving (Eq, Show)
--
-- class TooMany a where
--   tooMany :: a -> Bool
--
-- instance TooMany Int where
--   tooMany n = n > 42
--
-- instance TooMany Goats where
--   tooMany (Goats n) = tooMany n

{-# LANGUAGE GeneralizedNewtypeDeriving #-}

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

newtype Goats = Goats Int deriving (Eq, Show, TooMany)
