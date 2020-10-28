{-# LANGUAGE InstanceSigs #-}

import           Control.Monad (join)

newtype Identity a =
  Identity { runIdentity :: a }
  deriving (Eq, Show)

-- The identity monad transformer, serving
-- only to specify that additional
-- structure should exist.
newtype IdentityT f a =
  IdentityT { runIdentityT :: f a }
  deriving (Eq, Show)

instance Functor Identity where
  fmap f (Identity a) = Identity (f a)

instance (Functor m) => Functor (IdentityT m) where
  fmap f (IdentityT fa) = IdentityT (fmap f fa)

instance Applicative Identity where
  pure = Identity
  (Identity f) <*> (Identity a) = Identity (f a)

instance (Applicative m) => Applicative (IdentityT m) where
  pure x = IdentityT (pure x)
  (IdentityT fab) <*> (IdentityT fa) = IdentityT (fab <*> fa)

instance Monad Identity where
  return = pure
  (Identity a) >>= f = f a

-- instance (Monad m) => Monad (IdentityT m) where
--   return = pure
--   (IdentityT ma) >>= f = IdentityT $ ma >>= runIdentityT . f
--
--
-- sumR = return . (+1)
-- result = IdentityT [1, 2, 3] >>= sumR
-- -- IdentityT {runIdentityT = [2,3,4]}

instance (Monad m) => Monad (IdentityT m) where
  return = pure

  (>>=) :: IdentityT m a
        -> (a -> IdentityT m b)
        -> IdentityT m b
  (IdentityT ma) >>= f =
  -- 1.
  -- undefined

  -- 2.
    -- let aimb = ma >>= f
    -- in undefined

  -- 3.
    -- let aimb :: a
    --     aimb = fmap f ma
    --   in undefined

  -- 4.
    -- let aimb :: a
    --     aimb = fmap runIdentityT (fmap f ma)
    --   in undefined

  -- 5.
    -- let aimb :: a
    --     aimb = join (fmap runIdentityT (fmap f ma))
    --   in undefined

  -- 6.
    -- let aimb :: a
    --     aimb = join (fmap runIdentityT (fmap f ma))
    --   in aimb

  -- 7.
    let aimb = join (fmap runIdentityT (fmap f ma))
      in IdentityT aimb

