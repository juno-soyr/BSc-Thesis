-- Author: Haileselassie Gaspar
-- 2025

module LambdaParser where
import LambdaImplementation

{-
string2list :: String -> [String]
string2list str = case str of 
    ('\\':ys) -> Lam (findDot ys) rest
    where findDot str ->
-}
parseLambda :: [String] -> Term
parseLambda expr = case expr of
    ("\\" : y : "." : rest) -> Lam y (parseLambda rest)
    [x] -> Var x
    (x : xs) -> App (Var x) (parseLambda xs)
    [] -> error "Empty expression"
