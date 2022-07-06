-- 1 exercise
-- find if the element is present inside the list
-- elem'::(Eq a)=>a->[a]->Bool
-- elem' _ [] = False
-- elem' a (x:xs)= a==x || elem' a xs 


-- 2 exercise
-- Remove the element which is double inside the list
-- nub'::(Eq a)=>[a]->[a]
-- nub' []=[]
-- nub' (x:xs)
--  | x `elem` xs =nub' xs
--  | otherwise = x: nub' xs


-- 3 exercise
-- Create a function isAcc that returns True if a list is given to it is a list of accending
-- order

-- isAcc::[Int]->Bool
-- isAcc []= True
-- isAcc [x]=True
-- isAcc (x:y:xs) = x <= y && isAcc xs


-- 4 exercise
-- Create a function hasPath that determins if a path from one node to another exists within
-- a directed graph
hasPath:: [(Int,Int)]->Int->Int->Bool
hasPath [] x y = x==y
hasPath xs x y
 | x==y =True
 | otherwise =
    let xs'=[(n,m) | (n,m) <- xs ,n/= x] in
        or [hasPath xs' m y | (n,m) <- xs, n==m ]
main=do
    -- 1 exercise
    -- print(elem' 3 [1,2,3])
    
    
    -- 2 exercise
    -- print(nub' [1,2,3,4,3,1])

    -- 3 exercise
    -- print(isAcc [1,2,3,4])
    -- print(isAcc[4,3,2,1])


    -- 4 exercise
    -- Node path 1 ->2-> <-3<-4->5
    print(hasPath [(1,2),(2,3),(3,2),(4,3),(4,5)] 1 2)
