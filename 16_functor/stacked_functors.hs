
Prelude> n            = Nothing
Prelude> w            = Just "woohoo"
Prelude> ave          = Just "Ave"
Prelude> lms          = [ave, n, w]
Prelude> replaceWithP = const 'p'
Prelude> replaceWithP lms
'p'
Prelude> fmap replaceWithP lms
"ppp"

Prelude> (fmap . fmap) replaceWithP lms
[Just 'p',Nothing,Just 'p']
Prelude> tripFmap = fmap . fmap . fmap
Prelude> tripFmap replaceWithP lms
[Just "ppp",Nothing,Just "pppppp"]
