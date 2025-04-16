-- Author: Haileselassie Gaspar
-- 2025
module LambdaImplementation where
import qualified Data.Set as S
data Term =
  Var
  | App Term Term
  | Lam Term
  | Mal Term
  deriving (Eq)

instance Show Term where
  show Var = "x "
  show (App x y) = show x ++ show y
  show (Lam x) = "\\x." ++ show x
  show (Mal x) = "/x" ++ show x
-- ADBMAL Notation / DeBruijn Notation for solving capturing issues
-- Look into making specific formatting for Mal term

