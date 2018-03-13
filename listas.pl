% Criterio de parada
percorrer([]).

% Regra recursiva
percorrer([X|Y]) :-
	write(X),
	nl,
	percorrer(Y).

contrario([]).

contrario([X|Y]) :-
	contrario(Y),
	write(X),nl.