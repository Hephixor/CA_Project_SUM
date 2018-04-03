oprim(X) :- member(X,[not,and,or,eq,lt,add,sub,mul,div]).
tprim(X) :- member(X,[bool,int]).
num(X) :- integer(X).
ident(X) :- string_codes(S,X), string(S).
sym(X) :- tprim(X);oprim(X);ident(X).
addEnv(G,[],G).
addEnv(G,[X|Q],[X|GG]) :- addEnv(G,Q,GG).
checkArgs([],[]).
checkArgs([(_,T)|Q],[T|S]) :- checkArgs(Q,S).
typeExpr(_,true,bool).
typeExpr(_,false,bool).
typeExpr(_,N,int) :- integer(N).
typeExpr([(E,TT)|_],E,T) :- TT=T.
typeExpr([(ES,_)|C],E,T) :- not(ES=E), typeExpr(C,E,T).
typeExpr(C,not(A),bool) :- typeExpr(C,A,bool).
typeExpr(C,and(A,B),bool) :- typeExpr(C,A,bool), typeExpr(C,B,bool).
typeExpr(C,or(A,B),bool) :- typeExpr(C,A,bool), typeExpr(C,B,bool).
typeExpr(C,eq(A,B),bool) :- typeExpr(C,A,bool), typeExpr(C,B,bool).
typeExpr(C,eq(A,B),bool) :- typeExpr(C,A,int), typeExpr(C,B,int).
typeExpr(C,mul(A,B),int) :- typeExpr(C,A,int), typeExpr(C,B,int).
typeExpr(C,sub(A,B),int) :- typeExpr(C,A,int), typeExpr(C,B,int).
typeExpr(C,div(A,B),int) :- typeExpr(C,A,int), typeExpr(C,B,int).
typeExpr(C,add(A,B),int) :- typeExpr(C,A,int), typeExpr(C,B,int).
typeExpr(C,lt(A,B),bool) :- typeExpr(C,A,int), typeExpr(C,B,int).
typeExpr(C,if(A, B, D),T) :- typeExpr(C,A,bool),typeExpr(C,B,T),typeExpr(C,D,T).
typeExpr(C,abstr(ARGS,E),fleche(TS,T)) :- checkArgs(ARGS,TS), addEnv(C,ARGS,CC), typeExpr(CC,E,T).
typeExpr(C,app(E,ES),T) :- typeExpr(C,E,fleche(TS,T)), checkArgs(ES,TS).

typeStat(C,echo(E),void) :- typeExpr(C,E,int).

typeDec(C,const(X,T,E),CC) :- typeExpr(C,E,T), addEnv(C,[(X,T)],CC).
/*typeDec(C,funrec(X, ARGS, T, E), CCC) :- checkArgs(ARGS,TS), addEnv(C,ARGS,CC), typeExpr(CC,E,T), addEnv(CC,[(X,fleche(TS,T))],CCC).*/
typeDec(C,fun(X, ARGS, T, E), CCC) :- checkArgs(ARGS,TS), addEnv(C,ARGS,CC), typeExpr(CC,E,T) , addEnv(C,[(X,fleche(TS,T))],CCC).

typeCmds(_,[],void).

typeCmds(C,[S|CS],void) :- typeStat(C,S,void), typeCmds(C,CS,void).
typeCmds(C,[D|CS],void) :- typeDec(C,D,CC), typeCmds(CC,CS,void).

typeProg(_, CS, void) :- typeCmds([], CS, void).
