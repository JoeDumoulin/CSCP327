inc(I,J) :- J is I+1.
dec(I,J) :- J is I-1.

add(0,I,I).
add(N,I,J) :- N > 0, inc(I,I1), dec(N,N1), add(N1,I1,J).

