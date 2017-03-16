% MiniMax with depth limit

minimax(S,_,_,V,_):- final_state(S,V).
minimax(S,_,0,V,_):- !,evaluate(S,V).

minimax(S,max,D,V,M):-
  findall(S2,successor(S,max,S2),SL),
  maxvalue(SL,D,V,M).

minimax(S,min,D,V,M):-
  findall(S2,successor(S,min,S2),SL),
  minvalue(SL,D,V,M).

maxvalue([S],D,V,S):-
  D1 is D-1,
  minimax(S,min,D1,V,_).

maxvalue([S|Ns],D,V,BM):-
  D1 is D-1,
  minimax(S,min,D1,V1,_),
  maxvalue(Ns,D1,V2,S2),
  (V1>V2,!,BM=S,V=V1;BM=S2,V=V2).

minvalue([S],D,V,S):-
  D1 is D-1,
  minimax(S,max,D1,V,_).

minvalue([S|Ns],D,V,WM):-
  D1 is D-1,
  minimax(S,max,D1,V1,_),
  minvalue(Ns,D1,V2,S2),
  (V1<V2,!,WM=S,V=V1;WM=S2,V=V2).
