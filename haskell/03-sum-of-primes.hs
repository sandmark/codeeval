-- Print to stdout the sum of the first 1000 prime numbers.

main :: IO ()
main = print $ sum $ take 1000 [x | x <- [1..], isPrime x]

isPrime :: Int -> Bool
isPrime 1 = False
isPrime 2 = True
isPrime n | odd n && countOfDivisor n == 2 = True
          | otherwise                      = False
  where countOfDivisor m = length $ filter ((== 0) . (n `mod`)) [1..m]
