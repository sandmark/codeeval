{-
Input sample:

The first argument is a file that contains multiple sentences, one per line. Empty lines are also possible.

For example:
  Hello World
  Hello CodeEval

Output sample:
  World Hello
  CodeEval Hello

Print to stdout each sentence with the reversed words in it, one per line. Empty lines in the input should be ignored. Ensure that there are no trailing empty spaces in each line you print.
-}

import System.Environment (getArgs)

main :: IO ()
main = do
  cs <- getArgs >>= readFile . head
  let reversed = filter (/="") $ map (unwords . reverse . words) $ lines cs
  mapM_ putStrLn reversed
