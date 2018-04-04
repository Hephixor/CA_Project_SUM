type token =
  | NUM of (int)
  | IDENT of (string)
  | BINOP of (string)
  | BINIF of (string)
  | NOT of (string)
  | ECHO of (string)
  | SCAN of (string)
  | LPAR
  | RPAR
  | DDOTS
  | COMA
  | SEMICOLON
  | RCRO
  | LCRO
  | CONST
  | BOOLT
  | BOOLF
  | INT
  | BOOL
  | EOL

val line :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.prog
