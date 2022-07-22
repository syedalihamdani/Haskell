-- (*) Truth tables for logical expressions (2).

-- Continue problem P46 by defining and/2, or/2, etc as being operators. This allows to write
--  the logical expression in the more natural way, as in the example: A and (A or not B).
--  Define operator precedence as usual; i.e. as in Java.

-- Example:

-- * (table A B (A and (A or not B)))
-- true true true
-- true fail true
-- fail true fail
-- fail fail fail
-- Example in Haskell:

-- λ> table2 (\a b -> a `and'` (a `or'` not b))
-- True True True
-- True False True
-- False True False
-- False False False

import Data.List

not' :: Bool -> Boold
not' True  = False
not' False = True
 
and' :: Bool -> Bool -> Bool
and' True True = True
and' _    _    = False

or' :: Bool -> Bool -> Bool
or' False False = False
or' _     _     = True

nand' :: Bool -> Bool -> Bool
nand' a b = not' $ and' a b

nor' :: Bool -> Bool -> Bool
nor'  a b = not' $ or'  a b

impl' :: Bool -> Bool -> Bool
impl' a b = (not' a) `or'` b

equ' :: Bool -> Bool -> Bool
equ' True  True  = True
equ' False False = True
equ' _     _     = False

xor' :: Bool -> Bool -> Bool
xor' True  False = True
xor' False True  = True
xor' _     _     = False


infixl 4 `or'`    -- infixl 6 - tell us that - has left associativity, which means that           
infixl 6 `and'`   -- 1 - 2 - 3 - 4 gets parsed as ((1 -2) -3) -4

table2 :: (Bool -> Bool -> Bool) -> IO ()
table2 f = putStrLn $ concatMap (++ "\n" )
          [show a ++ " " ++ show b ++ " " ++ show (f a b)
          | a <- [True, False], b <- [True, False] ]

 

 
main =do
    table2 (\a b -> a `and'` (a `or'` not b))

{- infixl 6 - tell us that - has left associativity, which means that 1 - 2 - 3 - 4 
gets parsed as ((1 -2) -3) -4

The number that follows the associativity information describes in what order the operators
are applied. It must always be between 0 and 9 inclusive. This is commonly referred to as 
how tightly the operator binds. For example, consider the following fixity declarations 
(in base)
infixl 6 +
infixl 7 *
-}