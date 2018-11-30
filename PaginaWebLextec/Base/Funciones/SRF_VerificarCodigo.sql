USE [SR1.0]
GO

/****** Object:  UserDefinedFunction [dbo].[SRF_VerificarCodigo]    Script Date: 10/17/2018 8:45:41 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[SRF_VerificarCodigo](@IdExp int, @Codigo int)
RETURNS BIT
AS
BEGIN
	DECLARE @Resultado BIT
	SET @Resultado = 0
	IF @IdExp = @Codigo
		BEGIN
		SET @Resultado = 1
		END
	RETURN @Resultado
END

GO


