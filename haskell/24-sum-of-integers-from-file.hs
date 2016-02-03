import System.Environment (getArgs)

main :: IO ()
main = do
  cs <- getArgs >>= readFile . head
  print $ sum $ map str2int $ lines cs
  where str2int s = read s :: Int
