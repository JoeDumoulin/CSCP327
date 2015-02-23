% Here are some redicates that assist with traversing lists.
%
member_of(X, [X | _]).
member_of(X, [_ | T]) :- member_of(X, T).

concat_from_to([], L, L).
concat_from_to([X|L1], L2, [X|L3]) :- concat_from_to(L1, L2, L3).

member_of1(X, L) :- concat_from_to(_, [X| _], L).

append_to(X, L, [X|L]).

delete_from(X,[X|L],L).
delete_from(X, [Y|T], [Y|T1]) :- delete_from(X,T,T1).

member_of2(X, L) :- delete_from(X, L, _).

insert_into(X, L, L1) :- delete_from(X, L1, L).

permute([], []).
permute([X|L], P) :- permute(L, L1), insert_into(X, L1, P).

