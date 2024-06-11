*
* Control de Asientos
*
CLOSE ALL 
CLEAR ALL 
USE asientos ORDER id 
STORE 0 TO nSaldo,nID,nDif

SELECT asientos
SCAN 
	IF id#nID
		IF nSaldo#0
			IF ABS(nSaldo)>1
				?nID,nAsiento,nSaldo
			ENDIF 
		ENDIF 
		nSaldo=0
	ENDIF 
	nSaldo=nSaldo+debe-haber
	nDif=nDif+debe-haber
	nID=id
	nAsiento=asiento
ENDSCAN 
?nDif

