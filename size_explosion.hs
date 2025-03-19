type VarName = String

data Term =
    TmVar VarName
    | TmAbs VarName Term
    | TmApp Term Term deriving (Eq, Show)
