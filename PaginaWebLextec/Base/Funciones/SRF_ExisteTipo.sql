USE [SR1.0]
GO

/****** Object:  UserDefinedFunction [dbo].[SRF_ExisteTipo]    Script Date: 10/17/2018 8:43:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[SRF_ExisteTipo](@Nombre VARCHAR(50))
RETURNS BIT
AS
BEGIN
	DECLARE @Resultado BIT
	SET @Resultado = 0
	SELECT @Resultado = 1 FROM dbo.Tipo T
		WHERE T.nombre = @Nombre
	RETURN @Resultado
END
/*------------------------------------------------------------------------*/


GO


