-- Record syntax
-- OK, we've been tasked with creating a data type that describes a person. The info that we 
-- want to store about that person is: first name, last name, age, height, phone number, and 
-- favorite ice-cream flavor. I don't know about you, but that's all I ever want to know 
-- about a person. Let's give it a go!

-- IN the ghci
-- data Person = Person String String Int Float String String deriving (Show) 

-- ghci> let guy = Person "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"  
-- ghci> guy  
-- Person "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"

-- What if we want to create a function to get seperate info from a person? A function that
--  gets some person's first name, a function that gets some person's last name, etc. Well,
--  we'd have to define them kind of like this.

firstName :: Person -> String  
firstName (Person firstname _ _ _ _ _) = firstname  
  
lastName :: Person -> String  
lastName (Person _ lastname _ _ _ _) = lastname  
  
-- age :: Person -> Int  
-- age (Person _ _ age _ _ _) = age  
  
-- height :: Person -> Float  
-- height (Person _ _ _ height _ _) = height  
  
-- phoneNumber :: Person -> String  
-- phoneNumber (Person _ _ _ _ number _) = number  
  
-- flavor :: Person -> String  
-- flavor (Person _ _ _ _ _ flavor) = flavor

-- ghci> let guy = Person "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"  
-- ghci> firstName guy  
-- "Buddy"  
-- ghci> height guy  
-- 184.2  
-- ghci> flavor guy  
-- "Chocolate" 

--  Here's how we could achieve the above functionality with record syntax.

-- data Person = Person { firstName :: String  
--                      , lastName :: String  
--                      , age :: Int  
--                      , height :: Float  
--                      , phoneNumber :: String  
--                      , flavor :: String  
--                      } deriving (Show)


-- ghci> :t flavor  
-- flavor :: Person -> String  
-- ghci> :t firstName  
-- firstName :: Person -> String 

-- data Car = Car String String Int deriving (Show)

-- ghci> Car "Ford" "Mustang" 1967  
-- Car "Ford" "Mustang" 1967

-- If we define it using record syntax, we can make a new car like this

-- data Car = Car {company :: String, model :: String, year :: Int} deriving (Show)

-- ghci> Car {company="Ford", model="Mustang", year=1967}  
-- Car {company = "Ford", model = "Mustang", year = 1967}

 