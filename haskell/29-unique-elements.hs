import Data.List
import Data.List.Split (splitOn)
import System.Environment (getArgs)

main :: IO ()
main = do
  cs <- getArgs >>= readFile . head
  let ns = map (nub . splitOn ",") $ lines cs
  mapM_ (putStrLn . intercalate ",") ns
