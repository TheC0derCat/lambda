data Token
    = Lambda 
    | Identifier Char 
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
    _ -> Identifier (c)

filterWhiteSpace :: String -> String
filterWhiteSpace text = filter (\x -> not (x == ' ' || x == '\n' || x == '\t')) text

lexer :: String -> [Token]
lexer code = map lexch (filterWhiteSpace code)

data Function = Function {
    input :: Char,
    body :: LambdaTerm
} deriving (Show)

data LambdaTerm
    = Variable Char
    | Abstraction Function
    | Application Function LambdaTerm
    | End
    deriving (Show)

parser :: [Token] -> Int -> LambdaTerm
parser tokens i = case tokens!!i of
    Lambda -> Abstraction (Function
        (case tokens!!(i + 1) of
            Identifier c -> c
        ) (parser tokens (i + 3)) )
    Identifier i -> Variable i
    Seperator -> error "cant use seperator as expression"
    OpeningBracket -> parser tokens (i + 1) 
    ClosingBracket -> End

process :: String -> LambdaTerm
process code = parser (lexer code) 0

main :: IO ()
main = putStrLn "Hello World!"

