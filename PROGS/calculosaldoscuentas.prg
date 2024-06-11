WAIT WINDOWS "Aguardar un Momento"+CHR(13)+"Calculando Saldos..." NOWAIT
CLOSE TABLES all

USE plancuenta ORDER codigo IN 0 
USE asientos   ORDER asiento IN 0
SELECT asientos
SET RELATION TO codigo INTO plancuenta

SELE plancuenta
UPDATE plancuenta SET saldoanterior=0 
UPDATE plancuenta SET saldoactual=0 

SELE asientos
SCAN
	REPLACE plancuenta.saldoanterior WITH plancuenta.saldoactual
	REPLACE plancuenta.saldoactual   WITH plancuenta.saldoactual+asientos.debe-asientos.haber
	REPLACE asientos.saldo WITH plancuenta.saldoactual
ENDSCAN
WAIT CLEAR
