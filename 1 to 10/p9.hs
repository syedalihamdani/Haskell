-- (**) Pack consecutive duplicates of list elements into sublists. If a list contains repeated 
-- elements they should be placed in separate sublists.

-- Example:

-- * (pack '(a a a a b c c a a d e e e e))
-- ((A A A A) (B) (C C) (A A) (D) (E E E E))
-- Example in Haskell:

-- λ> pack ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 
            --  'a', 'd', 'e', 'e', 'e', 'e']
-- ["aaaa","b","cc","aa","d","eeee"]

--  First method

-- pack :: Eq a => [a] -> [[a]]
-- pack [] = []
-- pack (x:xs) = (x:first) : pack rest
--         where
--             getReps [] = ([], [])
--             getReps (y:ys)
--                     | y == x = let (f,r) = getReps ys in (y:f,r)
--                     | otherwise = ([], (y:ys)) 
--             (first,rest) = getReps xs

-- Second method
import Data.List
pack :: (Eq a) => [a] -> [[a]]
pack xs = group xs
main=do
    print(pack ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a','a', 'd', 'e', 'e', 'e', 'e'])
