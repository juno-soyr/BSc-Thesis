-- Author: Haileselassie Gaspar
-- 2025
module LambdaImplementation where
import qualified Data.Set as S
data Term =
  Var String
  | App Term Term
  | Lam String Term
  deriving (Eq,Read)
-- type Env = ('')
instance Show Term where
  show (Var x) = show x
  show (App x y) = " (" ++ show x ++ show y ++ ") "
  show (Lam x y) = " ( \\" ++ show x ++ "." ++ show y ++ ") "
-- Look into Alpha conversion
