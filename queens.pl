% eight queens problem
% solved using constraint programming
%
% run as: queens(+N, -Solutions).
:- use_module(library(clpfd)).

solve(N,S):-
	statistics(runtime, _),
	queens(N, S),
	statistics(runtime, [_,Y]),
	write(S),
	nl,
	write('time: '),
	write(Y),
	nl.

queens(N,Solution) :-
        length(Solution, N),
        Solution ins 1..N,
        constrain_all(Solution),
        labeling([], Solution).

constrain_all([]).
constrain_all([X|Xs]) :-
        constrain_between(X,Xs,1),
        constrain_all(Xs).

constrain_between(X,[],N).
constrain_between(X, [Y|Ys], N) :-
        no_threat(X,Y,N),
        N1 is N+1,
        constrain_between(X,Ys,N1).

no_threat(X,Y,I) :-
        X #\= Y,
        X #\= Y + I,
        X #\= Y - I.


