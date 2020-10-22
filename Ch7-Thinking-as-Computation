%Q6

%a
exactly3(L):- length(L,3).

%b
at_least_3(L):-length(L,3).
at_least_3(L):- \+ length(L,2), \+ length(L,1), \+ length(L,0).

%c
at_most_3(L):- length(L,3).
at_most_3(L):- length(L,2).
at_most_3(L):- length(L,1).
at_most_3(L):- length(L,0).

%d
intersect(L1,L2):- member(X,L1), member(X,L2).

%e
all_intersect(List,L):-intersect(List,L).
all_intersect(ListofLists,L):-subtract(ListofLists,AList,ListofLessLists), all_intersect(ListofLessLists,L), intersect(ListofLessLists,L).
