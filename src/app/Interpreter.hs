-- |
module Interpreter where
import LambdaImplementation
import Control.Monad (unless)
import System.IO (hFlush, stdout)

repl :: IO ()
repl = do
    putStr "l-interpreter >>> "
    hFlush stdout
    line <- getLine
    unless (line == ":q") $ do
        if line == "test"
            then do
                let expr = App (Lam "x" (App (Var "x") (Var "x"))) (App (Lam "x" (Var "x")) (Var "x"))
                print (eval expr)
            else do
                print line
        repl


evalStep :: Term -> Maybe Term
evalStep term = case term of
    App (Lam x body) e2 -> Just (subst x e2 body)
    App e1 e2 -> case evalStep e1 of
        Just e1' -> Just (App e1' e2)
        Nothing  -> App e1 <$> evalStep e2
    Lam x body -> Lam x <$> evalStep body
    Var _ -> Nothing



eval :: Term -> Term
eval term = maybe term eval (evalStep term)