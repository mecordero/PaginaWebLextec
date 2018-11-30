USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_FiltrarUsuarios]    Script Date: 10/4/2018 11:19:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SRSP_FiltrarUsuarios](@idExperimento int, @Nombre VARCHAR(50), @Apellido1 VARCHAR(50), @Apellido2 VARCHAR(50),
@Cedula VARCHAR(50), @Email VARCHAR(50), @Especialidad VARCHAR(50), @Nacionalidad VARCHAR(50), @GradoEstudio VARCHAR(50),
@Genero VARCHAR(50), @Habilitado VARCHAR(50), @Estudiante VARCHAR(50), @fechaNacimientoInicio date, @fechaNacimientoFinal date, @Telefono INT, @AnnoIngresoCarrera INT, @FechaRegistro DATE, @FechaDeshabilitado DATE)
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteExperimento(@idExperimento)  = 1)
		BEGIN
		 
			SELECT   u.idUsuario AS [ID Usuario], u.nombre AS Nombre, u.apellido1 AS [Primer Apellido], u.apellido2 AS [Segundo Apellido], u.numeroCedula AS [Numero de Cedula], u.email AS Email, u.especialidad AS Especialidad, 
                         u.nacionalidad AS Nacionalidad, u.gradoEstudio AS [Grado Estudio], u.genero AS Genero, u.habilitado AS Habilitado, u.estudiante AS Estudiante, u.fechaNacimiento AS [Fecha de Nacimiento], u.telefono AS Telefono, u.annoIngreso AS [Anno Ingreso Carrera], 
                         u.fechaRegistro AS [Fecha Registro], u.fechaDeshabilitado AS [Fecha Desabilitado]
			FROM dbo.Usuario as u, dbo.SesionxUsuario as su, dbo.Sesion as s
			WHERE s.fk_experimento  = @idExperimento and s.idSesion = su.fk_sesion and su.matriculado = 1 and su.fk_usuario = u.idUsuario and (u.nombre = isnull(@Nombre, u.nombre) or u.nombre is null) and  (u.apellido1 is null or u.apellido1 = isnull(@Apellido1, u.apellido1)) and (u.apellido2 = ISNULL(@Apellido2, u.apellido2) or u.apellido2 is null) and (u.numeroCedula = ISNULL(@Cedula, u.numeroCedula) or u.numeroCedula is null) and (u.email = ISNULL(@Email, u.email) or u.email is null) and (u.especialidad = ISNULL(@Especialidad, u.especialidad) or u.especialidad is null)
								and (u.nacionalidad = ISNULL(@Nacionalidad, u.nacionalidad) or u.nacionalidad is null) and (u.gradoEstudio = ISNULL(@GradoEstudio, u.gradoEstudio) or u.gradoEstudio is null) and (u.genero = ISNULL(@Genero, u.genero) or u.genero is null) and (u.habilitado = isnull(@Habilitado, u.habilitado) or u.habilitado is null) and (u.estudiante = ISNULL(@Estudiante, u.estudiante) or u.estudiante is null) and
								(u.telefono = ISNULL(@Telefono, u.telefono) or u.telefono is null) and (u.annoIngreso = ISNULL(@AnnoIngresoCarrera,u.annoIngreso) or u.annoIngreso is null) and (DATEDIFF(day, u.fechaRegistro, isnull(@FechaRegistro, u.fechaRegistro)) <= 0  or u.fechaRegistro is null) and DATEDIFF(day, u.fechaNacimiento, isnull(@fechaNacimientoInicio, u.fechaNacimiento)) <= 0 and DATEDIFF(day, u.fechaNacimiento, isnull(@fechaNacimientoFinal, u.fechaNacimiento)) >= 0  and (u.fechaDeshabilitado is null or DATEDIFF(day, u.fechaDeshabilitado, isnull(@FechaDeshabilitado, u.fechaDeshabilitado)) <= 0)
				RETURN 1
		END
		ELSE 
			BEGIN
			IF(@idExperimento  = 0)
				BEGIN
					SELECT  u.idUsuario AS [ID Usuario], u.nombre AS Nombre, u.apellido1 AS [Primer Apellido], u.apellido2 AS [Segundo Apellido], u.numeroCedula AS [Numero de Cedula], u.email AS Email, u.especialidad AS Especialidad, 
								 u.nacionalidad AS Nacionalidad, u.gradoEstudio AS [Grado Estudio], u.genero AS Genero, u.habilitado AS Habilitado, u.estudiante AS Estudiante, u.fechaNacimiento AS [Fecha de Nacimiento], u.telefono AS Telefono, u.annoIngreso AS [Anno Ingreso Carrera], 
								 u.fechaRegistro AS [Fecha Registro], u.fechaDeshabilitado AS [Fecha Desabilitado]
					FROM dbo.Usuario as u, dbo.SesionxUsuario as su, dbo.Sesion as s
					WHERE s.idSesion = su.fk_sesion and su.matriculado = 1 and su.fk_usuario = u.idUsuario and (u.nombre = isnull(@Nombre, u.nombre) or u.nombre is null) and  (u.apellido1 is null or u.apellido1 = isnull(@Apellido1, u.apellido1)) and (u.apellido2 = ISNULL(@Apellido2, u.apellido2) or u.apellido2 is null) and (u.numeroCedula = ISNULL(@Cedula, u.numeroCedula) or u.numeroCedula is null) and (u.email = ISNULL(@Email, u.email) or u.email is null) and (u.especialidad = ISNULL(@Especialidad, u.especialidad) or u.especialidad is null)
								and (u.nacionalidad = ISNULL(@Nacionalidad, u.nacionalidad) or u.nacionalidad is null) and (u.gradoEstudio = ISNULL(@GradoEstudio, u.gradoEstudio) or u.gradoEstudio is null) and (u.genero = ISNULL(@Genero, u.genero) or u.genero is null) and (u.habilitado = isnull(@Habilitado, u.habilitado) or u.habilitado is null) and (u.estudiante = ISNULL(@Estudiante, u.estudiante) or u.estudiante is null) and
								(u.telefono = ISNULL(@Telefono, u.telefono) or u.telefono is null) and (u.annoIngreso = ISNULL(@AnnoIngresoCarrera,u.annoIngreso) or u.annoIngreso is null) and (DATEDIFF(day, u.fechaRegistro, isnull(@FechaRegistro, u.fechaRegistro)) <= 0  or u.fechaRegistro is null) and DATEDIFF(day, u.fechaNacimiento, isnull(@fechaNacimientoInicio, u.fechaNacimiento)) <= 0 and DATEDIFF(day, u.fechaNacimiento, isnull(@fechaNacimientoFinal, u.fechaNacimiento)) >= 0  and (u.fechaDeshabilitado is null or DATEDIFF(day, u.fechaDeshabilitado, isnull(@FechaDeshabilitado, u.fechaDeshabilitado)) <= 0)
						RETURN 1
				END
			ELSE 
				BEGIN
					IF(@idExperimento is null)
						BEGIN
						SELECT  u.idUsuario AS [ID Usuario], u.nombre AS Nombre, u.apellido1 AS [Primer Apellido], u.apellido2 AS [Segundo Apellido], u.numeroCedula AS [Numero de Cedula], u.email AS Email, u.especialidad AS Especialidad, 
										u.nacionalidad AS Nacionalidad, u.gradoEstudio AS [Grado Estudio], u.genero AS Genero, u.habilitado AS Habilitado, u.estudiante AS Estudiante, u.fechaNacimiento AS [Fecha de Nacimiento], u.telefono AS Telefono, u.annoIngreso AS [Anno Ingreso Carrera], 
										u.fechaRegistro AS [Fecha Registro], u.fechaDeshabilitado AS [Fecha Desabilitado]
						FROM dbo.Usuario u
						WHERE (u.nombre = isnull(@Nombre, u.nombre) or u.nombre is null) and  (u.apellido1 is null or u.apellido1 = isnull(@Apellido1, u.apellido1)) and (u.apellido2 = ISNULL(@Apellido2, u.apellido2) or u.apellido2 is null) and (u.numeroCedula = ISNULL(@Cedula, u.numeroCedula) or u.numeroCedula is null) and (u.email = ISNULL(@Email, u.email) or u.email is null) and (u.especialidad = ISNULL(@Especialidad, u.especialidad) or u.especialidad is null)
								and (u.nacionalidad = ISNULL(@Nacionalidad, u.nacionalidad) or u.nacionalidad is null) and (u.gradoEstudio = ISNULL(@GradoEstudio, u.gradoEstudio) or u.gradoEstudio is null) and (u.genero = ISNULL(@Genero, u.genero) or u.genero is null) and (u.habilitado = isnull(@Habilitado, u.habilitado) or u.habilitado is null) and (u.estudiante = ISNULL(@Estudiante, u.estudiante) or u.estudiante is null) and
								(u.telefono = ISNULL(@Telefono, u.telefono) or u.telefono is null) and (u.annoIngreso = ISNULL(@AnnoIngresoCarrera,u.annoIngreso) or u.annoIngreso is null) and (DATEDIFF(day, u.fechaRegistro, isnull(@FechaRegistro, u.fechaRegistro)) <= 0  or u.fechaRegistro is null) and DATEDIFF(day, u.fechaNacimiento, isnull(@fechaNacimientoInicio, u.fechaNacimiento)) <= 0 and DATEDIFF(day, u.fechaNacimiento, isnull(@fechaNacimientoFinal, u.fechaNacimiento)) >= 0  and (u.fechaDeshabilitado is null or DATEDIFF(day, u.fechaDeshabilitado, isnull(@FechaDeshabilitado, u.fechaDeshabilitado)) <= 0)
							RETURN 0
						END
					ELSE 
						RETURN 0
				END
			END
	END TRY
	BEGIN CATCH
		RETURN @@ERROR * -1
	END CATCH
END

GO

