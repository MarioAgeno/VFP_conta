*.*
*.* Proceso que ordena Asientos por Fecha
*.* 
CLOSE TABLES ALL 
IF MESSAGEBOX("Este procedimiento puede demorar varios minutos esta seguro de seguir",4+32+256,"Atencion")=6
	WAIT WINDOWS "Aguardar un Momento" NOWAIT
	USE asientos EXCLUSIVE
	SORT ON fecha,asiento,codigo TO asientosord
	ZAP
	APPEND FROM asientosord 
	CLOS TABLE ALL
	WAIT CLEAR
	MESSAGEBOX("Proceso terminado",48,"Listo")
ENDIF
