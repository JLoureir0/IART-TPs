h(b(X,Y), H):-
  estado_final(b(Xf,Yf)),
  H is max(abs(X-Xf),abs(Y-Yf)).

astar([[(F,G,E)|Cam]|R],[(F,G,E)|Cam]):-
  estado_final(E).

astar([[(F,G,E)|Cam]|R], Sol):-
  findall([(F2,G2,E2)|[(F,G,E)|Cam]],
    (sucessor(E, E2, C), G2 is G+C, h(E2, H2), F2 is G2+H2),
    LS),
  append(R, LS, L2),
  sort(L2,L2Ord),
  astar(L2Ord,Sol).

solve_astar(Sol):-
  estado_inicial(Ei),
  h(Ei, Hi),
  Gi is 0,
  Fi is Gi+Hi,
  astar([[(Fi,Gi,Ei)]],Sol).
