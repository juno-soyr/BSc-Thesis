module LambdaImplementation where
type VarName = String
data Term =
  App Term Term
  | Abs VarName Term
  | Var VarName
 deriving (Eq, Show)

removeVar :: VarName -> [VarName] -> [VarName]
removeVar _ [] = []
removeVar x (y:ys)
  |x == y = removeVar x ys
  |otherwise = y : removeVar x ys

freeVar :: Term -> [VarName]
freeVar (Var a) = [a]
freeVar (App a b) = freeVar a ++ freeVar b
freeVar (Abs x a) = removeVar x (freeVar a)
-- lo_red :: Term -> [Term]
-- lo_red TmAbs VarName Term =
