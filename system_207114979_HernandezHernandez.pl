% Dominios
% Nombre: Atomo
% Sistema: Sistema
% Fecha: Numero

% Predicados
% system(Nombre, Sistema)
% fechaActual(Fecha)

% Metas
% system
% fechaActual

% Clausulas
% Predicado que construye un sistema y deja registro de la fecha de creacion
system(Nombre, Sistema) :- fechaActual(Fecha), Sistema = [system(Nombre, Fecha)].

% Predicado que permite obtener la fecha actual
fechaActual(Fecha) :- get_time(Fecha).