% 8-puzzle experiments
use_module(library(lists)).
use_module(library(heaps)).

%% move left in the top row
move([X1,0,X3, X4,X5,X6, X7,X8,X9],
     [0,X1,X3, X4,X5,X6, X7,X8,X9]).
move([X1,X2,0, X4,X5,X6, X7,X8,X9],
     [X1,0,X2, X4,X5,X6, X7,X8,X9]).

%% move left in the middle row
move([X1,X2,X3, X4,0,X6,X7,X8,X9],
     [X1,X2,X3, 0,X4,X6,X7,X8,X9]).
move([X1,X2,X3, X4,X5,0,X7,X8,X9],
     [X1,X2,X3, X4,0,X5,X7,X8,X9]).

%% move left in the bottom row
move([X1,X2,X3, X4,X5,X6, X7,0,X9],
     [X1,X2,X3, X4,X5,X6, 0,X7,X9]).
move([X1,X2,X3, X4,X5,X6, X7,X8,0],
     [X1,X2,X3, X4,X5,X6, X7,0,X8]).

%% move right in the top row
move([0,X2,X3, X4,X5,X6, X7,X8,X9],
     [X2,0,X3, X4,X5,X6, X7,X8,X9]).
move([X1,0,X3, X4,X5,X6, X7,X8,X9],
     [X1,X3,0, X4,X5,X6, X7,X8,X9]).

%% move right in the middle row
move([X1,X2,X3, 0,X5,X6, X7,X8,X9],
     [X1,X2,X3, X5,0,X6, X7,X8,X9]).
move([X1,X2,X3, X4,0,X6, X7,X8,X9],
     [X1,X2,X3, X4,X6,0, X7,X8,X9]).

%% move right in the bottom row
move([X1,X2,X3, X4,X5,X6,0,X8,X9],
     [X1,X2,X3, X4,X5,X6,X8,0,X9]).
move([X1,X2,X3, X4,X5,X6,X7,0,X9],
     [X1,X2,X3, X4,X5,X6,X7,X9,0]).

%% move up from the middle row
move([X1,X2,X3, 0,X5,X6, X7,X8,X9],
     [0,X2,X3, X1,X5,X6, X7,X8,X9]).
move([X1,X2,X3, X4,0,X6, X7,X8,X9],
     [X1,0,X3, X4,X2,X6, X7,X8,X9]).
move([X1,X2,X3, X4,X5,0, X7,X8,X9],
     [X1,X2,0, X4,X5,X3, X7,X8,X9]).


%% move up from the bottom row
move([X1,X2,X3, X4,X5,X6, X7,0,X9],
     [X1,X2,X3, X4,0,X6, X7,X5,X9]).
move([X1,X2,X3, X4,X5,X6, X7,X8,0],
     [X1,X2,X3, X4,X5,0, X7,X8,X6]).
move([X1,X2,X3, X4,X5,X6, 0,X8,X9],
     [X1,X2,X3, 0,X5,X6, X4,X8,X9]).

%% move up from the top row
move([0,X2,X3, X4,X5,X6, X7,X8,X9],
     [X4,X2,X3, 0,X5,X6, X7,X8,X9]).
move([X1,0,X3, X4,X5,X6, X7,X8,X9],
     [X1,X5,X3, X4,0,X6, X7,X8,X9]).
move([X1,X2,0, X4,X5,X6, X7,X8,X9],
     [X1,X2,X6, X4,X5,0, X7,X8,X9]).

%% move down from the middle row
move([X1,X2,X3, 0,X5,X6, X7,X8,X9],
     [X1,X2,X3, X7,X5,X6, 0,X8,X9]).
move([X1,X2,X3, X4,0,X6, X7,X8,X9],
     [X1,X2,X3, X4,X8,X6, X7,0,X9]).
move([X1,X2,X3, X4,X5,0, X7,X8,X9],
     [X1,X2,X3, X4,X5,X9, X7,X8,0]).

% manhattan distance cost
cost([0,_,_,_,_,_,_,_,_], 0).
cost([_,0,_,_,_,_,_,_,_], 1).
cost([_,_,_,0,_,_,_,_,_], 1).
cost([_,_,0,_,_,_,_,_,_], 2).
cost([_,_,_,_,0,_,_,_,_], 2).
cost([_,_,_,_,_,_,0,_,_], 2).
cost([_,_,_,_,_,0,_,_,_], 3).
cost([_,_,_,_,_,_,_,0,_], 3).
cost([_,_,_,_,_,_,_,_,0], 4).

cost([_,1,_,_,_,_,_,_,_], 0).
cost([1,_,_,_,_,_,_,_,_], 1).
cost([_,_,1,_,_,_,_,_,_], 1).
cost([_,_,_,_,1,_,_,_,_], 1).
cost([_,_,_,1,_,_,_,_,_], 2).
cost([_,_,_,_,_,_,_,1,_], 2).
cost([_,_,_,_,_,1,_,_,_], 2).
cost([_,_,_,_,_,_,_,_,1], 3).
cost([_,_,_,_,_,_,1,_,_], 3).

