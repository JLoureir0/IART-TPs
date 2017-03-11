% Problem:
% Three missionaries and three cannibals must cross a river using a boat which can carry at most two people,
% under the constraint that, for both banks, if there are missionaries present on the bank, they cannot be outnumbered
% by cannibals (if they were, the cannibals would eat the missionaries). The boat cannot cross the river by itself with
% no people on board.

% misscan(M,C,B).
% M - number of missionaries on the right bank of the river
% C - number of cannibals on the right bank of the river
% B - bank the boat is currently on (r=1 or l=0)

% Initial State
initial_state(misscan(3,3,1)).

% Final State
final_state(misscan(0,0,0)).

% Domain missionaries and cannibals
domain(M,C):-
  between(0,3,M),
  between(0,3,C).

% Rules: If there are missionaries present on either bank, they cannot be outnumbered by cannibals
rules(0,C).
rules(3,C).
rules(M,C):-
  M   >= C,
  3-M >= 3-C.


% State Transitions
successor(misscan(M,C,1), misscan(Nm,C,0)) :-
  Nm is M-2,
  domain(Nm,C),
  rules(Nm,C).
successor(misscan(M,C,0), misscan(Nm,C,1)) :-
  Nm is M+2,
  domain(Nm,C),
  rules(Nm,C).
successor(miproblemsscan(M,C,1), misscan(Nm,C,0)) :-
  Nm is M-1,
  domain(Nm,C),
  rules(Nm,C).
successor(misscan(M,C,0), misscan(Nm,C,1)) :-
  Nm is M+1,
  domain(Nm,C),
  rules(Nm,C).

successor(misscan(M,C,1), misscan(M,Nc,0)) :-
  Nc is C-2,
  domain(M,Nc),
  rules(M,Nc).
successor(misscan(M,C,0), misscan(M,Nc,1)) :-
  Nc is C+2,
  domain(M,Nc),
  rules(M,Nc).
successor(misscan(M,C,1), misscan(M,Nc,0)) :-
  Nc is C-1,
  domain(M,Nc),
  rules(M,Nc).
successor(misscan(M,C,0), misscan(M,Nc,1)) :-
  Nc is C+1,
  domain(M,Nc),
  rules(M,Nc).

successor(misscan(M,C,1), misscan(Nm,Nc,0)) :-
  Nm is M-1,
  Nc is C-1,
  domain(Nm,Nc),
  rules(Nm,Nc).
successor(misscan(M,C,0), misscan(Nm,Nc,1)) :-
  Nm is M+1,
  Nc is C+1,
  domain(Nm,Nc),
  rules(Nm,Nc).
