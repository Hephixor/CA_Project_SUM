open Ast
open Printf
let oc = open_out_bin "../data/outUM.um"

let rec print_um_expr e =
match e with
ASTNum n -> fprintf oc "%d" n
| ASTId x -> fprintf oc  "%s" x
| ASTBool x -> fprintf oc "\"%b\"" x
| ASTUnary(op, e) -> (
  fprintf oc "%s" (string_of_op op);
  fprintf oc "( ";
  print_um_expr e;
  fprintf oc ") "
  )
| ASTPrim(op, e1, e2) -> (
    fprintf oc  "%s" (string_of_op op);
    fprintf oc "( ";
    print_um_expr e1;
    fprintf oc ", ";
    print_um_expr e2;
    fprintf oc ") "
    )
| ASTApp(e1,e2) -> (
  fprintf oc "app(";
  print_um_expr e1;
  fprintf oc  ",";
  print_um_exprs e2;
  fprintf oc ")"
  )
| ASTIf(e1,e2,e3) -> (
  fprintf oc "if";
  fprintf oc  "( ";
  print_um_expr e1;
  fprintf oc  ", ";
  print_um_expr e2;
  fprintf oc  ", ";
  print_um_expr e3;
  fprintf oc  ") "
  )
| ASTAbstr (ar,ex) -> (
   fprintf oc  "abstr([ ";
   print_um_args ar;
   fprintf oc  " ],";
   print_um_expr ex;
   fprintf oc ")"
  )
and print_um_dec d =
  match d with
  ASTConst(ide, ty, x) -> (
      fprintf oc "const(%s" ide;
      fprintf oc ", ";
      print_um_typ ty;
      fprintf oc ", ";
      print_um_expr x;
      fprintf oc ") ";
      )
  | ASTFun(ide,ty,args,expr) -> (
    fprintf oc "fun(%s, [" ide;
    print_um_args args;
    fprintf oc "], ";
    print_um_typ ty;
    fprintf oc ", ";
    print_um_expr expr;
    fprintf oc " ) "
    )
  | ASTFRec(ide,ty,args,expr) -> (
    fprintf oc "funrec(%s, [" ide;
    print_um_args args;
    fprintf oc "] , ";
    print_um_typ ty;
    fprintf oc " , [ ";
    print_um_expr expr;
    fprintf oc " ]) "
    )
and print_um_exprs es =
  match es with
  | ASTExpres e -> print_um_expr e
  | ASTExprs(e, e') ->(
    print_um_expr e;
    print_um_exprs e')
and print_um_arg s =
  match s with
  ASTArgument(s,t) ->(
    fprintf oc " (%s," s;
    print_um_typ t;
    fprintf oc ") "
    )
and print_um_args ags =
  match ags with
   ASTArg(s) -> print_um_arg s
  | ASTArgs(s, s') -> (
    print_um_arg s;
    fprintf oc  ", ";
    print_um_args s'
  )
  and print_um_typ t =
    match t with
    ASTTyprim t ->(
        fprintf oc "%s" (string_of_tprim t)
        )
    | ASTTyfun(ts,t) -> (
        fprintf oc " fleche([";
        print_um_typs ts;
        fprintf oc "], ";
        print_um_typ t;
        fprintf oc ") "
      )
  and print_um_typs ts =
    match ts with
       [] -> ()
      |t::[] -> print_um_typ t
      | t::ts -> (
        print_um_typ t;
        fprintf oc ", ";
        print_um_typs ts
        )

and print_um_stat p =
  match p with
  ASTEcho p -> (
    fprintf oc "%x" 14;
    fprintf oc "%x" 0;
    fprintf oc "%x" 0;
    fprintf oc "%x" 0;
    print_um_expr p;
    )
and print_um_cmds cmd =
match cmd with
|ASTStat cmd ->(
  print_um_stat cmd;
  )
|ASTStatCmds (c,m) ->(
  print_um_stat c;
  fprintf oc " , ";
  print_um_cmds m)
|ASTDecCmds (cmd,a) -> (
  print_um_dec cmd;
  fprintf oc " , ";
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
