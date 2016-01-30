{-
  * program should accept a file as its first argument

  input sample:
    3 5 10
    2 7 15

  output sample:
    1 2 F 4 B F 7 8 F B
    1 F 3 F 5 F B F 9 F 11 F 13 FB 15
-}

import System.Environment (getArgs)
import Control.Monad (forM_)

main :: IO ()
main = do
  args <- getArgs
  cs   <- readFile $ head args
  let arr = map (map string2int . words) $ lines cs
  forM_ arr $ \[f,b,n] -> putStrLn $ fizzbuzz f b n

string2int :: String -> Int
string2int s = read s :: Int

fizzbuzz :: Int -> Int -> Int -> String
fizzbuzz f b n = unwords $ map fb [1..n]
  where fb m | m `mod` (f*b) == 0 = "FB"
             | m `mod` f     == 0 = "F"
             | m `mod` b     == 0 = "B"
             | otherwise          = show m
