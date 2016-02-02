import Data.List
import Data.List.Split
import System.Environment (getArgs)

main :: IO ()
main = do
  cs <- getArgs >>= readFile . head
  mapM_ (print . rightmost . separate) . filter (/= "") $ lines cs

separate :: String -> (String, Char)
separate s = let [str,c] = splitOn "," s in (str, head c)

rightmost :: (Eq a) => ([a], a) -> Int
rightmost (s,c) = last $ elemIndices c s
