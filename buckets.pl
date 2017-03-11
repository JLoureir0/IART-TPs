% 2.1

%Initial state
initial_state(b(0,0)).

%Final state
final_state(b(2,0)).

%State transitions
successor(b(X,Y), b(4,Y)) :- X<4.
successor(b(X,Y), b(X,3)) :- Y<3.
successor(b(X,Y), b(0,Y)) :- X>0.
successor(b(X,Y), b(X,0)) :- Y>0.
successor(b(X,Y), b(4,Y1)) :-
			X+Y>=4,
			X<4,
			Y1 is Y-(4-X).
successor(b(X,Y), b(X1,3)) :-
			X+Y>=3,
			Y<3,
			X1 is X-(3-Y).
successor(b(X,Y), b(X1,0)) :-
			X+Y<4,
			Y>0,
			X1 is X+Y.
successor(b(X,Y), b(0,Y1)) :-
			X+Y<3,
			X>0,
			Y1 is X+Y.

%Transitions between states with an associated cost
successor(b(X,Y), b(4,Y), C) :- X<4, C is 4-X.
successor(b(X,Y), b(X,3), C) :- Y<3, C is 3-Y.
successor(b(X,Y), b(0,Y), C)  :- X>0, C is X.
successor(b(X,Y), b(X,0), C)  :- Y>0, C is Y.
successor(b(X,Y), b(4,Y1), C) :-
			X+Y>=4,
			X<4,
			Y1 is Y-(4-X),
      C is Y-Y1.
successor(b(X,Y), b(X1,3), C) :-
			X+Y>=3,
			Y<3,
			X1 is X-(3-Y),
      C is X-X1.
successor(b(X,Y), b(X1,0), C) :-
			X+Y<4,
			Y>0,
			X1 is X+Y,
      C is Y.
successor(b(X,Y), b(0,Y1), C) :-
			X+Y<3,
			X>0,
			Y1 is X+Y,
      C is X.
