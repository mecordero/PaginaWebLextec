USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_ActualizarMensaje]    Script Date: 10/4/2018 11:12:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_ActualizarMensaje](@NombreExperimento VARCHAR(MAX), @Mensaje VARCHAR(MAX))
AS
BEGIN
	BEGIN TRY
			IF exists (SELECT 1 FROM dbo.Experimento  E
				WHERE E.nombre = @NombreExperimento)
			BEGIN
				UPDATE dbo.Experimento SET mensaje = @Mensaje
					FROM dbo.Experimento E WHERE E.nombre = @NombreExperimento
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


