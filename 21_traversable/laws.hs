-- The traverse function must satisfy the following laws:
-- 1. Naturality
t . traverse f = traverse (t . f)

--  2. Identity
traverse Identity = Identity

-- 3. Composition
traverse (Compose . fmap g . f) = Compose . fmap (traverse g) . traverse f

-- The sequenceA function must satisfy the following laws:
-- 1. Naturality
t . sequenceA = sequenceA . fmap t
-- 2. Identity
sequenceA . fmap Identity = Identity
-- 3. Composition
sequenceA . fmap Compose =
