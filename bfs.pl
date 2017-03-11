bfs([[E|Cam]|R],[E|Cam]):-
  final_state(E).

bfs([[E|Cam]|R],Sol):-
  findall([E2|[E|Cam]],successor(E,E2),Ls),
  append(R,Ls,L2),
  bfs(L2,Sol).


solve_bfs(Sol):-
  initial_state(Ei),
  bfs([[Ei]],Sol).
