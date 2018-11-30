USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_VerSesionxUsuario]    Script Date: 10/4/2018 11:28:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SRSP_VerSesionxUsuario](@idSesionxUsuario INT)
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteSesionxUsuario(@idSesionxUsuario)  = 1)
		BEGIN
			SELECT idSesionXusuario as [ID Sesion x Usuario], fk_usuario as [ID Usuario], fk_sesion as [ID Sesion], matriculado as Matriculado
			FROM dbo.SesionxUsuario 
			WHERE idSesionXusuario = @idSesionxUsuario
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


