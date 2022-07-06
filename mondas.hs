import Data.Monoid
-- lengthCompare :: String -> String ->Ordering
-- lengthCompare x y =(length x `compare` length y) `mappend` (x `compare` y)

lengthcompare :: String -> String -> Ordering
lengthcompare x y = (length x `compare` length y) `mappend`
                    (vowels x `compare` vowels y) `mappend`
                    (x `compare` y)
    where vowels= length .filter (`elem` "aeiou")

main=do
    print(lengthcompare "zem" "ant")

-- class Monoid m where
--     mempty :: m
--     mappend :: m->m->m
--     mconcat :: [m] ->m
--     mconcat =foldr mappen mempty




-- newtype Product a= Product {getProduct :: a }
--     deriving (Eq, Ord, Read, Show, Bounded)

-- instance Num a => Monoid (Product a) where
--     mempty =Product 1
--     Product x `mappend` Product y =Product (x*y)


-- instance Monoid a => Monoid (Maybe a) where
--     mempty =Nothing
--     Nothing `mappend` m =m
--     m `mappend` Nothing =m
--     Just m1 `mappend` Just m2 =Just (m1 `mappend` m2)


-- newtype First a=First {getFirst :: Maybe a}
--     deriving (Eq,Ord,Read,Show)

-- instance Monoid (First a) where
--     mempty = First Nothing
--     First (Just x) `mappend` _=First (Just x)
--     First Nothing `mappend` x=x

