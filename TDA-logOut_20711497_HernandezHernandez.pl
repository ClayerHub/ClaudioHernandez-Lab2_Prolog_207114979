% Dominios
% Sistema, NuevoSistema: Sistema
% Logeado: Atomo

% Predicados
% systemLogout(Sistema, NuevoSistema)
% quitarElemento(Logeado, Sistema, NuevoSistema)

% Metas
% systemLogout
% quitarElemento

% Clausulas
% Predicado que cierra sesion de un usuario del sistema
systemLogout(Sistema, NuevoSistema) :- member(["Login"], Sistema), quitarElemento(["Login"], Sistema, NuevoSistema).

% Predicado que elimina el elemento de una lista, y la entrega en una lista actualizada
quitarElemento(Logeado, Sistema, NuevoSistema) :- select(Logeado, Sistema, NuevoSistema).