% Dominios
% Sistema, NuevoSistema: Sistema
% Letter, Nombre: Atomo
% Capacidad: Numero

% Predicados
% systemAddDrive(Sistema, Letter, Nombre, Capacidad, NuevoSistema)
% letraUnica(Lista, Letter)
% atomOChar(Letter)
% esString(String)
% esInt(Entero)
% atomOUnicoChar(Char)
% esList(Lista)

% Metas
% systemAddDrive
% letraUnica
% atomOChar
% esString
% esInt
% atomOUnicoChar
% esList

% Clausulas
% Predicado que añade una unidad al sistema. Esta unidad debe ser unica
systemAddDrive(Sistema, Letter, Nombre, Capacidad, NuevoSistema) :- esList(Sistema),atomOUnicoChar(Letter),esString(Nombre),esInt(Capacidad), 
    unidadUnica(Sistema, Letter), append(Sistema, [[Letter, Nombre, Capacidad]], NuevoSistema).

% Predicado que valida que una unidad sea unica
unidadUnica([], _).
unidadUnica([[Letter, _, _] | _], Letter) :- !, fail.
unidadUnica([_ | Resto], Letter) :- unidadUnica(Resto, Letter).

% Predicado que valida si un argumento es un string
esString(String):-string(String).

% Predicado que valida si un argumento es un entero
esInt(Entero):-integer(Entero).

% Predicado que valida si un argumento es un atomo o un string de un caracter
atomOUnicoChar(Char):-(atom(Char);(string(Char),string_length(Char,1))).

% Predicado que valida si un argumento es una lista
esList(Lista):-is_list(Lista).