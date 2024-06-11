***************** Ver la configuración para VLTESORERIA ***************

CREATE SQL VIEW "VLTESORERIA" ; 
   AS SELECT asientos.codigo,plancuenta.cuenta,plancuenta.nombre,SUM(debe-haber) AS saldoanterior, 000000000.00 AS saldodia ;
   FROM asientos,plancuenta  WHERE asientos.codigo IN (SELECT codigo FROM tesoreria).AND.asientos.codigo=plancuenta.codigo.AND.asientos.fecha<?dFecha GROUP BY 2  ;
   UNION  SELECT asientos.codigo,plancuenta.cuenta,plancuenta.nombre, 000000000.00 AS saldoanterior, SUM(debe-haber) AS saldodia ;
   FROM asientos,plancuenta  WHERE asientos.codigo IN (SELECT codigo FROM tesoreria).AND.asientos.codigo=plancuenta.codigo.AND.asientos.fecha<=?dFecha GROUP BY 1 ORDER BY 2

DBSetProp('VLTESORERIA', 'View', 'UpdateType', 1)
DBSetProp('VLTESORERIA', 'View', 'WhereType', 3)
DBSetProp('VLTESORERIA', 'View', 'FetchMemo', .T.)
DBSetProp('VLTESORERIA', 'View', 'SendUpdates', .F.)
DBSetProp('VLTESORERIA', 'View', 'UseMemoSize', 255)
DBSetProp('VLTESORERIA', 'View', 'FetchSize', 100)
DBSetProp('VLTESORERIA', 'View', 'MaxRecords', -1)
DBSetProp('VLTESORERIA', 'View', 'Tables', 'asientos')
DBSetProp('VLTESORERIA', 'View', 'Prepared', .F.)
DBSetProp('VLTESORERIA', 'View', 'CompareMemo', .T.)
DBSetProp('VLTESORERIA', 'View', 'FetchAsNeeded', .F.)
DBSetProp('VLTESORERIA', 'View', 'FetchSize', 100)
DBSetProp('VLTESORERIA', 'View', 'Comment', "")
DBSetProp('VLTESORERIA', 'View', 'BatchUpdateCount', 1)
DBSetProp('VLTESORERIA', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for VLTESORERIA
* Props for the VLTESORERIA.cuenta field.
DBSetProp('VLTESORERIA.codigo', 'Field', 'KeyField', .F.)
DBSetProp('VLTESORERIA.codigo', 'Field', 'Updatable', .T.)
DBSetProp('VLTESORERIA.codigo', 'Field', 'UpdateName', 'asientos.codigo')
DBSetProp('VLTESORERIA.codigo', 'Field', 'DataType', "C(7)")
* Props for the VLTESORERIA.saldoanterior field.
DBSetProp('VLTESORERIA.saldoanterior', 'Field', 'KeyField', .F.)
DBSetProp('VLTESORERIA.saldoanterior', 'Field', 'Updatable', .F.)
DBSetProp('VLTESORERIA.saldoanterior', 'Field', 'UpdateName', 'saldoanterior')
DBSetProp('VLTESORERIA.saldoanterior', 'Field', 'DataType', "N(16,2)")
* Props for the VLTESORERIA.saldodia field.
DBSetProp('VLTESORERIA.saldodia', 'Field', 'KeyField', .F.)
DBSetProp('VLTESORERIA.saldodia', 'Field', 'Updatable', .F.)
DBSetProp('VLTESORERIA.saldodia', 'Field', 'UpdateName', 'saldodia')
DBSetProp('VLTESORERIA.saldodia', 'Field', 'DataType', "N(12,2)")
