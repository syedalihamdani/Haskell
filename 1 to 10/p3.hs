-- (*) Find the K'th element of a list. The first element in the list is number 1.

 
-- Example in Haskell:
-- λ> elementAt [1,2,3] 2
-- 2
-- λ> elementAt "haskell" 5
-- 'e'

elementAt :: [a] -> Int -> a
elementAt list i    = list !! (i-1)

main=do
    print(elementAt [1,2,3] 2)
    print(elementAt "haskell" 5)
