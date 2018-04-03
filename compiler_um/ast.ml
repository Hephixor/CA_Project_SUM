type op = Add | Mul | Sub | Div | Not | And | Or | Eq | Lt | True | False | None_op
type tprim = INT | BOOL | None_tprim
type kw = Echo | Const | None_kw

let string_of_op op =
match op with
Add -> "add"
| Mul -> "mul"
| Sub -> "sub"
| Div -> "div"
| True -> "true"
| False -> "false"
| Not -> "not"
| And -> "and"
| Or -> "or"
| Eq -> "eq"
| Lt -> "lt"
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
Echo -> "echo"
| Const -> "const"
| None_kw -> ""
let kw_of_string kw =
match kw with
"echo" -> Echo
| "const" -> Const
| _ -> None_kw

let op_of_string op =
match op with
"add" -> Add
| "mul" -> Mul
| "sub" -> Sub
| "div" -> Div
| "true" -> True
| "false" -> False
| "not" -> Not
| "and" -> And
| "or" -> Or
| "eq" -> Eq
| "lt" -> Lt
| _ -> None_op

type typ =
 ASTTyprim of tprim
|ASTTyfun of typ list * typ

type expr =
ASTNum of int
| ASTId of string
| ASTBool of bool
| ASTUnary of op * expr
| ASTPrim of op * expr * expr
| ASTApp of expr * exprs
| ASTIf of expr * expr * expr
| ASTAbstr of args * expr
and exprs =
ASTExpres of expr
| ASTExprs of expr * exprs
and arg =
ASTArgument of string * typ
and args =
ASTArg of arg
| ASTArgs of arg * args





type stat =
ASTEcho of expr

type dec =
ASTConst of string * typ * expr
|ASTFun of string * typ * args * expr
|ASTFRec of string * typ * args * expr

type cmds =
ASTStat of stat
| ASTStatCmds of stat * cmds
| ASTDecCmds of dec * cmds

type prog =
ASTProg of cmds
