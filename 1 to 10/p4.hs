-- (*) Find the number of elements of a list.

-- Example in Haskell:

-- λ> myLength [123, 456, 789]
-- 3
-- λ> myLength "Hello, world!"
-- 13

myLength :: [a] -> Int
myLength (xs) = length xs
main= do
    print(myLength [123, 456, 789])
    print(myLength "Hello, world!")