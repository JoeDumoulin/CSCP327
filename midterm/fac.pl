fac(0,1) :- !.
fac(F,N) :- F>0,
            F1 is F-1,
            fac(F1,N1),
            N is F*N1.



