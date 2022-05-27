USE [PROYECTOBCP]
GO
/****** Object:  StoredProcedure [dbo].[OBTENER_BASE_ACTIVO]    Script Date: 26/05/2022 08:01:09:p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[OBTENER_BASE_ACTIVO]
(	@MATRICULA AS varchar(6),
	@PAGE AS int,
	@SIZE AS int
)
AS
DECLARE @v_CAL int, @v_CL int
BEGIN
SELECT @v_CAL = COUNT(1)
FROM [dbo].[CHAPTER_AREA_LEADER]
WHERE [COD_MATRICULA] = @MATRICULA



SELECT @v_CL = COUNT(1)
FROM [dbo].[CHAPTER_LEADER]
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
ORDER BY NOMBRE_CAL
OFFSET @PAGE ROWS FETCH NEXT @SIZE ROWS ONLY
END
ELSE IF @v_CL > 0
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
ORDER BY NOMBRE_CAL
OFFSET @PAGE ROWS FETCH NEXT @SIZE ROWS ONLY
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
ORDER BY NOMBRE_CAL
OFFSET @PAGE ROWS FETCH NEXT @SIZE ROWS ONLY
END

END
