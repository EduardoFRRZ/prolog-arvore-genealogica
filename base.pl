% fatos 
tempo(ensolarado).
tempo(quente).

tempo(ensolarado,tempo).

% Arvore Genealogica
progenitor(joao,ana).
progenitor(joao,luis).
progenitor(ana,pedro).
progenitor(luis,maria).
progenitor(luis,antonio).
progenitor(maria,fernanda).
progenitor(fernanda,claudia).
progenitor(claudia,padoin).

feminino(ana).
feminino(maria).
feminino(fernanda).
feminino(claudia).

masculino(joao).
masculino(luis).
masculino(pedro).
masculino(antonio).

avo(X,Z) :-
	progenitor(X,Y),
	progenitor(Y,Z),
	masculino(X).

avoh(X,Z) :-
        progenitor(X,Y),
        progenitor(Y,Z),
        feminino(X).

irmaogenerico(X,Z) :-
	progenitor(Y,X),
	progenitor(Y,Z),
	X \== Y.

irmao(X,Z) :-
	irmaogenerico(X,Z),	
	masculino(X).

irma(X,Z) :-
	irmaogenerico(X,Z),
	feminino(X).

comumprimo(X,Z) :-
	irmaogenerico(Y,Q),
	progenitor(Y,X),
        progenitor(Q,Z),
	X \== Z,
	\+ irmaogenerico(X,Z).

primo(X,Z) :-
	comumprimo(X,Z),
	masculino(X).

prima(X,Z) :-
	comumprimo(X,Z),
	feminino(X).

% regra Antepassado Direto
antepassado(X,Y) :-
	progenitor(X,Y).

% regra Antepassado Indireto
antepassado(X,Y) :-
	progenitor(X,Z),
	antepassado(Z,Y).


% somar

somar(X,Y,Z) :-
	Z is X + Y.

somar2(X,Y) :-
	Z is X + Y,
	write(Z). 

entrada :-
	read(X), read(Y),
	somar2(X,Y).
