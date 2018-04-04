type op = Add | Mul | Sub | Div | Not | And | Or | Eq | Lt | Gt | Loe | Goe | True | False | None_op
type tprim = INT | BOOL | None_tprim
type kw = Echo | Const | Scan | None_kw

let string_of_op op =
match op with
Add -> "+"
| Mul -> "*"
| Sub -> "-"
| Div -> "/"
| True -> "true"
| False -> "false"
| Not -> "not"
| And -> "and"
| Or -> "or"
| Eq -> "eq"
| Lt -> "<"
| Gt -> ">"
| Loe -> "<="
| Goe -> ">="
| None_op -> ""


let string_of_tprim sp =
match sp with
| INT -> "int"
| BOOL -> "bool"
| None_tprim -> ""


let tprim_of_string sp =
match sp with
| "int" -> INT
| "bool" -> BOOL
| _ -> None_tprim


let string_of_kw kw =
match kw with
Echo -> "print"
| Const -> "let"
| None_kw -> ""
let kw_of_string kw =
match kw with
"echo" -> Echo
| "const" -> Const
| _ -> None_kw

let op_of_string op =
match op with
"+" -> Add
| "*" -> Mul
| "-" -> Sub
| "/" -> Div
| "true" -> True
| "false" -> False
| "not" -> Not
| "and" -> And
| "or" -> Or
| "eq" -> Eq
| "<" -> Lt
| ">" -> Gt
| "<=" -> Loe
| ">=" -> Goe
| _ -> None_op

type typ =
 ASTTyprim of tprim

type expr =
ASTNum of int
| ASTId of string
| ASTBool of bool
| ASTUnary of op * expr
| ASTPrim of op * expr * expr
| ASTIf of expr * expr * expr
| ASTScan of string
and exprs =
ASTExpres of expr
| ASTExprs of expr * exprs


type stat =
ASTEcho of expr

type dec =
ASTConst of string * typ * expr

type cmds =
ASTStat of stat
| ASTStatCmds of stat * cmds
| ASTDecCmds of dec * cmds

type prog =
ASTProg of cmds
