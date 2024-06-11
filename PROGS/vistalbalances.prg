OPEN DATABASE contabilidad EXCLUSIVE VALIDATE


***************** Ver la configuración para VLPREBALANCE ***************

CREATE SQL VIEW "VLPREBALANCE" ; 
   AS SELECT Asientos.codigo, SUM(Asientos.debe-Asientos.haber) AS saldoanterior, 000000000000.00 AS saldoactual  FROM  contabilidad!asientos WHERE Asientos.fecha < ?dDesde .AND. Asientos.ajuste <= ?nAjuste GROUP BY 1  UNION   SELECT Asientos.codigo, 000000000000.00 AS saldoanterior, SUM(Asientos.debe-Asientos.haber) AS saldoactual  FROM  contabilidad!asientos WHERE Asientos.fecha <= ?dHasta .AND. Asientos.ajuste <= ?nAjuste GROUP BY 1 ORDER BY 1

DBSetProp('VLPREBALANCE', 'View', 'UpdateType', 1)
DBSetProp('VLPREBALANCE', 'View', 'WhereType', 3)
DBSetProp('VLPREBALANCE', 'View', 'FetchMemo', .T.)
DBSetProp('VLPREBALANCE', 'View', 'SendUpdates', .F.)
DBSetProp('VLPREBALANCE', 'View', 'UseMemoSize', 255)
DBSetProp('VLPREBALANCE', 'View', 'FetchSize', 100)
DBSetProp('VLPREBALANCE', 'View', 'MaxRecords', -1)
DBSetProp('VLPREBALANCE', 'View', 'Tables', 'contabilidad!asientos')
DBSetProp('VLPREBALANCE', 'View', 'Prepared', .F.)
DBSetProp('VLPREBALANCE', 'View', 'CompareMemo', .T.)
DBSetProp('VLPREBALANCE', 'View', 'FetchAsNeeded', .F.)
DBSetProp('VLPREBALANCE', 'View', 'FetchSize', 100)
DBSetProp('VLPREBALANCE', 'View', 'Comment', "")
DBSetProp('VLPREBALANCE', 'View', 'BatchUpdateCount', 1)
DBSetProp('VLPREBALANCE', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for VLPREBALANCE
* Props for the VLPREBALANCE.codigo field.
DBSetProp('VLPREBALANCE.codigo', 'Field', 'KeyField', .F.)
DBSetProp('VLPREBALANCE.codigo', 'Field', 'Updatable', .T.)
DBSetProp('VLPREBALANCE.codigo', 'Field', 'UpdateName', 'contabilidad!asientos.codigo')
DBSetProp('VLPREBALANCE.codigo', 'Field', 'DataType', "N(5)")
* Props for the VLPREBALANCE.saldoanterior field.
DBSetProp('VLPREBALANCE.saldoanterior', 'Field', 'KeyField', .F.)
DBSetProp('VLPREBALANCE.saldoanterior', 'Field', 'Updatable', .F.)
DBSetProp('VLPREBALANCE.saldoanterior', 'Field', 'UpdateName', 'saldoanterior')
DBSetProp('VLPREBALANCE.saldoanterior', 'Field', 'DataType', "N(16,2)")
* Props for the VLPREBALANCE.saldoactual field.
DBSetProp('VLPREBALANCE.saldoactual', 'Field', 'KeyField', .F.)
DBSetProp('VLPREBALANCE.saldoactual', 'Field', 'Updatable', .F.)
DBSetProp('VLPREBALANCE.saldoactual', 'Field', 'UpdateName', 'saldoactual')
DBSetProp('VLPREBALANCE.saldoactual', 'Field', 'DataType', "N(15,2)")
 
***************** Ver la configuración para VLBALANCE ***************

CREATE SQL VIEW "VLBALANCE" ; 
   AS SELECT Vlprebalance.codigo, Plancuenta.cuenta, Plancuenta.nombre,  SUM(Vlprebalance.saldoanterior) AS saldoanterior,  SUM(Vlprebalance.saldoactual) AS saldoactual,  SUM(Vlprebalance.saldoactual-Vlprebalance.saldoanterior) AS diferencia,  Plancuenta.moneda, Plancuenta.resultado FROM  contabilidad!vlprebalance INNER JOIN contabilidad!plancuenta    ON  Vlprebalance.codigo = Plancuenta.codigo WHERE Plancuenta.moneda BETWEEN ?nMoneda AND ?nMoneda2 GROUP BY Plancuenta.cuenta

DBSetProp('VLBALANCE', 'View', 'UpdateType', 1)
DBSetProp('VLBALANCE', 'View', 'WhereType', 3)
DBSetProp('VLBALANCE', 'View', 'FetchMemo', .T.)
DBSetProp('VLBALANCE', 'View', 'SendUpdates', .F.)
DBSetProp('VLBALANCE', 'View', 'UseMemoSize', 255)
DBSetProp('VLBALANCE', 'View', 'FetchSize', 100)
DBSetProp('VLBALANCE', 'View', 'MaxRecords', -1)
DBSetProp('VLBALANCE', 'View', 'Tables', '')
DBSetProp('VLBALANCE', 'View', 'Prepared', .F.)
DBSetProp('VLBALANCE', 'View', 'CompareMemo', .T.)
DBSetProp('VLBALANCE', 'View', 'FetchAsNeeded', .F.)
DBSetProp('VLBALANCE', 'View', 'FetchSize', 100)
DBSetProp('VLBALANCE', 'View', 'Comment', "")
DBSetProp('VLBALANCE', 'View', 'BatchUpdateCount', 1)
DBSetProp('VLBALANCE', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for VLBALANCE
* Props for the VLBALANCE.codigo field.
DBSetProp('VLBALANCE.codigo', 'Field', 'KeyField', .F.)
DBSetProp('VLBALANCE.codigo', 'Field', 'Updatable', .F.)
DBSetProp('VLBALANCE.codigo', 'Field', 'UpdateName', 'contabilidad!vlprebalance.codigo')
DBSetProp('VLBALANCE.codigo', 'Field', 'DataType', "N(5)")
* Props for the VLBALANCE.cuenta field.
DBSetProp('VLBALANCE.cuenta', 'Field', 'KeyField', .F.)
DBSetProp('VLBALANCE.cuenta', 'Field', 'Updatable', .F.)
DBSetProp('VLBALANCE.cuenta', 'Field', 'UpdateName', 'contabilidad!plancuenta.cuenta')
DBSetProp('VLBALANCE.cuenta', 'Field', 'DataType', "C(10)")
* Props for the VLBALANCE.nombre field.
DBSetProp('VLBALANCE.nombre', 'Field', 'KeyField', .F.)
DBSetProp('VLBALANCE.nombre', 'Field', 'Updatable', .F.)
DBSetProp('VLBALANCE.nombre', 'Field', 'UpdateName', 'contabilidad!plancuenta.nombre')
DBSetProp('VLBALANCE.nombre', 'Field', 'DataType', "C(35)")
* Props for the VLBALANCE.saldoanterior field.
DBSetProp('VLBALANCE.saldoanterior', 'Field', 'KeyField', .F.)
DBSetProp('VLBALANCE.saldoanterior', 'Field', 'Updatable', .F.)
DBSetProp('VLBALANCE.saldoanterior', 'Field', 'UpdateName', 'saldoanterior')
DBSetProp('VLBALANCE.saldoanterior', 'Field', 'DataType', "N(16,2)")
* Props for the VLBALANCE.saldoactual field.
DBSetProp('VLBALANCE.saldoactual', 'Field', 'KeyField', .F.)
DBSetProp('VLBALANCE.saldoactual', 'Field', 'Updatable', .F.)
DBSetProp('VLBALANCE.saldoactual', 'Field', 'UpdateName', 'saldoactual')
DBSetProp('VLBALANCE.saldoactual', 'Field', 'DataType', "N(16,2)")
* Props for the VLBALANCE.diferencia field.
DBSetProp('VLBALANCE.diferencia', 'Field', 'KeyField', .F.)
DBSetProp('VLBALANCE.diferencia', 'Field', 'Updatable', .F.)
DBSetProp('VLBALANCE.diferencia', 'Field', 'UpdateName', 'diferencia')
DBSetProp('VLBALANCE.diferencia', 'Field', 'DataType', "N(17,2)")
* Props for the VLBALANCE.moneda field.
DBSetProp('VLBALANCE.moneda', 'Field', 'KeyField', .F.)
DBSetProp('VLBALANCE.moneda', 'Field', 'Updatable', .F.)
DBSetProp('VLBALANCE.moneda', 'Field', 'UpdateName', 'contabilidad!plancuenta.moneda')
DBSetProp('VLBALANCE.moneda', 'Field', 'DataType', "N(1)")
* Props for the VLBALANCE.resultado field.
DBSetProp('VLBALANCE.resultado', 'Field', 'KeyField', .F.)
DBSetProp('VLBALANCE.resultado', 'Field', 'Updatable', .F.)
DBSetProp('VLBALANCE.resultado', 'Field', 'UpdateName', 'contabilidad!plancuenta.resultado')
DBSetProp('VLBALANCE.resultado', 'Field', 'DataType', "L")


