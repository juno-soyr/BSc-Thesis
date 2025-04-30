-- Author: Haileselassie Gaspar
-- 2025
module LambdaImplementation where
import qualified Data.Set as S
import Data.List

data Term =
    Var
  | App Term Term
  | Lam Term
  | Close Term
  deriving (Eq,Read)

subTerms :: Term -> [Term]
subTerms term = 
  term : case term of
            Var -> []
            App t1 t2 -> subTerms t1 ++ subTerms t2
            Lam t -> subTerms t
            Close t -> subTerms t

isLambda :: Term -> Bool
isLambda (Lam _) = True
isLambda _ = False

namesBoundVars :: [String]
namesBoundVars = map (:[]) ['a'..'z'] ++ map show [0,1..]

namersFreeVars :: [String]
namersFreeVars = map (\a -> 'x':a) $ map show [0,1..]

putParens :: Bool -> String -> String
putParens True s = "(" ++ s ++ ")"
putParens False s = s

showTerm :: [String] -> [String] -> Bool -> Bool -> Term -> String
showTerm bound names insideAppRight insideLam Var = head bound
showTerm bound names insideAppRight insideLam (App x y) = 
  putParens insideAppRight (
    showTerm bound names False False x ++ " " ++ 
    showTerm bound (drop (length . filter isLambda $ subTerms x) names) True False y
  )
showTerm bound (n:names) insideAppRight insideLam (Lam t) = 
  putParens (not insideLam) $ "[" ++ n ++ "." ++ showTerm (n:bound) names False True t
showTerm (n:bound) names insideAppRight insideLam (Close t) = 
  putParens (not insideLam) $ "]" ++ n ++ "." ++ showTerm bound names False True t

-- type Env = ('')
instance Show Term where
   show = showTerm namersFreeVars namesBoundVars False True

subst :: Int -> Term -> Term -> Term
subst var value term = case term of
    Var
      | 0 == var  -> value
      | otherwise -> Var
    App e1 e2 -> App (subst var value e1) (subst var value e2)
    Lam body -> Lam (subst (var+1) value body)
    Close body
      | var > 0   -> Close (subst (var-1) value body)
      | otherwise -> body
