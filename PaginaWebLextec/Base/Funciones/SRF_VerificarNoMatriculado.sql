USE [SR1.0]
GO

/****** Object:  UserDefinedFunction [dbo].[SRF_VerificarNoMatriculado]    Script Date: 10/17/2018 8:46:13 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[SRF_VerificarNoMatriculado]( @IdUsuario int, @IdSesion int)
RETURNS BIT
AS
BEGIN
	DECLARE @Resultado BIT
	SET @Resultado = 0
	SELECT @Resultado = 1 FROM dbo.SesionxUsuario ExU
		WHERE ExU.fk_usuario = @IdUsuario AND ExU.fk_sesion = @IdSesion and ExU.matriculado='False'
	RETURN @Resultado
END

GO


