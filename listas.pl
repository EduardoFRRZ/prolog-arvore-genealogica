% Criterio de parada
percorrer([]).

% Regra recursiva
percorrer([X|Y]) :-
	write(X),
	nl,
	percorrer(Y).
