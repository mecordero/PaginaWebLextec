USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_ActualizarTipo]    Script Date: 10/4/2018 11:14:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_ActualizarTipo](@ID INT, @Nombre VARCHAR(50))
AS
BEGIN
	BEGIN TRY
			IF not exists (SELECT 1 FROM dbo.Tipo  T 		-- Validación de alguna existencia previa del Cliente.
				WHERE T.idTipo <> @ID and T.nombre = @Nombre)
			BEGIN
				UPDATE dbo.Tipo SET   Nombre = @Nombre
					FROM dbo.Tipo T WHERE T.idTipo = @ID
				RETURN 1
			END
			ELSE
				RETURN 0
	END TRY
	BEGIN CATCH
		RETURN @@ERROR * -1
	END CATCH
END

-- /*-------------------------------------------------------------------------------------*/
--Insertar un ExperimentoXusuario


GO


