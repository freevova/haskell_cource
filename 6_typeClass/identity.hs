data Identity a = Identity a

instance Eq a => Eq (Identity a) where
  (==) (Identity v) (Identity v') = v == v'

data NoEq = NoEqInst deriving Show

-- Does not work
-- Prelude> inoe = Identity NoEqInst
-- Prelude> inoe == inoe
