type VarName = String
data Term =
  TmApp Term Term
  | TmAbs VarName Term
  | TmVar VarName
 deriving (Eq, Show)

lou_red :: Term -> Term
lou_red TmAbs VarName Term =
