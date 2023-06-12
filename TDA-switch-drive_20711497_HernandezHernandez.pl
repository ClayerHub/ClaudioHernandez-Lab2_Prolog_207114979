% Dominios
% Sistema, NuevoSistema: Sistema
% Unidad: Atomo

% Recorridos
% systemSwitchDrive(Sistema, Unidad, NuevoSistema)

% Metas
% systemSwitchDrive
% Clausulas
% Predicado que fija la unidad en la que el usuario realizara acciones
systemSwitchDrive(Sistema, Unidad, NuevoSistema) :- member(["Login"], Sistema), member([Unidad,_,_], Sistema), NuevoSistema = Sistema.