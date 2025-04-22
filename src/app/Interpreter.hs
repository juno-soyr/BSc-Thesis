-- |
module Interpreter where
import LambdaImplementation


findSpace :: String -> Maybe [String, String]
findSpace "" = Nothing
findSpace x:xs = if x == ' ' then

stringToLambda :: String -> Term
stringToLambda "x" = Var
stringToLambda ('l':'x':xs) = Lam ( stringToLambda xs )
stringToLambda x = App ( stringToLambda xs stringToLambda xy )
