-- |
module Interpreter where
import LambdaImplementation
import LambdaParser
import Control.Monad (unless)
import System.IO (hFlush, stdout)

parseAndStep :: String -> IO()
parseAndStep s = do
    print $ "Input: " ++ s
    case parseAll term s of
        Left e -> print e
        Right term -> do
            print $ "Parsed: " ++ show term
            print (eval term)

repl :: IO ()
repl = do
    putStr "l-interpreter >>> "
    hFlush stdout
    line <- getLine
    unless (line == ":q") $ do
        if line == "test"
            then do
                let expr = App (Lam (App Var Var)) (App (Lam Var) (Lam Var))
                print (eval expr)
            else do
                case parseAll term line of
                    Left e -> print e
                    Right term -> print (eval term)
        repl


evalStep :: Term -> Maybe Term
evalStep term = case term of
    App (Lam body) e2 -> Just (subst 0 e2 body)
    App e1 e2 -> case evalStep e1 of
        Just e1' -> Just (App e1' e2)
        Nothing  -> App e1 <$> evalStep e2
    Lam body -> Lam <$> evalStep body
    Close body -> Close <$> evalStep body
    Var -> Nothing

eval :: Term -> Term
eval term = maybe term eval (evalStep term)