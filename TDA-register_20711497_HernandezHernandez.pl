% Dominios
% Sistema, NuevoSistema: Sistema
% Usuario: Nombre

% Predicados
% systemRegister(Sistema, Usuario, NuevoSistema)
% usuarioUnico(Sistema, Usuario)

% Metas
% systemRegister
% usuarioUnico

% Clausulas
% Predicado que registra un nuevo usuario unico
systemRegister(Sistema, Usuario, NuevoSistema) :- usuarioUnico(Sistema, Usuario), append(Sistema, [[Usuario]], NuevoSistema); Sistema = NuevoSistema.

% Predicado que verifica que el usuario ingresado sea unico
usuarioUnico(Sistema, Usuario) :- \+ member([Usuario], Sistema).