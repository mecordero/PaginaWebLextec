USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_VerSesionesdeExperimento]    Script Date: 10/4/2018 11:27:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_VerSesionesdeExperimento](@idExperimento INT)
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteExperimento(@idExperimento)  = 1)
		BEGIN
			SELECT  idSesion, fecha, horaInicio, horaFinal, s.cupo, CASE WHEN lleno = 1 THEN 'Si' ELSE 'No' END AS lleno
			FROM dbo.Sesion as s
			WHERE s.fk_experimento  = @idExperimento 
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


