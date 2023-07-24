:- module(systemCopy_207114979_HernandezHernandez, [systemCopy/4, esList/1, esString/1]).
% Dominios
% Sistema, NuevoSistema: Sistema
% Archivo, Ubicacion: String
% Resto: Variable

% Recorridos
% systemCopy(Sistema, NombreArchivo, Direccion, NuevoSistema)
% esList(Lista)
% esString(String)

% Metas
% systemCopy
% esList
% esString

% Clausulas
systemCopy(Sistema, Archivo, Ubicacion, NuevoSistema):- esList(Sistema), esString(Archivo), esString(Ubicacion),
    member([Archivo | Resto], Sistema), append(Sistema, [[Archivo | Resto]], NuevoSistema).