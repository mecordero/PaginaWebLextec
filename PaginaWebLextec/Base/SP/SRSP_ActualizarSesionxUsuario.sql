USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_ActualizarSesionxUsuario]    Script Date: 10/4/2018 11:14:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SRSP_ActualizarSesionxUsuario](@idSesionxUsuario int, @idUsuario int, @idSesion int, @matriculado bit)
AS
BEGIN
	BEGIN TRY
			IF (dbo.SRF_ExisteSesionxUsuario(@idSesionxUsuario)  = 1)
			BEGIN
				UPDATE dbo.SesionxUsuario   SET fk_usuario = ISNULL(@idUsuario, fk_usuario),
									fk_sesion = ISNULL(@idSesion, fk_sesion), 
									matriculado = ISNULL(@matriculado, matriculado)
					FROM dbo.SesionxUsuario S WHERE S.idSesionXusuario = @idSesionxUsuario
				RETURN 1
			END
			ELSE
				RETURN 0
	END TRY
	BEGIN CATCH
		RETURN @@ERROR * -1
	END CATCH
END

GO


