USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_InsertarUsuario]    Script Date: 10/4/2018 11:23:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SRSP_InsertarUsuario](@Nombre VARCHAR(50), @Apellido1 VARCHAR(50), @Apellido2 VARCHAR(50),
@Cedula VARCHAR(50), @Email VARCHAR(50), @Especialidad VARCHAR(50), @Nacionalidad VARCHAR(50), @GradoEstudio VARCHAR(50),
@Genero VARCHAR(50), @Habilitado BIT, @Estudiante BIT, @fechaNacimiento DATE, @Telefono INT, @AnnoIngreso INT, @FechaRegistro DATE, @FechaDeshabilitado DATE)
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteUsuario(@Cedula) = 0)
		BEGIN
			INSERT INTO dbo.Usuario(nombre, apellido1, apellido2, numeroCedula, email, especialidad,
				nacionalidad, gradoEstudio, genero, habilitado, estudiante, fechaNacimiento, telefono, annoIngreso,
			fechaRegistro, fechaDeshabilitado, cantidadParticipacion)
				VALUES(@Nombre, @Apellido1, @Apellido2,	@Cedula, @Email, @Especialidad, @Nacionalidad, @GradoEstudio,
					@Genero, @Habilitado, @Estudiante, @fechaNacimiento, @Telefono, @AnnoIngreso, @FechaRegistro, @FechaDeshabilitado,0)
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


