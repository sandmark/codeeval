-- Print to stdout the largest prime palindrome less than 1000.

main :: IO ()
main = do
  let n = maximum [x | x <- [1000,999..1], isPrime x, isPalindrome (show x)]
  print n

isPalindrome :: String -> Bool
isPalindrome s = reverse s == s

isPrime :: Int -> Bool
isPrime 1 = False
isPrime 2 = True
isPrime n | odd n && countOfDivisor n == 2 = True
          | otherwise                      = False
  where countOfDivisor m = length $ filter ((== 0) . (n `mod`)) [1..m]
