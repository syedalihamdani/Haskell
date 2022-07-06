-- Recursion
-- Recursion is actually a way of defining functions in which the function is applied 
-- inside its own definition.

-- Recursion is important to Haskell because unlike imperative languages, 
-- you do computations in Haskell by declaring what something is instead of declaring how 
-- you get it. That's why there are no while loops or for loops in Haskell and instead we 
-- many times have to use recursion to declare what something is.


-- Now let's see how we'd define it recursively. We could first set up an edge condition 
-- and say that the maximum of a singleton list is equal to the only element in it. Then we
--  can say that the maximum of a longer list is the head if the head is bigger than the 
-- maximum of the tail. If the maximum of the tail is bigger, well, then it's the 
-- maximum of the tail. That's it! Now let's implement that in Haskell.

maximum1 []=error "List is empty"
maximum1 [x]=x
maximum1 (x:xs)
     |x> maxTail =x
     |otherwise =maxTail
    where maxTail=maximum1 xs

-- Here's how we could rewrite maximum' by using max:
maximum2 :: (Ord a) => [a] -> a  
maximum2 [] = error "maximum of empty list"  
maximum2 [x] = x  
maximum2 (x:xs) = max x (maximum2 xs)  

replicate' :: (Num i, Ord i) => i -> a -> [a]  
replicate' n x  
    | n <= 0    = []  
    | otherwise = x:replicate' (n-1) x

take' :: (Num i, Ord i) => i -> [a] -> [a]  
take' n _  
    | n <= 0   = []  
take' _ []     = []  
take' n (x:xs) = x : take' (n-1) xs  


reverse' :: [a] -> [a]  
reverse' [] = []  
reverse' (x:xs) = reverse' xs ++ [x]

repeat' :: a -> [a]  
repeat' x = x:repeat' x

zip' :: [a] -> [b] -> [(a,b)]  
zip' _ [] = []  
zip' [] _ = []  
zip' (x:xs) (y:ys) = (x,y):zip' xs ys 


elem' :: (Eq a) => a -> [a] -> Bool  
elem' a [] = False  
elem' a (x:xs)  
    | a == x    = True  
    | otherwise = a `elem'` xs


quicksort :: (Ord a) => [a] -> [a]  
quicksort [] = []  
quicksort (x:xs) =   
    let smallerSorted = quicksort [a | a <- xs, a <= x]  
        biggerSorted = quicksort [a | a <- xs, a > x]  
    in  smallerSorted ++ [x] ++ biggerSorted 


main=do
    print(maximum1 [1,2,3,4])
    print(maximum2 [1,2,3,4])
    print(replicate' 3 5)
    print(take' 2 [2,1])
    print(reverse' [3,2,1])
    -- print(repeat' 1)
    print(zip' [1,2] [2,1])
    print(elem' 3 [4,5,6,7])
    print(quicksort [2,4,1,5,7,3,6])
    print( quicksort "the quick brown fox jumps over the lazy dog")

   