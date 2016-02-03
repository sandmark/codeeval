import Data.Char (toLower)
import System.Environment (getArgs)

main :: IO ()
main = do
  cs <- getArgs >>= readFile . head
  mapM_ (putStrLn . toLowerString) (lines cs)
  where toLowerString = map toLower
