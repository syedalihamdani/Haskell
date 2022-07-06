-- Currying


-- f::a -> b -> c -> d
-- We can rewrite like this
-- f::a-> (b -> (c -> d))

add::Int -> Int -> Int
-- add x y =x+y

-- add x =(\y -> x+y)

add = (\x -> (\y -> x+y))  -- All 3 way are the same

 

main=do
    print(add 2 4)