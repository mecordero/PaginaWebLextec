USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_EliminarExperimento]    Script Date: 10/4/2018 11:16:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_EliminarExperimento](@ID INT)
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteExperimento(@ID)  = 1)
		BEGIN
			DELETE FROM dbo.Experimento
				WHERE idExperimento = @ID
			RETURN 1
		END
		ELSE
			RETURN 0
	END TRY
	BEGIN CATCH
		RETURN @@ERROR * -1
	END CATCH
END

-- Procedimiento para actualizar un Estante.


GO


