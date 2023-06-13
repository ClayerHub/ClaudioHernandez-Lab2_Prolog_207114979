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

% Dominios
% Sistema, NuevoSistema: Sistema
% Usuario: Atomo

% Recorridos
% systemLogin(Sistema, Usuario, NuevoSistema)

% Metas
% systemLogin

% Clausulas
% Predicado que permite iniciar sesion si el usuario ya esta registrado
systemLogin(Sistema, Usuario, NuevoSistema) :- \+ member(Usuario, Sistema), append(Sistema, [["Login"]], NuevoSistema).

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

% Dominios
% Sistema, NuevoSistema: Sistema
% NombreCarpeta: Atomo

% Recorridos
% systemMkdir(Sistema, NombreCarpeta, NuevoSistema)

% Metas
% systemMkdir

% Clausulas
systemMkdir(_, _, _).

% Dominios
% Sistema9, NuevoSistema9: Sistema
% Direccion9: Atomo

% Recorridos
% systemCd(Sistema9, Atomo9, NuevoSistema9)

% Metas
% systemCd

% Clausulas
systemCd(_, _, _).

% Dominios
% Sistema, NuevoSistema: Sistema
% DatosArchivo: Lista
% NombreArchivo, Contenido: Atomo

% Recorridos
% file(NombreArchivo, Contenido, DatosArchivo)
% systemAddFile(Sistema, DatosArchivo, NuevoSistema)

% Metas
% file
% systemAddFile

% Clausulas
file(_, _, _).
systemAddFile(_, _, _).


% Dominios
% Sistema, NuevoSistema: Sistema
% NombreArchivo: Atomo

% Recorridos
% systemDel(Sistema, NombreArchivo, NuevoSistema)

% Metas
% systemDel

% Clausulas
systemDel(_, _, _).

% Dominios
% Sistema, NuevoSistema: Sistema
% NombreArchivo, Direccion: Atomo

% Recorridos
% systemCopy(Sistema, NombreArchivo, Direccion, NuevoSistema)

% Metas
% systemCopy

% Clausulas
systemCopy(_, _, _, _).

% Dominios
% Sistema, NuevoSistema: Sistema
% NombreArchivo, Direccion: Atomo

% Recorridos
% systemMove(Sistema, NombreArchivo, Direccion, NuevoSistema)

% Metas
% systemMove

% Clausulas
systemMove(_, _, _, _).

% Dominios
% Sistema, NuevoSistema: Sistema
% NombreActual, NuevoNombre: Atomo

% Recorridos
% systemRen(Sistema, NombreActual, NuevoNombre, NuevoSistema)

% Metas
% systemRen

% Clausulas
systemRen(_, _, _, _).

% Dominios
% Sistema: Sistema
% Parametro: Lista
% Str: Atomo

% Recorridos
% systemDir(Sistema, Parametro, Str)

% Metas
% systemDir

% Clausulas
systemDir(_, _, _).

% Dominios
% Sistema, NuevoSistema: Sistema
% Unidad, NuevoNombre: Atomo

% Recorridos
% systemFormat(Sistema, Unidad, NuevoNombre, NuevoSistema)

% Metas
% systemFormat

% Clausulas
systemFormat(_, _, _, _).

% Dominios
% Sistema, NuevoSistema: Sistema
% Clave, NombreArchivo: Atomo

% Recorridos
% systemEncrypt(Sistema, Clave, NombreArchivo, NuevoSistema)

% Metas
% systemEncrypt

% Clausulas
systemEncrypt(_, _, _, _).

% Dominios
% Sistema, NuevoSistema: Sistema
% Clave, NombreArchivo: Atomo

% Recorridos
% systemDecrypt(Sistema, Clave, NombreArchivo, NuevoSistema)

% Metas
% systemDecrypt

% Clausulas
systemDecrypt(_, _, _, _).

% Dominios
% Sistema: Sistema
% PalabraClave, NombreArchivo: Atomo

% Recorridos
% systemGrep(Sistema, PalabraClave, NombreArchivo)

% Metas
% systemGrep

% Clausulas
systemGrep(_, _, _).

% Dominios
% Sistema: Sistema
% Str: Atomo

% Recorridos
% systemViewTrash(Sistema, Atomo)

% Metas
% systemViewTrash

% Clausulas
systemViewTrash(_, _).

% Dominios
% Sistema, NuevoSistema: Sistema
% NombreArchivo: Atomo

% Recorridos
% systemRestore(Sistema, NombreArchivo, NuevoSistema)

% Metas
% systemRestore

% Clausulas
systemRestore(_, _, _).



