{- Functional programing language language is start with a concipt that a program is 
function. Functions transform inputs to outputs.
  Program: rules to produce output from input
  Computation: processs of applying the rules -}



{-

                           Building up programs ...

How do we describe the rules?
1. Start with built in functions
2. Use these to build more complex functions

Suppose we start with whole numbers, {0,1,2,3, ...}
 and the successor function, succ , which is +1 functon

succ 0 = 1
succ 1 = 2
succ 2 = 3

We can compose succ twice to build a new function

plusTwo n = succ (succ n)

we can get plusThree by using plusTwo

plusThree n = succ (plusTwo n)

How do we define plus?
plus n m means apply succ to n, m times
Again note: plus n m, not plus(n,m)

plus n 1 = succ n
plus n 2 = succ (plus n 1) = succ (succ n)
...
plus n i = succ(succ(...(succ n)...)) / i times

-}

-- This led us to Inductive or recursive definitions

{-                        Inductive/recursive definitions

Inductive definition is one where we specify the base case and then we specify the value for
larger argurment in terms of smaller argument.

So, we know that when we add 0 to the n it is done nothing so 0 is the base case.
plus n 0 = n, for every n
plus n 1 = succ n = succ (plus n 0)

Assume we know how to cumpute plus n m
Then, plus n (succ m) is succ (plus n m)

Unravel the definition

puls 7 3
= plus 7 (succ 2)
= succ (plus 7 2)
= succ (plus 7 (succ 1))
= succ (succ (plus 7 1))
= succ (succ (plus 7 (succ 0)))
= succ (succ (succ (plus 7 0)))
= succ (succ (succ 7 ))

another recursively define function

Multiplication is repeated addition

mult n m means apply plus n, m times
mult n 0 = n, for every n
    defining next line       now n . (m + 1) = n + (n.m)
mult n (succ m) = plus n (mult n m)
-}

{-
                                Summary
Functional programs are rules describing how outputs derived from inputs

Basic operation is function composition

Recursive definitions allow repeated function composition, depending on the input
-}
main=do
    print(succ 0 = 1)
    print(succ 1 = 2)
    print(succ 2 = 3)