% Dominios
% Sistema, NuevoSistema: Sistema
% Usuario: Atomo

% Recorridos
% systemLogin(Sistema, Usuario, NuevoSistema)

% Metas
% systemLogin

% Clausulas
% Predicado que permite iniciar sesion si el usuario ya esta registrado
systemLogin(Sistema, Usuario, NuevoSistema) :- \+ member(Usuario, Sistema), append(Sistema, [[Usuario, "Login"]], NuevoSistema).