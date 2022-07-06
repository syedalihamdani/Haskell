-- Higher order functions
-- Haskell functions can take functions as parameters and return functions as return values.
-- A function that does either of those is called a higher order function.

-- Curried functions
-- Every function in Haskell officially only takes one parameter. So how is it possible that 
-- we defined and used several functions that take more than one parameter so far? Well, it's 
-- a clever trick! All the functions that accepted several parameters so far have been curried
-- functions.

-- Putting a space between two things is simply function application. The space is sort of 
-- like an operator and it has the highest precedence. Let's examine the type of max. It's 
-- max :: (Ord a) => a -> a -> a. That can also be written as max :: (Ord a) => a -> (a -> 
-- a). That could be read as: max takes an a and returns (that's the ->) a function that 
-- takes an a and returns an a. That's why the return type and the parameters of functions 
-- are all simply separated with arrows.

multThree :: (Num a) => a -> a -> a -> a  
multThree x y z = x * y * z 

compareWithHundred1 :: (Num a, Ord a) => a -> Ordering  
compareWithHundred1 x = compare 100 x 
-- We can rewrite this as:
compareWithHundred2 :: (Num a, Ord a) => a -> Ordering  
compareWithHundred2 = compare 100  

divideByTen :: (Floating a) => a -> a  
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool  
isUpperAlphanum = (`elem` ['A'..'Z'])
 

 

 

main=do
     print(max 4 5) 
     print((max 4) 5)
     print( multThree 1 2 3)

     let multTwoWithNine = multThree 9
     let multWithEighteen = multTwoWithNine 2
     print(multTwoWithNine 2 3)
     print(multWithEighteen 10)
     print(compareWithHundred1 4)
     print(compareWithHundred2 4)
     print(divideByTen 20)

     print(isUpperAlphanum 'a')