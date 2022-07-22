   toStr =map (\x -> show x ++ space x) ["s","d"]
          space True = "  "
          space False = " "
main = do
    putStrLn(toStr) 