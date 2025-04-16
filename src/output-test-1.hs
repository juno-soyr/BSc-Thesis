-- | TEST For output of the terms to a readable syntax

module Main where
import LambdaImplementation
main = do
  print $ Lam ( App Var Var )
