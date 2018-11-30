USE [SR1.0]
GO

/****** Object:  UserDefinedFunction [dbo].[SRF_ExisteExperimento]    Script Date: 10/17/2018 8:41:37 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[SRF_ExisteExperimento](@ID INT)
RETURNS BIT
AS
BEGIN
	DECLARE @Resultado BIT
	SET @Resultado = 0
	SELECT @Resultado = 1 FROM dbo.Experimento E
		WHERE E.idExperimento = @ID
	RETURN @Resultado
END

/*------------------------------------------------------------------------*/


GO


