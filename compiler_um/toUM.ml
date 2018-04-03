open Ast
open Printf
let oc = open_out "../outUM.um"

let rec print_prolog_expr e =
match e with
ASTNum n -> fprintf oc "%d" n
| ASTId x -> fprintf oc  "%s" x
| ASTBool x -> fprintf oc "\"%b\"" x
| ASTUnary(op, e) -> (
  fprintf oc "%s" (string_of_op op);
  fprintf oc "( ";
  print_prolog_expr e;
  fprintf oc ") "
  )
| ASTPrim(op, e1, e2) -> (
    fprintf oc  "%s" (string_of_op op);
    fprintf oc "( ";
    print_prolog_expr e1;
    fprintf oc ", ";
    print_prolog_expr e2;
    fprintf oc ") "
    )
| ASTApp(e1,e2) -> (
  fprintf oc "app(";
  print_prolog_expr e1;
  fprintf oc  ",";
  print_prolog_exprs e2;
  fprintf oc ")"
  )
| ASTIf(e1,e2,e3) -> (
  fprintf oc "if";
  fprintf oc  "( ";
  print_prolog_expr e1;
  fprintf oc  ", ";
  print_prolog_expr e2;
  fprintf oc  ", ";
  print_prolog_expr e3;
  fprintf oc  ") "
  )
| ASTAbstr (ar,ex) -> (
   fprintf oc  "abstr([ ";
   print_prolog_args ar;
   fprintf oc  " ],";
   print_prolog_expr ex;
   fprintf oc ")"
  )
and print_prolog_dec d =
  match d with
  ASTConst(ide, ty, x) -> (
      fprintf oc "const(%s" ide;
      fprintf oc ", ";
      print_prolog_typ ty;
      fprintf oc ", ";
      print_prolog_expr x;
      fprintf oc ") ";
      )
  | ASTFun(ide,ty,args,expr) -> (
    fprintf oc "fun(%s, [" ide;
    print_prolog_args args;
    fprintf oc "], ";
    print_prolog_typ ty;
    fprintf oc ", ";
    print_prolog_expr expr;
    fprintf oc " ) "
    )
  | ASTFRec(ide,ty,args,expr) -> (
    fprintf oc "funrec(%s, [" ide;
    print_prolog_args args;
    fprintf oc "] , ";
    print_prolog_typ ty;
    fprintf oc " , [ ";
    print_prolog_expr expr;
    fprintf oc " ]) "
    )
and print_prolog_exprs es =
  match es with
  | ASTExpres e -> print_prolog_expr e
  | ASTExprs(e, e') ->(
    print_prolog_expr e;
    print_prolog_exprs e')
and print_prolog_arg s =
  match s with
  ASTArgument(s,t) ->(
    fprintf oc " (%s," s;
    print_prolog_typ t;
    fprintf oc ") "
    )
and print_prolog_args ags =
  match ags with
   ASTArg(s) -> print_prolog_arg s
  | ASTArgs(s, s') -> (
    print_prolog_arg s;
    fprintf oc  ", ";
    print_prolog_args s'
  )
  and print_prolog_typ t =
    match t with
    ASTTyprim t ->(
        fprintf oc "%s" (string_of_tprim t)
        )
    | ASTTyfun(ts,t) -> (
        fprintf oc " fleche([";
        print_prolog_typs ts;
        fprintf oc "], ";
        print_prolog_typ t;
        fprintf oc ") "
      )
  and print_prolog_typs ts =
    match ts with
       [] -> ()
      |t::[] -> print_prolog_typ t
      | t::ts -> (
        print_prolog_typ t;
        fprintf oc ", ";
        print_prolog_typs ts
        )

and print_prolog_stat p =
  match p with
  ASTEcho p -> (
    fprintf oc " echo( ";
    print_prolog_expr p;
    fprintf oc ") "
    )
and print_prolog_cmds cmd =
match cmd with
|ASTStat cmd ->(
  print_prolog_stat cmd;
  )
|ASTStatCmds (c,m) ->(
  print_prolog_stat c;
  fprintf oc " , ";
  print_prolog_cmds m)
|ASTDecCmds (cmd,a) -> (
  print_prolog_dec cmd;
  fprintf oc " , ";
  print_prolog_cmds a
  )
and print_prolog_prog ppp =
match ppp with
ASTProg ppp -> (
  fprintf oc "[";
  print_prolog_cmds ppp;
  fprintf oc " ]";
  )

let _ =
try

let ic = open_in "../sum.txt" in
  let n = in_channel_length ic in
  let lines = Bytes.create n in
  really_input ic lines 0 n;
  close_in ic;

let lexbuf = Lexing.from_string lines in
let e = Parser.line Lexer.token lexbuf in
print_prolog_prog e;
with Lexer.Eof -> exit 0
