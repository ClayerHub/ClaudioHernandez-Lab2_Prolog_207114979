% Dominios
% Nombre: Atomo
% Sistema: Sistema
% Fecha: Numero

% Predicados
% crearSistema(Nombre, Sistema)
% obtenerFecha(Fecha)

% Metas
% crearSistema
% obtenerFecha

% Clausulas
% Predicado que construye un sistema y deja registro de la fecha de creacion
crearSistema(Nombre, Sistema) :-
    obtenerFecha(Fecha),
    Sistema = sistema(Nombre, Fecha).

% Predicado que permite obtener la fecha actual
obtenerFecha(Fecha) :- get_time(Fecha).