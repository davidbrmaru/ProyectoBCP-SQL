CREATE OR ALTER PROC SP_CARGA_INICIAL 
AS
BEGIN
-- Limpiamos tabla [APPLICATION_TEAM_MEMBER]
   DELETE FROM [dbo].[APPLICATION_TEAM_MEMBER]

-- Limpiamos tablas
   DELETE FROM [dbo].[APPLICATION]
   DELETE FROM [dbo].[TEAM_MEMBER]
   DELETE FROM [dbo].[CHAPTER_LEADER]
   DELETE FROM [dbo].[CHAPTER_AREA_LEADER]
   DELETE FROM [dbo].[SQUAD]
   DELETE FROM [dbo].[TRIBE]

-- RETORNAMOS IDENTITY A 0
	DBCC CHECKIDENT ('[APPLICATION]', RESEED, 0);
	DBCC CHECKIDENT ('[TEAM_MEMBER]', RESEED, 0);
	DBCC CHECKIDENT ('[CHAPTER_LEADER]', RESEED, 0);
	DBCC CHECKIDENT ('[CHAPTER_AREA_LEADER]', RESEED, 0);
	DBCC CHECKIDENT ('[SQUAD]', RESEED, 0);
	DBCC CHECKIDENT ('[TRIBE]', RESEED, 0);

-- CARGAMOS DATOS A TABLAS	
--[CHAPTER_AREA_LEADER]
	INSERT INTO [dbo].[CHAPTER_AREA_LEADER] (COD_MATRICULA,NOMBRES,APELLIDO_PATERNO,APELLIDO_MATERNO,FEC_INGRESO,USUARIO_INGRESA,FLG_ACTIVO)
	SELECT DISTINCT 'XXXXXX' AS COD_MATRICULA,
		CASE  
		WHEN dbo.repetidos(Nombre_Cals,' ')>0 THEN SUBSTRING(Nombre_Cals, 1, dbo.INSTR(Nombre_Cals,' ', 1,1)  - 1) 
		WHEN dbo.repetidos(Nombre_Cals,' ')=0 THEN SUBSTRING(Nombre_Cals, 1, LEN(Nombre_Cals)) 
		ELSE '' END AS NOMBRES,
		CASE  
		WHEN dbo.repetidos(Nombre_Cals,' ')>1 THEN SUBSTRING(Nombre_Cals, dbo.INSTR(Nombre_Cals,' ', 1,1)+1, dbo.INSTR(Nombre_Cals,' ', 1,2) - dbo.INSTR(Nombre_Cals,' ', 1,1) -1) 
		WHEN dbo.repetidos(Nombre_Cals,' ')=1 THEN SUBSTRING(Nombre_Cals, dbo.INSTR(Nombre_Cals,' ', 1,1)+1, LEN(Nombre_Cals))
		ELSE '' END AS APELLIDO_PATERNO,
		CASE  
		WHEN dbo.repetidos(Nombre_Cals,' ')>1 THEN SUBSTRING(Nombre_Cals, dbo.INSTR(Nombre_Cals,' ', 1,2)+1, LEN(Nombre_Cals))
		ELSE '' END AS APELLIDO_MATERNO,
		GETDATE() AS FEC_INGRESO,
		'ETLINI' AS USUARIO_INGRESA,
		1 AS FLG_ACTIVO
		FROM [dbo].[TP_INICIAL_BASE_ACTIVOS]
		WHERE trim(Nombre_Cals) != ''

