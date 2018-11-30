USE [SR1.0]
GO

/****** Object:  UserDefinedFunction [dbo].[SRF_ExisteResultado]    Script Date: 10/17/2018 8:42:22 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[SRF_ExisteResultado](@idResultado INT)
RETURNS BIT
AS
BEGIN
	DECLARE @Resultado BIT
	SET @Resultado = 0
	SELECT @Resultado = 1 FROM dbo.Resultado R
		WHERE R.idResultado = @idResultado
	RETURN @Resultado
END

GO


