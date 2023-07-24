:- module(systemDel_207114979_HernandezHernandez, [systemDel/3, esList/1]).
% Dominios
% Sistema, NuevoSistema: Sistema
% NombreArchivo: String 

% Recorridos
% systemDel(Sistema, NombreArchivo, NuevoSistema)
% esList(Lista)

% Metas
% systemDel
% esList

% Clausulas
systemDel(Sistema, NombreArchivo, NuevoSistema):- esList(Sistema), esString(NombreArchivo), select([NombreArchivo | _], Sistema, NuevoSistema). 