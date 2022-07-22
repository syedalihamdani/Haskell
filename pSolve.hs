
-- Given a list of integers, find a correct way of inserting arithmetic signs (operators)
--  such that the result is a correct equation.Example:With the list numbers [2,3,5,7,11]
-- we can form the equations 2-3+5+7=11 or 2 = (3*5+7)/11

-- The other two solutions alluded to in the problem description are dropped by the haskell
--  solution as trivial variants

main=do
    print(2 == 3-(5+7-11))
    print(2 == 3-5-(7-11))
    print(2 == 3-(5+7)+11)
    print(2 ==3 -5-7+11)
    print(2*(3-5) == 7-11)
    print(2-3+5+7==11)
    print(2 == (3*5+7)/11)
    print(2-(3-(5+7)) == 11)
    print(2-(3-5-7) ==11)
    print(2-(3-5)+7==11)
    print(2-3+5+7 ==11)
    print(2-(3-5)+7 == 11)
    print(2-3+5+7 == 11)
    print(2 ==3-(5+(7-11)))
    print(2-3+(5+7)==11)