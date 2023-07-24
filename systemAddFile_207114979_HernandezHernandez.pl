:- module(systemAddFile_207114979_HernandezHernandez, [file/3, systemAddFile/3, esList/1]).
% Dominios
% Sistema, NuevoSistema: Sistema
% ListaArchivo: Lista
% Nombre, Contenido: String

% Recorridos
% file(Nombre, Contenido, ListaArchivo)
% systemAddFile(Sistema, ListaArchivo, NuevoSistema)
% esList(Lista)

% Metas
% file
% systemAddFile
% esList

% Clausulas
file(Nombre, Contenido, ListaArchivo):- ListaArchivo = [Nombre, Contenido].
systemAddFile(Sistema, ListaArchivo, NuevoSistema):- esList(Sistema), esList(ListaArchivo), append(Sistema, [ListaArchivo], NuevoSistema).

