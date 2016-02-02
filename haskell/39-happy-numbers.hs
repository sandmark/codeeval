import Data.Char (digitToInt)
import System.Environment (getArgs)

main :: IO ()
main = do
  cs <- getArgs >>= readFile . head
  mapM_ (print . happyOrNot) $ lines cs

happyOrNot :: String -> Int
happyOrNot s   = isHappy $ happies s
  where isHappy ("1":_) = 1
        isHappy ("4":_) = 0
        isHappy (_:xs)  = isHappy xs

happies :: String -> [String]
happies n = s : happies s
  where s = sumDigits n

sumDigits :: String -> String
sumDigits = show . sum . map ((^2) . digitToInt)
