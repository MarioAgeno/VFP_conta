***************** Ver la configuración para VLPREMINUTA ***************

CREATE SQL VIEW "VLPREMINUTA" ; 
   AS SELECT asientos.codigo,cuenta,SUM(debe-haber) AS saldoanterior,000000000.00 AS debe,000000000.00 AS haber   FROM asientos,plancuenta WHERE asientos.codigo=plancuenta.codigo.AND.asientos.fecha<?dFecha .AND. asientos.empresa=?oApp.Empresa GROUP BY asientos.codigo  UNION   SELECT asientos.codigo,cuenta,000000000.00 AS saldoanterior,SUM(debe) AS debe,SUM(haber) AS haber   FROM asientos,plancuenta WHERE asientos.codigo=plancuenta.codigo.AND.asientos.fecha=?dFecha .AND. asientos.empresa=?oApp.Empresa GROUP BY asientos.codigo ORDER BY 2

DBSetProp('VLPREMINUTA', 'View', 'UpdateType', 1)
DBSetProp('VLPREMINUTA', 'View', 'WhereType', 3)
DBSetProp('VLPREMINUTA', 'View', 'FetchMemo', .T.)
DBSetProp('VLPREMINUTA', 'View', 'SendUpdates', .F.)
DBSetProp('VLPREMINUTA', 'View', 'UseMemoSize', 255)
DBSetProp('VLPREMINUTA', 'View', 'FetchSize', 100)
DBSetProp('VLPREMINUTA', 'View', 'MaxRecords', -1)
DBSetProp('VLPREMINUTA', 'View', 'Tables', 'asientos')
DBSetProp('VLPREMINUTA', 'View', 'Prepared', .F.)
DBSetProp('VLPREMINUTA', 'View', 'CompareMemo', .T.)
DBSetProp('VLPREMINUTA', 'View', 'FetchAsNeeded', .F.)
DBSetProp('VLPREMINUTA', 'View', 'FetchSize', 100)
DBSetProp('VLPREMINUTA', 'View', 'Comment', "")
DBSetProp('VLPREMINUTA', 'View', 'BatchUpdateCount', 1)
DBSetProp('VLPREMINUTA', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for VLPREMINUTA
* Props for the VLPREMINUTA.codigo field.
DBSetProp('VLPREMINUTA.codigo', 'Field', 'KeyField', .F.)
DBSetProp('VLPREMINUTA.codigo', 'Field', 'Updatable', .T.)
DBSetProp('VLPREMINUTA.codigo', 'Field', 'UpdateName', 'asientos.codigo')
DBSetProp('VLPREMINUTA.codigo', 'Field', 'DataType', "N(5)")
* Props for the VLPREMINUTA.cuenta field.
DBSetProp('VLPREMINUTA.cuenta', 'Field', 'KeyField', .F.)
DBSetProp('VLPREMINUTA.cuenta', 'Field', 'Updatable', .T.)
DBSetProp('VLPREMINUTA.cuenta', 'Field', 'UpdateName', 'plancuenta.cuenta')
DBSetProp('VLPREMINUTA.cuenta', 'Field', 'DataType', "C(10)")
* Props for the VLPREMINUTA.saldoanterior field.
DBSetProp('VLPREMINUTA.saldoanterior', 'Field', 'KeyField', .F.)
DBSetProp('VLPREMINUTA.saldoanterior', 'Field', 'Updatable', .F.)
DBSetProp('VLPREMINUTA.saldoanterior', 'Field', 'UpdateName', 'saldoanterior')
DBSetProp('VLPREMINUTA.saldoanterior', 'Field', 'DataType', "N(16,2)")
* Props for the VLPREMINUTA.debe field.
DBSetProp('VLPREMINUTA.debe', 'Field', 'KeyField', .F.)
DBSetProp('VLPREMINUTA.debe', 'Field', 'Updatable', .T.)
DBSetProp('VLPREMINUTA.debe', 'Field', 'UpdateName', 'asientos.debe')
DBSetProp('VLPREMINUTA.debe', 'Field', 'DataType', "N(12,2)")
* Props for the VLPREMINUTA.haber field.
DBSetProp('VLPREMINUTA.haber', 'Field', 'KeyField', .F.)
DBSetProp('VLPREMINUTA.haber', 'Field', 'Updatable', .T.)
DBSetProp('VLPREMINUTA.haber', 'Field', 'UpdateName', 'asientos.haber')
DBSetProp('VLPREMINUTA.haber', 'Field', 'DataType', "N(12,2)")
 


***************** Ver la configuración para VLMINUTA ***************
CREATE SQL VIEW "VLMINUTA" ; 
   AS SELECT codigo,cuenta,SUM(saldoanterior) AS saldoanterior, SUM(debe) AS debe,SUM(haber) AS haber, SUM(saldoanterior+debe-haber) AS saldoactual   FROM vlpreMinuta GROUP BY codigo ORDER BY 2

DBSetProp('VLMINUTA', 'View', 'UpdateType', 1)
DBSetProp('VLMINUTA', 'View', 'WhereType', 3)
DBSetProp('VLMINUTA', 'View', 'FetchMemo', .T.)
DBSetProp('VLMINUTA', 'View', 'SendUpdates', .F.)
DBSetProp('VLMINUTA', 'View', 'UseMemoSize', 255)
DBSetProp('VLMINUTA', 'View', 'FetchSize', 100)
DBSetProp('VLMINUTA', 'View', 'MaxRecords', -1)
DBSetProp('VLMINUTA', 'View', 'Tables', 'vlpreMinuta')
DBSetProp('VLMINUTA', 'View', 'Prepared', .F.)
DBSetProp('VLMINUTA', 'View', 'CompareMemo', .T.)
DBSetProp('VLMINUTA', 'View', 'FetchAsNeeded', .F.)
DBSetProp('VLMINUTA', 'View', 'FetchSize', 100)
DBSetProp('VLMINUTA', 'View', 'Comment', "")
DBSetProp('VLMINUTA', 'View', 'BatchUpdateCount', 1)
DBSetProp('VLMINUTA', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for VLMINUTA
* Props for the VLMINUTA.codigo field.
DBSetProp('VLMINUTA.codigo', 'Field', 'KeyField', .F.)
DBSetProp('VLMINUTA.codigo', 'Field', 'Updatable', .F.)
DBSetProp('VLMINUTA.codigo', 'Field', 'UpdateName', 'codigo')
DBSetProp('VLMINUTA.codigo', 'Field', 'DataType', "N(5)")
* Props for the VLMINUTA.cuenta field.
DBSetProp('VLMINUTA.cuenta', 'Field', 'KeyField', .F.)
DBSetProp('VLMINUTA.cuenta', 'Field', 'Updatable', .F.)
DBSetProp('VLMINUTA.cuenta', 'Field', 'UpdateName', 'cuenta')
DBSetProp('VLMINUTA.cuenta', 'Field', 'DataType', "C(10)")
* Props for the VLMINUTA.saldoanterior field.
DBSetProp('VLMINUTA.saldoanterior', 'Field', 'KeyField', .F.)
DBSetProp('VLMINUTA.saldoanterior', 'Field', 'Updatable', .T.)
DBSetProp('VLMINUTA.saldoanterior', 'Field', 'UpdateName', 'vlpreMinuta.saldoanterior')
DBSetProp('VLMINUTA.saldoanterior', 'Field', 'DataType', "N(16,2)")
* Props for the VLMINUTA.debe field.
DBSetProp('VLMINUTA.debe', 'Field', 'KeyField', .F.)
DBSetProp('VLMINUTA.debe', 'Field', 'Updatable', .F.)
DBSetProp('VLMINUTA.debe', 'Field', 'UpdateName', 'debe')
DBSetProp('VLMINUTA.debe', 'Field', 'DataType', "N(16,2)")
* Props for the VLMINUTA.haber field.
DBSetProp('VLMINUTA.haber', 'Field', 'KeyField', .F.)
DBSetProp('VLMINUTA.haber', 'Field', 'Updatable', .F.)
DBSetProp('VLMINUTA.haber', 'Field', 'UpdateName', 'haber')
DBSetProp('VLMINUTA.haber', 'Field', 'DataType', "N(16,2)")
* Props for the VLMINUTA.saldoactual field.
DBSetProp('VLMINUTA.saldoactual', 'Field', 'KeyField', .F.)
DBSetProp('VLMINUTA.saldoactual', 'Field', 'Updatable', .F.)
DBSetProp('VLMINUTA.saldoactual', 'Field', 'UpdateName', 'saldoactual')
DBSetProp('VLMINUTA.saldoactual', 'Field', 'DataType', "N(18,2)")
