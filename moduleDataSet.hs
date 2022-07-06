-- Data.Set

-- Code is only tested in the ghci

-- The Data.Set module offers us, well, sets. Like sets from mathematics. Sets are kind of
-- like a cross between lists and maps. All the elements in a set are unique. And because 
-- they're internally implemented with trees (much like maps in Data.Map), they're ordered.
--  Checking for membership, inserting, deleting, etc. is much faster than doing the same 
-- thing with lists. The most common operation when dealing with sets are inserting into a 
-- set, checking for membership and converting a set to a list.

-- Because the names in Data.Set clash with a lot of Prelude and Data.List names, we do a
--  qualified import.

-- Put this import statement in a script:

text1 = "I just had an anime dream. Anime... Reality... Are they so different?"  
text2 = "The old man left his garbage can out and now his trash is all over my lawn!"
main=do
    -- The fromList function works much like you would expect. It takes a list and converts it into a set.
    let set1 = Set.fromList text1
    let set2 = Set.fromList text2
    print(set1)
    print(set2)

    -- As you can see, the items are ordered and each element is unique.
    --  Now let's use the intersection function to see which elements they both share.
    print(Set.intersection set1 set2  )
    -- We can use the difference function to see which letters are in the first set but 
    -- aren't in the second one and vice versa.
    print(Set.difference set1 set2)
    print(Set.difference set2 set1 )
    -- Or we can see all the unique letters used in both sentences by using union.
    print(Set.union set1 set2)
    -- The null, size, member, empty, singleton, insert and delete functions all work like you'd expect them to.
    print(Set.null Set.empty)
    print(Set.null $ Set.fromList [3,4,5,5,4,3])
    print(Set.size $ Set.fromList [3,4,5,3,4,5]) 
    print(Set.singleton 9)  
    print(Set.insert 4 $ Set.fromList [9,3,8,1])  
    print(Set.insert 8 $ Set.fromList [5..10])  
    print(Set.delete 4 $ Set.fromList [3,4,5,4,3,4,5]) 


    print(Set.fromList [2,3,4] `Set.isSubsetOf` Set.fromList [1,2,3,4,5])  
  
    print(Set.fromList [1,2,3,4,5] `Set.isSubsetOf` Set.fromList [1,2,3,4,5])  
   
    print(Set.fromList [1,2,3,4,5] `Set.isProperSubsetOf` Set.fromList [1,2,3,4,5])  
   
    print(Set.fromList [2,3,4,8] `Set.isSubsetOf` Set.fromList [1,2,3,4,5])

    -- We can also map over sets and filter them.

    print(Set.filter odd $ Set.fromList [3,4,5,6,7,2,3,4])  
    print(Set.map (+1) $ Set.fromList [3,4,5,6,7,2,3,4])  
-- Sets are often used to weed a list of duplicates from a list by first making it into a 
-- set with fromList and then converting it back to a list with toList. The Data.List 
-- function nub already does that, but weeding out duplicates for large lists is much 
-- faster if you cram them into a set and then convert them back to a list than using nub.
--  But using nub only requires the type of the list's elements to be part of the Eq typeclass,
--  whereas if you want to cram elements into a set, the type of the list has to be in Ord.
    
--    ghci> let setNub xs = Set.toList $ Set.fromList xs  
-- ghci> setNub "HEY WHATS CRACKALACKIN"  
-- " ACEHIKLNRSTWY"  
-- ghci> nub "HEY WHATS CRACKALACKIN"  
-- "HEY WATSCRKLIN"