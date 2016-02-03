{-
Print out the grade school multiplication table upto 12*12.
  1   2   3   4   5   6   7   8   9  10  11  12
  2   4   6   8  10  12  14  16  18  20  22  24
  3   6   9  12  15  18  21  24  27  30  33  36
  ...
-}

import Text.Printf

main :: IO ()
main = do
  let table = map (\x -> take 12 [x,x+x..]) [1..12]
  mapM_ (putStrLn . format) table

format :: [Int] -> String
format = foldr (\n r -> printf "%4d" n ++ r) ""
