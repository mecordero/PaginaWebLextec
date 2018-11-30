USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_InsertarSesionxUsuario]    Script Date: 10/4/2018 11:23:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_InsertarSesionxUsuario](@idUsuario int, @idSesion int, @matriculado bit)
AS
BEGIN
	DECLARE @userAlreadyInSession INT;

	SELECT @userAlreadyInSession = idSesionXUsuario
	FROM dbo.SesionxUsuario
	WHERE fk_usuario = @idUsuario AND fk_sesion = @idSesion;

	IF @userAlreadyInSession IS NULL
	BEGIN
		INSERT INTO dbo.SesionxUsuario(fk_usuario, fk_sesion, matriculado)
		VALUES(@idUsuario, @idSesion, @matriculado);
		RETURN 1;
	END
END
GO


