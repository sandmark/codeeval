{-
  2020 # 0(2) == 2,  1(0) == 0, '2' two, '3' zero.
  22   # '0' zero, '1' zero.
  1210 # '0' one,  '1' two,  '2' one, '3' zero.
-}

import Data.Char
import System.Environment (getArgs)

main :: IO ()
main = do
  cs <- getArgs >>= readFile . head
  mapM_ (putBool . isDescribed . str2int) $ lines cs
  where putBool True  = print 1
        putBool False = print 0
        str2int s = read s :: Int

isDescribed :: Int -> Bool
isDescribed n = and $ zipWith f [0..] s
  where s = show n
        f i c = digitToInt c == countOf (intToDigit i) s
        countOf x = length . filter (== x)
