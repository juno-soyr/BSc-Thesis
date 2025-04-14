module LambdaImplementation where
import qualified Data.Set as S
type VarName = Int
data Term =
  Var VarName
  | App Term Term
  | Abs VarName Term
 deriving (Eq, Show)

replace :: VarName -> Term -> Term -> Term
replace y x (Var z)
  | z == y = x
  | otherwise = Var z
replace y x (App z w) = App (replace y x z) (replace y x w)
replace y x (Abs z w) = Abs z (replace y x w)

loBeta :: Term -> Term
loBeta (App (Abs x y) z) = replace x y z
loBeta (App x y) = App (loBeta x) (loBeta y)
lobeta (Abs x y) = Abs x (loBeta y)
loBeta (Var x) = Var x
