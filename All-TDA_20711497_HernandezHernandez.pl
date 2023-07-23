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

%-----------------------------------------------------------
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
systemAddDrive(Sistema, Letter, Nombre, Capacidad, NuevoSistema) :- esList(Sistema),atomOUnicoChar(Letter),esString(Nombre),esInt(Capacidad), 
    unidadUnica(Sistema, Letter), append(Sistema, [[Letter, Nombre, Capacidad]], NuevoSistema).

% Predicado que valida que una unidad sea unica
unidadUnica([], _).
unidadUnica([[Letter, _, _] | _], Letter) :- !, fail.
unidadUnica([_ | Resto], Letter) :- unidadUnica(Resto, Letter).

% Predicado que valida si un argumento es un string
esString(String):-string(String).
%Predicado que valida si un argumento es un entero
esInt(Entero):-integer(Entero).
% Predicado que valida si un argumento es un atomo o un string de un caracter
atomOUnicoChar(Char):-(atom(Char);(string(Char),string_length(Char,1))).
%Predicado que valida si un argumento es una lista
esList(Lista):-is_list(Lista).
           
%----------------------------------------------------------------
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
systemRegister(Sistema, Usuario, NuevoSistema) :- esList(Sistema), esString(Usuario), usuarioUnico(Sistema, Usuario), append(Sistema, [[Usuario]], NuevoSistema); esList(Sistema), esString(Usuario), usuarioExistente(Sistema, Usuario), Sistema = NuevoSistema.

% Predicado que verifica que el usuario ingresado sea unico
usuarioUnico(Sistema, Usuario) :- \+ member([Usuario], Sistema).

%Predicado que verifica que el usuario ingresado es igual a uno del sistema
usuarioExistente(Sistema, Usuario) :- member([Usuario], Sistema).

%--------------------------------------------------------------
% Dominios
% Sistema, NuevoSistema: Sistema
% Usuario: Atomo

% Recorridos
% systemLogin(Sistema, Usuario, NuevoSistema)

% Metas
% systemLogin

% Clausulas
% Predicado que permite iniciar sesion si el usuario ya esta registrado
systemLogin(Sistema, Usuario, NuevoSistema) :- esList(Sistema), esString(Usuario), dosVeces([Usuario], Sistema), member([Usuario], Sistema), Sistema = NuevoSistema;
    esList(Sistema), esString(Usuario), member([Usuario], Sistema), unicosAtomos(Sistema), append(Sistema, [[Usuario]], NuevoSistema).


%Predicado que verifica la cantidad de veces que se repite un atomo en una lista
repeticionesAtomo(_, [], 0).
repeticionesAtomo(Atomo, [Atomo|Resto], N):- repeticionesAtomo(Atomo, Resto, M), N is M + 1.
repeticionesAtomo(Atomo, [_|Resto], N):- repeticionesAtomo(Atomo, Resto, N).

%Predicado que verifica si un argumento esta dos veces en una lista
dosVeces(Atomo, Lista):- repeticionesAtomo(Atomo, Lista, 2).   

%Predicado que verifica que todos los argumentos de una lista sean unicos
unicosAtomos([]).
unicosAtomos([X|Resto]):- not(member(X, Resto)), unicosAtomos(Resto).
%----------------------------------------------------
% Dominios
% Sistema, NuevoSistema: Sistema
% Logeado: Atomo

% Predicados
%systemLogout(Sistema, NuevoSistema):- esList(Sistema), 
% quitarElemento(Logeado, Sistema, NuevoSistema)

% Metas
% systemLogout
% quitarElemento

% Clausulas
% Predicado que cierra sesion de un usuario del sistema
systemLogout(Sistema, NuevoSistema) :- esList(Sistema), verificarDupla(Sistema, Duplicado), eliminarCopia(Duplicado, Sistema, NuevoSistema);false.
% Predicado que si detecta que un elemento esta anotado dos veces, entrega true
verificarDupla([], false) :- false.
verificarDupla([X|Resto], X) :- 
    member(X, Resto).
verificarDupla([X|Resto], Duplicado) :- 
    \+ member(X, Resto), verificarDupla(Resto, Duplicado).

%Predicado que elimina un valor que esta duplicado
eliminarCopia(_, [], []).
eliminarCopia(Atomo, [Atomo|Resto], Resto) :- !.
eliminarCopia(Atomo, [X|Resto], [X|NuevaLista]) :- 
    eliminarCopia(Atomo, Resto, NuevaLista).

%--------------------------------------------------------------------
% Dominios
% Sistema, NuevoSistema: Sistema
% Unidad: Atomo

% Recorridos
% systemSwitchDrive(Sistema, Unidad, NuevoSistema)