--[CHAPTER_LEADER]
	INSERT INTO [dbo].[CHAPTER_LEADER] (ID_CHAPTER_AREA_LEADER,COD_MATRICULA,NOMBRES,APELLIDO_PATERNO,APELLIDO_MATERNO,NOMBRE_CHAPTER,FEC_INGRESO,USUARIO_INGRESA,FLG_ACTIVO)
	SELECT MAX(B.ID) AS ID_CHAPTER_AREA_LEADER,
		A.Mat_Chapter AS COD_MATRICULA,
		MAX(CASE  
		WHEN dbo.repetidos(CHAPTER_LEADER,' ')>0 THEN SUBSTRING(Chapter_Leader, 1, dbo.INSTR(Chapter_Leader,' ', 1,1)  - 1) 
		WHEN dbo.repetidos(CHAPTER_LEADER,' ')=0 THEN SUBSTRING(Chapter_Leader, 1, LEN(Chapter_Leader)) 
		ELSE '' END) AS NOMBRES,
		MAX(CASE  
		WHEN dbo.repetidos(CHAPTER_LEADER,' ')>1 THEN SUBSTRING(Chapter_Leader, dbo.INSTR(Chapter_Leader,' ', 1,1)+1, dbo.INSTR(Chapter_Leader,' ', 1,2) - dbo.INSTR(Chapter_Leader,' ', 1,1) -1) 
		WHEN dbo.repetidos(CHAPTER_LEADER,' ')=1 THEN SUBSTRING(Chapter_Leader, dbo.INSTR(Chapter_Leader,' ', 1,1)+1, LEN(Chapter_Leader))
		ELSE '' END) AS APELLIDO_PATERNO,
		MAX(CASE  
		WHEN dbo.repetidos(CHAPTER_LEADER,' ')>1 THEN SUBSTRING(Chapter_Leader, dbo.INSTR(Chapter_Leader,' ', 1,2)+1, LEN(Chapter_Leader))
		ELSE '' END) AS APELLIDO_MATERNO,
		MAX(A.CHAPTER) AS NOMBRE_CHAPTER,
		GETDATE() AS FEC_INGRESO,
		'ETLINI' AS USUARIO_INGRESA,
		1 AS FLG_ACTIVO
	FROM [dbo].[TP_INICIAL_BASE_ACTIVOS] A
	JOIN [dbo].[CHAPTER_AREA_LEADER] B ON A.Nombre_Cals = CONCAT(B.NOMBRES, ' ',B.APELLIDO_PATERNO,' ',B.APELLIDO_MATERNO)
	WHERE trim(Chapter_Leader) != ''	
	GROUP BY A.Mat_Chapter

--[dbo].[TRIBE]
	INSERT INTO [dbo].[TRIBE] (NOMBRE,TIPO,FEC_INGRESO,USUARIO_INGRESA,FLG_ACTIVO)
	SELECT DISTINCT TRIBU_COE AS NOMBRE,
		CASE 
		WHEN TRIBU_COE LIKE '%TRIBU%' THEN 'TRIBU'
		WHEN TRIBU_COE LIKE '%COE%' THEN 'COE'
		ELSE 'TRIBU' END,
		GETDATE() AS FEC_INGRESO,
		'ETLINI' AS USUARIO_INGRESA,
		1 AS FLG_ACTIVO
	FROM [dbo].[TP_INICIAL_BASE_ACTIVOS] A
	WHERE TRIM(TRIBU_COE)!=''

--[dbo].[SQUAD]
	INSERT INTO [dbo].[SQUAD](ID_TRIBE,NOMBRE,FEC_INGRESO,USUARIO_INGRESA,FLG_ACTIVO)
	SELECT DISTINCT B.ID AS ID_TRIBE,
		SQUAD AS NOMBRE,
		GETDATE() AS FEC_INGRESO,
		'ETLINI' AS USUARIO_INGRESA,
		1 AS FLG_ACTIVO
	FROM [dbo].[TP_INICIAL_BASE_ACTIVOS] A
	JOIN [dbo].[TRIBE] B ON A.TRIBU_COE = B.NOMBRE
	WHERE TRIM(SQUAD)!=''

--[dbo].[TEAM_MEMBER]
	INSERT INTO [dbo].[TEAM_MEMBER] (COD_MATRICULA,NOMBRE,APELLIDO_PATERNO,APELLIDO_MATERNO,ID_CHAPTER_LEADER,
							TIPO_PROVEEDOR,EMPRESA,ROL,ROL_INSOURCING,ESPECIALIDAD,FEC_INGRESO,USUARIO_INGRESA,FLG_ACTIVO)
	SELECT  A.Matricula AS COD_MATRICULA	,
		MAX(A.Nombres) AS NOMBRE,
		MAX(A.Apellido_Paterno) AS APELLIDO_PATERNO,
		MAX(A.Apellido_Materno) AS APELLIDO_MATERNO,
		MAX(B.ID) AS ID_CHAPTER_LEADER,
		MAX(A.Tipo_Preper) AS TIPO_PROVEEDOR,
		MAX(A.Empresa) AS EMPRESA,
		MAX(A.SQ_ROL) AS ROL,
		MAX(A.ROL_INSOURCING) AS ROL_INSOURCING,
		MAX(A.Especialidad) AS ESPECIALIDAD,
		GETDATE() AS FEC_INGRESO,
		'ETLINI' AS USUARIO_INGRESA,
		1 AS FLG_ACTIVO
	FROM [dbo].[TP_INICIAL_BASE_ACTIVOS] A
	JOIN [dbo].[CHAPTER_LEADER] B ON A.Mat_Chapter = B.COD_MATRICULA
	WHERE TRIM(Matricula)!=''
	GROUP BY A.Matricula

