% 4.2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Toothpick game:
% - There are 10 toothpicks on a table
% - each player can withdraw one, two or three toothpicks at their turn
% - the goal is to avoid being the one that keeps the last toothpick
%%%%%%%%%%

% a representação do estado vai incluir também o jogador a jogar,
% the state representation also includes which player is next to make a move

% state representation: (NumberOfToothpicks, Player)

initial_state((10,max)).

% final state (having 0 toothpicks is a good thing)
final_state((0,max), 1).
final_state((0,min), 0).

% Transitions between states
successor((N,max), max, (N1,min)) :- N>0, N1 is N-1.
successor((N,max), max, (N1,min)) :- N>1, N1 is N-2.
successor((N,max), max, (N1,min)) :- N>2, N1 is N-3.
successor((N,min), min, (N1,max)) :- N>0, N1 is N-1.
successor((N,min), min, (N1,max)) :- N>1, N1 is N-2.
successor((N,min), min, (N1,max)) :- N>2, N1 is N-3.

evaluate((N,max),V):- 1 is N mod 4,!,V=0;V=1.

evaluate((N,min),V):- 1 is N mod 4,!,V=1;V=0.
