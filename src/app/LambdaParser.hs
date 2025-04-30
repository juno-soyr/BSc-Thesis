-- -- Author: Haileselassie Gaspar
-- -- 2025

module LambdaParser where
import LambdaImplementation

import Text.ParserCombinators.Parsec
import qualified Text.Parsec.Token as P
import Text.Parsec.Language (haskellDef)

lexer = P.makeTokenParser haskellDef

parens = P.parens lexer
symbol = P.symbol lexer

var = do symbol "o"; return Var
lambda = do symbol "["; body <- term; return (Lam body) 
close = do symbol "]"; body <- term; return (Close body) 
term = do; terms <- many1 termNoApp; return (foldl1 App terms) 
termNoApp = parens term <|> var <|> lambda <|> close

parseAll :: Parser a -> String -> Either ParseError a
parseAll p s = parse (p <* eof) [] s
