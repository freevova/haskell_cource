{-# LANGUAGE RankNTypes #-}
type Nat f g = forall a . f a -> g a

-- This'll work
maybeToList :: Nat Maybe []
maybeToList Nothing  = []
maybeToList (Just a) = [a]

-- This will not work, not allowed.
degenerateMtl :: Nat Maybe []
degenerateMtl Nothing  = []
degenerateMtl (Just a) = [a+1]

-- a type changes

module BadNat where
type Nat f g a = f a -> g a
-- This'll work
maybeToList :: Nat Maybe [] a
maybeToList Nothing = []
maybeToList (Just a) = [a]

-- But this will too if we tell it
-- 'a' is Num a => a
degenerateMtl :: Num a => Nat Maybe [] a
degenerateMtl Nothing = []
degenerateMtl (Just a) = [a+1]
