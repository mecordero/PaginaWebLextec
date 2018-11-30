USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_ActualizarExperimentoInterfaz]    Script Date: 10/4/2018 11:12:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_ActualizarExperimentoInterfaz](@ID INT, @Nombre VARCHAR(50), @NombrePublico VARCHAR(50), @Nota VARCHAR(MAX), @Descripcion VARCHAR(MAX), @Lugar VARCHAR(MAX),
 @Completado BIT, @Abierto BIT, @FechaRegistro DATE, @FechaInicio DATETIME, @FechaFinal DATETIME,@tipo VARCHAR(50), @clase VARCHAR(50))
AS
BEGIN
	BEGIN TRY
			BEGIN
			Declare @ID_Tipo int
			Declare @ID_Clase int
			Select @ID_Tipo= t.idTipo from Tipo T where t.nombre=@tipo
			Select @ID_Clase= C.idClase from Clase C where c.nombre=@clase
				UPDATE dbo.Experimento SET   fk_tipo = @ID_Tipo,
											fk_clase = @ID_Clase,
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
	END TRY
	BEGIN CATCH
		RETURN @@ERROR * -1
	END CATCH
END
GO


