USE [SR1.0]
GO

/****** Object:  UserDefinedFunction [dbo].[SRF_EstaMatriculado]    Script Date: 10/17/2018 8:35:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[SRF_EstaMatriculado]( @Email varchar(50), @idSesion int)
RETURNS BIT
AS
BEGIN
	DECLARE @Resultado BIT
	SET @Resultado = 0
	SELECT @Resultado = 1 FROM dbo.SesionxUsuario SxU, Usuario U
		WHERE SxU.fk_usuario = U.idUsuario AND SxU.fk_sesion = @idSesion
		and U.email =  @Email and SxU.matriculado = 1
	RETURN @Resultado
END
GO


