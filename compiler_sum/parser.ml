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

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
 open Ast
# 31 "parser.ml"
let yytransl_const = [|
  263 (* LPAR *);
  264 (* RPAR *);
  265 (* DDOTS *);
  266 (* COMA *);
  267 (* SEMICOLON *);
  268 (* RCRO *);
  269 (* LCRO *);
  270 (* STAR *);
  271 (* ARC *);
  272 (* FUN *);
  273 (* REC *);
  274 (* CONST *);
  275 (* BOOLT *);
  276 (* BOOLF *);
  277 (* INT *);
  278 (* BOOL *);
  279 (* EOL *);
    0|]

let yytransl_block = [|
  257 (* NUM *);
  258 (* IDENT *);
  259 (* BINOP *);
  260 (* BINIF *);
  261 (* NOT *);
  262 (* ECHO *);
    0|]

let yylhs = "\255\255\
\001\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\005\000\005\000\
\005\000\006\000\006\000\006\000\006\000\007\000\007\000\008\000\
\004\000\004\000\009\000\009\000\009\000\010\000\011\000\011\000\
\011\000\002\000\000\000"

let yylen = "\002\000\
\002\000\001\000\003\000\001\000\003\000\001\000\003\000\001\000\
\003\000\004\000\004\000\005\000\006\000\004\000\001\000\002\000\
\003\000\001\000\001\000\005\000\005\000\001\000\003\000\003\000\
\001\000\003\000\004\000\007\000\008\000\002\000\001\000\003\000\
\003\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\035\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\001\000\002\000\004\000\000\000\000\000\
\006\000\008\000\030\000\000\000\000\000\000\000\000\000\000\000\
\034\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\018\000\019\000\000\000\
\000\000\000\000\033\000\032\000\003\000\005\000\000\000\000\000\
\000\000\007\000\009\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\027\000\000\000\000\000\010\000\
\000\000\016\000\014\000\024\000\011\000\026\000\000\000\000\000\
\000\000\000\000\000\000\012\000\000\000\017\000\023\000\000\000\
\000\000\000\000\000\000\013\000\021\000\020\000\028\000\000\000\
\029\000"

let yydgoto = "\002\000\
\004\000\005\000\052\000\035\000\053\000\057\000\058\000\036\000\
\009\000\010\000\011\000"

let yysindex = "\001\000\
\249\254\000\000\082\255\000\000\245\254\043\255\001\255\025\255\
\019\255\022\255\023\255\000\000\000\000\000\000\012\255\041\255\
\000\000\000\000\000\000\030\255\046\255\030\255\082\255\082\255\
\000\000\045\255\051\255\043\255\043\255\043\255\059\255\062\255\
\043\255\052\255\063\255\069\255\030\255\000\000\000\000\068\255\
\030\255\043\255\000\000\000\000\000\000\000\000\043\255\043\255\
\077\255\000\000\000\000\027\255\085\255\030\255\043\255\041\255\
\070\255\056\255\041\255\089\255\000\000\091\255\043\255\000\000\
\043\255\000\000\000\000\000\000\000\000\000\000\030\255\075\255\
\030\255\092\255\041\255\000\000\097\255\000\000\000\000\030\255\
\098\255\043\255\095\255\000\000\000\000\000\000\000\000\043\255\
\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\096\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\053\255\067\255\000\000\000\000\000\000\076\255\090\255\
\000\000\000\000\000\000\023\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\103\255\000\000\000\000\000\000\000\000\
\086\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000"

let yygindex = "\000\000\
\000\000\000\000\250\255\201\255\212\255\241\255\041\000\000\000\
\000\000\000\000\243\255"

let yytablesize = 112
let yytable = "\019\000\
\070\000\001\000\020\000\074\000\040\000\003\000\042\000\066\000\
\033\000\043\000\044\000\012\000\026\000\027\000\028\000\029\000\
\030\000\021\000\015\000\083\000\078\000\047\000\048\000\049\000\
\016\000\060\000\022\000\013\000\014\000\023\000\031\000\032\000\
\024\000\015\000\025\000\061\000\037\000\065\000\068\000\016\000\
\062\000\063\000\034\000\013\000\014\000\017\000\018\000\041\000\
\069\000\015\000\038\000\039\000\045\000\002\000\002\000\016\000\
\077\000\081\000\046\000\002\000\054\000\017\000\018\000\072\000\
\085\000\002\000\050\000\004\000\004\000\051\000\073\000\002\000\
\002\000\004\000\055\000\087\000\006\000\006\000\056\000\004\000\
\059\000\089\000\006\000\071\000\064\000\004\000\004\000\006\000\
\006\000\080\000\008\000\008\000\067\000\022\000\006\000\006\000\
\008\000\007\000\076\000\008\000\022\000\075\000\008\000\082\000\
\084\000\086\000\088\000\031\000\008\000\008\000\015\000\079\000"

