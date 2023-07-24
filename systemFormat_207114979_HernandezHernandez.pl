:- module(systemFormat_207114979_HernandezHernandez, [systemFormat/4, esList/1, esString/1]).
% Dominios
% Sistema, NuevoSistema: Sistema
% Unidad, NuevoNombre: String
% Lista, String: Variable

% Recorridos
% systemFormat(Sistema, Unidad, NuevoNombre, NuevoSistema)
% esList(Lista)
% esString(String)

% Metas
% systemFormat
% esList
% esString

% Clausulas
systemFormat(Sistema, Unidad, NuevoNombre, NuevoSistema):- esList(Sistema), esString(Unidad), esString(NuevoNombre), NuevoSistema = Sistema.