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

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
 open Ast
# 28 "parser.ml"
let yytransl_const = [|
  264 (* LPAR *);
  265 (* RPAR *);
  266 (* DDOTS *);
  267 (* COMA *);
  268 (* SEMICOLON *);
  269 (* RCRO *);
  270 (* LCRO *);
  271 (* CONST *);
  272 (* BOOLT *);
  273 (* BOOLF *);
  274 (* INT *);
  275 (* BOOL *);
  276 (* EOL *);
    0|]

let yytransl_block = [|
  257 (* NUM *);
  258 (* IDENT *);
  259 (* BINOP *);
  260 (* BINIF *);
  261 (* NOT *);
  262 (* ECHO *);
  263 (* SCAN *);
    0|]

let yylhs = "\255\255\
\001\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\004\000\004\000\004\000\
\005\000\005\000\006\000\007\000\008\000\009\000\009\000\009\000\
\002\000\000\000"

let yylen = "\002\000\
\002\000\001\000\003\000\001\000\003\000\001\000\003\000\001\000\
\003\000\004\000\005\000\006\000\002\000\001\000\002\000\003\000\
\001\000\001\000\001\000\004\000\002\000\001\000\003\000\003\000\
\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\026\000\000\000\000\000\000\000\000\000\
\000\000\000\000\001\000\002\000\004\000\000\000\000\000\006\000\
\008\000\021\000\000\000\000\000\000\000\025\000\013\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\017\000\018\000\
\000\000\024\000\023\000\003\000\005\000\000\000\000\000\000\000\
\007\000\009\000\020\000\000\000\000\000\010\000\011\000\000\000\
\012\000"

let yydgoto = "\002\000\
\004\000\005\000\018\000\000\000\033\000\000\000\008\000\009\000\
\010\000"

let yysindex = "\007\000\
\251\254\000\000\016\255\000\000\246\254\019\255\009\255\011\255\
\012\255\015\255\000\000\000\000\000\000\023\255\013\255\000\000\
\000\000\000\000\241\254\016\255\016\255\000\000\000\000\024\255\
\025\255\019\255\019\255\019\255\028\255\029\255\000\000\000\000\
\019\255\000\000\000\000\000\000\000\000\019\255\019\255\030\255\
\000\000\000\000\000\000\031\255\019\255\000\000\000\000\032\255\
\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\015\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000"

let yygindex = "\000\000\
\000\000\000\000\230\255\000\000\000\000\000\000\000\000\000\000\
\241\255"

let yytablesize = 41
let yytable = "\038\000\
\039\000\040\000\031\000\032\000\034\000\035\000\043\000\001\000\
\003\000\011\000\019\000\044\000\045\000\024\000\025\000\026\000\
\027\000\028\000\048\000\012\000\013\000\006\000\020\000\021\000\
\023\000\014\000\015\000\022\000\029\000\030\000\007\000\000\000\
\036\000\037\000\016\000\017\000\041\000\042\000\046\000\047\000\
\049\000"

let yycheck = "\026\000\
\027\000\028\000\018\001\019\001\020\000\021\000\033\000\001\000\
\014\001\020\001\002\001\038\000\039\000\001\001\002\001\003\001\
\004\001\005\001\045\000\001\001\002\001\006\001\012\001\012\001\
\002\001\007\001\008\001\013\001\016\001\017\001\015\001\255\255\
\009\001\009\001\016\001\017\001\009\001\009\001\009\001\009\001\
\009\001"

let yynames_const = "\
  LPAR\000\
  RPAR\000\
  DDOTS\000\
  COMA\000\
  SEMICOLON\000\
  RCRO\000\
  LCRO\000\
  CONST\000\
  BOOLT\000\
  BOOLF\000\
  INT\000\
  BOOL\000\
  EOL\000\
  "

let yynames_block = "\
  NUM\000\
  IDENT\000\
  BINOP\000\
  BINIF\000\
  NOT\000\
  ECHO\000\
  SCAN\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'prog) in
    Obj.repr(
# 19 "parser.mly"
         ( _1 )
# 152 "parser.ml"
               : Ast.prog))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 22 "parser.mly"
    ( ASTNum(_1) )
# 159 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 23 "parser.mly"
                ( ASTNum(_2) )
# 166 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 24 "parser.mly"
        ( ASTId(_1) )
# 173 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 25 "parser.mly"
                 ( ASTId(_2) )
# 180 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 26 "parser.mly"
        (ASTBool(true))
# 186 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 27 "parser.mly"
                 (ASTBool(true))
# 192 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 28 "parser.mly"
        (ASTBool(false))
# 198 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 29 "parser.mly"
                 (ASTBool(false))
# 204 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 30 "parser.mly"
                     ( ASTUnary (Ast.Not,_3) )
# 212 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 31 "parser.mly"
                            ( ASTPrim (op_of_string(_2) , _3, _4))
# 221 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 32 "parser.mly"
                                 ( ASTIf(_3,_4,_5))
# 231 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 33 "parser.mly"
             ( ASTScan(_2))
# 239 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 37 "parser.mly"
     (ASTExpres(_1))
# 246 "parser.ml"
               : 'exprs))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'exprs) in
    Obj.repr(
# 38 "parser.mly"
            (ASTExprs(_1, _2))
# 254 "parser.ml"
               : 'exprs))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exprs) in
    Obj.repr(
# 39 "parser.mly"
                      (ASTExprs(_1, _3))
# 262 "parser.ml"
               : 'exprs))
; (fun __caml_parser_env ->
    Obj.repr(
# 42 "parser.mly"
    (ASTTyprim(Ast.INT))
# 268 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 43 "parser.mly"
       (ASTTyprim(Ast.BOOL))
# 274 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'typ) in
    Obj.repr(
# 47 "parser.mly"
    ([_1])
# 281 "parser.ml"
               : 'types))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 50 "parser.mly"
                     (ASTConst(_2, _3, _4))
# 290 "parser.ml"
               : 'dec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 54 "parser.mly"
          (ASTEcho(_2))
# 298 "parser.ml"
               : 'stat))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stat) in
    Obj.repr(
# 58 "parser.mly"
     (ASTStat(_1))
# 305 "parser.ml"
               : 'cmds))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'stat) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cmds) in
    Obj.repr(
# 59 "parser.mly"
                     (ASTStatCmds(_1,_3))
# 313 "parser.ml"
               : 'cmds))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'dec) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cmds) in
    Obj.repr(
# 60 "parser.mly"
                    (ASTDecCmds(_1,_3))
# 321 "parser.ml"
               : 'cmds))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'cmds) in
    Obj.repr(
# 64 "parser.mly"
               (ASTProg(_2))
# 328 "parser.ml"
               : 'prog))
(* Entry line *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let line (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.prog)
