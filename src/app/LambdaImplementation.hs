-- Author: Haileselassie Gaspar
-- 2025
module LambdaImplementation where
import qualified Data.Set as S
import Data.List

data Term =
    Variable String
  | Application Term Term
  | Lambda String Term
  deriving (Eq,Read)
instance Show Term where
  show (Variable x) = x
  show (Application t u) = show t ++ show u
  show (Lambda x t) = "(\\" ++ x ++ "." ++ show t ++ ")"
data Context =
  Context
  Context Term

freeVariables :: Term -> S.Set String
freeVariables (Variable var) = S.singleton var
freeVariables (Application lt1 lt2) = S.union (freeVariables lt1) (freeVariables lt2)
freeVariables (Lambda var lt) = S.delete var $ freeVariables lt
