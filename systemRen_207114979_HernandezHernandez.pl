:- module(systemRen_207114979_HernandezHernandez, [systemRen/4, cambiarNombre/4, esString/1, esList/1]).
% Dominios
% Sistema, NuevoSistema: Sistema
% NombreActual, NuevoNombre: Atomo
% NombreActual, NombreNuevo, Sublista, Resto, RestoSublistas, NuevoResto: Variables

% Recorridos
% systemRen(Sistema, NombreActual, NuevoNombre, NuevoSistema)
% cambiarNombre(Archivo, NuevoNombre, Sistema, NuevoSistema)
% esString(String)
% esList(Lista)

% Metas
% systemRen
% cambiarNombre
% esString
% esList

% Clausulas
systemRen(Sistema, Archivo, NuevoNombre, NuevoSistema):- esList(Sistema), esString(Archivo), esString(NuevoNombre), 
	cambiarNombre(Archivo, NuevoNombre, Sistema, NuevoSistema).

% Predicado que cambia el Nombre por uno nuevo
cambiarNombre(_, _, [], []).
cambiarNombre(NombreActual, NombreNuevo, [[NombreActual | Resto] | RestoSublistas], [[NombreNuevo | Resto]|RestoSublistas]) :- !.
cambiarNombre(NombreActual, NombreNuevo, [Sublista | Resto], [Sublista | NuevoResto]):- cambiarNombre(NombreActual, NombreNuevo, Resto, NuevoResto).

