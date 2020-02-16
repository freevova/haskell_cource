data Expr = Lit Integer | Add Expr Expr

eval :: Expr -> Integer
eval (Lit number) = number
eval (Add expr1 expr2) = eval (expr1) + eval (expr2)

-- eval (Add (Lit 1) (Lit 2)) => 3

printExpr :: Expr -> String
printExpr (Lit number) = show $ number
printExpr (Add expr1 expr2) = printExpr (expr1) ++ " + " ++ printExpr (expr2)

-- printExpr (Add (Lit 1) (Lit 9001)) => "1 + 9001"
-- a1 = Add (Lit 9001) (Lit 1)
-- a2 = Add a1 (Lit 20001)
-- a3 = Add (Lit 1) a2
-- printExpr a3 => "1 + 9001 + 1 + 20001"
