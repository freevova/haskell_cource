newtype Constant a b = Constant { getConstant :: a } deriving (Eq, Show)

Prelude> Constant 2
  Constant {getConstant = 2}


instance Functor (Constant m) where
  fmap _ (Constant v) = Constant v

Prelude> const 2 (getConstant (Constant 3))
  2

Prelude> fmap (const 2) (Constant 3)
  Constant {getConstant = 3}

Prelude> gc = getConstant
Prelude> c  = Constant 3
Prelude> gc $ fmap (const 2) c
  3
Prelude> gc $ fmap (const "blah") c
  3
