USE [SR1.0]
GO

/****** Object:  UserDefinedFunction [dbo].[SRF_ExisteUsuario]    Script Date: 10/17/2018 8:44:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[SRF_ExisteUsuario](@Cedula VARCHAR(50))
RETURNS BIT
AS
BEGIN
	DECLARE @Resultado BIT
	SET @Resultado = 0
	SELECT @Resultado = 1 FROM dbo.Usuario U
		WHERE U.numeroCedula = @Cedula
	RETURN @Resultado
END

-- /*------------------------------------------------------------------------*/


GO


