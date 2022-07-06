import Data.Map
-- This file is tested in ghci compiler

-- association lists (also called dictionaries) are lists that are used to store key-value 
-- pairs where ordering doesn't matter. For instance, we might use an association list to 
-- store phone numbers, where phone numbers would be the values and people's names would be
--  the keys. We don't care in which order they're stored, we just want to get the right 
-- phone number for the right person.

-- The most obvious way to represent association lists in Haskell would be by having a list
--  of pairs. The first component in the pair would be the key, the second component the value.
--  Here's an example of an association list with phone numbers:
phoneBook =   
    [("betty","555-2938")  
    ,("bonnie","452-2928")  
    ,("patsy","493-2928")  
    ,("lucille","205-2928")  
    ,("wendy","939-8282")  
    ,("penny","853-2492")  
    ] 
findKey :: (Eq k) => k -> [(k,v)] -> v  
findKey key xs = snd . head . filter (\(k,v) -> key == k) $ xs 

findKey :: (Eq k) => k -> [(k,v)] -> Maybe v  
findKey key [] = Nothing  
findKey key ((k,v):xs) = if key == k  
                            then Just v  
                            else findKey key xs


findKey :: (Eq k) => k -> [(k,v)] -> Maybe v  
findKey key = Data.map.foldr (\(k,v) acc -> if key == k then Just v else acc) Nothing 

main=do
    print(findKey "penny" phoneBook)
    print(findKey "betty" phoneBook)
    print(findKey "wilma" phoneBook)

    -- import qualified Data.Map as Map
    -- The fromList function takes an association list (in the form of a list) and returns
    --  a map with the same associations.

    -- If there are duplicate keys in the original association list, the duplicates are
    --  just discarded. This is the type signature of fromList

    -- Map.fromList :: (Ord k) => [(k, v)] -> Map.Map k v 





    -- empty represents an empty map. It takes no arguments, it just returns an empty map.
    --   in terminal
    -- print(Map.empty)

    -- insert takes a key, a value and a map and returns a new map that's just like the old
    --  one, only with the key and value inserted
       
  
  print(Map.insert 3 100 Map.empty)  
  print(Map.insert 5 600 (Map.insert 4 200 ( Map.insert 3 100  Map.empty)))  
   
  print(Map.insert 5 600 . Map.insert 4 200 . Map.insert 3 100 $ Map.empty)

--   null checks if a map is empty.
    print(Map.null Map.empty)
    print(Map.null $ Map.fromList [(2,3),(5,5)])