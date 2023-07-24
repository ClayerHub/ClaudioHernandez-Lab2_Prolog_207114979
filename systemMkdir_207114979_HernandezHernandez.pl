:- module(systemMkdir_207114979_HernandezHernandez, [systemMkdir/3, esList/1, esString/1, nombreUnico/2, nuevaCarpeta/4, cualDoble/2, fechaActual/1]).
% Dominios
% Sistema, NuevoSistema: Sistema
% Nombre: String
% String, Resto, Duplicado, Creador, Lista, NuevaLista, Entero, Direccion: Variables
% Fecha: Fecha

% Recorridos
% systemMkdir(Sistema, NombreCarpeta, NuevoSistema)
% esList(Lista)
% esString(String)
% nombreUnico(Lista, String)
% nuevaCarpeta(String, Lista, NuevaLista, Entero)
% cualDoble(Lista, Creador)
% fechaActual(Fecha)

% Metas
% systemMkdir
% esList
% esString
% nombreUnico
% nuevaCarpeta
% cualDoble
% fechaActual

% Clausulas
% Predicado que añade un directorio al sistema
systemMkdir(Sistema, Nombre, NuevoSistema):- esList(Sistema), esString(Nombre), nombreUnico(Sistema, Nombre), nuevaCarpeta(Nombre, Sistema, NuevoSistema, 6).

% Predicado que crea una lista con los datos de la carpeta
nuevaCarpeta(String, Lista, NuevaLista, Entero):- cualDoble(Lista, Creador), nth1(Entero, Lista, Direccion), fechaActual(Fecha), append(Lista, [[String, Creador, Direccion, Fecha, Fecha]], NuevaLista).

% Predicado que entrega el valor que esta duplicado en la lista (usuario)
cualDoble([String|Resto], String):- member(String, Resto).
cualDoble([_|Resto], Duplicado):- cualDoble(Resto, Duplicado).

% Predicado que verifica si el nombre es unico en la lista
nombreUnico([], _).
nombreUnico([[String, _, _, _, _] | _], String) :- !, fail.
nombreUnico([_ | Resto], String) :- nombreUnico(Resto, String).