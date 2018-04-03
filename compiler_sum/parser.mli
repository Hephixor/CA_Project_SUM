type token =
  | NUM of (int)
  | IDENT of (string)
  | BINOP of (string)
  | BINIF of (string)
  | NOT of (string)
  | ECHO of (string)
  | LPAR
  | RPAR
  | DDOTS
  | COMA
  | SEMICOLON
  | RCRO
  | LCRO
  | STAR
  | ARC
  | FUN
  | REC
  | CONST
  | BOOLT
  | BOOLF
  | INT
  | BOOL
  | EOL

val line :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.prog
