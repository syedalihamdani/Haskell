main=do
-- print(:t 33)
-- print(:t "a")
-- print(: True)
--  how do we write out the type of a function that takes several parameters?
--  Here's a simple function that takes three integers and adds them together:

-- addThree :: Int -> Int -> Int -> Int  
-- addThree x y z = x + y + z 


-- Int stands for integer. It's used for whole numbers. 7 can be an Int but 7.2 cannot. 
-- Int is bounded, which means that it has a minimum and a maximum value. 
-- Usually on 32-bit machines the maximum possible Int is 2147483647 and the minimum is
--  -2147483648.

-- factorial :: Integer -> Integer  
-- factorial n = product [1..n]

-- Integer stands for, er … also integer. The main difference is that it's not bounded so
--  it can be used to represent really really big numbers. 
-- I mean like really big. Int, however, is more efficient.

-- factorial :: Integer -> Integer  
-- factorial n = product [1..n]
-- factorial 50 

-- Float is a real floating point with single precision.
-- circumference :: Float -> Float  
-- circumference r = 2 * pi * 

-- Double is a real floating point with double the precision!
-- circumference' :: Double -> Double  
-- circumference' r = 2 * pi * r

-- circumference' 4.0 

-- Bool is a boolean type. It can have only two values: True and False.

-- Char represents a character. It's denoted by single quotes. A list of characters is a string.

-- Remember fst? It returns the first component of a pair. Let's examine its type.
-- :t fst 