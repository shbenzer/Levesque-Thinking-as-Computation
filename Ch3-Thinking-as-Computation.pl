%Knowledge Base:

child(john,sue).    child(john,sam).
child(jane,sue).    child(jane,sam).
child(sue,george).  child(sue,gina).
child(bob,jane).    child(bob,bill).
child(june,jane).   child(june,bill).
child(jacob,lily).  child(jacob,sam).
child(louise,john). child(louise,marsha).
child(anna, mark).  child(anna,gina).
child(chet,fred).   child(chet,anna).
child(jim,chet).    child(jim, emma).
child(marsha,marx).
child(bill,marx).
child(lisa,jim).   child(lisa,barb).

male(john).   male(sam).     male(george).
male(bob).    male(jacob).   male(bill).
male(chet).   male(fred).    male(mark).
male(jim).    male(marx).

female(sue).  female(jane).  female(june).
female(gina). female(lily).  female(louise).
female(marsha).  female(anna).  female(emma).
female(lisa).  female(barb).

parent(Y,X) :- child(X,Y).

father(Y,X) :- child(X,Y), male(Y).

opp_sex(X,Y) :- male(X), female(Y).
opp_sex(Y,X) :- male(X), female(Y).

grand_father(X,Z) :- father(X,Y), parent(Y,Z).

%Q1
mother(M,C):- female(M), parent(M,C).
grand_parent(GP,GC):- parent(GP,C), parent(C,GC).
great_grand_parent(X,Y):- grand_parent(X,Z), parent(Z,Y).
great_grand_mother(GGM,GGC):- mother(GGM,C), parent(C,GC), parent(GC,GGC), \+ C = GC, \+ GC = GGC.

%Q2
sibling(A,B):- parent(P,A), parent(P,B), \+ A=B.
brother(B,Sib):- male(B), sibling(B,Sib).
sister(S,Sib):- female(S), sibling(S,Sib).

%Q3
half_sibling(S1,S2):- parent(D1,S1), parent(M1,S1), parent(D2,S2), parent(M2,S2), D1 = D2, \+ M1 = M2, \+ M1 = D1, \+ D1 = M2, \+ M1 = D2, \+ D2 = M2.
half_sibling(S1,S2):- parent(D1,S1), parent(M1,S1), parent(D2,S2), parent(M2,S2), \+ D1 = D2, M1 = M2, \+ M1 = D1, \+ D1 = M2, \+ M1 = D2, \+ D2 = M2.
full_sibling(S1,S2):- father(F,S1), father(F,S2), mother(M,S1), mother(M,S2), \+ S1 = S2.

%Q4
first_cousin(C1,C2):- parent(P1,C1), parent(P2,C2), sibling(P1,P2).
second_cousin(C1,C2):-parent(P1,C1), parent(P2,C2), first_cousin(P1,P2).

%Q5
half_first_cousin(C1,C2):-parent(P1,C1), parent(P2,C2), half_sibling(P1,P2).
double_first_cousin(C1,C2):-father(F,C1), mother(M,C1), parent(P1,C2), parent(P2,C2), full_sibling(F,P1), full_sibling(M,P2), \+ C1 = C2, \+ F = M.

%Q6
first_cousin_twice_removed(C1,C2):- first_cousin(C1,X), grand_parent(X,C2).
first_cousin_twice_removed(C1,C2):- grand_parent(X,C1), first_cousin(X,C2).

%Q7
descendant(D,A):-child(D,A).
descendant(D,A):-child(D,X), descendant(X,A).
ancestor(A,D):-parent(A,D).
ancestor(A,D):-parent(A,X), ancestor(X,D).

%Q8
cousin(X, Y):- parent(P1,X), parent(P2,Y), sibling(P1,P2).
cousin(X, Y):- parent(P1,X), parent(P2,Y), cousin(P1,P2).

%Q9
%do not return anything for closest_common_ancestor(X,X,A).
common_ancestor(R1,R2,A):- ancestor(A,R1), ancestor(A,R2), \+ R1 = R2.
closest_common_ancestor(R1,R2,A):- common_ancestor(R1,R2,A), child(X,A),\+ common_ancestor(R1,R2,X).

% Q10 

write_child(X,Y):-
	write(X), write(' is a child of '), write(Y), nl.

write_descendant_chain(X,Y):- descendant(X,Y), parent(Z,X), descendant(Z,Y), write_child(X,Z), write_descendant_chain(Z,Y).
write_descendant_chain(X,Y):- descendant(X,Y), parent(Z,X), Z=Y, write_child(X,Z), write_descendant_chain(Z,Y).
