-- Exercise 1
-- Create a function which reverse the list
rev1 :: [a] -> [a]
rev1 = foldl (\acc x -> x : acc) []

-- rev2 :: [a] -> [a]
-- rev2 = foldr (\acc x->x :acc) []

-- Exercise 2
-- Create a function prefixes that returns all the prefixes of a given list
prefixes :: [a] -> [[a]]
prefixes = foldr (\x acc -> [x] : (map ((:) x) acc)) []

main=do
    print(rev1 [1,2,3])
    -- print(rev2 [1,2,3])
    print(prefixes [1,2,3])