let yycheck = "\006\000\
\056\000\001\000\002\001\059\000\020\000\013\001\022\000\052\000\
\015\000\023\000\024\000\023\001\001\001\002\001\003\001\004\001\
\005\001\017\001\007\001\075\000\065\000\028\000\029\000\030\000\
\013\001\041\000\002\001\001\001\002\001\011\001\019\001\020\001\
\011\001\007\001\012\001\042\000\007\001\011\001\054\000\013\001\
\047\000\048\000\002\001\001\001\002\001\019\001\020\001\002\001\
\055\000\007\001\021\001\022\001\008\001\001\001\002\001\013\001\
\063\000\073\000\008\001\007\001\009\001\019\001\020\001\008\001\
\080\000\013\001\008\001\001\001\002\001\008\001\015\001\019\001\
\020\001\007\001\012\001\082\000\001\001\002\001\010\001\013\001\
\013\001\088\000\007\001\014\001\008\001\019\001\020\001\006\001\
\013\001\015\001\001\001\002\001\008\001\008\001\019\001\020\001\
\007\001\016\001\008\001\018\001\015\001\013\001\013\001\012\001\
\008\001\008\001\012\001\012\001\019\001\020\001\008\001\071\000"

let yynames_const = "\
  LPAR\000\
  RPAR\000\
  DDOTS\000\
  COMA\000\
  SEMICOLON\000\
  RCRO\000\
  LCRO\000\
  STAR\000\
  ARC\000\
  FUN\000\
  REC\000\
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
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'prog) in
    Obj.repr(
# 19 "parser.mly"
         ( _1 )
# 194 "parser.ml"
               : Ast.prog))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 22 "parser.mly"
    ( ASTNum(_1) )
# 201 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 23 "parser.mly"
                ( ASTNum(_2) )
# 208 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 24 "parser.mly"
        ( ASTId(_1) )
# 215 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 25 "parser.mly"
                 ( ASTId(_2) )
# 222 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 26 "parser.mly"
        (ASTBool(true))
# 228 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 27 "parser.mly"
                 (ASTBool(true))
# 234 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 28 "parser.mly"
        (ASTBool(false))
# 240 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 29 "parser.mly"
                 (ASTBool(false))
# 246 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 30 "parser.mly"
                     ( ASTUnary (Ast.Not,_3) )
# 254 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'args) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 31 "parser.mly"
                      (ASTAbstr (_2,_4))
# 262 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 32 "parser.mly"
                            ( ASTPrim (op_of_string(_2) , _3, _4))
# 271 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 33 "parser.mly"
                                 ( ASTIf(_3,_4,_5))
# 281 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'exprs) in
    Obj.repr(
# 34 "parser.mly"
                       ( ASTApp(_2,_3))
# 289 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 38 "parser.mly"
     (ASTExpres(_1))
# 296 "parser.ml"
               : 'exprs))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'exprs) in
    Obj.repr(
# 39 "parser.mly"
            (ASTExprs(_1, _2))
# 304 "parser.ml"
               : 'exprs))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exprs) in
    Obj.repr(
# 40 "parser.mly"
                      (ASTExprs(_1, _3))
# 312 "parser.ml"
               : 'exprs))
; (fun __caml_parser_env ->
    Obj.repr(
# 43 "parser.mly"
    (ASTTyprim(Ast.INT))
# 318 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 44 "parser.mly"
       (ASTTyprim(Ast.BOOL))
# 324 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'types) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    Obj.repr(
# 45 "parser.mly"
                          ( ASTTyfun(_2,_4))
# 332 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'types) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'typ) in
    Obj.repr(
# 46 "parser.mly"
                          ( ASTTyfun(_2,_5))
# 340 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'typ) in
    Obj.repr(
# 50 "parser.mly"
    ([_1])
# 347 "parser.ml"
               : 'types))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'typ) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'types) in
    Obj.repr(
# 51 "parser.mly"
                (_1::_3)
# 355 "parser.ml"
               : 'types))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'typ) in
    Obj.repr(
# 55 "parser.mly"
                (ASTArgument(_1,_3))
# 363 "parser.ml"
               : 'arg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'arg) in
    Obj.repr(
# 59 "parser.mly"
    (ASTArg(_1))
# 370 "parser.ml"
               : 'args))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arg) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'args) in
    Obj.repr(
# 60 "parser.mly"
               (ASTArgs(_1,_3))
# 378 "parser.ml"
               : 'args))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 64 "parser.mly"
                     (ASTConst(_2, _3, _4))
# 387 "parser.ml"
               : 'dec))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'typ) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'args) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 65 "parser.mly"
                                   (ASTFun(_2,_3,_5,_7))
# 397 "parser.ml"
               : 'dec))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 4 : 'typ) in
    let _6 = (Parsing.peek_val __caml_parser_env 2 : 'args) in
    let _8 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 66 "parser.mly"
                                       (ASTFRec(_3,_4,_6,_8))
# 407 "parser.ml"
               : 'dec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 70 "parser.mly"
          (ASTEcho(_2))
# 415 "parser.ml"
               : 'stat))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stat) in
    Obj.repr(
# 74 "parser.mly"
     (ASTStat(_1))
# 422 "parser.ml"
               : 'cmds))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'stat) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cmds) in
    Obj.repr(
# 75 "parser.mly"
                     (ASTStatCmds(_1,_3))
# 430 "parser.ml"
               : 'cmds))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'dec) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cmds) in
    Obj.repr(
# 76 "parser.mly"
                    (ASTDecCmds(_1,_3))
# 438 "parser.ml"
               : 'cmds))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'cmds) in
    Obj.repr(
# 80 "parser.mly"
               (ASTProg(_2))
# 445 "parser.ml"
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
