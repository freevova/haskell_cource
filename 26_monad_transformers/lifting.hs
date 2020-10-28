-- fmap :: Functor f
--       => (a -> b) -> f a -> f b
-- liftA :: Applicative f
--       => (a -> b) -> f a -> f b
-- liftM :: Monad m
--       => (a -> r) -> m a -> m r

class MonadTrans t where
-- | Lift a computation from
--  the argument monad to
--  the constructed monad.

lift :: (Monad m) => m a -> t m a

newtype ScottyT e m a =
  ScottyT
  { runS :: State (ScottyState e m) a }
  deriving (Functor, Applicative, Monad)

newtype ActionT e m a =
  ActionT
  { runAM
    :: ExceptT
      (ActionError e)
      (ReaderT ActionEnv
        (StateT ScottyResponse m))
      a
  }
  deriving ( Functor, Applicative )

type ScottyM = ScottyT Text IO
type ActionM = ActionT Text IO

param :: Parsable a
      => Data.Text.Internal.Lazy.Text
      -> ActionM a

get :: RoutePattern
    -> ActionM ()
    -> ScottyM ()

-- scotty.hs
{-# LANGUAGE OverloadedStrings #-}

module Scotty where
import Web.Scotty
import Data.Monoid (mconcat)
import Control.Monad.Trans.Class

main = scotty 3000 $ do
  get "/:word" $ do
    beam <- param "word"
    -- putStrLn "hello"
    lift (putStrLn "hello")
    html $
    mconcat ["<h1>Scotty, ", beam, " me up!</h1>"]


1. IdentityT
instance MonadTrans IdentityT where
lift = IdentityT

2. MaybeT
instance MonadTrans MaybeT where
  lift = MaybeT . liftM Just

lift :: (Monad m) => m a -> t m a
(MaybeT . liftM Just) :: Monad m => m a -> MaybeT m a
MaybeT :: m (Maybe a) -> MaybeT m a (liftM Just) :: Monad m => m a -> m (Maybe a)

v :: Monad m => m a
liftM Just :: Monad m => m a -> m (Maybe a)
liftM Just v :: m (Maybe a)
MaybeT (liftM Just v) :: MaybeT m a

3. ReaderT
instance MonadTrans (ReaderT r) where
lift = ReaderT . const
