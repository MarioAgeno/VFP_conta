   s   !                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Courier New                    }ParentAlias = "astomodelo"
RelationalExpr = "codigo"
ChildAlias = "plancuenta"
ChildOrder = "codigo"
Name = "Relation2"
                                      relation                       uParentAlias = "astomodelo"
RelationalExpr = "id"
ChildAlias = "planmodelo"
ChildOrder = "id"
Name = "Relation1"
             relation                       �Left = 10
Top = 140
Width = 90
Height = 90
Alias = "entidad"
Order = "id"
Database = ..\data\contabilidad.dbc
CursorSource = "entidad"
Filter = (entidad.id=oApp.empresa)
Name = "Cursor4"
                                cursor                         �Left = 290
Top = 20
Width = 90
Height = 90
Alias = "plancuenta"
Order = "codigo"
Database = ..\data\contabilidad.dbc
CursorSource = "plancuenta"
Name = "Cursor3"
                         cursor                         �Left = 155
Top = 134
Width = 90
Height = 90
Alias = "planmodelo"
Order = "id"
Database = ..\data\contabilidad.dbc
CursorSource = "planmodelo"
Name = "Cursor2"
                            cursor                         �Left = 10
Top = 20
Width = 90
Height = 90
Alias = "astomodelo"
Order = "id"
Database = ..\data\contabilidad.dbc
CursorSource = "astomodelo"
Filter = (!EMPTY(astomodelo.id))
Name = "Cursor1"
                             cursor                         dataenvironment                Arial                          astomodelo.id                  
DATETIME()                                                    Courier New                    cTituloReporte                                                Times New Roman                "M.A.A.Soft"                                                  Times New Roman                _pageno                                                       Courier New                    "@Z 999"                       Courier New                    "Pagina"                       entidad.logo                                                  )plancuenta.cuenta+" - "+plancuenta.nombre                                                      Arial                          astomodelo.columna="D"         plancuenta.codigo                                             Arial                          planmodelo.nombre              Arial                          planmodelo.comentario          Arial                          planmodelo.id                                                 Arial                          )plancuenta.cuenta+" - "+plancuenta.nombre                                                      Arial                          astomodelo.columna="H"         Arial                          "DEBE"                         Arial                          "HABER"                        Arial                          "Cuenta Nombre"                Arial                          "Comentario"                   Courier New                    Times New Roman                Times New Roman                Arial                          Arial                          pLeft = 67
Top = 258
Width = 555
Height = 305
InitialSelectedAlias = "astomodelo"
Name = "Dataenvironment"
            