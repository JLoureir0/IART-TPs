bfs([[S|Path]|R],[S|Path]):-
  final_state(S).

bfs([[S|Path]|R],Sol):-
  findall([S2|[S|Path]],successor(S,S2),Ls),
  append(R,Ls,L2),
  bfs(L2,Sol).


solve_bfs(Sol):-
  initial_state(Si),
  bfs([[Si]],Sol).
