module LambdaImplementation where
import qualified Data.Set as S
type VarName = Int
data Term =
  Var VarName
  | App Term Term
  | Abs VarName Term
 deriving (Eq, Show)



-- ADBMAL Notation / DeBruijn Notation for solving capturing issues