% Metas
% systemSwitchDrive
% Clausulas
% Predicado que fija la unidad en la que el usuario realizara acciones
systemSwitchDrive(Sistema, Unidad, NuevoSistema) :- esList(Sistema), atomOUnicoChar(Unidad), verificarDupla(Sistema, _), valorEnSublista(Sistema, Unidad), append(Sistema, [[Unidad]], NuevoSistema).

% Predicado para verificar si un elemento esta dentro de las sublistas
valorEnSublista([], _):- false.
valorEnSublista([Sublista|_], Valor) :- member(Valor, Sublista), !.
valorEnSublista([_|Resto], Valor) :- valorEnSublista(Resto,Valor).


posicion_valor(Valor, Lista, Posicion) :-
    posicion_valor_aux(Valor, Lista, 1, Posicion).

posicion_valor_aux(Valor, [Valor|_], Posicion, Posicion).
posicion_valor_aux(Valor, [_|Resto], PosicionActual, Posicion) :-
    PosicionNueva is PosicionActual + 1,
    posicion_valor_aux(Valor, Resto, PosicionNueva, Posicion).
%--------------------------------------------------
% Dominios
% Sistema, NuevoSistema: Sistema
% NombreCarpeta: Atomo

% Recorridos
% systemMkdir(Sistema, NombreCarpeta, NuevoSistema)

% Metas
% systemMkdir

% Clausulas
systemMkdir(Sistema, Nombre, NuevoSistema):- esList(Sistema), esString(Nombre), nombreUnico(Sistema, Nombre), nuevaCarpeta(Nombre, Sistema, NuevoSistema, 6).

nuevaCarpeta(Nombre, Sistema, NuevoSistema, Ubicacion):- cualDoble(Sistema, Creador), nth1(Ubicacion, Sistema, Direccion), fechaActual(Fecha), append(Sistema, [[Nombre, Creador, Direccion, Fecha, Fecha]], NuevoSistema).

%Predicado que entrega el valor que esta duplicado en la lista (usuario)
cualDoble([Atomo|Resto], Atomo):- member(Atomo, Resto).
cualDoble([_|Resto], Duplicado):- cualDoble(Resto, Duplicado).

nombreUnico([], _).
nombreUnico([[Nombre, _, _, _, _] | _], Nombre) :- !, fail.
nombreUnico([_ | Resto], Nombre) :- nombreUnico(Resto, Nombre).

%--------------------------------------------------------------------
% Dominios
% Sistema9, NuevoSistema9: Sistema
% Direccion9: Atomo

% Recorridos
% systemCd(Sistema9, Atomo9, NuevoSistema9)

% Metas
% systemCd

% Clausulas
systemCd(Sistema, Directorio, NuevoSistema):- esList(Sistema), esString(Directorio), direccionValida(Directorio, "."), NuevoSistema = Sistema;
    esList(Sistema), esString(Directorio), direccionValida(Directorio, ".."), dosIguales(Sistema), eliminarUltimoElementoSublista(Sistema, 6, 1, NuevoSistema);
    esList(Sistema), esString(Directorio), direccionValida(Directorio, ".."), dosIguales(Sistema), subListaUno(Sistema, 6), NuevoSistema = Sistema; 
    esList(Sistema), esString(Directorio), direccionValida(Directorio, "/"), dosIguales(Sistema), subListaUno(Sistema, 6), NuevoSistema = Sistema;
    esList(Sistema), esString(Directorio), direccionValida(Directorio, "/"), dosIguales(Sistema), unElementoSublista(Sistema, 6, NuevoSistema); 
    esList(Sistema), esString(Directorio), direccionValida(Directorio, "./"), NuevoSistema = Sistema; 
    esList(Sistema), esString(Directorio), direccionValida(Directorio, "././././"), NuevoSistema = Sistema;
    esList(Sistema), esString(Directorio), nombreUnico(Sistema, Directorio), agregarASublista(Sistema, 6, Directorio, NuevoSistema); NuevoSistema = Sistema. 
    



%Con esto se llama eliminar_ultimo_elemento_sublista_posicion_aux(Lista, Posicion, 1, NuevaLista).

eliminarUltimoElementoSublista([], _, _, []).
eliminarUltimoElementoSublista([Sublista | Resto], Posicion, PosActual, [NuevaSublista | NuevoResto]):-
    PosActual =:= Posicion, length(Sublista, Longitud), Longitud > 1, quitarUltimoElemento(Sublista, NuevaSublista),
    NuevaPosActual is PosActual + 1, eliminarUltimoElementoSublista(Resto, Posicion, NuevaPosActual, NuevoResto).
eliminarUltimoElementoSublista([Sublista | Resto], Posicion, PosActual, [Sublista | NuevoResto]) :-
    NuevaPosActual is PosActual + 1, eliminarUltimoElementoSublista(Resto, Posicion, NuevaPosActual, NuevoResto).

quitarUltimoElemento(Sublista, NuevaSublista):- append(NuevaSublista, [_], Sublista).

