sum'::[Int]->Int
sum' []     = 0
sum' (x:xs) = x + sum xs
main=do
    print(sum' [1,2,3])
    print(sum [1,2,3])
    print(even [1,2,3])
    