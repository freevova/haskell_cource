-- The difference is that let bindings are expressions themselves.
-- where bindings are just syntactic constructs. That is why we are able to write
(let a = 100; b = 200; c = 300 in a*b*c, let foo="Hey "; bar = "there!" in foo ++ bar)

-- Returns 30 with let
let x = 5; y = 6 in x * y
-- With where
module Practice where
mult1 = x * y
  where x = 5
        y = 6

-- Returns 1009 with let
let x = 3; y = 1000 in x * 3 + y
-- With where
module Practice where
test = x * 3 + y
  where x = 3
        y = 1000

-- Returns 1009 with let
let y = 10; x = 10 * 5 + y in x * 5
-- With where
module Practice where
test = x * 5
  where y = 10
        x = 10 * 5 + y

-- Returns -17 with let
let x = 7
    y = negate x
    z = y * 10
  in z / x + y
-- With where:
module Practice where
test = z / x + y
  where x = 7
        y = negate 7
        z = y * 10
