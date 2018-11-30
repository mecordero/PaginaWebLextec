USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_VerSesion]    Script Date: 10/4/2018 11:27:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_VerSesion](@idSesion INT)
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteSesion(@idSesion)  = 1)
		BEGIN
			SELECT idSesion as [ID Sesion], fk_experimento as Experimento, fecha as Fecha, horaInicio as [Hora de Inicio], horaFinal as [Hora Final], CASE WHEN lleno = 1 THEN 'Si' ELSE 'No' END AS Lleno, cupo as Cupo
			FROM dbo.Sesion 
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


