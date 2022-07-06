import Data.List
solveRPN :: (Num a) => String -> a
solveRPN expression = head . foldl foldingFunction [] . words
    where foldingFunction (x:y:ys) "*" = (x * y): ys
          foldingFunction (x:y:ys) "+" = (x + y):ys
          foldingFunction (x:y:ys) "-" = (y -x):ys
          foldingFunction xs numberString = read numberString:xs

main=do
    print(solveRPN "10 4 3 + 2 * - ") 