USE [SR1.0]
GO

/****** Object:  UserDefinedFunction [dbo].[SRF_ExisteRelacion]    Script Date: 10/17/2018 8:42:01 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[SRF_ExisteRelacion]( @IdUsuario int, @idSesion int)
RETURNS BIT
AS
BEGIN
	DECLARE @Resultado BIT
	SET @Resultado = 0
	SELECT @Resultado = 1 FROM dbo.SesionxUsuario SxU
		WHERE SxU.fk_usuario = @IdUsuario AND SxU.fk_sesion = @idSesion; 
	RETURN @Resultado
END

GO


