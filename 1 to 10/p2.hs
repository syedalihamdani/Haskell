-- (*) Find the last but one element of a list.

-- (Note that the Lisp transcription of this problem is incorrect.)

-- Example in Haskell:

-- λ> myButLast [1,2,3,4]
-- 3
-- λ> myButLast ['a'..'z']
-- 'y'

myButLast :: [a] -> a
myButLast = last . init
main=do
    print(myButLast [1,2,3,4])
    print(myButLast ['a'..'z'])

