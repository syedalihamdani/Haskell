-- Some higher-orderism is in order
-- Functions can take functions as parameters and also return functions. To illustrate this,
--  we're going to make a function that takes a function and then applies it twice to something!

applyTwice :: (a -> a) -> a -> a  
applyTwice f x = f (f x)  

-- First of all, notice the type declaration. Before, we didn't need parentheses because 
-- -> is naturally right-associative. However, here, they're mandatory. They indicate that
--the first parameter is a function that takes something and returns that same thing. The 
--second parameter is something of that type also and the return value is also of the same
--type. We could read this type declaration in the curried way, but to save ourselves a 
--headache, we'll just say that this function takes two parameters and returns one thing.
--The first parameter is a function (of type a -> a) and the second is that same a. The 
--function can also be Int -> Int or String -> String or whatever. But then, the second 
--parameter to also has to be of that type

-- Note: From now on, we'll say that functions take several parameters despite each 
-- function actually taking only one parameter and returning partially applied functions
--  until we reach a function that returns a solid value. So for simplicity's sake, we'll
--  say that a -> a -> a takes two parameters, even though we know what's really going on 
-- under the hood.

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]  
zipWith' _ [] _ = []  
zipWith' _ _ [] = []  
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys 

flip' :: (a -> b -> c) -> (b -> a -> c)  
flip' f = g  
    where g x y = f y x 


-- map takes a function and a list and applies that function to every element in the list,
--  producing a new list. Let's see what its type signature is and how it's defined.

--  It is GHC base defined 
-- map :: (a -> b) -> [a] -> [b]  
-- map _ [] = []  
-- map f (x:xs) = f x : map f xs 


-- filter is a function that takes a predicate (a predicate is a function that tells whether
--  something is true or not, so in our case, a function that returns a boolean value) and a
--  list and then returns the list of elements that satisfy the predicate. The type signature
--  and implementation go like this:
-- filter :: (a -> Bool) -> [a] -> [a]  
-- filter _ [] = []  
-- filter p (x:xs)   
--     | p x       = x : filter p xs  
--     | otherwise = filter p xs
-- takeWhile function. It takes a predicate and a list and then goes from the beginning of 
-- the list and returns its elements while the predicate holds true. Once an element is 
-- found for which the predicate doesn't hold, it stops. If we wanted to get the first word
--  of the string "elephants know how to party", we could do takeWhile (/=' ') "elephants 
-- know how to party" and it would return "elephants". Okay. The sum of all odd squares that
--  are smaller than 10,000. First, we'll begin by mapping the (^2) function to the infinite
--  list [1..]. Then we filter them so we only get the odd ones. And then, we'll take elements from that list while they are smaller than 10,000. Finally, we'll get the sum of that list. We don't even have to define a function for that, we can do it in one line in GHCI:

-- this is also called down

 

-- Now what we want to know is this: for all starting numbers between 1 and 100, how many 
-- chains have a length greater than 15? First off, we'll write a function that produces a chain:
chain :: (Integral a) => a -> [a]  
chain 1 = [1]  
chain n  
    | even n =  n:chain (n `div` 2)  
    | odd n  =  n:chain (n*3 + 1)

-- Lambdas
-- Lambdas are basically anonymous functions that are used because we need some functions
--  only once. Normally, we make a lambda with the sole purpose of passing it to a higher-order
--  function. To make a lambda, we write a \ (because it kind of looks like the greek letter
--  lambda if you squint hard enough) and then we write the parameters, separated by spaces.
--  After that comes a -> and then the function body. We usually surround them by parentheses,
--  because otherwise they extend all the way to the right.

-- numLongChains :: Int  
-- numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))

--  zipWith (\a b -> (a * 30 + 3) / b) [5,4,3,2,1] [1,2,3,4,5]
-- map (\(a,b) -> a + b) [(1,2),(3,5),(6,3),(2,6),(2,5)]  
  
-- addThree :: (Num a) => a -> a -> a -> a  
-- addThree x y z = x + y + z
-- addThree :: (Num a) => a -> a -> a -> a  
-- addThree = \x -> \y -> \z -> x + y + z
-- flip' :: (a -> b -> c) -> b -> a -> c  
-- flip' f = \x y -> f y x 

-- Only folds and horses
-- Back when we were dealing with recursion, we noticed a theme throughout many of the
--  recursive functions that operated on lists. Usually, we'd have an edge case for the 
-- empty list. We'd introduce the x:xs pattern and then we'd do some action that involves
--  a single element and the rest of the list. It turns out this is a very common pattern, 
-- so a couple of very useful functions were introduced to encapsulate it. These functions 
-- are called folds. They're sort of like the map function, only they reduce the list to some
--  single value.

--  foldl function, also called the left fold. It folds the list up from the left side.
--  The binary function is applied between the starting value and the head of the list.
--  That produces a new accumulator value and the binary function is called with that value
--  and the next element, etc.
-- Let's implement sum again, only this time, we'll use a fold instead of explicit recursion.
sum' :: (Num a) => [a] -> a  
sum' xs = foldl (\acc x -> acc + x) 0 xs


