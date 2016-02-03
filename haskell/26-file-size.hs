import System.Environment (getArgs)
import System.Posix

main :: IO ()
main = do
  args <- getArgs
  let path = head args
  size <- getFileSize path
  print size

getFileSize :: FilePath -> IO System.Posix.FileOffset
getFileSize path = fileSize `fmap` getFileStatus path
