import Data.List.Split (splitOn)
import System.Environment (getArgs)

main :: IO ()
main = do
  cs <- getArgs >>= readFile . head
  mapM_ (print . myMod . toIntPair . splitOn ",") $ lines cs
  where myMod (n,m) | n < m = n
                    | otherwise = myMod (n-m,m)
        toIntPair [a,b] = (str2int a, str2int b)
        str2int s = read s :: Int
