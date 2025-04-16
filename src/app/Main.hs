-- | Main Program

module Main where
import Control.Monad
main = do
  print "soyrs-calculator>"
  a <- getLine
  when (a /= "exit")  $ do
    print a
    main
