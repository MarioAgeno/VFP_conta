*.*
*.* Correccion Saldos en asientos Contables
*.*
WAIT WINDOW "Aguardar un Momento Calculado Saldos ... " NOWAIT 
CLOSE TABLES ALL 
USE asientos
INDEX ON STR(codigo,5)+DTOS(fecha) TO astoord

nCodigo=0
nSaldo=0
SCAN
	IF codigo#nCodigo
		nSaldo=0
	ENDIF 
	nCodigo=codigo
	nSaldo=nSaldo+debe-haber
	REPLACE saldo WITH nSaldo
	SELECT asientos 
ENDSCAN

CLOSE TABLES ALL 
WAIT CLEAR 
