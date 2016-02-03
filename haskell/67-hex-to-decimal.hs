import Numeric (readHex)
import System.Environment (getArgs)

main :: IO ()
main = do
  cs <- getArgs >>= readFile . head
  mapM_ (print . fst . head . readHex) $ lines cs
