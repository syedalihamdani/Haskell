type Birds = Int  
type Pole = (Birds,Birds) 

landLeft :: Birds -> Pole -> Maybe Pole  
landLeft n (left,right)  
    | abs ((left + n) - right) < 4 = Just (left + n, right)  
    | otherwise                    = Nothing  
  
landRight :: Birds -> Pole -> Maybe Pole  
landRight n (left,right)  
    | abs (left - (right + n)) < 4 = Just (left, right + n)  
    | otherwise                    = Nothing 

banana :: Pole -> Maybe Pole  
banana _ = Nothing

(>>) :: (Monad m) => m a -> m b -> m b  
m >> n = m >>= \_ -> n

main=do
    print(landLeft 2 (0,0))
    print(landLeft 10 (0,3))
-- We can't do landLeft 1 (landRight 1 (0,0)) anymore because when we apply landRight 1 to (0,0), we don't get a Pole, but a Maybe Pole. landLeft 1 takes a Pole and not a Maybe Pole.
-- We need a way of taking a Maybe Pole and feeding it to a function that takes a Pole and returns a Maybe Pole. Luckily, we have >>=, which does just that for Maybe. Let's give it a go:
    print(landRight 1 (0,0) >>= landLeft 2 )

    print(Nothing >>= landLeft 2 )

    -- sequence of birdy landings:
    print(return (0,0) >>= landRight 2 >>= landLeft 2 >>= landRight 2)

    print(return (0,0) >>= landLeft 1 >>= landRight 4 >>= landLeft (-1) >>= landRight (-2)  )

    print(return (0,0) >>= landLeft 1 >>= banana >>= landRight 1)

    print(Nothing >> Just 3)