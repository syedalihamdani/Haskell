-- Pattern matching
-- This chapter will cover some of Haskell's cool syntactic constructs and we'll start with
--  pattern matching. Pattern matching consists of specifying patterns to which some data 
-- should conform and then checking to see if it does and deconstructing the data according
--  to those patterns.

-- When defining functions, you can define separate function bodies for different patterns.
--  This leads to really neat code that's simple and readable. You can pattern match on any
--  data type — numbers, characters, lists, tuples, etc. Let's make a really trivial function
--  that checks if the number we supplied to it is a seven or not.

lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're out of luck, pal!"

sayMe 1 = "One!"  
sayMe 2 = "Two!"  
sayMe 3 = "Three!"  
sayMe 4 = "Four!"  
sayMe 5 = "Five!"  
sayMe x = "Not between 1 and 5" 

factorial 0 = 1  
factorial n = n * factorial (n - 1)  

charName 'a' = "Albert"  
charName 'b' = "Broseph"  
charName 'c' = "Cecil"

-- addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

tell1 [] = "The list is empty"  
tell2 (x:[]) = "The list has one element: " ++ show x  
tell3 (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y 
-- _ sign means list with elements that we don't care
tell4 (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y


length' [] = 0 ;length' (_:xs) = 1 + length' xs

sum' [] = 0;sum' (x:xs) = x + sum' xs


-- capital "" = "Empty string, whoops!"
-- capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

-- second all@(x:y:xs) = "The second letter of " ++ all ++ " is " ++ [y] 





-- Guards, guards!
-- Whereas patterns are a way of making sure a value conforms to some form and deconstructing
--  it, guards are a way of testing whether some property of a value (or several of them) 
-- are true or false. That sounds a lot like an if statement and it's very similar. The 
-- thing is that guards are a lot more readable when you have several conditions and they
--  play really nicely with patterns.

-- Instead of explaining their syntax, let's just dive in and make a function using guards.
--  We're going to make a simple function that berates you differently depending on your 
-- BMI (body mass index). Your BMI equals your weight divided by your height squared. If 
-- your BMI is less than 18.5, you're considered underweight. If it's anywhere from 18.5 to
--  25 then you're considered normal. 25 to 30 is overweight and more than 30 is obese. 
-- So here's the function (we won't be calculating it right now, this function just gets a 
-- BMI and tells you off)

bmiTell bmi  
    | bmi <= 18.5 = "You're underweight, you emo, you!"  
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise   = "You're a whale, congratulations!" 


bmiTell2 weight height  
    | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"  
    | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise                 = "You're a whale, congratulations!"  

-- max' a b
--   |a>b =a 
--   |otherwise =b
--   another way of writting this function

max' a b|a>b =a|otherwise =b

a `myCompare` b  
    | a > b     = GT  
    | a == b    = EQ  
    | otherwise =  LT

bmiTell3 weight height  
    | bmi <= 18.5 = "You're underweight, you emo, you!"  
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise   = "You're a whale, congratulations!"  
    where bmi=weight/height ^2

bmiTell4 weight height  
    | bmi <= skinny = "You're underweight, you emo, you!"  
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"  
    | otherwise     = "You're a whale, congratulations!"  
    where bmi = weight / height ^ 2  
          skinny = 18.5  
          normal = 25.0  
          fat = 30.0  

-- initials firstname lastname = [f] ++ ". " ++ [l] ++ "."  
--     where (f:_) = firstname  
--           (l:_) = lastname

initials firstname middlename lastname=[f] ++ ". "++ [m] ++ ". "++[l]
      where (f:_)=firstname
            (m:_)=middlename
            (l:_)=lastname

calcBmis xs = [bmi w h | (w, h) <- xs]  
        where bmi weight height = weight / height ^ 2



cylinder r h = 
    let sideArea = 2 * pi * r * h  
        topArea = pi * r ^2  
    in  sideArea + 2 * topArea  

-- Case expressions
-- Many imperative languages (C, C++, Java, etc.) have case syntax and if you've ever
-- programmed in them, you probably know what it's about. It's about taking a variable and
-- then executing blocks of code for specific values of that variable and then maybe including
--  a catch-all block of code in case the variable has some value for which we didn't set 
-- up a case.

-- Haskell takes that concept and one-ups it. Like the name implies, case expressions are,
--  well, expressions, much like if else expressions and let bindings. Not only can we 
-- evaluate expressions based on the possible cases of the value of a variable, we can also
--  do pattern matching. Hmmm, taking a variable, pattern matching it, evaluating pieces of
--  code based on its value, where have we heard this before? Oh yeah, pattern matching on 
-- parameters in function definitions! Well, that's actually just syntactic sugar for case
--  expressions. These two pieces of code do the same thing and are interchangeable:


head1 [] = error "No head for empty lists!";head1 (x:_) = x 


head2 xs = case xs of [] -> error "No head for empty lists!";(x:_) -> x

describeList :: [a] -> String
describeList xs ="The list is " ++ case xs of [] ->"empty."
                                              [x] -> "a singleton list"
                                              xs -> "a longer list."


-- describeList :: [a] -> String
-- describeList xs = "The list is " ++ hello xs
--     where hello []="empty."
--           hello [x]= "a singleton list."
--           hello xs ="a longer list"




main=do





    -- print(lucky 7)
    -- print(lucky 8)
    -- putStrLn(lucky 7)

    -- putStrLn(sayMe 1)
    -- putStrLn(sayMe 3)
    -- putStrLn(sayMe 5)
    -- putStrLn(sayMe 7)
    -- putStrLn(sayMe 9)
    -- putStrLn(sayMe 11)
    -- putStrLn(sayMe 13)

    -- print(factorial 0)
    -- print(factorial 100)

    -- putStrLn(charName 'a')
    -- putStrLn(charName 'b')
    -- putStrLn(charName 'c')

    -- putStrLn(tell1 [])
    -- putStrLn(tell2 (2:[]))
    -- putStrLn(tell3 (4:5:[]))
    -- putStrLn(tell4 ([1,2,3,4]))

    -- print(length'(2:[1,2]))

--     let xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]
--     print([a+b | (a,b) <- xs])

 

--     -- guards are a way of testing whether some property of a value (or several of them)
--     --  are true or false. That sounds a lot like an if statement and it's very similar.
--     -- The thing is that guards are a lot more readable when you have several conditions
--     --  and they play really nicely with patterns.

--     print(bmiTell 11)
--     print(bmiTell 19)
--     print(bmiTell 25)
--     print(bmiTell 27)
--     print(bmiTell 32)


--     print(bmiTell2 95 1.9)
--     print(bmiTell2 90 1.9)
--     print(bmiTell2 87 1.9)

--     print(max' 2 5)

--     print (3 `myCompare` 2)

--     print(bmiTell3 95 1.8)
--     print(bmiTell4 95 1.8)


    -- print(initials "Syed" "Ali" "Hamdani")

    -- print (calcBmis [(12,33)])


--     print(cylinder 12 30)


-- -- [if 5 > 3 then "Woo" else "Boo", if 'a' > 'b' then "Foo" else "Bar"]

-- -- other way let in
-- -- 4 * (let a = 9 in a + 1) + 2  

-- -- They can also be used to introduce functions in a local scope:
-- -- [let square x = x * x in (square 5, square 3, square 2)] 

-- -- If we want to bind to several variables inline,
-- --  we obviously can't align them at columns. That's why we can separate them with semicolons.
-- -- (let a = 100; b = 200; c = 300 in a*b*c, let foo="Hey "; bar = "there!" in foo ++ bar)  
-- -- (let (a,b,c) = (1,2,3) in a+b+c) * 100 
   
--     let zoot x y z = x * y + z

--     print(zoot 3 4 5)
       

    --    putStrLn(head1 [])
-- print(head1 [1,2]) 
        
        -- putStrLn(head2 [])
        -- print(head2 [22,44])
        print(describeList [4,3])
        -- print(describeList [])
          


