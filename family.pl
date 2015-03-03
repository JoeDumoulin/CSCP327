% family.pl
% a family tree in prolog
father(michael,cathy).
father(michael,sharon).
father(charles_gordon,michael).
father(charles_gordon,julie).
father(charles,charles_gordon).
father(jim,melody).
father(jim,crystal).
father(elmo,jim).
father(greg,stephanie).
father(greg,danielle).

mother(melody,cathy).
mother(melody,sharon).
mother(hazel,michael).
mother(hazel,julie).
mother(eleanor,melody).
mother(eleanor,crystal).
mother(crystal,stephanie).
mother(crystal,danielle).

child(X,Y) :- father(Y,X).
child(X,Y) :- mother(Y,X).

parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).

sibling(X,Y) :- parent(Z,X),
                parent(Z,Y).
