% Dominios
% Sistema, NuevoSistema: Sistema
% Letter, Nombre: Atomo
% Capacidad: Numero
% Resto: Variable

% Predicados
% systemAddDrive(Sistema, Letter, Nombre, Capacidad, NuevoSistema)
% letraUnica(Lista, Letter)
% atomOChar(Letter)

% Metas
% systemAddDrive
% letraUnica
% atomOChar

% Clausulas
% Predicado que añade una unidad al sistema
systemAddDrive(Sistema, Letter, Nombre, Capacidad, NuevoSistema) :- atomOChar(Letter), letraUnica(Sistema, Letter), append(Sistema, [[Letter, Nombre, Capacidad]], NuevoSistema).


% Predicado que valida que una letra sea unica
letraUnica([], _).
letraUnica([[Letter, _, _] | _], Letter) :- !, fail.
letraUnica([_ | Resto], Letter) :- letraUnica(Resto, Letter).

% Predicado que valida si un argumento es un atomo o un string de un caracter
atomOChar(Letter) :- (atom(Letter); string(Letter)), atom_length(Letter, 1).
