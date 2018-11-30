USE [SR1.0]
GO

/****** Object:  UserDefinedFunction [dbo].[SRF_ExisteUsuarioID]    Script Date: 10/17/2018 8:44:30 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[SRF_ExisteUsuarioID](@idUsuario INT)
RETURNS BIT
AS
BEGIN
	DECLARE @Resultado BIT
	SET @Resultado = 0
	SELECT @Resultado = 1 FROM dbo.Usuario u
		WHERE u.idUsuario= @idUsuario 
	RETURN @Resultado
END

GO


