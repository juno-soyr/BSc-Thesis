-- |
module Interpreter where
import LambdaImplementation
import Control.Monad (unless)
import System.IO (hFlush, stdout)

lambdaParser :: String -> Term


repl :: IO ()
repl = do
    putStr ">>> "
    hFlush stdout
    line <- getLine
    unless (line == ":q") $ do
        print line
        repl
