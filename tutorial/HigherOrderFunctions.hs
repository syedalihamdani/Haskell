-- Syntax
app::(a->b)->a->b
app f x=f x

-- Example
add1::Int ->Int
add1 x=x+1

-- Anonymous Function is a function that does not have the name when defining the function
-- (\x ->x+1)
-- (\x y z -> x+y+z) 1 2 3

 
main=do
    print(app add1 1)
    -- using the anonymous function
    -- print(app (\1))  -- some error
    -- prit(map (+3) [1,3,5])
