USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_EliminarTipo]    Script Date: 10/4/2018 11:18:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_EliminarTipo](@Nombre VARCHAR(50))
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteTipo(@Nombre)  = 1)			-- Validación de alguna existencia previa del Cliente (FN).
		BEGIN
			DELETE FROM dbo.Tipo
				WHERE nombre = @Nombre
			RETURN 1
		END
		ELSE
			RETURN 0
	END TRY
	BEGIN CATCH
		RETURN @@ERROR * -1
	END CATCH
END

-- Procedimiento para actualizar  un Tipo de experimento.


GO