--[dbo].[APPLICATION]
	INSERT INTO [dbo].[APPLICATION] (COD_APLICACION,NOMBRE,COD_OWNER,ID_SQUAD,BINDING_BLOCK,FEC_INGRESO,USUARIO_INGRESA,FLG_ACTIVO)
	SELECT  A.Codigo_APP AS COD_APLICACION	,
		MAX(A.Codigo_APP) AS NOMBRE,
		'XXXXXX' AS COD_OWNER,
		MAX(B.ID) AS ID_SQUAD,
		MAX(A.BB) AS BINDING_BLOCK,
		GETDATE() AS FEC_INGRESO,
		'ETLINI' AS USUARIO_INGRESA,
		1 AS FLG_ACTIVO
	FROM [dbo].[TP_INICIAL_BASE_ACTIVOS] A
	JOIN [dbo].[SQUAD] B ON A.SQUAD = B.NOMBRE
	WHERE TRIM(Codigo_APP)!=''  AND LEN(Codigo_APP) = 4
	GROUP BY A.Codigo_APP

	INSERT INTO [dbo].[APPLICATION_TEAM_MEMBER] (ID_APPLICATION,ID_TEAM_MEMBER,POR_ASIGNADO,COMENTARIO,FEC_INGRESO,USUARIO_INGRESA)
	SELECT  B.ID AS ID_APPLICATION	,
		C.ID AS ID_TEAM_MEMBER,
		MAX(REPLACE(A.Por_Asignacion,'%','')) AS POR_ASIGNADO,
		MAX(A.COMENTARIOS) AS COMENTARIO,
		GETDATE() AS FEC_INGRESO,
		'ETLINI' AS USUARIO_INGRESA
	FROM [dbo].[TP_INICIAL_BASE_ACTIVOS] A
	JOIN [dbo].[APPLICATION] B ON A.Codigo_APP = B.COD_APLICACION
	JOIN [dbo].[TEAM_MEMBER] C ON A.Matricula = C.COD_MATRICULA
	WHERE TRIM(Codigo_APP)!='' AND TRIM(Matricula)!='' AND TRIM(Por_Asignacion)!=''
	GROUP BY B.ID,C.ID 
	
END

GO


CREATE OR ALTER PROCEDURE [dbo].[OBTENER_BASE_ACTIVO]
(  @MATRICULA AS varchar(6)
)
AS
DECLARE @v_CAL int, @v_CL int
BEGIN
    SELECT @v_CAL = COUNT(1)  
    FROM  [dbo].[CHAPTER_AREA_LEADER]
    WHERE [COD_MATRICULA] = @MATRICULA

	SELECT @v_CL = COUNT(1)  
    FROM  [dbo].[CHAPTER_LEADER]
    WHERE [COD_MATRICULA] = @MATRICULA

IF @v_CAL > 0 
BEGIN
		SELECT D.NOMBRES + ' '+ D.APELLIDO_PATERNO + ' ' + D.APELLIDO_MATERNO AS NOMBRE_CAL,
		C.COD_MATRICULA AS MAT_CHAPTER,
		C.NOMBRES + ' '+ C.APELLIDO_PATERNO + ' ' + C.APELLIDO_MATERNO AS CHAPTER_LEADER,
		B.TIPO_PROVEEDOR AS TIPO_PREPER,
		B.EMPRESA,
		B.COD_MATRICULA AS MATRICULA,
		B.APELLIDO_PATERNO,
		B.APELLIDO_MATERNO,
		B.NOMBRE,
		B.ROL AS SQ_ROL,
		B.ROL_INSOURCING,
		B.ESPECIALIDAD,
		G.NOMBRE AS TRIBU,
		F.NOMBRE AS SQUAD,
		E.NOMBRE AS CODIGO_APP_ASIGNADO,
		A.POR_ASIGNADO AS PORCENTAJE_ASIGNADO,
		E.BINDING_BLOCK AS BB,
		C.NOMBRE_CHAPTER AS CHAPTER,
		A.COMENTARIO
		
		FROM [dbo].[APPLICATION_TEAM_MEMBER] A
		JOIN [dbo].[TEAM_MEMBER] B ON A.ID_TEAM_MEMBER=B.ID
		JOIN [dbo].[CHAPTER_LEADER] C ON B.ID_CHAPTER_LEADER = C.ID
		JOIN [dbo].[CHAPTER_AREA_LEADER] D ON C.ID_CHAPTER_AREA_LEADER = D.ID
		JOIN [dbo].[APPLICATION] E ON A.ID_APPLICATION = E.ID
		JOIN [dbo].[SQUAD] F ON E.ID_SQUAD = F.ID
		JOIN [dbo].[TRIBE] G ON F.ID_TRIBE = G.ID
		WHERE D.COD_MATRICULA = @MATRICULA
