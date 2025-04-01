module LambdaImplementation where
type VarName = String
data Term =
  App Term Term
  | Abs VarName Term
  | Var VarName
 deriving (Eq, Show)

-- Look up sources
-- Based on femke's notes on lambda calculus

-- Remove a variable from a list of variables
removeVar :: VarName -> [VarName] -> [VarName]
removeVar _ [] = []
removeVar x (y:ys)
  |x == y = removeVar x ys
  |otherwise = y : removeVar x ys

-- remove duplicate free variables
rmDup :: [VarName] -> [VarName]
rmDup [] = []
rmDup (x:xs)
  | x `elem` xs = rmDup xs
  | otherwise = x : rmDup xs


-- Get the set of free variables -> Make sure no duplicates(Proper set)
freeVar :: Term -> [VarName]
freeVar (Var a) = [a]
freeVar (App a b) = rmDup (freeVar a ++ freeVar b)
freeVar (Abs x a) = removeVar x (freeVar a)
-- Get the set of bound variables -> TODO
boundVar :: Term -> [VarName]
boundVar (Var a) = []
boundVar (App a b) = rmDup (boundVar a ++ boundVar b)
boundVar (Abs x a) = x : boundVar a

-- lo_red :: Term -> [Term]
-- lo_red TmAbs VarName Term =
