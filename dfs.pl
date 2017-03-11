dfs(E0,_,[E]):-final_state(E).

dfs(E,Visited,[E|Es]):-
  successor(E,E2), \+ member(E2,Visited),
  dfs(E2,[E2|Visited],Es).

solve_dfs(Sol):-
  initial_state(Ei),
  dfs(Ei,[Ei],Sol).
