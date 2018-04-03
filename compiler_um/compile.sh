ocamllex -o lexer.ml lexer.mll;
ocamlc -c ast.ml;
ocamlyacc -bparser parser.mly;
ocamlc -c ast.cmo parser.mli;
ocamlc -c ast.cmo lexer.ml;
ocamlc -c ast.cmo parser.ml;
ocamlc -c ast.cmo toUM.ml;
ocamlc -o toUM ast.cmo lexer.cmo parser.cmo toUM.cmo
