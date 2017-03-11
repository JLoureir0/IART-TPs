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

% Restrictions
restrictions(3,C,_):-
  C =< 3,
  C >= 0.
restrictions(0,C,_):-
  C =< 3,
  C >= 0.
restrictions(M,C,_):-
  M >= C,
  3-M >= 3-C.


% State Transitions
successor(misscan(M,C,1), misscan(Nm,C,0)) :-
  M >= 2, M =< 3,
  C >= 0, C =< 3,
  Nm is M-2,
  restrictions(Nm,C,0).
successor(misscan(M,C,0), misscan(Nm,C,1)) :-
  M >= 0, M =< 1,
  C >= 0, C =< 3,
  Nm is M+2,
  restrictions(Nm,C,1).
successor(miproblemsscan(M,C,1), misscan(Nm,C,0)) :-
  M >= 1, M =< 3,
  C >= 0, C =< 3,
  Nm is M-1,
  restrictions(Nm,C,0).
successor(misscan(M,C,0), misscan(Nm,C,1)) :-
  M >= 0, M =< 2,
  C >= 0, C =< 3,
  Nm is M+1,
  restrictions(Nm,C,1).

successor(misscan(M,C,1), misscan(M,Nc,0)) :-
  M >= 0, M =< 3,
  C >= 2, C =< 3,
  Nc is C-2,
  restrictions(M,Nc,0).
successor(misscan(M,C,0), misscan(M,Nc,1)) :-
  M >= 0, M =< 3,
  C >= 0, C =< 1,
  Nc is C+2,
  restrictions(M,Nc,1).
successor(misscan(M,C,1), misscan(M,Nc,0)) :-
  M >= 0, M =< 3,
  C >= 1, C =< 3,
  Nc is C-1,
  restrictions(M,Nc,0).
successor(misscan(M,C,0), misscan(M,Nc,1)) :-
  M >= 0, M =< 3,
  C >= 0, C =< 2,
  Nc is C+1,
  restrictions(M,Nc,1).

successor(misscan(M,C,1), misscan(Nm,Nc,0)) :-
  M >= 1, M =< 3,
  C >= 1, C =< 3,
  Nm is M-1,
  Nc is C-1,
  restrictions(Nm,Nc,0).
successor(misscan(M,C,0), misscan(Nm,Nc,1)) :-
  M >= 0, M =< 2,
  C >= 0, C =< 2,
  Nm is M+1,
  Nc is C+1,
  restrictions(Nm,Nc,1).
