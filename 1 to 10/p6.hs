-- (*) Find out whether a list is a palindrome. A palindrome can be read forward or backward;
--  e.g. (x a m a x).

-- Example in Haskell:

-- λ> isPalindrome [1,2,3]
-- False
-- λ> isPalindrome "madamimadam"
-- True
-- λ> isPalindrome [1,2,4,8,16,8,4,2,1]
-- True

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome xs = xs == (reverse xs)
main=do
    print(isPalindrome [1,2,3])
    print(isPalindrome "madamimadam")
    print(isPalindrome [1,2,4,8,16,8,4,2,1])
