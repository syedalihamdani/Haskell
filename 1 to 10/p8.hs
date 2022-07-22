-- (**) Eliminate consecutive duplicates of list elements.

-- If a list contains repeated elements they should be replaced with a single copy of the 
-- element. The order of the elements should not be changed.

 
-- Example in Haskell:

-- λ> compress "aaaabccaadeeee"
-- "abcade"

compress ::(Eq a) => [a] -> [a]
compress [] = []
compress (x:xs) = x: (compress (remove x xs))
    where
        remove :: (Eq a) => a -> [a] -> [a]
        remove x [] = []
        remove x (y:ys)
         | x == y    = remove x ys
         | otherwise = y:(remove x ys) 

main=do
    print(compress "aaaabccaadeeee")
    
