:- module(systemCd_207114979_HernandezHernandez, [systemCd/3, esList/1, esString/1, nombreUnico/2, dosIguales/1, agregarASublista/4, 
    eliminarUltimoElementoSublista/4, subListaUno/2, unElementoSublista/3, quitarUltimoElemento/2, primerElemento/2, nuevaSublista/4, 
    direccionValida/2, nuevoString/3, guardarEnPosicion/4]).
% Dominios
% Sistema, NuevoSistema: Sistema
% Directorio: String
% String, Opcion, X, Lista, Resto, Posicion, NuevaPosActual, Sublista, Resto, PosActual, NuevaSublista, NuevoResto, Longitud, PrimerElemento,
% RestarUno, Prefijo, Elemento, Cabeza, Posicion1: Variable

% Recorridos
% systemCd(Sistema, Directorio, NuevoSistema)
% esList(Lista)
% esString(String)
% nombreUnico(Lista, String)
% dosIguales(Lista)
% agregarASublista(Lista, Posicion, String, NuevaLista)
% eliminarUltimoElementoSublista(Lista, Posicion, NuevaPosActual, NuevaLista)
% subListaUno(Lista, Posicion)
% unElementoSublista(Lista, Posicion, NuevaLista)
% quitarUltimoElemento(Sublista, NuevaSublista)
% primerElemento(Lista, Sublista)
% nuevaSublista(Posicion, NuevaSublista, Lista, NuevaLista)
% direccionValida(String, Opcion)
% nuevoString(Sublista, String, NuevaSublista)
% guardarEnPosicion(Elemento, Lista, Posicion1, NuevaLista)

% Metas
% systemCd
% esList
% esString
% nombreUnico
% dosIguales
% agregarASublista
% eliminarUltimoElementoSublista
% subListaUno
% unElementoSublista
% quitarUltimoElemento
% primerElemento
% nuevaSublista
% direccionValida
% nuevoString
% guardarEnPosicion

% Clausulas
% Predicado en el que cambia el directorio donde se realizan acciones
systemCd(Sistema, Directorio, NuevoSistema):- esList(Sistema), esString(Directorio), direccionValida(Directorio, "."), NuevoSistema = Sistema;
    esList(Sistema), esString(Directorio), direccionValida(Directorio, ".."), dosIguales(Sistema), eliminarUltimoElementoSublista(Sistema, 6, 1, NuevoSistema);
    esList(Sistema), esString(Directorio), direccionValida(Directorio, ".."), dosIguales(Sistema), subListaUno(Sistema, 6), NuevoSistema = Sistema; 
    esList(Sistema), esString(Directorio), direccionValida(Directorio, "/"), dosIguales(Sistema), subListaUno(Sistema, 6), NuevoSistema = Sistema;
    esList(Sistema), esString(Directorio), direccionValida(Directorio, "/"), dosIguales(Sistema), unElementoSublista(Sistema, 6, NuevoSistema); 
    esList(Sistema), esString(Directorio), direccionValida(Directorio, "./"), NuevoSistema = Sistema; 
    esList(Sistema), esString(Directorio), direccionValida(Directorio, "././././"), NuevoSistema = Sistema;
    esList(Sistema), esString(Directorio), nombreUnico(Sistema, Directorio), agregarASublista(Sistema, 6, Directorio, NuevoSistema); NuevoSistema = Sistema. 
    
% Predicado que verifica si el largo de una sublista es mayor a 1
eliminarUltimoElementoSublista([], _, _, []).
eliminarUltimoElementoSublista([Sublista | Resto], Posicion, PosActual, [NuevaSublista | NuevoResto]):-
    PosActual =:= Posicion, length(Sublista, Longitud), Longitud > 1, quitarUltimoElemento(Sublista, NuevaSublista),
    NuevaPosActual is PosActual + 1, eliminarUltimoElementoSublista(Resto, Posicion, NuevaPosActual, NuevoResto).
eliminarUltimoElementoSublista([Sublista | Resto], Posicion, PosActual, [Sublista | NuevoResto]) :-
    NuevaPosActual is PosActual + 1, eliminarUltimoElementoSublista(Resto, Posicion, NuevaPosActual, NuevoResto).

% Predicado que elimina el ultimo elemento de la sublista
quitarUltimoElemento(Sublista, NuevaSublista):- append(NuevaSublista, [_], Sublista).

% Predicado que verifica si un elemento esta dos veces en la lista
dosIguales(Lista):- append(_, [X|Resto], Lista), member(X,Resto).

% Predicado que verifica si el largo de una sublista de una posicion especifica es 1
subListaUno(Lista, Posicion):- nth1(Posicion, Lista, Sublista), length(Sublista, 1).

% Predicado que busca el elemento de una sublista en una posicion especifica
unElementoSublista(Lista, Posicion, NuevaLista):- nth1(Posicion, Lista, Sublista), primerElemento(Sublista, PrimerElemento),
    nuevaSublista(Posicion, [PrimerElemento], Lista, NuevaLista).

% Predicado que entrega el primer valor de una sublista
primerElemento([PrimerElemento | _], PrimerElemento).

% Predicado que agrega un string a una posicion especifica de una sublista
nuevaSublista(Posicion, NuevaSublista, Lista, NuevaLista):- RestarUno is Posicion - 1, length(Prefijo, RestarUno), append(Prefijo, [_ | Resto], Lista),
    append([Prefijo, NuevaSublista], Resto, NuevaLista).

% Predicado que verifica si un string es igual a una opcion escrita
direccionValida(String, Opcion) :- String = Opcion.

% Predicado que consigue una sublista de una lista
agregarASublista(Lista, Posicion, String, NuevaLista):- 
    select(Sublista, Lista, Resto), nuevoString(Sublista, String, NuevaSublista),
    guardarEnPosicion(NuevaSublista, Resto, Posicion, NuevaLista).

% Predicado que agrega un string a una sublista
nuevoString(Sublista, String, NuevaSublista):- append(Sublista, [String], NuevaSublista).

% Predicado que almacena en una posicion especifica de una sublista un elemento
guardarEnPosicion(_, [], 1, []).
guardarEnPosicion(Elemento, Lista, 1, [Elemento | Lista]).
guardarEnPosicion(Elemento, [Cabeza | Resto], Posicion, [Cabeza | NuevaLista]):- Posicion > 1,
    Posicion1 is Posicion - 1, guardarEnPosicion(Elemento, Resto, Posicion1, NuevaLista).
