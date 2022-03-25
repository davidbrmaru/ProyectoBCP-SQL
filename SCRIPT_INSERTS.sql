USE [PROYECTOBCP]

GO
INSERT INTO [dbo].[TRIBE] ([NOMBRE],[TIPO],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('TRIBU_CANALES_DIGITALES','TRIBU',GETDATE(),'S61121',1)
INSERT INTO [dbo].[TRIBE] ([NOMBRE],[TIPO],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('TRIBU_DAILY_BANKING','TRIBU',GETDATE(),'S61121',1)
INSERT INTO [dbo].[TRIBE] ([NOMBRE],[TIPO],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('TRIBU_DATA','TRIBU',GETDATE(),'S61121',1)
INSERT INTO [dbo].[TRIBE] ([NOMBRE],[TIPO],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('TRIBU_CORE_CLIENTES_PRODUCTOS_Y_STAFF','TRIBU',GETDATE(),'S61121',1)
INSERT INTO [dbo].[TRIBE] ([NOMBRE],[TIPO],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('TRIBU_TARJETA_SERV_Y_PROD_DE_INVERSION','TRIBU',GETDATE(),'S61121',1)
INSERT INTO [dbo].[TRIBE] ([NOMBRE],[TIPO],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('TRIBU_RIESGOS_PERSONAS','TRIBU',GETDATE(),'S61121',1)
INSERT INTO [dbo].[TRIBE] ([NOMBRE],[TIPO],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('COE_ARCHITECTURE_AND_PLATFORM','COE',GETDATE(),'S61121',1)


INSERT INTO [dbo].[CHAPTER_AREA_LEADER] ([COD_MATRICULA],[NOMBRES],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('S61120','GIANFRANCO','CARRASCO','SAENZ',GETDATE(),'S61121',1)
INSERT INTO [dbo].[CHAPTER_AREA_LEADER] ([COD_MATRICULA],[NOMBRES],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('S61121','GIOMAR','LLANQUE','QUIROZ',GETDATE(),'S61121',1)
INSERT INTO [dbo].[CHAPTER_AREA_LEADER] ([COD_MATRICULA],[NOMBRES],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('S61122','LEYDI','BAUTISTA','QUISPE',GETDATE(),'S61121',1)
INSERT INTO [dbo].[CHAPTER_AREA_LEADER] ([COD_MATRICULA],[NOMBRES],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('S61123','GIANFRANCO','CARRASCO','SAENZ',GETDATE(),'S61121',1)
INSERT INTO [dbo].[CHAPTER_AREA_LEADER] ([COD_MATRICULA],[NOMBRES],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('S61124','GORKI','RUBINOS','SOTO',GETDATE(),'S61121',1)


INSERT INTO [dbo].[CHAPTER_LEADER] ([ID_CHAPTER_AREA_LEADER],[COD_MATRICULA],[NOMBRES],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES (1,'U27777','JUAN','COURT','',GETDATE(),'S61121',1)
INSERT INTO [dbo].[CHAPTER_LEADER] ([ID_CHAPTER_AREA_LEADER],[COD_MATRICULA],[NOMBRES],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES (2,'U19222','ALDO','MANOSALVA','',GETDATE(),'S61121',1)
INSERT INTO [dbo].[CHAPTER_LEADER] ([ID_CHAPTER_AREA_LEADER],[COD_MATRICULA],[NOMBRES],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES (3,'T18885','JEAN','PAUL','FRANCIA',GETDATE(),'S61121',1)
INSERT INTO [dbo].[CHAPTER_LEADER] ([ID_CHAPTER_AREA_LEADER],[COD_MATRICULA],[NOMBRES],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES (4,'U00196','DIANA','VIDAL','MORON',GETDATE(),'S61121',1)
INSERT INTO [dbo].[CHAPTER_LEADER] ([ID_CHAPTER_AREA_LEADER],[COD_MATRICULA],[NOMBRES],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES (5,'U01612','YAJAIRA','GASTANADUI','',GETDATE(),'S61121',1)
INSERT INTO [dbo].[CHAPTER_LEADER] ([ID_CHAPTER_AREA_LEADER],[COD_MATRICULA],[NOMBRES],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES (1,'S51118','RICARDO','BAY','MASIAS',GETDATE(),'S61121',1)


INSERT INTO [dbo].[SQUAD] ([ID_TRIBE],[NOMBRE],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES (1,'SQ BACKEND HBK 2',GETDATE(),'S61121',1)
INSERT INTO [dbo].[SQUAD] ([ID_TRIBE],[NOMBRE],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES (2,'SQ PAYMENTS',GETDATE(),'S61121',1)
INSERT INTO [dbo].[SQUAD] ([ID_TRIBE],[NOMBRE],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES (3,'SQ CONSIST CREDITOS COMERCIALES',GETDATE(),'S61121',1)
INSERT INTO [dbo].[SQUAD] ([ID_TRIBE],[NOMBRE],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES (4,'SQ DE CLIENTES CONTENTOS',GETDATE(),'S61121',1)
INSERT INTO [dbo].[SQUAD] ([ID_TRIBE],[NOMBRE],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES (5,'SQ CONTACT CENTER OUTBOUND & ANALYTICS',GETDATE(),'S61121',1)


INSERT INTO [dbo].[TEAM_MEMBER] ([COD_MATRICULA],[NOMBRE],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[ID_CHAPTER_LEADER],[TIPO_PROVEEDOR],[EMPRESA],[ROL],[ROL_INSOURCING],[ESPECIALIDAD],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('T16111','CHRISTIAN','VELA ','BECERRA',1,'PROVEEDOR','EVERIS','DEVELOPER','DEV','BACKEND JAVA',GETDATE(),'S61121',1)
INSERT INTO [dbo].[TEAM_MEMBER] ([COD_MATRICULA],[NOMBRE],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[ID_CHAPTER_LEADER],[TIPO_PROVEEDOR],[EMPRESA],[ROL],[ROL_INSOURCING],[ESPECIALIDAD],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('T01558','KENYI GUILLERMO ','NU�EZ','VELARDE',2,'PROVEEDOR','TCS','QA','QA','TESTING',GETDATE(),'S61121',1)
INSERT INTO [dbo].[TEAM_MEMBER] ([COD_MATRICULA],[NOMBRE],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[ID_CHAPTER_LEADER],[TIPO_PROVEEDOR],[EMPRESA],[ROL],[ROL_INSOURCING],[ESPECIALIDAD],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('T14777','Julio Cesar Armando',' Mendieta',' Ochoa',3,'PROVEEDOR','TCS','QA','QA','TESTING',GETDATE(),'S61121',1)
INSERT INTO [dbo].[TEAM_MEMBER] ([COD_MATRICULA],[NOMBRE],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[ID_CHAPTER_LEADER],[TIPO_PROVEEDOR],[EMPRESA],[ROL],[ROL_INSOURCING],[ESPECIALIDAD],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('T11305','CHRISTIAN  ERNESTO','CANDIOTTI','URQUIZO',4,'PROVEEDOR','NTT DATA','QA','QA','TESTING',GETDATE(),'S61121',1)
INSERT INTO [dbo].[TEAM_MEMBER] ([COD_MATRICULA],[NOMBRE],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[ID_CHAPTER_LEADER],[TIPO_PROVEEDOR],[EMPRESA],[ROL],[ROL_INSOURCING],[ESPECIALIDAD],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('T22487','KATHERIN VANESSA','GARC�A','ESPEJO',5,'PROVEEDOR','NTT DATA','QA','QA','TESTING',GETDATE(),'S61121',1)
INSERT INTO [dbo].[TEAM_MEMBER] ([COD_MATRICULA],[NOMBRE],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[ID_CHAPTER_LEADER],[TIPO_PROVEEDOR],[EMPRESA],[ROL],[ROL_INSOURCING],[ESPECIALIDAD],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('T88828','SHEILLA  MARUSELA','DIAZ','VIVANCO',6,'PROVEEDOR','NTT DATA','QA','QA','TESTING',GETDATE(),'S61121',1)
INSERT INTO [dbo].[TEAM_MEMBER] ([COD_MATRICULA],[NOMBRE],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[ID_CHAPTER_LEADER],[TIPO_PROVEEDOR],[EMPRESA],[ROL],[ROL_INSOURCING],[ESPECIALIDAD],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('S12985','YVAN FABRIZZIO','RANILLA','MARQUEZ',1,'PROVEEDOR','NTT DATA','QA','QA','TESTING',GETDATE(),'S61121',1)
INSERT INTO [dbo].[TEAM_MEMBER] ([COD_MATRICULA],[NOMBRE],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[ID_CHAPTER_LEADER],[TIPO_PROVEEDOR],[EMPRESA],[ROL],[ROL_INSOURCING],[ESPECIALIDAD],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('T00133','ANGEL LUIS','POVIS','RODRIGUEZ',2,'PROVEEDOR','GLOBANT','DEVELOPER','DEV','BACKEND JAVA',GETDATE(),'S61121',1)
INSERT INTO [dbo].[TEAM_MEMBER] ([COD_MATRICULA],[NOMBRE],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[ID_CHAPTER_LEADER],[TIPO_PROVEEDOR],[EMPRESA],[ROL],[ROL_INSOURCING],[ESPECIALIDAD],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('T19382','HERBERT DANIEL','CHAICHA','OCA�A',3,'PROVEEDOR','GLOBANT','DEVELOPER','DEV','BACKEND JAVA',GETDATE(),'S61121',1)
INSERT INTO [dbo].[TEAM_MEMBER] ([COD_MATRICULA],[NOMBRE],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[ID_CHAPTER_LEADER],[TIPO_PROVEEDOR],[EMPRESA],[ROL],[ROL_INSOURCING],[ESPECIALIDAD],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('U01612','YAJAIRA','GASTANADUI','CABALLERO',4,'ORG�NICO','BCP','CHAPTER- LEAD- DEVELOPER','DEV','NET',GETDATE(),'S61121',1)
INSERT INTO [dbo].[TEAM_MEMBER] ([COD_MATRICULA],[NOMBRE],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[ID_CHAPTER_LEADER],[TIPO_PROVEEDOR],[EMPRESA],[ROL],[ROL_INSOURCING],[ESPECIALIDAD],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('S00305','JOHAN ALEXANDER','URIARTE','FLORES',5,'PROVEEDOR','Belltech','DEVELOPER','DEV','NET',GETDATE(),'S61121',1)
INSERT INTO [dbo].[TEAM_MEMBER] ([COD_MATRICULA],[NOMBRE],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[ID_CHAPTER_LEADER],[TIPO_PROVEEDOR],[EMPRESA],[ROL],[ROL_INSOURCING],[ESPECIALIDAD],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('S86159','GONZALO MANUEL','NUNEZ','VILLAR',6,'PROVEEDOR','Belltech','DEVELOPER','DEV','NET',GETDATE(),'S61121',1)
INSERT INTO [dbo].[TEAM_MEMBER] ([COD_MATRICULA],[NOMBRE],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[ID_CHAPTER_LEADER],[TIPO_PROVEEDOR],[EMPRESA],[ROL],[ROL_INSOURCING],[ESPECIALIDAD],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('T12147','JOSSIMAR EDUAR','ALVA ','MEDINA',1,'PROVEEDOR','Belltech','DEVELOPER','DEV','NET',GETDATE(),'S61121',1)
INSERT INTO [dbo].[TEAM_MEMBER] ([COD_MATRICULA],[NOMBRE],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[ID_CHAPTER_LEADER],[TIPO_PROVEEDOR],[EMPRESA],[ROL],[ROL_INSOURCING],[ESPECIALIDAD],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('T09335','GLENN ','GARCIA ','PEREZ',2,'PROVEEDOR','Belltech','DEVELOPER','DEV','NET',GETDATE(),'S61121',1)
INSERT INTO [dbo].[TEAM_MEMBER] ([COD_MATRICULA],[NOMBRE],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[ID_CHAPTER_LEADER],[TIPO_PROVEEDOR],[EMPRESA],[ROL],[ROL_INSOURCING],[ESPECIALIDAD],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('E14865','Lincy del Rocio','Pe�a','Villegas',3,'ORG�NICO','BCP','DEVELOPER','DEV','NET',GETDATE(),'S61121',1)
INSERT INTO [dbo].[TEAM_MEMBER] ([COD_MATRICULA],[NOMBRE],[APELLIDO_PATERNO],[APELLIDO_MATERNO],[ID_CHAPTER_LEADER],[TIPO_PROVEEDOR],[EMPRESA],[ROL],[ROL_INSOURCING],[ESPECIALIDAD],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('S69111','Renzo Robert','Bautista','Villagomez',4,'Proveedor','Belltech','DEVELOPER','DEV','NET',GETDATE(),'S61121',1)


INSERT INTO [dbo].[APPLICATION] ([COD_APLICACION],[NOMBRE],[COD_OWNER],[ID_SQUAD],[BINDING_BLOCK],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('MBBK','APP1','OWNER1',1,'Mobile Banking',GETDATE(),'S61121',1)
INSERT INTO [dbo].[APPLICATION] ([COD_APLICACION],[NOMBRE],[COD_OWNER],[ID_SQUAD],[BINDING_BLOCK],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('APCS','APP2','OWNER2',2,'COBOL Consist',GETDATE(),'S61121',1)
INSERT INTO [dbo].[APPLICATION] ([COD_APLICACION],[NOMBRE],[COD_OWNER],[ID_SQUAD],[BINDING_BLOCK],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('DIWA','APP3','OWNER3',3,'Web/Mobile Minorista',GETDATE(),'S61121',1)
INSERT INTO [dbo].[APPLICATION] ([COD_APLICACION],[NOMBRE],[COD_OWNER],[ID_SQUAD],[BINDING_BLOCK],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('ATMF','APP4','OWNER4',4,'Package Tribe',GETDATE(),'S61121',1)
INSERT INTO [dbo].[APPLICATION] ([COD_APLICACION],[NOMBRE],[COD_OWNER],[ID_SQUAD],[BINDING_BLOCK],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('KNDC','APP5','OWNER5',5,'Package Tribe',GETDATE(),'S61121',1)
INSERT INTO [dbo].[APPLICATION] ([COD_APLICACION],[NOMBRE],[COD_OWNER],[ID_SQUAD],[BINDING_BLOCK],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('NCR','APP6','OWNER6',1,'Package Tribe',GETDATE(),'S61121',1)
INSERT INTO [dbo].[APPLICATION] ([COD_APLICACION],[NOMBRE],[COD_OWNER],[ID_SQUAD],[BINDING_BLOCK],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('UTMK','APP7','OWNER7',2,'.NET Business Tribe',GETDATE(),'S61121',1)
INSERT INTO [dbo].[APPLICATION] ([COD_APLICACION],[NOMBRE],[COD_OWNER],[ID_SQUAD],[BINDING_BLOCK],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('SMEX','APP8','OWNER8',3,'.NET Business Tribe',GETDATE(),'S61121',1)
INSERT INTO [dbo].[APPLICATION] ([COD_APLICACION],[NOMBRE],[COD_OWNER],[ID_SQUAD],[BINDING_BLOCK],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('SCOR','APP9','OWNER9',4,'.NET Business Tribe',GETDATE(),'S61121',1)
INSERT INTO [dbo].[APPLICATION] ([COD_APLICACION],[NOMBRE],[COD_OWNER],[ID_SQUAD],[BINDING_BLOCK],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('MTRA','APP10','OWNER10',5,'.NET Business Tribe',GETDATE(),'S61121',1)
INSERT INTO [dbo].[APPLICATION] ([COD_APLICACION],[NOMBRE],[COD_OWNER],[ID_SQUAD],[BINDING_BLOCK],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('CIFI','APP11','OWNER11',1,'.NET Business Support/Direction',GETDATE(),'S61121',1)
INSERT INTO [dbo].[APPLICATION] ([COD_APLICACION],[NOMBRE],[COD_OWNER],[ID_SQUAD],[BINDING_BLOCK],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('E261','APP12','OWNER12',2,'.NET Business Support/Direction',GETDATE(),'S61121',1)
INSERT INTO [dbo].[APPLICATION] ([COD_APLICACION],[NOMBRE],[COD_OWNER],[ID_SQUAD],[BINDING_BLOCK],[FEC_INGRESO],[USUARIO_INGRESA],[FLG_ACTIVO]) VALUES ('RAIT','APP13','OWNER13',3,'.NET Business Support/Direction',GETDATE(),'S61121',1)


INSERT INTO [dbo].[APPLICATION_TEAM_MEMBER] ([ID_APPLICATION],[ID_TEAM_MEMBER],[POR_ASIGNADO],[FEC_INGRESO],[USUARIO_INGRESA]) VALUES (1,1,100,GETDATE(),'S61121')
INSERT INTO [dbo].[APPLICATION_TEAM_MEMBER] ([ID_APPLICATION],[ID_TEAM_MEMBER],[POR_ASIGNADO],[FEC_INGRESO],[USUARIO_INGRESA]) VALUES (2,2,100,GETDATE(),'S61121')
INSERT INTO [dbo].[APPLICATION_TEAM_MEMBER] ([ID_APPLICATION],[ID_TEAM_MEMBER],[POR_ASIGNADO],[FEC_INGRESO],[USUARIO_INGRESA]) VALUES (2,3,100,GETDATE(),'S61121')
INSERT INTO [dbo].[APPLICATION_TEAM_MEMBER] ([ID_APPLICATION],[ID_TEAM_MEMBER],[POR_ASIGNADO],[FEC_INGRESO],[USUARIO_INGRESA]) VALUES (1,4,100,GETDATE(),'S61121')
INSERT INTO [dbo].[APPLICATION_TEAM_MEMBER] ([ID_APPLICATION],[ID_TEAM_MEMBER],[POR_ASIGNADO],[FEC_INGRESO],[USUARIO_INGRESA]) VALUES (1,5,100,GETDATE(),'S61121')
INSERT INTO [dbo].[APPLICATION_TEAM_MEMBER] ([ID_APPLICATION],[ID_TEAM_MEMBER],[POR_ASIGNADO],[FEC_INGRESO],[USUARIO_INGRESA]) VALUES (1,6,100,GETDATE(),'S61121')
INSERT INTO [dbo].[APPLICATION_TEAM_MEMBER] ([ID_APPLICATION],[ID_TEAM_MEMBER],[POR_ASIGNADO],[FEC_INGRESO],[USUARIO_INGRESA]) VALUES (1,7,100,GETDATE(),'S61121')
INSERT INTO [dbo].[APPLICATION_TEAM_MEMBER] ([ID_APPLICATION],[ID_TEAM_MEMBER],[POR_ASIGNADO],[FEC_INGRESO],[USUARIO_INGRESA]) VALUES (3,8,100,GETDATE(),'S61121')
INSERT INTO [dbo].[APPLICATION_TEAM_MEMBER] ([ID_APPLICATION],[ID_TEAM_MEMBER],[POR_ASIGNADO],[FEC_INGRESO],[USUARIO_INGRESA]) VALUES (3,9,100,GETDATE(),'S61121')
INSERT INTO [dbo].[APPLICATION_TEAM_MEMBER] ([ID_APPLICATION],[ID_TEAM_MEMBER],[POR_ASIGNADO],[FEC_INGRESO],[USUARIO_INGRESA]) VALUES (4,10,25,GETDATE(),'S61121')
INSERT INTO [dbo].[APPLICATION_TEAM_MEMBER] ([ID_APPLICATION],[ID_TEAM_MEMBER],[POR_ASIGNADO],[FEC_INGRESO],[USUARIO_INGRESA]) VALUES (5,10,25,GETDATE(),'S61121')
INSERT INTO [dbo].[APPLICATION_TEAM_MEMBER] ([ID_APPLICATION],[ID_TEAM_MEMBER],[POR_ASIGNADO],[FEC_INGRESO],[USUARIO_INGRESA]) VALUES (6,10,50,GETDATE(),'S61121')
INSERT INTO [dbo].[APPLICATION_TEAM_MEMBER] ([ID_APPLICATION],[ID_TEAM_MEMBER],[POR_ASIGNADO],[FEC_INGRESO],[USUARIO_INGRESA]) VALUES (7,11,100,GETDATE(),'S61121')
INSERT INTO [dbo].[APPLICATION_TEAM_MEMBER] ([ID_APPLICATION],[ID_TEAM_MEMBER],[POR_ASIGNADO],[FEC_INGRESO],[USUARIO_INGRESA]) VALUES (8,12,100,GETDATE(),'S61121')
INSERT INTO [dbo].[APPLICATION_TEAM_MEMBER] ([ID_APPLICATION],[ID_TEAM_MEMBER],[POR_ASIGNADO],[FEC_INGRESO],[USUARIO_INGRESA]) VALUES (9,13,100,GETDATE(),'S61121')
INSERT INTO [dbo].[APPLICATION_TEAM_MEMBER] ([ID_APPLICATION],[ID_TEAM_MEMBER],[POR_ASIGNADO],[FEC_INGRESO],[USUARIO_INGRESA]) VALUES (10,14,100,GETDATE(),'S61121')
INSERT INTO [dbo].[APPLICATION_TEAM_MEMBER] ([ID_APPLICATION],[ID_TEAM_MEMBER],[POR_ASIGNADO],[FEC_INGRESO],[USUARIO_INGRESA]) VALUES (11,15,80,GETDATE(),'S61121')
INSERT INTO [dbo].[APPLICATION_TEAM_MEMBER] ([ID_APPLICATION],[ID_TEAM_MEMBER],[POR_ASIGNADO],[FEC_INGRESO],[USUARIO_INGRESA]) VALUES (12,15,20,GETDATE(),'S61121')
INSERT INTO [dbo].[APPLICATION_TEAM_MEMBER] ([ID_APPLICATION],[ID_TEAM_MEMBER],[POR_ASIGNADO],[FEC_INGRESO],[USUARIO_INGRESA]) VALUES (13,16,100,GETDATE(),'S61121')

