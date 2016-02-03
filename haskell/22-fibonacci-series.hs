-- F(0) = 0; F(1) = 1; F(n) = F(n–1) + F(n–2) when n>1.

import System.Environment (getArgs)

main :: IO ()
main = do
  cs <- getArgs >>= readFile . head
  mapM_ (print . fib . str2int) (lines cs)

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

str2int :: String -> Int
str2int s = read s :: Int
