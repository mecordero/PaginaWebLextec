USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_llenarUsuarioSesion]    Script Date: 10/4/2018 11:23:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SRSP_llenarUsuarioSesion]
AS
BEGIN
UPDATE
    dbo.Usuario
SET
    dbo.Usuario.fechaUltimaParticipacion = S.fecha,
    dbo.Usuario.fk_ultimaSesion = S.idSesion,
	dbo.Usuario.fk_ultimoExperimento = S.fk_experimento
FROM
    dbo.Sesion as S 
    INNER JOIN SesionxUsuario AS SU
        ON S.idSesion = SU.fk_sesion
WHERE
    dbo.Usuario.idUsuario = SU.fk_usuario
	RETURN 1		
END

GO


