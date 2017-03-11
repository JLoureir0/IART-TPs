dfs([S|Path],_,[S|Path]):-
  final_state(S).

dfs([S|Path],Visited,Sol):-
  successor(S,S2),
  \+ member(S2,Visited),
  dfs([S2|[S|Path]],[S2|Visited],Sol).

solve_dfs(Sol):-
  initial_state(Si),
  dfs([Si],[Si],Sol).
