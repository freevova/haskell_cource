Parenthesization:
1. 2 + 2 * 3 - 1     == 2 + (2 * 3) - 1
2. (^) 10 $ 1 + 1    == (1 + 1) ^ 2
3. 2 ^ 2 * 4 ^ 5 + 1 == (2 ^ 2) * (4 ^ 5) + 1

More fun with functions:
waxOn = x * 5
  where z = 7
        y = z + 8
        x = y ^ 2

triple x = x * 3
waxOff x = triple x
