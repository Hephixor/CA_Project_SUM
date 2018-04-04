{
open Parser (* The type token is defined in parser.mli *)
exception Eof
}
rule token = parse
[' ' '\t'] { token lexbuf } (* skip blanks *)
| ['\n' ] { EOL }
| "true" { BOOLT}
| "false" {BOOLF}
| ['-']?['0'-'9']+('.'['0'-'9'])? as lxm { NUM(int_of_string lxm) }
| "if" as op { BINIF(op) }
| "++" as op { BINOP(op) }
| "--" as op { BINOP(op) }
| "**" as op { BINOP(op) }
| "//" as op { BINOP(op) }
| "not" as op { NOT(op) }
| "and" as op { BINOP(op) }
| "or" as op { BINOP(op) }
| "eq" as op { BINOP(op) }
| "<<" as op { BINOP(op) }
| ">>" as op { BINOP(op) }
| "<=" as op { BINOP(op) }
| ">=" as op { BINOP(op) }
| "print" as kw { ECHO(kw) }
| "let" { CONST }
| "int" { INT }
| "bool" { BOOL }
| "scan" as var { SCAN(var)}
| ';' { SEMICOLON }
| ':' { DDOTS }
| ',' { COMA }
| '[' { LCRO }
| ']' { RCRO }
| '(' { LPAR }
| ')' { RPAR }
| ['a'-'z''A'-'Z']['a'-'z''A'-'Z''0'-'9']* as id { IDENT(id) }
| eof { raise Eof }
