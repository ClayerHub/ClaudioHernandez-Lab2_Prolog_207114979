:- module(systemRegister_207114979_HernandezHernandez, [systemRegister/3, usuarioUnico/2, usuarioExistente/2, esList/1, esString/1]).

% Dominios
% Sistema, NuevoSistema: Sistema
% Usuario: String
% Lista, String = Variables

% Predicados
% systemRegister(Sistema, Usuario, NuevoSistema)
% usuarioUnico(Lista, String)
% usuarioExistente(Lista, String)
% esList(Lista)
% esString(String)

% Metas
% systemRegister
% usuarioUnico
% usuarioExistente
% esList
% esString

% Clausulas
% Predicado que registra un nuevo usuario unico
systemRegister(Sistema, Usuario, NuevoSistema) :- esList(Sistema), esString(Usuario), usuarioUnico(Sistema, Usuario), append(Sistema, [[Usuario]], NuevoSistema); esList(Sistema), esString(Usuario), usuarioExistente(Sistema, Usuario), Sistema = NuevoSistema.

% Predicado que verifica que el usuario ingresado sea unico
usuarioUnico(Lista, String) :- \+ member([String], Lista).

% Predicado que verifica que el usuario ingresado es igual a uno del sistema
usuarioExistente(Lista, String) :- member([String], Lista).