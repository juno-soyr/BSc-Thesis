-- |
module Interpreter where
import LambdaImplementation
import Control.Monad (unless)
import System.IO (hFlush, stdout)

-- stringToLambda :: String -> Term
--stringToLambda "x" = Var
--stringToLambda ('l':'x':xs) = Lam ( stringToLambda xs )
--stringToLambda x = App( stringToLambda y) (stringToLambda ys) where
 -- y = head (words x)
-- ys = tail (words x)

repl :: IO ()
repl = do
    putStr ">>> "
    hFlush stdout
    line <- getLine
    unless (line == ":q") $ do
        let term = read line
        print term
        repl
