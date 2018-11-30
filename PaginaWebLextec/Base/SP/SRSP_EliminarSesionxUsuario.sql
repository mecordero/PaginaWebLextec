USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_EliminarSesionxUsuario]    Script Date: 10/4/2018 11:18:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SRSP_EliminarSesionxUsuario](@idSesionxUsuario INT)
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteSesionxUsuario(@idSesionxUsuario)  = 1)
		BEGIN
			DELETE FROM dbo.SesionxUsuario
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


