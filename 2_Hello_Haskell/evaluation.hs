sayHello :: String -> IO ()
sayHello x = putStrLn ("Hello, " ++ x ++ "!")

tripple :: Num a => a -> a
tripple x = x * 3

-- You may write functions and operators
-- in infix and prefix style, like:
infixStyle :: Integral a => a
infixStyle = 10 `div` 4

prefixStyle :: Integral a => a
prefixStyle = div 10 4
