type VarName = String

data Term =
  TmVar VarName
  | TmAbs VarName Term
  | TmApp Term Term deriving (Eq, Show)

eval :: Term -> Term
eval (TmApp (TmAbs x t12) v2@(TmAbs _ _))
eval (TmApp t1 t2)
eval _ = error "No rule applies"
