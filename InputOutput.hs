import Data.Char
import System.IO 
import System.Environment 

import Control.Monad
main=do
    -- putStrLn("What is your first Name")
    -- firstName<- getLine
    -- putStrLn("What is your last name")
    -- lastName<-getLine
    -- let bigFirstName=map toUpper firstName
    --     bigLastName=map toUpper lastName
    -- putStrLn $ "hey"++ " "++bigFirstName++ " " ++bigLastName++ " How are you?"

--     line<-getLine
--     if null line
--         then return ()
--         else do
--             putStrLn $ reversewords line
--             main

-- reversewords :: String -> String
-- reversewords= unwords . map reverse .words

-- return ()
-- return "HaHaha"
-- line<-getLine
-- return "Blah Blah Blah Blah"
-- return 4
-- putStrLn line


-- a <- return "hell"  
-- b <- return "yeah!"  
-- putStrLn $ a ++ " " ++ b


-- let a = "hell"  
--     b = "yeah"  
-- putStrLn $ a ++ " " ++ b  

-- putStr is much like putStrLn in that it takes a string as a parameter and returns an 
-- I/O action that will print that string to the terminal, only putStr doesn't jump into a
--  new line after printing out the string while putStrLn does.
-- putStr "Hey, "  
-- putStr "I'm "  
-- putStrLn "Andy!"
-- putChar takes a character and returns an I/O action that will print it out to the terminal.
-- putChar 't'  
-- putChar 'e'  
-- putChar 'h'

-- print True  
-- print 2  
-- print "haha"  
-- print 3.2  
-- print [3,4,3]
-- c <- getChar
-- if c /= ' '  
--     then do  
--     putChar c  
--     main  
--     else return ()

-- The when function is found in Control.Monad (to get access to it, do import Control.Monad).
-- c <- getChar
-- when (c /= ' ') $ do
--     putChar c
--     main
-- sequence takes a list of I/O actions and returns an I/O actions that will perform those
--  actions one after the other. The result contained in that I/O action will be a list of
--  the results of all the I/O actions that were performed. Its type signature is sequence
--  :: [IO a] -> IO [a]. Doing this

-- a <- getLine  
-- b <- getLine  
-- c <- getLine  
-- print [a,b,c]


-- rs <- sequence [getLine, getLine, getLine]  
-- print rs

-- forever takes an I/O action and returns an I/O action that just repeats the I/O action
--  it got forever. It's located in Control.Monad. This little program will indefinitely 
-- ask the user for some input and spit it back to him, CAPSLOCKED
 
-- main = forever $ do
-- putStr "Give me some input: "  
-- l <- getLine  
-- putStrLn $ map toUpper l

-- forM (located in Control.Monad) is like mapM, only that it has its parameters switched 
-- around. The first parameter is the list and the second one is the function to map over 
-- that list, which is then sequenced. Why is that useful? Well, with some creative use of
--  lambdas and do notation, we can do stuff like this:

--     contents <- getContents
--     putStr (shortLinesOnly contents)  
  
-- shortLinesOnly :: String -> String  
-- shortLinesOnly input =
--     let allLines = lines input  
--         shortLines = filter (\line -> length line < 10) allLines  
--         result = unlines shortLines  
--     in  result





-- To read any text file
--    import System.IO     
    
-- main = do     
    -- withFile "girlfriend.txt" ReadMode (\handle -> do  
    --     contents <- hGetContents handle     
    --     putStr contents)

    -- readFile has a type signature of readFile :: FilePath -> IO String. Remember, 
    -- FilePath is just a fancy name for String. readFile takes a path to a file and 
    -- returns an I/O action that will read that file (lazily, of course) and bind its
    --  contents to something as a string. It's usually more handy than doing openFile and
    -- binding it to a handle and then doing hGetContents. Here's how we could have written
    --  our previous example with readFile:


    -- contents <- readFile "girlfriend.txt"  
    -- putStr contents

    -- writeFile has a type of writeFile :: FilePath -> String -> IO (). It takes a path to
    --  a file and a string to write to that file and returns an I/O action that will do 
    -- the writing. If such a file already exists, it will be stomped down to zero length
    --  before being written on. Here's how to turn girlfriend.txt into a CAPSLOCKED 
    -- version and write it to girlfriendcaps.txt:

    -- contents <- readFile "girlfriend.txt"     
    -- writeFile "girlfriendcaps.txt" (map toUpper contents)

    -- appendFile has a type signature that's just like writeFile, only appendFile doesn't 
    -- truncate the file to zero length if it already exists but it appends stuff to it.

    -- todoItem <- getLine  
    -- appendFile "girlfriend.txt" (todoItem ++ "\n")

    -- import System.Environment   
-- import Data.List  
  
-- main = do  
   args <- getArgs  
   progName <- getProgName  
   putStrLn "The arguments are:"  
   mapM putStrLn args  
   putStrLn "The program name is:"  
   putStrLn progName 

