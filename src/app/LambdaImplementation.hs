-- Author: Haileselassie Gaspar
-- 2025
module LambdaImplementation where
import qualified Data.Set as S
data Term =
  None
  | Var String
  | App Term Term
  | Lam String Term
  deriving (Eq,Read)
-- type Env = ('')
instance Show Term where
  show (Var x) = x
  show (App x y) = "(" ++ show x ++ " " ++ show y ++ ")"
  show (Lam x y) = "(λ" ++ x ++ "." ++ show y ++ ")"
-- Look into Alpha conversion
subst :: String -> Term -> Term -> Term
subst var value term = case term of
    Var x
        | x == var  -> value
        | otherwise -> Var x
    Lam x body
        | x == var  -> Lam x body 
        | otherwise -> Lam x (subst var value body)
    App e1 e2 -> App (subst var value e1) (subst var value e2)