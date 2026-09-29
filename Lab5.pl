female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).


parent(abraham, herb).
parent(mona, herb).
parent(abraham, homer).
parent(mona, homer).
parent(clancy, marge).
parent(jackie, marge).
parent(clancy, patty).
parent(jackie, patty).
parent(clancy, selma).
parent(jackie, selma).
parent(homer, bart).
parent(marge, bart).
parent(homer, lisa).
parent(marge, lisa).
parent(homer, maggie).
parent(marge, maggie).
parent(selma, ling).


father(X,Y) :-
    male(X),
    parent(X,Y).

mother(X,Y) :-
    female(X),
    parent(X,Y).

son(X,Y) :-
    male(X),
    parent(Y,X).

daughter(X,Y) :-
    female(X),
    parent(Y,X).

brother(X,Y) :-
    male(X),
    father(F,X),
    father(F,Y),
    mother(M,X),
    mother(M,Y),
    X \= Y.

sister(X,Y) :-
    female(X),
    father(F,X),
    father(F,Y),
    mother(M,X),
    mother(M,Y),
    X \= Y.

grandfather(X,Y) :-
    male(X),
    parent(X,Z),
    parent(Z,Y).

aunt(X,Y) :-
    sister(X,P),
    parent(P,Y).

uncle(X,Y) :-
    brother(X,P),
    parent(P,Y).

cousin(X,Y) :-
    parent(P1,X),
    parent(P2,Y),
    (brother(P1,P2) ; sister(P1,P2)),
    X \= Y.

ancestor(X,Y) :-
    parent(X,Y).

ancestor(X,Y) :-
    parent(X,Z),
    ancestor(Z,Y).
