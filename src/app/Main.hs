-- | Main Program

module Main where
import Interpreter

main :: IO()
main = do
    parseAndStep "([o)(ooo)"
    parseAndStep "([[o)(ooo)"
    parseAndStep "([[o(]o))(ooo)"
    parseAndStep "([[o(]o)(]]o))(ooo)"