module LambdaImplementation where
type VarName = String
data Term =
  App Term Term
  | Abs VarName Term
  | Var VarName
 deriving (Eq, Show)

freeVar ::  Term -> [VarName]
freeVar term  = []

-- lo_red :: Term -> [Term]
-- lo_red TmAbs VarName Term =
