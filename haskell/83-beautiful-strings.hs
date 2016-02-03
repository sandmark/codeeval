{-
The most beautiful letter is determined by how many times appeared, and set to be 26.
In that way, "abbccc" is replaced with [24,25,25,26,26,26] and
  sum of that list will be a Maximum Possible Beauty of the string.
-}

import Data.Char
import Data.List
import System.Environment (getArgs)

main :: IO ()
main = do
  cs <- getArgs >>= readFile . head
  mapM_ (print . maximumPossibleBeauty . letters) $ lines cs

maximumPossibleBeauty :: String -> Int
maximumPossibleBeauty s = sum . zipWith toBeauty [26,25..] . group $ sortBy count s
  where count a b = countOf b `compare` countOf a
        countOf x = length $ filter (== x) s
        toBeauty n e = n * length e

letters :: String -> String
letters = filter (`elem` ['a'..'z']) . sort . map toLower
