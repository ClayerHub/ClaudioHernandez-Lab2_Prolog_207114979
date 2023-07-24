:- module(systemLogout_207114979_HernandezHernandez, [systemLogout/2, verificarDupla/2, eliminarCopia/3, esList/1]).
% Dominios
% Sistema, NuevoSistema: Sistema
% Lista, Duplicado, X, Resto, Atomo, NuevaLista = Variables

% Predicados
% systemLogout(Sistema, NuevoSistema)
% verificarDupla(Lista, Duplicado)
% eliminarCopia(Duplicado, Lista, NuevaLista)
% esList(Lista)

% Metas
% systemLogout
% verificarDupla
% eliminarCopia
% esList

% Clausulas
% Predicado que cierra sesion de un usuario del sistema
systemLogout(Sistema, NuevoSistema) :- esList(Sistema), verificarDupla(Sistema, Duplicado), eliminarCopia(Duplicado, Sistema, NuevoSistema);false.

% Predicado que si detecta que un elemento esta anotado dos veces, entrega true
verificarDupla([], false) :- false.
verificarDupla([X|Resto], X) :- 
    member(X, Resto).
verificarDupla([X|Resto], Duplicado) :- 
    \+ member(X, Resto), verificarDupla(Resto, Duplicado).

% Predicado que elimina un valor que esta duplicado
eliminarCopia(_, [], []).
eliminarCopia(String, [String|Resto], Resto) :- !.
eliminarCopia(String, [X|Resto], [X|NuevaLista]) :- 
    eliminarCopia(String, Resto, NuevaLista).