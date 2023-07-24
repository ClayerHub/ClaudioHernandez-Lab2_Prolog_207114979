:- module(systemSwitchDrive_207114979_HernandezHernandez, [systemSwitchDrive/3, esList/1, atomOUnicoChar/1, verificarDupla/2, valorEnSublista/2]).
% Dominios
% Sistema, NuevoSistema: Sistema
% Unidad: String
% Lista, Duplicado, Char, Sublista, Valor, Resto = Variables

% Recorridos
% systemSwitchDrive(Sistema, Unidad, NuevoSistema)
% esList(Lista)
% atomOUnicoChar(Char)
% verificarDupla(Lista, Duplicado)
% valorEnSublista(Lista, Char)

% Metas
% systemSwitchDrive
% esList
% atomOUnicoChar
% verificarDupla
% valorEnSublista

% Clausulas
% Predicado que fija la unidad en la que el usuario realizara acciones
systemSwitchDrive(Sistema, Unidad, NuevoSistema) :- esList(Sistema), atomOUnicoChar(Unidad), verificarDupla(Sistema, _), valorEnSublista(Sistema, Unidad), append(Sistema, [[Unidad]], NuevoSistema).

% Predicado para verificar si un elemento esta dentro de las sublistas
valorEnSublista([], _):- false.
valorEnSublista([Sublista|_], Valor) :- member(Valor, Sublista), !.
valorEnSublista([_|Resto], Valor) :- valorEnSublista(Resto,Valor).