-- The foldl1 and foldr1 functions work much like foldl and foldr, only you don't need to 
-- provide them with an explicit starting value. They assume the first (or last) element of
--  the list to be the starting value and then start the fold with the element next to it. 
-- With that in mind, the sum function can be implemented like so: sum = foldl1 (+). Because
--  they depend on the lists they fold up having at least one element, they cause runtime 
-- errors if called with empty lists. foldl and foldr, on the other hand, work fine with 
-- empty lists. When making a fold, think about how it acts on an empty list. If the function
--  doesn't make sense when given an empty list, you can probably use a foldl1 or foldr1 to 
-- implement it.

-- Just to show you how powerful folds are, we're going to implement a bunch of standard 
-- library functions by using folds:
maximum' :: (Ord a) => [a] -> a  
maximum' = foldr1 (\x acc -> if x > acc then x else acc)  
  
-- reverse' :: [a] -> [a]  
-- reverse' = foldl (\acc x -> x : acc) []  
  
-- product' :: (Num a) => [a] -> a  
-- product' = foldr1 (*)  
  
-- filter' :: (a -> Bool) -> [a] -> [a]  
-- filter' p = foldr (\x acc -> if p x then x : acc else acc) []  
  
-- head' :: [a] -> a  
-- head' = foldr1 (\x _ -> x)  
  
-- last' :: [a] -> a  
-- last' = foldl1 (\_ x -> x)  


-- scanl and scanr are like foldl and foldr, only they report all the intermediate 
-- accumulator states in the form of a list. There are also scanl1 and scanr1, which are 
-- analogous to foldl1 and foldr1.

-- These are tested down

--   scanl (+) 0 [3,5,2,1]  
   
--   scanr (+) 0 [3,5,2,1]  
   
--   scanl1 (\acc x -> if x > acc then x else acc) [3,4,5,3,7,9,2,1]  
   
--   scanl (flip (:)) [] [3,2,1]

sqrtSums :: Int  
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1 
  
--   Tested down
--   sqrtSums  
   
--   sum (map sqrt [1..131])  
   
--   sum (map sqrt [1..130])


-- Function composition

-- In mathematics, function composition is defined like this:  (f . g)(x) = f(g(x)), 
-- meaning that composing two functions produces a new function that, when called with a
--  parameter, say, x is the equivalent of calling g with the parameter x and then calling
--  the f with that result.

-- In Haskell, function composition is pretty much the same thing. We do function composition
--  with the . function, which is defined like so:

-- add' :: [Int]->Int
-- add' []=0
-- add' (x:xs)=x + add' xs

add' :: [Int]->Int
add' xs= foldl (\acc x -> acc + x) 0 xs
 
   

main=do
     -- The lines blow works on the terminal
      print(add' [1,2])
    print(applyTwice (+3) 10)
    print(applyTwice (++ " HAHA") "HEY" )
    print(applyTwice (3:) [1] )
    print(zipWith' (+) [4,2,5,6] [2,6,2,3] )
    print(zipWith' max [6,3,2,1] [7,3,1,5])  
    print(zipWith' (++) ["foo ", "bar ", "baz "] ["fighters", "hoppers", "aldrin"])  
    print(zipWith' (*) (replicate 5 2) [1..])  
    print(zipWith' (zipWith' (*)) [[1,2,3],[3,5,6],[2,3,4]] [[3,2,2],[3,4,5],[5,4,3]])  
    print(flip' zip [1,2,3,4,5] "hello")    
    print(zipWith (flip' div) [2,2..] [10,8,6,4,2])


    -- print(map (+3) [1,5,3,1,6])  
    -- print(map (++ "!") ["BIFF", "BANG", "POW"])  
    -- print(map (replicate 3) [3..6])  
    -- print(map (map (^2)) [[1,2],[3,4,5,6],[7,8]])  
    -- print(map fst [(1,2),(3,5),(6,3),(2,6),(2,5)])
    -- print(filter (>3) [1,5,3,2,1,6,4,3,2,1])  
    -- print(filter (==3) [1,2,3,4,5])  
    -- print(filter even [1..10])  
    -- print(let notNull x = not (null x) in filter notNull [[1,2,3],[],[3,4,5],[2,2],[],[],[]]) 
    -- print(filter (`elem` ['a'..'z']) "u LaUgH aT mE BeCaUsE I aM diFfeRent")  
    -- print(filter (`elem` ['A'..'Z']) "i lauGh At You BecAuse u r aLL the Same")
    print(sum (takeWhile (<10000) (filter odd (map (^2) [1..]))))
    print(sum (takeWhile (<10000) [n^2 | n <- [1..], odd (n^2)]))
    print(chain 10)
    print(chain 1)
    print(chain 30)

    print (zipWith (\a b -> (a * 30 + 3) / b) [5,4,3,2,1] [1,2,3,4,5])
    print (map (\(a,b) -> a + b) [(1,2),(3,5),(6,3),(2,6),(2,5)] )

    print (sum' [3,5,2,1] )


    print(scanl (+) 0 [3,5,2,1] ) 
   
    print(scanr (+) 0 [3,5,2,1])  
   
    print(scanl1 (\acc x -> if x > acc then x else acc) [3,4,5,3,7,9,2,1])  
   
    print(scanl (flip (:)) [] [3,2,1])

    print(sqrtSums)  
   
    print(sum (map sqrt [1..131]))  
   
    print(sum (map sqrt [1..130])) 

 



