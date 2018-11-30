USE [SR1.0]
GO

/****** Object:  UserDefinedFunction [dbo].[SRF_VerificarCupo]    Script Date: 10/17/2018 8:45:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[SRF_VerificarCupo](@idSesion int)
RETURNS BIT
AS
BEGIN
	DECLARE @Resultado BIT
	SET @Resultado = 0
	DECLARE @Cupo INT
	SELECT @Cupo = S.cupo FROM Sesion S Where S.idSesion = @idSesion; 
	IF @Cupo > 0
		BEGIN
		SET @Resultado = 1
		END
	RETURN @Resultado
END

GO


