-- |
module Interpreter where
import LambdaImplementation

main = do
    line <- getLine
    if null line
        then return ()
        else do
            show line
            main
