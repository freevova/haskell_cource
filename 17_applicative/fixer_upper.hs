import Control.Applicative

x :: Maybe String
x = const <$> Just "Hello" <*> Just "World"

y :: Maybe (Integer, Integer, [Char], [Integer])
y = (,,,) <$> Just 90 <*> Just 10 <*> Just "Tierness" <*> Just [1, 2, 3]

x' = liftA2 const (Just "Hello") (Just "World")
