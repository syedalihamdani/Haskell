safediv :: Integral a => a->a -> Maybe a
safediv a b = if b == 0 then Nothing else Just $ div a b

-- Module use for Maybe 
-- import Data.Maybe

-- The famious that are used from this module
-- isJust :: Maybe a ->Bool
-- isNothing :: Maybe a -> Bool
-- fromJust :: Maybe a->a

main=do
    print(safediv 4 2)
    print(safediv 4 0)