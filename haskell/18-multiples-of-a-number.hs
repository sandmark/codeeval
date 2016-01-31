{-
Given numbers x and n, where n is a power of 2, print out the smallest multiple of n which is greater than or equal to x. Do not use division or modulo operator.
Input sample:

The first argument will be a path to a filename containing a comma separated list of two integers, one list per line. E.g.
  13,8
  17,16

Output sample:
Print to stdout, the smallest multiple of n which is greater than or equal to x, one per line. E.g.
  16
  32
-}

import System.Environment (getArgs)
import Data.List (elemIndex)

main :: IO ()
main = do
  cs <- getArgs >>= readFile . head
  let ns = map (smallestMultiple . pair2ints . splitBy ',') $ lines cs
  mapM_ print ns
  where pair2ints (s1, s2) = (str2int s1, str2int s2)

splitBy :: (Eq a) => a -> [a] -> ([a],[a])
splitBy c xs = case elemIndex c xs of
  Nothing -> error "parse error"
  Just i  -> let (first, second) = splitAt i xs
             in (first, tail second)

str2int :: String -> Int
str2int s = read s :: Int

smallestMultiple :: (Int, Int) -> Int
smallestMultiple (x,n) = head $ dropWhile (< x) multiples
  where multiples = mapWithIndex (\(i,m) -> m*i) [n,n..]

mapWithIndex :: (Num a, Enum a) => ((a,t1) -> t2) -> [t1] -> [t2]
mapWithIndex f = zipWith (curry f) [0..]
