import Data.Char (digitToInt)
import System.Environment (getArgs)

main :: IO ()
main = do
  cs <- getArgs >>= readFile . head
  mapM_ (print . sumOfDigits) (lines cs)

sumOfDigits :: String -> Int
sumOfDigits = sum . map digitToInt
