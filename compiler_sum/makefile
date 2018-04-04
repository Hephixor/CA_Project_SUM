LEX_ML = ocamllex
YACC_ML = ocamlyacc
OCAMLC = ocamlc
toUM: parser toUM.ml
	$(OCAMLC) -o toUM ast.cmo lexer.cmo parser.cmo toUM.ml
parser: ast.ml lexer.mll parser.mly
	$(OCAMLC) -c ast.ml
	$(LEX_ML) -o lexer.ml lexer.mll
	$(YACC_ML) -b parser parser.mly
	$(OCAMLC) -c parser.mli
	$(OCAMLC) -c lexer.ml
	$(OCAMLC) -c parser.ml
clean:
	rm -f *.cmo
	rm -f *.cmi
	rm -f lexer.ml
	rm -f parser.mli
	rm -f parser.ml
tidy:
	rm -f *.cmo
	rm -f *.cmi
	rm -f lexer.ml
	rm -f parser.mli
	rm -f parser.ml
	rm -f toUM
