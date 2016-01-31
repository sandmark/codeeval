import System.Environment (getArgs)
import Data.List.Split (splitOn)
import Data.Char (toLower)

main :: IO ()
main = do
  cs <- getArgs >>= readFile . head
  let ls = map (checkBits . toInts . splitOn ",") $ lines cs
  mapM_ (putStrLn . map toLower . show) ls
  where toInts = map str2int
        str2int s = read s :: Int
        checkBits [n,p1,p2] = isBitsSame n p1 p2

isBitsSame :: Int -> Int -> Int -> Bool
isBitsSame n p1 p2 = let b1 = bin !! (p1 - 1)
                         b2 = bin !! (p2 - 1)
                     in b1 == b2
  where bin = toBin n

toBin :: Int -> [Int]
toBin = toBin'
  where toBin' 0 = []
        toBin' n = let (q,r) = n `divMod` 2
                   in r : toBin' q
