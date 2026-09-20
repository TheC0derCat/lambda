data Token
    = Lambda 
    | Variable Char 
    | Seperator
    | OpeningBracket
    | ClosingBracket
    deriving (Show)

lexch :: Char -> Token
lexch c = case c of 
    'λ' -> Lambda
    '.' -> Seperator
    '(' -> OpeningBracket
    ')' -> ClosingBracket
    _ -> Variable (c)

lexer :: String -> [Token]
lexer code = map lexch code

main :: IO ()
main = putStrLn "Hello World!"

