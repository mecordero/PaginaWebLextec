USE [SR1.0]
GO

/****** Object:  UserDefinedFunction [dbo].[SRF_ExisteSesionxUsuario]    Script Date: 10/17/2018 8:43:35 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[SRF_ExisteSesionxUsuario](@ID INT)
RETURNS BIT
AS
BEGIN
	DECLARE @Resultado BIT
	SET @Resultado = 0
	SELECT @Resultado = 1 FROM dbo.SesionxUsuario SxU
		WHERE SxU.idSesionXusuario = @ID
	RETURN @Resultado
END
GO


