USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_InsertarExperimento]    Script Date: 10/4/2018 11:22:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_InsertarExperimento](@FK_tipo INT, @FK_clase INT, @FK_administrador INT, @Nombre VARCHAR(50),
@NombrePublico VARCHAR(50), @Nota VARCHAR(max), @Descripcion VARCHAR(max), @Lugar VARCHAR(max),
 @Completado BIT, @Abierto BIT, @FechaRegistro DATE, @FechaInicio DATETIME, @FechaFinal DATETIME)
AS
BEGIN
		INSERT INTO dbo.Experimento(fk_tipo, fk_clase, fk_administrador, nombre, nombrePublico, nota, descripcion, lugar, completado, abierto, fechaRegistro, fechaInicio, fechaFinal)
			VALUES(@FK_tipo, @FK_clase, @FK_administrador, @Nombre, @NombrePublico, @Nota, @Descripcion, @Lugar, @Completado, @Abierto, @FechaRegistro, @FechaInicio, @FechaFinal)
			RETURN 1
END

GO


