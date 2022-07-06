-- Loading modules

import Data.List 
 
  
numUniques :: (Eq a) => [a] -> Int  
numUniques = length . nub 

-- Loading module into the ghci
-- ghci> :m + Data.List
-- ghci> :m + Data.List Data.Map Data.Set

-- f you just need a couple of functions from a module, you can selectively import just
--  those functions. If we wanted to import only the nub and sort functions from Data.List,
--  we'd do this:

-- import Data.List (nub, sort)
-- You can also choose to import all of the functions of a module except a few select ones
-- import Data.List hiding (nub) 

-- Another way of dealing with name clashes is to do qualified imports.
--  The Data.Map module, which offers a data structure for looking up values by key,
--  exports a bunch of functions with the same name as Prelude functions, like filter or
--  null. So when we import Data.Map and then call filter, Haskell won't know which function
--  to use. Here's how we solve this:

-- import qualified Data.Map 

-- import qualified Data.Map as M 

-- Now, to reference Data.Map's filter function, we just use M.filter.


-- Data.List
-- The Data.List module is all about lists, obviously. It provides some very useful
--  functions for dealing with them.

main=do
    -- intersperse takes an element and a list and then puts that element in between each pair
    --  of elements in the list. Here's a demonstration:
    print(intersperse '.' "MONKEY" )
    print(intersperse 0 [1,2,3,4,5,6]) 
    -- intercalate takes a list of lists and a list. It then inserts that list in between
    --  all those lists and then flattens the result.
    print(intercalate " " ["hey","there","guys"])
    print(intercalate [0,0,0] [[1,2,3],[4,5,6],[7,8,9]])

    -- transpose transposes a list of lists. If you look at a list of lists as a 2D matrix,
    --  the columns become the rows and vice versa.
    print(transpose [[1,2,3],[4,5,6],[7,8,9]])
    print(transpose ["hey","there","guys"])
    print(map sum $ transpose [[0,3,5,9],[10,0,0,9],[8,5,1,-1]])

    -- concat flattens a list of lists into just a list of elements.
    print(concat ["foo","bar","car"] )
    print(concat [[3,4,5],[2,3,4],[2,1,1]])

    -- Doing concatMap is the same as first mapping a function to a list and then 
    -- concatenating the list with concat.
    print(concatMap (replicate 4) [1..3])
    -- and takes a list of boolean values and returns True only if all the values in the
    --  list are True
    print(and $ map (>4) [5,6,7,8])
    print(and $ map (==4) [4,4,4,3,4])
    -- r is like and, only it returns True if any of the boolean values in a list is True.
    print(or $ map (==4) [2,3,4,5,6,1])
    print(or $ map (>4) [1,2,3])
    -- any and all take a predicate and then check if any or all the elements in a list 
    -- satisfy the predicate, respectively. Usually we use these two functions instead of
    --  mapping over a list and then doing and or or.
    print(any (==4) [2,3,5,6,1,4])
    print( all (>4) [6,9,10])
    print(all (`elem` ['A'..'Z']) "HEYGUYSwhatsup")
    print(any (`elem` ['A'..'Z']) "HEYGUYSwhatsup")
    -- iterate takes a function and a starting value. It applies the function to the 
    -- starting value, then it applies that function to the result, then it applies the 
    -- function to that result again, etc. It returns all the results in the form of an 
    -- infinite list.
    print(take 10 $ iterate (*2) 1)
    print(take 3 $ iterate (++ "haha") "haha")
    -- splitAt takes a number and a list. It then splits the list at that many elements,
    -- returning the resulting two lists in a tuple.
    print(splitAt 3 "heyman")
    print(splitAt 100 "heyman")
    print(splitAt (-3) "heyman")
    print(let (a,b) = splitAt 3 "foobar" in b ++ a)
    -- takeWhile is a really useful little function. It takes elements from a list while 
    -- the predicate holds and then when an element is encountered that doesn't satisfy 
    -- the predicate, it's cut off. It turns out this is very useful.
    print(takeWhile (>3) [6,5,4,3,2,1,2,3,4,5,4,3,2,1])
    print(takeWhile (/=' ') "This is a sentence")
    print(sum $ takeWhile (<10000) $ map (^3) [1..])

    -- dropWhile is similar, only it drops all the elements while the predicate is true. 
    -- Once predicate equates to False, it returns the rest of the list. An extremely 
    -- useful and lovely function!
    print(dropWhile (/=' ') "This is a sentence")
    print(dropWhile (<3) [1,2,2,2,3,4,5,4,3,2,1])
    -- span is kind of like takeWhile, only it returns a pair of lists. The first list 
    -- contains everything the resulting list from takeWhile would contain if it were 
    -- called with the same predicate and the same list. The second list contains the part
    --  of the list that would have been dropped
    print(let (fw, rest) = span (/=' ') "This is a sentence" in "First word:" ++ fw ++ ", the rest:" ++ rest  )
    -- Whereas span spans the list while the predicate is true, break breaks it when the 
    -- predicate is first true. Doing break p is the equivalent of doing span (not . p).
    print(break (==4) [1,2,3,4,5,6,7] )
    print(span (/=4) [1,2,3,4,5,6,7])
    -- sort simply sorts a list. The type of the elements in the list has to be part of the Ord typeclass,
    --  because if the elements of a list can't be put in some kind of order, then the list
    --  can't be sorted.
    print(sort [8,5,3,2,1,6,4,2])
    print(sort "This will be sorted soon")
    -- import Data.Char
    -- Rest module of data.list can be from the library
    