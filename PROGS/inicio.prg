*
* Verifico que no se encuentre la aplicacion ejecutandose mas de una vez
*
DECLARE INTEGER FindWindow IN win32api INTEGER nullpointer, STRING cwindow_name

IF FindWindow(0,"M.A.A.Soft") > 0
	MESSAGEBOX("Esta aplicacion ya se encuentra abierta por favor verifique en la barra de estado de su administrador de sistemas",16,"Atencion !!!")
	RETURN
ENDIF

SET SYSMENU OFF
PUBLIC oApp

SET CLASSLIB TO \clientes\comun\libs\clasesbases
SET CLASSLIB TO conta ADDITIVE
oApp=CREATEOBJECT("mientorno")
oApp.Setup
_screen.Caption="M.A.A.Soft"

DO FORM acercaDe WITH 5000
ON ERROR DO ErrorAplicacion                  && Rutina de Errores

DO FORM AccesoEmpresa WITH "E" TO lSigo      && Controlo Acceso al Sistema 
IF !lSigo                                    && Empresa en la que se conecta
	RETURN
ENDIF

*DO FORM ControlaTablas                  && Controlo Tablas e Indices

ON SHUTDOWN oApp.CerrarAplicacion
ON READERROR MESSAGEBOX("Entrada no valida para el campo seleccionado",48,"Atencion")

LOCAL oMenu
oMenu = NEWOBJECT( "createmenu", "c:\clientes\comun\libs\clasesbases.vcx", .NULL., .T., .F., oApp.usuario)
oMenu.CreateMenu()
oMenu.Destroy()

READ EVENTS

oApp.Cleanup
RELEASE oApp
ON SHUTDOWN
CLOSE ALL
RELEASE ALL EXTENDED
CLEAR
CLEAR ALL
ON ERROR
