import Data.List (intersect, intercalate)
import Data.List.Split (splitOn)
import System.Environment (getArgs)

main :: IO ()
main = do
  cs <- getArgs >>= readFile . head
  let ns = map (\[a,b] -> a `intersect` b) $ separate $ lines cs
  mapM_ (putStrLn . intercalate ",") ns
  where separate = map (map (splitOn ",") . splitOn ";")
