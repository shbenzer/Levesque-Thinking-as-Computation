%Knowledge Base:

color(red).  color(blue).   color(yellow).

dig(0).  dig(1).  dig(2).  dig(3).  dig(4).
dig(5).  dig(6).  dig(7).  dig(8).  dig(9).

person(donna).
person(danny).
person(david).
person(doreen).

across(danny,david).
across(david,danny).
across(doreen,donna).
across(donna,doreen).

beside(doreen,danny,david).
beside(doreen,david,danny).
beside(danny,donna,doreen).
beside(danny,doreen,donna).
beside(david,donna,doreen).
beside(david,doreen,donna).
beside(donna,danny,david).
beside(donna,david,danny).

%Q2
europe_color(Fr,Sw,It,Be,Ho,Ge,Au):- color(Fr), color(Sw), color(It), color(Be), color(Ho), color(Ge), color(Au), 
\+ Fr = Be, \+ Fr = Sw, \+ Fr = Ge, \+ Fr = It,
\+ Ge = Ho, \+ Ge = Be, \+ Ge = Sw, \+ Ge = Au,
\+ Sw = Au, \+ Sw = It,
\+ It = Au,
\+ Be = Ho.

%Q3
cryptarithmetic(C,R,O,S,A,D,N,G,E):- dig(S),
R is (S+S) mod 10, C1 is (S+S) // 10,
dig(D), D > 0,
E is (S+D+C1) mod 10, C10 is (S+D+C1) // 10,
dig(O), dig(A),
G is (O+A+C10) mod 10, C100 is (O+A+C10) // 10,
dig(R), R > 0,
N is (R+O+C100) mod 10, C1000 is (R+O+C100) // 10,
dig(C), C > 0,
A is (C+R+C1000) mod 10, D is (C+R+C1000) // 10,
unique(C,R,O,S,A,D,N,G,E).
    
unique(C,R,O,S,A,D,N,G,E):- dig(C), dig(R), dig(O), dig(S), dig(A), dig(D), dig(N), dig(G), dig(E),
\+ C = R, \+ C = O, \+ C = S, \+ C = A, \+ C = D, \+ C = N, \+ C = G, \+ C = E,
\+ R = O, \+ R = S, \+ R = A, \+ R = D, \+ R = N, \+ R = G, \+ R = E,
\+ O = S, \+ O = A, \+ O = D, \+ O = N, \+ O = G, \+ O = E,
\+ S = A, \+ S = D, \+ S = N, \+ S = G, \+ S = E,
\+ A = D, \+ A = N, \+ A = G, \+ A = E,
\+ D = N, \+ D = G, \+ D = E,
\+ N = G, \+ N = E,
\+ G = E.



%Q4
who_ordered_pizza(PizzaPerson):- uniq_people(Donna,Danny,David,Doreen), 
uniq_people(ChickenPerson,SteakPerson,PizzaPerson,LasagnaPerson), 
uniq_people(CokePerson,WaterPerson,CoffeePerson,MilkPerson), 
beside(Doreen,SteakPerson,_),
ChickenPerson = CokePerson,
across(LasagnaPerson,MilkPerson),
\+ David = CoffeePerson,
Donna = WaterPerson,
\+ Danny = SteakPerson.

uniq_people(A,B,C,D):- person(A), person(B), person(C), person(D), 
\+ A = B, \+ A = C, \+ A = D,
\+ B = C, \+ B = D,
\+ C = D.







