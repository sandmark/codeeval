import System.Environment (getArgs)
import Data.Char (digitToInt)

main :: IO ()
main = do
  cs <- getArgs >>= readFile . head
  mapM_ (print . isArmstrong . str2int) $ lines cs
  where str2int s = read s :: Int

isArmstrong :: Int -> Bool
isArmstrong n = n == sum (map ((^digits) . digitToInt) s)
  where digits = length s
        s      = show n