END 
ELSE IF  @v_CL > 0 
		BEGIN
		SELECT D.NOMBRES + ' '+ D.APELLIDO_PATERNO + ' ' + D.APELLIDO_MATERNO AS NOMBRE_CAL,
		C.COD_MATRICULA AS MAT_CHAPTER,
		C.NOMBRES + ' '+ C.APELLIDO_PATERNO + ' ' + C.APELLIDO_MATERNO AS CHAPTER_LEADER,
		B.TIPO_PROVEEDOR AS TIPO_PREPER,
		B.EMPRESA,
		B.COD_MATRICULA AS MATRICULA,
		B.APELLIDO_PATERNO,
		B.APELLIDO_MATERNO,
		B.NOMBRE,
		B.ROL AS SQ_ROL,
		B.ROL_INSOURCING,
		B.ESPECIALIDAD,
		G.NOMBRE AS TRIBU,
		F.NOMBRE AS SQUAD,
		E.NOMBRE AS CODIGO_APP_ASIGNADO,
		A.POR_ASIGNADO AS PORCENTAJE_ASIGNADO,
		E.BINDING_BLOCK AS BB,
		C.NOMBRE_CHAPTER AS CHAPTER,
		A.COMENTARIO
		
		FROM [dbo].[APPLICATION_TEAM_MEMBER] A
		JOIN [dbo].[TEAM_MEMBER] B ON A.ID_TEAM_MEMBER=B.ID
		JOIN [dbo].[CHAPTER_LEADER] C ON B.ID_CHAPTER_LEADER = C.ID
		JOIN [dbo].[CHAPTER_AREA_LEADER] D ON C.ID_CHAPTER_AREA_LEADER = D.ID
		JOIN [dbo].[APPLICATION] E ON A.ID_APPLICATION = E.ID
		JOIN [dbo].[SQUAD] F ON E.ID_SQUAD = F.ID
		JOIN [dbo].[TRIBE] G ON F.ID_TRIBE = G.ID
		WHERE C.COD_MATRICULA = @MATRICULA
		END 
ELSE 
		BEGIN
		SELECT D.NOMBRES + ' '+ D.APELLIDO_PATERNO + ' ' + D.APELLIDO_MATERNO AS NOMBRE_CAL,
		C.COD_MATRICULA AS MAT_CHAPTER,
		C.NOMBRES + ' '+ C.APELLIDO_PATERNO + ' ' + C.APELLIDO_MATERNO AS CHAPTER_LEADER,
		B.TIPO_PROVEEDOR AS TIPO_PREPER,
		B.EMPRESA,
		B.COD_MATRICULA AS MATRICULA,
		B.APELLIDO_PATERNO,
		B.APELLIDO_MATERNO,
		B.NOMBRE,
		B.ROL AS SQ_ROL,
		B.ROL_INSOURCING,
		B.ESPECIALIDAD,
		G.NOMBRE AS TRIBU,
		F.NOMBRE AS SQUAD,
		E.NOMBRE AS CODIGO_APP_ASIGNADO,
		A.POR_ASIGNADO AS PORCENTAJE_ASIGNADO,
		E.BINDING_BLOCK AS BB,
		C.NOMBRE_CHAPTER AS CHAPTER,
		A.COMENTARIO
		
		FROM [dbo].[APPLICATION_TEAM_MEMBER] A
		JOIN [dbo].[TEAM_MEMBER] B ON A.ID_TEAM_MEMBER=B.ID
		JOIN [dbo].[CHAPTER_LEADER] C ON B.ID_CHAPTER_LEADER = C.ID
		JOIN [dbo].[CHAPTER_AREA_LEADER] D ON C.ID_CHAPTER_AREA_LEADER = D.ID
		JOIN [dbo].[APPLICATION] E ON A.ID_APPLICATION = E.ID
		JOIN [dbo].[SQUAD] F ON E.ID_SQUAD = F.ID
		JOIN [dbo].[TRIBE] G ON F.ID_TRIBE = G.ID
		END
    
END
GO
