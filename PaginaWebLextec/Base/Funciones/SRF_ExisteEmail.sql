USE [SR1.0]
GO

/****** Object:  UserDefinedFunction [dbo].[SRF_ExisteEmail]    Script Date: 10/17/2018 8:37:12 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[SRF_ExisteEmail] (@Email VARCHAR(50))
RETURNS BIT
AS
BEGIN
	DECLARE @Resultado BIT
	SET @Resultado = 0
	SELECT @Resultado = 1 FROM dbo.Usuario U
		WHERE U.email = @Email and U.habilitado='True'
	RETURN @Resultado
END
GO


