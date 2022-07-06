doubleMe x =print(x+x)
doubleUs x y=print(x*2+y*2)
doubleSmallNumer x=print(if x>100
    then x
    else x*2)
doubleSmallNumber' x =print( (if x > 100 then x else x*2) + 1)
-- boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x] 
main=do
    let a=succ 9 + max 5 4 + 1 
    print(a) 
    let b=(succ 9) + (max 5 4) + 1  
    print(b);

    doubleMe 3
    doubleUs 2 3
    doubleSmallNumer 10
    doubleSmallNumber' 10
    let conanO'Brien = "It's a-me, Conan O'Brien!"  
    putStrLn(conanO'Brien)
    let lostNumbers = [4,8,15,16,23,42] 
    print(lostNumbers)
    let list1=[1,2,3,4]
    let list2=[9,10,11,12]
    print(list1++list2) 
    -- strings are just lists of characters. "hello" is just syntactic sugar for ['h','e','l','l','o'].
    --  Because strings are lists, we can use list functions on them, which is really handy.
    putStrLn( "hello" ++ " " ++ "world")
    
    -- Can put only one element or one spell
    --  putting something at the beginning of a
    --   list using the : operator (also called the cons operator) is instantaneous.
    putStrLn('A':" SMALL CAT")
    print(5:[1,2,3,4,5]) 

    -- If you want to get an element out of a list by index, use !!. The indices start at 0.
    let elementOut="Steve Buscemi" !! 6  
    print(elementOut)
    let elementOut2 =[9.4,33.2,96.2,11.2,23.25] !! 1
    print(elementOut2)
    -- Lists can be compared if the stuff they contain can be compared. When using <, <=, > and >= to
    -- compare lists, they are compared in lexicographical order. First the heads are 
    -- compared. If they are equal then the second elements are compared, etc.
    print([3,2,1] > [2,1,0]) 
    print([3,2,1] > [5,1,0])
    print([3,2,1] > [2,10,100])
    print([3,4,2] > [3,4])
    print([3,4,2] > [3,4])
    print([3,4,2] == [3,4,2])

    -- head takes a list and returns its head.
    --  The head of a list is basically its first element.
    print(head [5,4,3,2,1])  
    -- tail takes a list and returns its tail. In other words, it chops off a list's head.
    print(tail [5,4,3,2,1] )
    -- last takes a list and returns its last element.
    print(last [5,4,3,2,1] )
    -- init takes a list and returns everything except its last element.
    print(init [5,4,3,2,1])
    -- length takes a list and returns its length, obviously.
    print(length [3,5,6,2])
    -- null checks if a list is empty. If it is, it returns True, otherwise it returns False.
    -- Use this function instead of xs == [] (if you have a list called xs)
    print(null [1,2,3] )
    print(null []) 
    -- reverse reverses a list.
    print(reverse [1,2,3,4,5])
    -- take takes number and a list. 
    -- It extracts that many elements from the beginning of the list. Watch
    print(take 3 [5,4,3,2,1])
    print(take 1 [5,4,3,2,1])
    print(take 2 [5,4,3,2,1])
    print(take 0 [5,4,3,2,1])
    -- drop works in a similar way, 
    -- only it drops the number of elements from the beginning of a list.
    print( drop 3 [8,4,2,1,5,6])  
    print(drop 0 [1,2,3,4] ) 
    print(drop 100 [1,2,3,4])  
    -- maximum takes a list of stuff that 
    -- can be put in some kind of order and returns the biggest element.
    print(maximum [1,9,2,3,4])
    -- minimum returns the smallest.
    print(minimum [8,4,2,1,5,6])
    -- sum takes a list of numbers and returns their sum.
    print(sum [5,2,1,6,3,2,5,7])
    -- product takes a list of numbers and returns their product.
    print( product [6,2,1,2])
    print( product [6,2,1,2,0])
    -- elem takes a thing and a list of things and tells us if that thing is an element of the list.
    --  It's usually called as an infix function because it's easier to read that way.
    print( 4 `elem` [3,4,5,6] )
    print(10 `elem` [3,4,5,6] )

    -- Texas ranges
    -- To make a list containing all the natural numbers from 1 to 20, you just write [1..20].

    print([1..20])
    print(['a'..'z'])
    -- Ranges are cool because you can also specify a step. What if we want all even numbers
    --  between 1 and 20? Or every third number between 1 and 20?
    print([2,4..20] )
    print([3,6..20])
    print([0.1, 0.3 .. 1])
    print(take 24 [13,26..])
    -- cycle takes a list and cycles it into an infinite list. If you just try to display the result,
    -- it will go on forever so you have to slice it off somewhere.
    print(take 10 (cycle [1,2,3]))
    print(take 12 (cycle "LOL ") )
    -- repeat takes an element and produces an infinite list of just that element. 
    -- It's like cycling a list with only one element.
    print(take 10 (repeat 5))
    -- Although it's simpler to just use the replicate function 
    -- if you want some number of the same element in a list.
        -- comprehension
        -- A basic comprehension for a set that contains the first ten even natural numbers
        --  is set notation. The part before the pipe is called the output function, x is 
        -- the variable, N is the input set and x <= 10 is the predicate. That means that
        --  the set contains the doubles of all natural numbers that satisfy the predicate
        --  The list comprehension we could use is [x*2 | x <- [1..10]]. x is drawn from [1..10] and for every element in [1..10] (which we have bound to x), 
        -- we get that element, only doubled. Here's that comprehension in action.
    print([x*2 | x <- [1..10]])
        -- As you can see, we get the desired results. Now let's add a condition (or a predicate) to that comprehension. Predicates go after the binding parts and are separated from them by a comma.
        -- Let's say we want only the elements which, doubled, are greater than or equal to 12
    print([x*2 | x <- [1..10], x*2 >= 12])
        -- Cool, it works. How about if we wanted all numbers from 50 to 100 
        -- whose remainder when divided with the number 7 is 3? Easy.
    print([ x | x <- [50..100], x `mod` 7 == 3])

        -- Success! Note that weeding out lists by predicates is also called filtering.
        --  We took a list of numbers and we filtered them by the predicate. Now for another
        --   example. Let's say we want a comprehension that replaces each odd number greater 
        --   than 10 with "BANG!" and each odd number that's less than 10 with "BOOM!".
        --    If a number isn't odd, we throw it out of our list. For convenience, 
        -- we'll put that comprehension inside a function so we can easily reuse it.
          
        -- print(boomBangs [5..11])

    print( [ x*y | x <- [2,5,10], y <- [8,10,11]])
    print([ x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50])

    let nouns = ["hobo","frog","pope"]
    let adjectives = ["lazy","grouchy","scheming"] 
    print([adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns])
    let xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]
    print([ [ x | x <- xs, even x ] | xs <- xxs]) 

    let tup=[(1,2),(8,11),(4,5)]
    print(tup)
    print(tup!!0)
    print(tup)


    -- snd takes a pair and returns its second component. Surprise!
    print(snd (8,11))
    print(snd ("Wow", False))

    -- fst takes a pair and returns its first component. Surprise!
    print(fst (8,11))
    print(fst ("Wow", False))

    -- A cool function that produces a list of pairs: zip. It takes two lists and then zips
    --  them together into one list by joining the matching elements into pairs. It's a 
    -- really simple function but it has loads of uses. It's especially useful for when
    --  you want to combine two lists in a way or traverse two lists simultaneously.
    --  Here's a demonstration.
    print(zip [1,2,3,4,5] [5,5,5,5,5])
    print(zip [1 .. 5] ["one", "two", "three", "four", "five"] )
    print(zip [1..] ["apple", "orange", "cherry", "mango"])
