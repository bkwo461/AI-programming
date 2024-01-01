
different(red, green).
different(red, blue).
different(green, blue).
different(green, red).
different(blue, red).
different(blue, green).

mapcolouring(N,A,WA,B,G,T,M,H,WE) :-
    different(N,A),
    different(A,WA),
    different(WA,T),
    different(WA,M),
    different(WA,H),
    different(WA,B),
    different(T,M),
    different(M,H),
    different(H,B), 
	different(H,G), 
	different(B,G), 
	different(M,WE).


