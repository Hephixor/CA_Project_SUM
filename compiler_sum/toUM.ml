open Ast
open Printf
open Bytes
let oc = open_out_bin "../data/outUM.um"

let specOp oc a n =
  output_byte oc ((13 lsl 4) lor ((a lsl 1) lor (n lsr 24) ) );
  output_byte oc ((n lsl 8) lsr 24);
  output_byte oc ((n lsl 16) lsr 24);
  output_byte oc ((n lsl 24) lsr 24)

let standOp oc op a b c =
  output_byte oc (op lsl 4);
  output_byte oc 0;
  output_byte oc (a lsr 2);
  output_byte oc (((a lsl 30) lsr 24) lor ((b lsl 3) lor c))

let print oc s =
  let rec aux i =
    if i<(String.length s) then
      let n = Char.code (String.get s i) in
      specOp oc 0 n;
      standOp oc 10 0 0 0;
      aux (i+1)
  in
  aux 0;
  specOp oc 0 10;
  standOp oc 10 0 0 0


let rec print_um_expr e =
match e with
ASTNum n ->  n
| ASTId x ->  int_of_string x
| ASTBool x -> (
  match x with
  true -> 1
  |false -> 0
)
| ASTUnary(op, e) -> (
  match op with
  Add -> 0
  |Sub -> 0
  |Mul -> 0
  |Div -> 0
  |Not -> 0
  |And -> 0
  |Or -> 0
  |Eq -> 0
  |Lt -> 0
  |Gt -> 0
  |Loe -> 0
  |Goe -> 0
  |True -> 1
  |False -> 0
  |None_op -> 0
)
| ASTPrim(op, e1, e2) -> 0
| ASTIf(e1,e2,e3) -> 0
| ASTScan(e) -> 0

and print_um_dec d =
  match d with
  ASTConst(ide, ty, x) -> 0

and print_um_exprs es =
  match es with
  | ASTExpres e -> print_um_expr e
  | ASTExprs(e, e') -> (
    print_um_expr e;
    print_um_exprs e'
  )

and print_um_stat p =
  match p with
  ASTEcho p -> (
    print oc (string_of_int (print_um_expr p))
    )

and print_um_cmds cmd =
match cmd with
|ASTStat cmd ->(
  print_um_stat cmd;
  )
|ASTStatCmds (c,m) ->(
  print_um_stat c;
  print_um_cmds m
  )
|ASTDecCmds (cmd,a) -> (
  print_um_dec cmd;
  print_um_cmds a
  )

and print_um_prog ppp =
match ppp with
ASTProg ppp -> (
  print_um_cmds ppp;
  standOp oc 7 0 0 0
  )

let _ =
try
let ic = open_in "../data/sum.sum" in
  let n = in_channel_length ic in
  let lines = Bytes.create n in
  really_input ic lines 0 n;
  close_in ic;

let lexbuf = Lexing.from_string lines in
let e = Parser.line Lexer.token lexbuf in
print_um_prog e;
with Lexer.Eof -> exit 0
