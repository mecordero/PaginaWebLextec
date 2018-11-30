USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_ActualizarClase]    Script Date: 10/4/2018 11:11:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_ActualizarClase](@ID INT, @Nombre VARCHAR(50))
AS
BEGIN
	BEGIN TRY
			IF not exists (SELECT 1 FROM dbo.Clase  C 		-- Validación de alguna existencia previa del Cliente.
				WHERE C.idClase <> @ID and C.nombre = @Nombre)
			BEGIN
				UPDATE dbo.Clase SET   Nombre = @Nombre
					FROM dbo.Clase C WHERE C.idClase = @ID
				RETURN 1
			END
			ELSE
				RETURN 0
	END TRY
	BEGIN CATCH
		RETURN @@ERROR * -1
	END CATCH
END


-- /*--------------------------------------------------------------------------------------*/

-- Procedimiento para insertar  un Tipo de experimento.


GO


