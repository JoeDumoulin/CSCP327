
:- use_module(library(clpfd)).

solve(N,L) :-
  L = [A, B, C, D],
  L ins 1..sup,
  N #= A*A + B*B + C*C + D*D,
  all_distinct(L),
  A #< B, B #< C, C #< D,
  labeling([],L).

crypt :-
  [S,E,N,D,M,O,R,Y] ins 0..9,
  [C1,C2,C3,C4] ins 0..1,
  S #\= 0,
  M #\= 0,

  all_different([S,E,N,D,M,O,R,Y]),
  
  D + E #= Y + 10*C4,
  C4 + N + R #= E + 10*C3,
  C3 + E + O #= N + 10*C2,
  C2 + S + M #= O + 10*C1,
  M #= C1,
  
  labeling([], [S,E,N,D,M,O,R,Y,C1,C2,C3,C4]),
  
  write(' SEND '(' ',S,E,N,D)), nl,
  write('+MORE '(' ',M,O,R,E)), nl,
  write('-----------------'), nl,
  write('MONEY '(M,O,N,E,Y)).

queens(N,Solution) :-
  length(Solution, N),
  Solution ins 1..N,
  constrain_all(Solution),
  labeling([], Solution).

constrain_all([]).
constrain_all([X|Xs]) :-
  constrain_between(X,Xs,1),
  constrain_all(Xs).

constrain_between(X, [], N).
constrain_between(X, [Y|Ys], N) :-
  no_threat(X,Y,N),
  N1 is N + 1,
  constrain_between(X,Ys,N1).

no_threat(X,Y,I) :-
  X #\= Y,
  X #\= Y + I,
  X #\= Y - I.


