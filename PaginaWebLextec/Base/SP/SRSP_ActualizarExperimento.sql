USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_ActualizarExperimento]    Script Date: 10/4/2018 11:12:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_ActualizarExperimento](@FK_tipo INT, @FK_clase INT, @ID INT, @Nombre VARCHAR(50), @NombrePublico VARCHAR(50), @Nota VARCHAR(MAX), @Descripcion VARCHAR(MAX), @Lugar VARCHAR(MAX),
 @Completado BIT, @Abierto BIT, @FechaRegistro DATE, @FechaInicio DATETIME, @FechaFinal DATETIME)
AS
BEGIN
	BEGIN TRY
			IF exists (SELECT 1 FROM dbo.Experimento  E
				WHERE E.idExperimento = @ID)
			BEGIN
				UPDATE dbo.Experimento SET   fk_tipo = @FK_tipo,
											fk_clase = @FK_clase,
											nombre = @Nombre,
				 							nombrePublico = @NombrePublico,
											nota = @Nota,
											descripcion = @Descripcion,
											lugar = @Lugar,
	
											completado = @Completado,
											abierto = @Abierto,
											fechaRegistro = @FechaRegistro,
											fechaInicio = @FechaInicio,
											fechaFinal = @FechaFinal
					FROM dbo.Experimento E WHERE E.idExperimento = @ID
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


