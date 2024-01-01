is_member(X) :- member(X, [g11,g12,g13,g14,g22,g24,g31,g34,g41,g42,g43,g44,g21,g23,g32,g33]).
pos(X) :- member(X, [g11,g12,g13,g14,g24,g31, g34,g41, g42,g43,g44,g22]).
neg(X) :- member(X, [g21,g23,g32,g33]).
edg(X) :- member(X, [g11,g12,g13,g14,g21,g24,g31,g34,g41,g42,g43,g44]).


adjacent(G, Adj) :-
    (G = g11, Adj = [g12, g21]);
    (G = g12, Adj = [g11, g13, g22]);
    (G = g13, Adj = [g12, g14, g23]);
    (G = g14, Adj = [g13, g24]);
    (G = g21, Adj = [g11, g22, g31]);
    (G = g22, Adj = [g12, g21, g23, g32]);
    (G = g23, Adj = [g13, g22, g24, g33]);
    (G = g24, Adj = [g14, g23, g34]);
    (G = g31, Adj = [g21, g32, g41]);
    (G = g32, Adj = [g22, g31, g33, g42]);
    (G = g33, Adj = [g23, g32, g34, g43]);
    (G = g34, Adj = [g24, g33, g44]);
    (G = g41, Adj = [g31, g42]);
    (G = g42, Adj = [g32, g41, g43]);
    (G = g43, Adj = [g33, g42, g44]);
    (G = g44, Adj = [g34, g43]).

is_adjacent(G, N) :- adjacent(G, Adj), member(N, Adj).

is_surrounded(Visited, G) :-
    is_member(G), \+ edg(G), 
    forall(is_adjacent(G, N), (pos(N); member(N, Visited))).

is_surrounded(Visited, G) :-
    is_member(G), \+ edg(G), 
    visit(G, Visited, NewVisited),
    forall((is_adjacent(G, N), neg(N)), (member(N, NewVisited); is_surrounded(NewVisited,N))).

is_surrounded(G) :-
    is_member(G),
    is_surrounded([], G).

visit(G, Visited, [G|Visited]) :-
    \+ member(G, Visited).

