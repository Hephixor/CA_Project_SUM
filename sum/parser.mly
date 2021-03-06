%{
 open Ast
%}
%token <int> NUM
%token <string> IDENT
%token <string> BINOP
%token <string> BINIF
%token <string> NOT ECHO SCAN
%token LPAR RPAR DDOTS COMA SEMICOLON RCRO LCRO
%token CONST
%token BOOLT BOOLF
%token INT BOOL
%token EOL
%start line
%type <Ast.prog> line

%%
line:
prog EOL { $1 }
;
expr:
NUM { ASTNum($1) }
| LPAR NUM RPAR { ASTNum($2) }
| IDENT { ASTId($1) }
| LPAR IDENT RPAR{ ASTId($2) }
| BOOLT {ASTBool(true)}
| LPAR BOOLT RPAR{ASTBool(true)}
| BOOLF {ASTBool(false)}
| LPAR BOOLF RPAR{ASTBool(false)}
| LPAR NOT expr RPAR { ASTUnary (Ast.Not,$3) }
| LPAR BINOP expr expr RPAR { ASTPrim (op_of_string($2) , $3, $4)}
| LPAR BINIF expr expr expr RPAR { ASTIf($3,$4,$5)}
| SCAN IDENT { ASTScan($2)}
;

exprs:
expr {ASTExpres($1)}
|expr exprs {ASTExprs($1, $2)}
|expr SEMICOLON exprs {ASTExprs($1, $3)}

typ:
INT {ASTTyprim(Ast.INT)}
| BOOL {ASTTyprim(Ast.BOOL)}
;

types:
typ {[$1]}

dec:
CONST IDENT typ expr {ASTConst($2, $3, $4)}
;

stat:
ECHO expr {ASTEcho($2)}
;

cmds:
stat {ASTStat($1)}
|stat SEMICOLON cmds {ASTStatCmds($1,$3)}
|dec SEMICOLON cmds {ASTDecCmds($1,$3)}
;

prog:
LCRO cmds RCRO {ASTProg($2)}
;
