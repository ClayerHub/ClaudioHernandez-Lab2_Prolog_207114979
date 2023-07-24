:- module(systemLogin_207114979_HernandezHernandez, [systemLogin/3, dosVeces/2, esList/1, esString/1, repeticionesAtomo/3, unicosAtomos/1]).
% Dominios
% Sistema, NuevoSistema: Sistema
% Usuario: Atomo
% String, Resto, N, Lista, X = Variables

% Recorridos
% systemLogin(Sistema, Usuario, NuevoSistema)
% dosVeces(Atomo, Lista)
% esList(Lista)
% esString(String)
% repeticionesAtomo(String, Lista, N)
% unicosAtomos(Lista)

% Metas
% systemLogin
% dosVeces
% esList
% esString
% repeticionesAtomo
% unicosAtomos

% Clausulas
% Predicado que permite iniciar sesion si el usuario ya esta registrado
systemLogin(Sistema, Usuario, NuevoSistema) :- esList(Sistema), esString(Usuario), dosVeces([Usuario], Sistema), member([Usuario], Sistema), NuevoSistema = Sistema;
    esList(Sistema), esString(Usuario), member([Usuario], Sistema), unicosAtomos(Sistema), append(Sistema, [[Usuario]], NuevoSistema).

% Predicado que verifica la cantidad de veces que se repite un atomo en una lista
repeticionesAtomo(_, [], 0).
repeticionesAtomo(String, [String|Resto], N):- repeticionesAtomo(String, Resto, M), N is M + 1.
repeticionesAtomo(String, [_|Resto], N):- repeticionesAtomo(String, Resto, N).

% Predicado que verifica si un argumento esta dos veces en una lista
dosVeces(String, Lista):- repeticionesAtomo(String, Lista, 2).   

% Predicado que verifica que todos los argumentos de una lista sean unicos
unicosAtomos([]).
unicosAtomos([X|Resto]):- not(member(X, Resto)), unicosAtomos(Resto).