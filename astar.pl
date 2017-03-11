astar([[(F,G,S)|Path]|R],[(F,G,S)|Path]):-
  final_state(S).

astar([[(F,G,S)|Path]|R], Sol):-
  findall([(F2,G2,S2)|[(F,G,S)|Path]],
    (successor(S, S2, C), G2 is G+C, h(S2, H2), F2 is G2+H2),
    LS),
  append(R, LS, L2),
  sort(L2,L2Ord),
  astar(L2Ord,Sol).

solve_astar(Sol):-
  initial_state(Si),
  h(Si, Hi),
  Gi is 0,
  Fi is Gi+Hi,
  astar([[(Fi,Gi,Si)]],Sol).
