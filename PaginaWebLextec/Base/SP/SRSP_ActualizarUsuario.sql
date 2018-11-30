USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_ActualizarUsuario]    Script Date: 10/4/2018 11:14:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SRSP_ActualizarUsuario]( @Nombre VARCHAR(50), @Apellido1 VARCHAR(50), @Apellido2 VARCHAR(50),
@Cedula VARCHAR(50), @Email VARCHAR(50), @Especialidad VARCHAR(50), @Nacionalidad VARCHAR(50), @GradoEstudio VARCHAR(50),
@Genero VARCHAR(50), @Habilitado VARCHAR(50), @Estudiante VARCHAR(50), @fechaNacimiento date, @Telefono INT, @AnnoIngresoCarrera INT, @FechaRegistro DATE, @FechaDeshabilitado DATE)
AS
BEGIN
	BEGIN TRY
			IF exists (SELECT 1 FROM dbo.Usuario  U
				WHERE U.numeroCedula = @Cedula)
			BEGIN
				UPDATE dbo.Usuario SET  nombre = @Nombre,
												apellido1 = @Apellido1,
												apellido2 = @Apellido2,
												email = @Email,
												especialidad = @Especialidad,
												nacionalidad = @Nacionalidad,
												gradoEstudio = @GradoEstudio,
												genero = @Genero,
												habilitado = @Habilitado,
												estudiante = @Estudiante,
												fechaNacimiento = @fechaNacimiento,
												telefono = @Telefono,
												annoIngreso = @AnnoIngresoCarrera,
												fechaRegistro = @FechaRegistro,
												fechaDeshabilitado = @FechaDeshabilitado
					FROM dbo.Usuario U WHERE U.numeroCedula = @Cedula
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


