-- Author: Haileselassie Gaspar
-- 2025
module LambdaImplementation where
import qualified Data.Set as S
import Data.List

data Term =
    Variable Int
  | Application Term Term
  | Lambda String Term
  deriving (Eq,Read)
instance Show Term where
  show (Variable x) = show x
  show (Application t u) = show t ++ show u
  show (Lambda x t) = "(\\" ++ x ++ "." ++ show t ++ ")"
data Context =
  Context
  Context Term

