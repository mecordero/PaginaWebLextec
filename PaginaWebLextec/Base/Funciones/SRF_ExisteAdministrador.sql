USE [SR1.0]
GO

/****** Object:  UserDefinedFunction [dbo].[SRF_ExisteAdministrador]    Script Date: 10/17/2018 8:36:34 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[SRF_ExisteAdministrador](@Email VARCHAR(50))
RETURNS BIT
AS
BEGIN
	DECLARE @Resultado BIT
	SET @Resultado = 0
	SELECT @Resultado = 1 FROM dbo.Administrador A
		WHERE A.email = @Email
	RETURN @Resultado
END

/*------------------------------------------------------------------------*/


GO


