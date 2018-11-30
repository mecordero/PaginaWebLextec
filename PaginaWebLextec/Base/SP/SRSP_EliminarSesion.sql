USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_EliminarSesion]    Script Date: 10/4/2018 11:17:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_EliminarSesion](@idSesion INT)
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteSesion(@idSesion)  = 1)
		BEGIN
			DELETE FROM dbo.Sesion
				WHERE idSesion = @idSesion
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