cost([_,_,2,_,_,_,_,_,_], 0).
cost([_,2,_,_,_,_,_,_,_], 1).
cost([_,_,_,_,_,2,_,_,_], 1).
cost([2,_,_,_,_,_,_,_,_], 2).
cost([_,_,_,_,2,_,_,_,_], 2).
cost([_,_,_,_,_,_,_,_,2], 2).
cost([_,_,_,_,_,_,_,2,_], 3).
cost([_,_,_,2,_,_,_,_,_], 3).
cost([_,_,_,_,_,_,2,_,_], 4).

cost([_,_,_,3,_,_,_,_,_], 0).
cost([3,_,_,_,_,_,_,_,_], 1).
cost([_,_,_,_,3,_,_,_,_], 1).
cost([_,_,_,_,_,_,3,_,_], 1).
cost([_,3,_,_,_,_,_,_,_], 2).
cost([_,_,_,_,_,3,_,_,_], 2).
cost([_,_,_,_,_,_,_,3,_], 2).
cost([_,_,3,_,_,_,_,_,_], 3).
cost([_,_,_,_,_,_,_,_,3], 3).

cost([_,_,_,_,4,_,_,_,_], 0).
cost([_,_,_,4,_,_,_,_,_], 1).
cost([_,_,_,_,_,4,_,_,_], 1).
cost([_,4,_,_,_,_,_,_,_], 1).
cost([_,_,_,_,_,_,_,4,_], 1).
cost([4,_,_,_,_,_,_,_,_], 2).
cost([_,_,4,_,_,_,_,_,_], 2).
cost([_,_,_,_,_,_,4,_,_], 2).
cost([_,_,_,_,_,_,_,_,4], 2).

cost([_,_,_,_,_,5,_,_,_], 0).
cost([_,_,_,_,5,_,_,_,_], 1).
cost([_,_,5,_,_,_,_,_,_], 1).
cost([_,_,_,_,_,_,_,_,5], 1).
cost([_,5,_,_,_,_,_,_,_], 2).
cost([_,_,_,5,_,_,_,_,_], 2).
cost([_,_,_,_,_,_,_,5,_], 2).
cost([5,_,_,_,_,_,_,_,_], 3).
cost([_,_,_,_,_,_,5,_,_], 3).

cost([_,_,_,_,_,_,6,_,_], 0).
cost([_,_,_,_,_,_,_,6,_], 1).
cost([_,_,_,6,_,_,_,_,_], 1).
cost([6,_,_,_,_,_,_,_,_], 2).
cost([_,_,_,_,6,_,_,_,_], 2).
cost([_,_,_,_,_,_,_,_,6], 2).
cost([_,6,_,_,_,_,_,_,_], 3).
cost([_,_,_,_,_,6,_,_,_], 3).
cost([_,_,6,_,_,_,_,_,_], 4).

cost([_,_,_,_,_,_,_,7,_], 0).
cost([_,_,_,_,_,_,_,_,7], 1).
cost([_,_,_,_,_,_,7,_,_], 1).
cost([_,_,_,_,7,_,_,_,_], 1).
cost([_,_,_,_,_,7,_,_,_], 2).
cost([_,_,_,7,_,_,_,_,_], 2).
cost([_,7,_,_,_,_,_,_,_], 2).
cost([7,_,_,_,_,_,_,_,_], 3).
cost([_,_,7,_,_,_,_,_,_], 3).

cost([_,_,_,_,_,_,_,_,8], 0).
cost([_,_,_,_,_,_,_,8,_], 1).
cost([_,_,_,_,_,8,_,_,_], 1).
cost([_,_,_,_,_,_,8,_,_], 2).
cost([_,_,_,_,8,_,_,_,_], 2).
cost([_,_,8,_,_,_,_,_,_], 2).
cost([_,_,_,8,_,_,_,_,_], 3).
cost([_,8,_,_,_,_,_,_,_], 3).
cost([8,_,_,_,_,_,_,_,_], 4).


% test with
% findall(A,cost([5,2,3,4,0,1,6,7,8],A), L).

% node(+State, -Cost)
node(State, Cost):-
  findall(A, cost(State, A), L),
  sum_list(L, Cost).

make_nodes([Last], [node(Last, _)]) :- !.
%make_nodes([First|Rest], [node(First, Cost)|Nodes]):-
%    make_nodes(Rest, Nodes).

% step(+Parent, -ChildrenNodes)
% from the parent state, collect the valid children states.
step(ParentState, ChildrenNodes):-
    findall(Child, move(ParentState, Child), ChildrenNodes).

teststep(Parent):-
    step(Parent, C),
    write(C),
    fail.


