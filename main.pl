:- use_module(system_207114979_HernandezHernandez, [system/2, fechaActual/1]).
:- use_module(systemAddDrive_207114979_HernandezHernandez, [systemAddDrive/5, esString/1, esInt/1, atomOUnicoChar/1, esList/1]).
:- use_module(systemRegister_207114979_HernandezHernandez, [systemRegister/3, usuarioUnico/2, usuarioExistente/2, esList/1, esString/1]).
:- use_module(systemLogin_207114979_HernandezHernandez, [systemLogin/3, dosVeces/2, esList/1, esString/1, repeticionesAtomo/3, unicosAtomos/1]).
:- use_module(systemLogout_207114979_HernandezHernandez, [systemLogout/2, verificarDupla/2, eliminarCopia/3, esList/1]).
:- use_module(systemSwitchDrive_207114979_HernandezHernandez, [systemSwitchDrive/3, esList/1, atomOUnicoChar/1, verificarDupla/2, valorEnSublista/2]).
:- use_module(systemMkdir_207114979_HernandezHernandez, [systemMkdir/3, esList/1, esString/1, nombreUnico/2, nuevaCarpeta/4, cualDoble/2, fechaActual/1]).
:- use_module(systemCd_207114979_HernandezHernandez, [systemCd/3, esList/1, esString/1, nombreUnico/2, dosIguales/1, agregarASublista/4, 
    eliminarUltimoElementoSublista/4, subListaUno/2, unElementoSublista/3, quitarUltimoElemento/2, primerElemento/2, nuevaSublista/4, 
    direccionValida/2, nuevoString/3, guardarEnPosicion/4]).
:- use_module(systemAddFile_207114979_HernandezHernandez, [file/3, systemAddFile/3, esList/1]).
:- use_module(systemDel_207114979_HernandezHernandez, [systemDel/3, esList/1]).
:- use_module(systemCopy_207114979_HernandezHernandez, [systemCopy/4, esList/1, esString/1]).
:- use_module(systemMove_207114979_HernandezHernandez, [systemMove/4, esList/1, esString/1]).
:- use_module(systemRen_207114979_HernandezHernandez, [systemRen/4, cambiarNombre/4, esString/1, esList/1]).
:- use_module(systemFormat_207114979_HernandezHernandez, [systemFormat/4, esList/1, esString/1]).
:- use_module(systemDir_207114979_HernandezHernandez, [systemDir/3]).
:- use_module(systemEncrypt_207114979_HernandezHernandez, [systemEncrypt/4]).
:- use_module(systemDecrypt_207114979_HernandezHernandez, [systemDecrypt/4]).
:- use_module(systemGrep_207114979_HernandezHernandez, [systemGrep/3]).
:- use_module(systemViewTrash_207114979_HernandezHernandez, [systemViewTrash/2]).
:- use_module(systemRestore_207114979_HernandezHernandez, [systemRestore/3]).

% Caso que debe retornar true:
% Creando un sistema, con el disco C, dos usuarios: “user1” y “user2” 
% se hace login con "user1”, se utiliza el disco "C", se crea la carpeta “folder1” 
% "folder2", se cambia al directorio actual "folder1", 
% se crea la carpeta "folder11" dentro de "folder1", 
% se hace logout del usuario "user1", se hace login con “user2”, 
% se crea el archivo "foo.txt" dentro de “folder1”, se acceder a la carpeta c:/folder2, 
% se crea el archivo "ejemplo.txt" dentro de c:/folder2

% system("newSystem", S1), systemAddDrive(S1, "C", "OS", 10000000000, S2), systemRegister(S2, "user1", S3), systemRegister(S3, "user2", S4), 
% systemLogin(S4, "user1", S5), systemSwitchDrive(S5, "C", S6), systemMkdir(S6, "folder1", S7), systemMkdir(S7, "folder2", S8), 
% systemCd(S8, "folder1", S9), systemMkdir(S9, "folder11", S10), systemLogout(S10, S11), systemLogin(S11, "user2", S12), 
% file( "foo.txt", "hello world", F1), systemAddFile(S12, F1, S13), systemCd(S13, "/folder2", S14),  file( "ejemplo.txt", "otro archivo", F2), 
% systemAddFile(S14, F2, S15).

% Casos que deben retornar false:
% si se intenta añadir una unidad con una letra que ya existe
% system("newSystem", S1), systemRegister(S1, "user1", S2), systemAddDrive(S2, "C", "OS", 1000000000, S3), 
% systemAddDrive(S3, "C", "otra etiqueta", 1000000000, S4).

% si se intenta hacer login con otra sesión ya iniciada por este usuario u otro
% system("newSystem", S1), systemRegister(S1, "user1", S2), systemRegister(S2, "user2", S3), 
% systemLogin(S3, "user1", S4), systemLogin(S4, "user2", S5).

% si se intenta usar una unidad inexistente
% system("newSystem", S1), systemRegister(S1, "user1", S2), systemLogin(S2, "user1", S3), systemSwitchDrive(S3, "K", S4).