dosIguales(Lista):- append(_, [X|Resto], Lista), member(X,Resto).

subListaUno(Lista, Posicion):- nth1(Posicion, Lista, Sublista), length(Sublista, 1).

unElementoSublista(Lista, Posicion, NuevaLista):- nth1(Posicion, Lista, Sublista), primerElemento(Sublista, PrimerElemento),
    nuevaSublista(Posicion, [PrimerElemento], Lista, NuevaLista).

primerElemento([PrimerElemento | _], PrimerElemento).

nuevaSublista(Posicion, NuevaSublista, Lista, NuevaLista):- restarUno is Posicion - 1, length(Prefijo, restarUno), append(Prefijo, [_ | Resto], Lista),
    append([Prefijo, NuevaSublista], Resto, NuevaLista).

direccionValida(String, Opcion) :- String = Opcion.

agregarASublista(Lista, Posicion, String, NuevaLista):- 
    select(Sublista, Lista, Resto), nuevoString(Sublista, String, NuevaSublista),
    guardarEnPosicion(NuevaSublista, Resto, Posicion, NuevaLista).

nuevoString(Sublista, String, NuevaSublista):- append(Sublista, [String], NuevaSublista).

guardarEnPosicion(_, [], 1, []).
guardarEnPosicion(Elemento, Lista, 1, [Elemento | Lista]).
guardarEnPosicion(Elemento, [Cabeza | Resto], Posicion, [Cabeza | NuevaLista]):- Posicion > 1,
    Posicion1 is Posicion - 1, guardarEnPosicion(Elemento, Resto, Posicion1, NuevaLista).


agregar_string_sublista(Lista, Posicion, String, NuevaLista) :-
    select(Sublista, Lista, Resto),
    insertar_en_posicion(NuevaSublista, Resto, Posicion, NuevaLista),
    agregar_string(Sublista, String, NuevaSublista).

agregar_string(Sublista, String, NuevaSublista) :-
    append(Sublista, [String], NuevaSublista).

insertar_en_posicion(_, [], 1, []).
insertar_en_posicion(Elemento, Lista, 1, [Elemento | Lista]).
insertar_en_posicion(Elemento, [Cabeza | Resto], Posicion, [Cabeza | NuevaLista]) :-
    Posicion > 1,
    Posicion1 is Posicion - 1,
    insertar_en_posicion(Elemento, Resto, Posicion1, NuevaLista).
%----------------------------------------------------------
% Dominios
% Sistema, NuevoSistema: Sistema
% DatosArchivo: Lista./
% NombreArchivo, Contenido: Atomo
% Recorridos
% file(NombreArchivo, Contenido, DatosArchivo)
% systemAddFile(Sistema, DatosArchivo, NuevoSistema)

% Metas
% file
% systemAddFile

% Clausulas
file(Nombre, Contenido, Archivo):- Archivo = [Nombre, Contenido].
systemAddFile(Sistema, Archivo, NuevoSistema):- esList(Sistema), esList(Archivo), append(Sistema, [Archivo], NuevoSistema).


%----------------------------------------------------------------
% Dominios
% Sistema, NuevoSistema: Sistema
% NombreArchivo: Atomo

% Recorridos
% systemDel(Sistema, NombreArchivo, NuevoSistema)

% Metas
% systemDel

% Clausulas
systemDel(Sistema, NombreArchivo, NuevoSistema):- 
    esList(Sistema), esString(NombreArchivo), select([NombreArchivo | _], Sistema, NuevoSistema). 

%-----------------------------------------------------------------------------------
% Dominios
% Sistema, NuevoSistema: Sistema
% NombreArchivo, Direccion: Atomo

% Recorridos
% systemCopy(Sistema, NombreArchivo, Direccion, NuevoSistema)

% Metas
% systemCopy

% Clausulas
systemCopy(Sistema, Archivo, Ubicacion, NuevoSistema):- esList(Sistema), esString(Archivo), esString(Ubicacion),
    member([Archivo | Resto], Sistema), append(Sistema, [[Archivo | Resto]], NuevoSistema).
  

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
systemRen(Sistema, Archivo, NuevoNombre, NuevoSistema):- esList(Sistema), esString(Archivo), esString(NuevoNombre), cambiarNombre(Archivo, NuevoNombre, Sistema, NuevoSistema).
cambiarNombre(_, _, [], []).
cambiarNombre(NombreActual, NombreNuevo, [[NombreActual | Resto] | RestoSublistas], [[NombreNuevo | Resto]|RestoSublistas]) :- !.
cambiarNombre(NombreActual, NombreNuevo, [Sublista | Resto], [Sublista | NuevoResto]):- cambiarNombre(NombreActual, NombreNuevo, Resto, NuevoResto).


%--------------------------------------------------------------
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
