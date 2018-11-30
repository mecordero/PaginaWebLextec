USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_InsertarTipo]    Script Date: 10/4/2018 11:23:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_InsertarTipo](@Nombre VARCHAR(50))
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteTipo(@Nombre) = 0)			-- Validación de alguna existencia previa del CLiente (FN).
		BEGIN
			INSERT INTO dbo.Tipo(nombre)
				VALUES(@Nombre)
			RETURN 1
		END
		ELSE
			RETURN 0
	END TRY
	BEGIN CATCH
		RETURN @@ERROR * -1
	END CATCH
END

-- -- Procedimiento para eliminar un Tipo de experimento.


GO


