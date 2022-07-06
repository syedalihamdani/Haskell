-- Functor is a TYPECLASS
-- a typeclass, you can think of it as an interface

--  class Functor f where
--     fmap :: (a -> b) -> f a -> f b

-- In haskell there is wrapped value and there is an unwrapped value
-- unwrapped value examples are 3,4, "hello"
-- wrapped value exampe like    data Maybe a = Just a | Nothing  here is Just a is wrapped value
--  we can not functions over wrapped values that is we use Functor fmap. wrapped is also called box 

data Maybe2 a = Just2 a | Nothing2 deriving (Show)

instance Functor Maybe2 where
    fmap f (Just2 a) = Just2 (f a)
    fmap f Nothing2 = Nothing2 


-- haskell offers functor for Maybe, Either, List
-- But when you want to apply functor to your own data structor like Tree

-- Application Functor
-- Applicative functor is defined like this
-- class Functor f => Applicative f where
--     pure :: a -> f a
--     (<*>) :: f (a -> b) -> f a -> f b
    --  <*> is an infix notation for Applicative Functor

instance Applicative Maybe2 where
    pure = Just2
    Just2 f <*> J = fmap f J
    Nothing2 f <*> J = Nothing2
 


main=do
    
    print(fmap (*3) (Just2 10))
    print((Just2 +2) <*> (Just2 4))
     
