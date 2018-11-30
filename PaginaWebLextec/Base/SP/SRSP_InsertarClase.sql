USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_InsertarClase]    Script Date: 10/4/2018 11:21:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_InsertarClase](@Nombre VARCHAR(50))
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteClase(@Nombre) = 0)			-- Validación de alguna existencia previa del CLiente (FN).
		BEGIN
			INSERT INTO dbo.Clase(nombre)
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

-- -- Procedimiento para eliminar una Clase


GO


