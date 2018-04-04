open Ast
open Printf
open Bytes
let oc = open_out_bin "../data/outUM.um"

let opSpeciaux oc a n =
  output_byte oc ( (13 lsl 4) lor ( (a lsl 1) lor (n lsr 24) ) );
  output_byte oc ( (n lsl 8) lsr 24);
  output_byte oc ( (n lsl 16) lsr 24);
  output_byte oc ( (n lsl 24) lsr 24)

let opStandards oc op a b c =
  output_byte oc (op lsl 4);
  output_byte oc 0;
  output_byte oc (a lsr 2);
  output_byte oc (((a lsl 30) lsr 24) lor ( (b lsl 3) lor c))

let print oc s =
  let rec aux i =
    if i<(String.length s) then
      let n = Char.code (String.get s i) in
      opSpeciaux oc 0 n;
      opStandards oc 10 0 0 0;
      aux (i+1)
  in
  aux 0;
  opSpeciaux oc 0 10;
  opStandards oc 10 0 0 0



let rec print_um_expr e =
match e with
ASTNum n ->  n
| ASTId x -> int_of_string x
| ASTBool x -> 0
| ASTUnary(op, e) -> 0
| ASTPrim(op, e1, e2) -> 0
| ASTApp(e1,e2) -> 0
| ASTIf(e1,e2,e3) -> 0
| ASTAbstr (ar,ex) -> 0
and print_um_dec d =
  match d with
  ASTConst(ide, ty, x) -> 0
  | ASTFun(ide,ty,args,expr) -> 0
  | ASTFRec(ide,ty,args,expr) -> 0
and print_um_exprs es =
  match es with
  | ASTExpres e -> print_um_expr e
  | ASTExprs(e, e') ->0
and print_um_arg s =
  match s with
  ASTArgument(s,t) ->0
and print_um_args ags =
  match ags with
   ASTArg(s) -> print_um_arg s
  | ASTArgs(s, s') -> 0
  and print_um_typ t =
    match t with
    ASTTyprim t -> 0
    | ASTTyfun(ts,t) -> 0
  and print_um_typs ts =
    match ts with
       [] -> 0
      |t::[] -> print_um_typ t
      | t::ts -> 0
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
  )
|ASTDecCmds (cmd,a) -> (
  print_um_dec cmd;

  print_um_cmds a
  )
and print_um_prog ppp =
match ppp with
ASTProg ppp -> (
  print_um_cmds ppp;
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
