data WhoCares a =
  ItDoesnt
  | Matter a
  | WhatThisIsCalled
  deriving (Eq, Show)

instance Functor WhoCares where
  fmap _ ItDoesnt         = ItDoesnt
  fmap _ WhatThisIsCalled = WhatThisIsCalled
  fmap f (Matter a)       = Matter (f a)

-- Identity law brake:
instance Functor WhoCares where
  fmap _ ItDoesnt         = WhatThisIsCalled
  fmap f WhatThisIsCalled = ItDoesnt
  fmap f (Matter a)       = Matter (f a)

-- Composition law brake:
data CountingBad a = Heisenberg Int a deriving (Eq, Show)

instance Functor CountingBad where
fmap f (Heisenberg n a) = Heisenberg (n+1) (f a)

-- Prelude> u = "Uncle"
-- Prelude> oneWhoKnocks = Heisenberg 0 u
-- Prelude> fmap (++" Jesse") oneWhoKnocks
-- Heisenberg 1 "Uncle Jesse"
-- Prelude> f = ((++" Jesse").(++" lol"))
-- Prelude> fmap f oneWhoKnocks
-- Heisenberg 1 "Uncle lol Jesse"

-- It's ok:
data CountingGood a = Heisenberg Int a deriving (Eq, Show)
instance Functor CountingGood where
  fmap f (Heisenberg n a) = Heisenberg (n) (f a)
