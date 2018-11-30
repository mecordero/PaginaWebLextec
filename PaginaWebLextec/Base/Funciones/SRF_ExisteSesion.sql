USE [SR1.0]
GO

/****** Object:  UserDefinedFunction [dbo].[SRF_ExisteSesion]    Script Date: 10/17/2018 8:43:21 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[SRF_ExisteSesion](@idSesion INT)
RETURNS BIT
AS
BEGIN
	DECLARE @Resultado BIT
	SET @Resultado = 0
	SELECT @Resultado = 1 FROM dbo.Sesion S
		WHERE S.idSesion = @idSesion
	RETURN @Resultado
END

GO


