:- module(systemMove_207114979_HernandezHernandez, [systemMove/4, esList/1, esString/1]).
% Dominios
% Sistema, NuevoSistema: Sistema
% NombreArchivo, Direccion: Atomo
% Resto: Variable

% Recorridos
% systemMove(Sistema, NombreArchivo, Direccion, NuevoSistema)
% esList(Lista)
% esString(String)

% Metas
% systemMove
% esList
% esString

% Clausulas
systemMove(Sistema, NombreArchivo, Direccion, NuevoSistema):- esList(Sistema), esString(NombreArchivo), esString(Direccion),
	member([NombreArchivo | Resto], Sistema), append(Sistema, [[NombreArchivo | Resto]], NuevoSistema). 
