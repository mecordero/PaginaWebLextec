
CREATE PROCEDURE [dbo].[SRSP_llenarUsuarioSesion]
AS
BEGIN
UPDATE
    dbo.Usuario
SET
    dbo.Usuario.fechaUltimaParticipacion = S.fecha,
    dbo.Usuario.fk_ultimaSesion = S.idSesion,
	dbo.Usuario.fk_ultimoExperimento = S.fk_experimento
FROM
    dbo.Sesion as S 
    INNER JOIN SesionxUsuario AS SU
        ON S.idSesion = SU.fk_sesion
WHERE
    dbo.Usuario.idUsuario = SU.fk_usuario
	RETURN 1		
END
go

--CRUD SESION
/*
DROP PROCEDURE dbo.SRSP_InsertarSesion
go 
*/

CREATE PROCEDURE [dbo].[SRSP_InsertarSesion](@idExperimento int, @Fecha DATETIME, @horaInicio TIME, @horaFinal TIME, @lleno bit)
AS
BEGIN
		INSERT INTO dbo.Sesion(fk_experimento, fecha, horaInicio, horaFinal, lleno)
			VALUES(@idExperimento, @Fecha, @horaInicio, @horaFinal, @lleno)
			RETURN 1
END
GO 
-- Procedimiento para insertar una sesion
-- verificado // 
-- /*---------------------------------------------------------------------------------------*/
/*DROP FUNCTION dbo.SRF_ExisteSesion 
go */

CREATE FUNCTION [dbo].[SRF_ExisteSesion](@idSesion INT)
RETURNS BIT
AS
BEGIN
	DECLARE @Resultado BIT
	SET @Resultado = 0
	SELECT @Resultado = 1 FROM dbo.Sesion S
		WHERE S.idSesion = @idSesion
	RETURN @Resultado
END
GO 
-- Funcion para verificar si existe una sesion
-- verificado // 
-- /*---------------------------------------------------------------------------------------*/

/*
DROP PROCEDURE dbo.SRSP_ActualizarSesion
go 
*/

CREATE PROCEDURE [dbo].[SRSP_ActualizarSesion](@idExp int, @idSesion int, @Fecha DATETIME, @horaInicio TIME, @horaFinal TIME, @lleno bit)
AS
BEGIN
	BEGIN TRY
			IF exists (SELECT 1 FROM dbo.Sesion S
				WHERE S.idSesion = @idSesion)
			BEGIN
				UPDATE dbo.Sesion   SET fk_experimento = ISNULL(@idExp, fk_experimento),
									fecha = IsNull(@Fecha, fecha),
									horaInicio = ISNULL(@horaInicio, horaInicio), 
									horaFinal = ISNULL(@horaFinal, horaFinal), 
									lleno = ISNULL(@lleno, lleno)
					FROM dbo.Sesion S WHERE S.idSesion = @idSesion
				RETURN 1
			END
			ELSE
				RETURN 0
	END TRY
	BEGIN CATCH
		RETURN @@ERROR * -1
	END CATCH
END
Go
-- procedimiento para actualizar una sesion, si alguno de sus parametros es nulo, mantendrá el original 
-- verificado // 
-- /*---------------------------------------------------------------------------------------*/
/*
DROP PROCEDURE dbo.SRSP_EliminarSesion
go 
*/

CREATE PROCEDURE [dbo].[SRSP_EliminarSesion](@idSesion INT)
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteSesion(@idSesion)  = 1)
		BEGIN
			DELETE FROM dbo.Sesion
				WHERE idSesion = @idSesion
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
-- Procedimiento para borrar una sesion 
-- verificado // 
-- /*---------------------------------------------------------------------------------------*/
/*
DROP PROCEDURE dbo.SRSP_VerSesion
go 
*/
CREATE PROCEDURE [dbo].[SRSP_VerSesion](@idSesion INT)
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteSesion(@idSesion)  = 1)
		BEGIN
			SELECT idSesion as [ID Sesion], fk_experimento as Experimento, fecha as Fecha, horaInicio as [Hora de Inicio], horaFinal as [Hora Final], CASE WHEN lleno = 1 THEN 'Si' ELSE 'No' END AS Lleno
			FROM dbo.Sesion 
			WHERE idSesion = @idSesion
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

-- Procedimiento para ver 1 sesion
-- /*---------------------------------------------------------------------------------------*/

--CRUD Resultado 
 

-- para insertar el excel para el resultado de una sesion, se hizo de esta forma por como se implementara en web
CREATE PROCEDURE [dbo].[SRSP_InsertarResultado](@idSesion int, @nombre Varchar(50), @tipo varchar(50), @tamano bigint, @archivo varbinary(MAX))
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteSesion(@idSesion)  = 1)
		BEGIN
			INSERT INTO dbo.Resultado(fk_sesion, nombre, tipo, tamano, archivo)
			VALUES(@idSesion, @nombre, @tipo, @tamano, @archivo)
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
-- /*---------------------------------------------------------------------------------------*/
/*
DROP FUNCTION dbo.SRF_ExisteResultado
go 
*/
CREATE FUNCTION [dbo].[SRF_ExisteResultado](@idResultado INT)
RETURNS BIT
AS
BEGIN
	DECLARE @Resultado BIT
	SET @Resultado = 0
	SELECT @Resultado = 1 FROM dbo.Resultado R
		WHERE R.idResultado = @idResultado
	RETURN @Resultado
END
GO 
-- Funcion para verificar si existe un resultado
-- /*---------------------------------------------------------------------------------------*/

/*
DROP PROCEDURE dbo.SRSP_ActualizarResultado
go 
*/
-- para actualizar el excel para el resultado de una sesion, se hizo de esta forma por como se implementara en web
CREATE PROCEDURE [dbo].[SRSP_ActualizarResultado](@idResultado int, @idSesion int, @nombre Varchar(50), @tipo varchar(50), @tamano bigint, @archivo varbinary(MAX))
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteResultado(@idResultado)  = 1)
		BEGIN
			INSERT INTO dbo.Resultado(fk_sesion, nombre, tipo, tamano, archivo)
			VALUES(@idSesion, @nombre, @tipo, @tamano, @archivo)
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

-- /*---------------------------------------------------------------------------------------*/
/*
DROP PROCEDURE dbo.SRSP_EliminarResultado
go 
*/

CREATE PROCEDURE [dbo].[SRSP_EliminarResultado](@idResultado INT)
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteResultado(@idResultado)  = 1)
		BEGIN
			DELETE FROM dbo.Resultado
				WHERE idResultado = @idResultado
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
-- Procedimiento para borrar una sesion 
-- /*---------------------------------------------------------------------------------------*/
/*
DROP PROCEDURE dbo.SRSP_VerResultado
go 
*/
CREATE PROCEDURE [dbo].[SRSP_VerResultado](@idResultado INT)
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteResultado(@idResultado)  = 1)
		BEGIN
			SELECT  idResultado as [ID Resultado],  fk_sesion as [ID Sesion], nombre as Nombre, tipo as Tipo, tamano as Tamaño, archivo as [Archivo en Bin]
			FROM dbo.Resultado
			WHERE idResultado = @idResultado
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
--procedimiento para ver resultado
-- /*---------------------------------------------------------------------------------------*/
/*DROP FUNCTION dbo.SRF_ExisteUsuarioID
go */


CREATE FUNCTION [dbo].[SRF_ExisteUsuarioID](@idUsuario INT)
RETURNS BIT
AS
BEGIN
	DECLARE @Resultado BIT
	SET @Resultado = 0
	SELECT @Resultado = 1 FROM dbo.Usuario u
		WHERE u.idUsuario= @idUsuario 
	RETURN @Resultado
END
GO 


-- Funcion para verificar si existe un usuario solo con el id 
-- verificada // 


-- /*---------------------------------------------------------------------------------------*/

--CRUD SesionxUsuario 

/*
DROP FUNCTION dbo.SRSP_InsertarSesionxUsuario
go 
*/
-- para insertar una relacion entre sesion y un usuario
-- verificada // 
CREATE PROCEDURE [dbo].[SRSP_InsertarSesionxUsuario](@idUsuario int, @idSesion int, @matriculado bit)
AS
BEGIN
	INSERT INTO dbo.SesionxUsuario(fk_usuario, fk_sesion, matriculado)
	VALUES(@idUsuario, @idSesion, @matriculado)
	RETURN 1
END
GO 
 
-- /*---------------------------------------------------------------------------------------*/
/*DROP FUNCTION dbo.SRF_ExisteSesionxUsuario 
go */


CREATE FUNCTION [dbo].[SRF_ExisteSesionxUsuario](@idSesionxUsuario INT)
RETURNS BIT
AS
BEGIN
	DECLARE @Resultado BIT
	SET @Resultado = 0
	SELECT @Resultado = 1 FROM dbo.SesionxUsuario S
		WHERE S.idSesionXusuario= @idSesionxUsuario 
	RETURN @Resultado
END
GO 


-- Funcion para verificar si existe una relacion entre sesion x usuario
-- verificada // 


-- /*---------------------------------------------------------------------------------------*/

/*
DROP PROCEDURE dbo.SRSP_ActualizarSesionxUsuario
go 
*/

CREATE PROCEDURE [dbo].[SRSP_ActualizarSesionxUsuario](@idSesionxUsuario int, @idUsuario int, @idSesion int, @matriculado bit)
AS
BEGIN
	BEGIN TRY
			IF (dbo.SRF_ExisteSesionxUsuario(@idSesionxUsuario)  = 1)
			BEGIN
				UPDATE dbo.SesionxUsuario   SET fk_usuario = ISNULL(@idUsuario, fk_usuario),
									fk_sesion = ISNULL(@idSesion, fk_sesion), 
									matriculado = ISNULL(@matriculado, matriculado)
					FROM dbo.SesionxUsuario S WHERE S.idSesionXusuario = @idSesionxUsuario
				RETURN 1
			END
			ELSE
				RETURN 0
	END TRY
	BEGIN CATCH
		RETURN @@ERROR * -1
	END CATCH
END
Go

-- Funcion para actualizar la relacion entre usuario y sesiones
-- verificada // 
-- /*---------------------------------------------------------------------------------------*/
/*
DROP PROCEDURE dbo.SRSP_EliminarSesion
go 
*/

CREATE PROCEDURE [dbo].[SRSP_EliminarSesionxUsuario](@idSesionxUsuario INT)
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteSesionxUsuario(@idSesionxUsuario)  = 1)
		BEGIN
			DELETE FROM dbo.SesionxUsuario
				WHERE idSesionXusuario = @idSesionxUsuario
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

-- Procedimiento para borrar una relacion entre una sesion y un usuario 
-- verificada // 
-- /*---------------------------------------------------------------------------------------*/


/*
DROP PROCEDURE dbo.SRSP_VerSesion
go 
*/
CREATE PROCEDURE [dbo].[SRSP_VerSesionxUsuario](@idSesionxUsuario INT)
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteSesionxUsuario(@idSesionxUsuario)  = 1)
		BEGIN
			SELECT idSesionXusuario as [ID Sesion x Usuario], fk_usuario as [ID Usuario], fk_sesion as [ID Sesion], matriculado as Matriculado
			FROM dbo.SesionxUsuario 
			WHERE idSesionXusuario = @idSesionxUsuario
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

-- Procedimiento para ver 1 sesionxusuaurio
-- Filtros para progra 
-- verificado // 
-- /*---------------------------------------------------------------------------------------*/

--Ver los usuarios que estan matriculados a un experimento 
-- ya no se ocupa 

/*
DROP PROCEDURE dbo.SRSP_VerUsuariosxExperimento
go 

CREATE PROCEDURE [dbo].[SRSP_VerUsuariosxExperimento](@idExperimento INT)
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteExperimento(@idExperimento)  = 1)
		BEGIN
			SELECT  idUsuario AS [ID Usuario], nombre AS Nombre, apellido1 AS [Primer Apellido], apellido2 AS [Segundo Apellido], numeroCedula AS [Numero de Cedula], email AS Email, especialidad AS Especialidad, 
                         nacionalidad AS Nacionalidad, gradoEstudio AS [Grado Estudio], genero AS Genero, habilitado AS Habilitado, estudiante AS Estudiante, fechaNacimiento AS [Fecha de Nacimiento], telefono AS Telefono, annoIngreso AS [Anno Ingreso Carrera], 
                         fechaRegistro AS [Fecha Registro], fechaDeshabilitado AS [Fecha Desabilitado]
			FROM dbo.Usuario as u, dbo.SesionxUsuario as su, dbo.Sesion as s
			WHERE s.fk_experimento  = @idExperimento and s.idSesion = su.fk_sesion and su.fk_usuario = u.idUsuario
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
*/

-- /*---------------------------------------------------------------------------------------*/





--Ver los usuarios que no estan participando en un experimento, si no ingresa el numero de 
--experimento busca todos los usuarios que no han participado en experimentos
--verificada // 




DROP PROCEDURE dbo.SRSP_VerUsuariosSinParticipar
go 

CREATE PROCEDURE [dbo].[SRSP_VerUsuariosSinParticipar](@idExperimento INT,  @Nombre VARCHAR(50), @Apellido1 VARCHAR(50), @Apellido2 VARCHAR(50),
@Cedula VARCHAR(50), @Email VARCHAR(50), @Especialidad VARCHAR(50), @Nacionalidad VARCHAR(50), @GradoEstudio VARCHAR(50),
@Genero VARCHAR(50), @Habilitado VARCHAR(50), @Estudiante VARCHAR(50), @fechaNacimientoInicio date, @fechaNacimientoFinal date, @Telefono INT, @AnnoIngresoCarrera INT, @FechaRegistro DATE, @FechaDeshabilitado DATE)
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteExperimento(@idExperimento)  = 1)
		BEGIN
			SELECT *
			FROM dbo.Usuario
			EXCEPT
			SELECT  u.*
			FROM dbo.Usuario as u, dbo.SesionxUsuario as su, dbo.Sesion as s
			WHERE s.fk_experimento  = isnull(@idExperimento, s.fk_experimento) and s.idSesion = su.fk_sesion and su.matriculado = 1 and su.fk_usuario = u.idUsuario and (u.nombre = isnull(@Nombre, u.nombre) or u.nombre is null) and  (u.apellido1 is null or u.apellido1 = isnull(@Apellido1, u.apellido1)) and (u.apellido2 = ISNULL(@Apellido2, u.apellido2) or u.apellido2 is null) and (u.numeroCedula = ISNULL(@Cedula, u.numeroCedula) or u.numeroCedula is null) and (u.email = ISNULL(@Email, u.email) or u.email is null) and (u.especialidad = ISNULL(@Especialidad, u.especialidad) or u.especialidad is null)
								and (u.nacionalidad = ISNULL(@Nacionalidad, u.nacionalidad) or u.nacionalidad is null) and (u.gradoEstudio = ISNULL(@GradoEstudio, u.gradoEstudio) or u.gradoEstudio is null) and (u.genero = ISNULL(@Genero, u.genero) or u.genero is null) and (u.habilitado = isnull(@Habilitado, u.habilitado) or u.habilitado is null) and (u.estudiante = ISNULL(@Estudiante, u.estudiante) or u.estudiante is null) and
								(u.telefono = ISNULL(@Telefono, u.telefono) or u.telefono is null) and (u.annoIngreso = ISNULL(@AnnoIngresoCarrera,u.annoIngreso) or u.annoIngreso is null) and (DATEDIFF(day, u.fechaRegistro, isnull(@FechaRegistro, u.fechaRegistro)) <= 0  or u.fechaRegistro is null) and DATEDIFF(day, u.fechaNacimiento, isnull(@fechaNacimientoInicio, u.fechaNacimiento)) <= 0 and DATEDIFF(day, u.fechaNacimiento, isnull(@fechaNacimientoFinal, u.fechaNacimiento)) >= 0  and (u.fechaDeshabilitado is null or DATEDIFF(day, u.fechaDeshabilitado, isnull(@FechaDeshabilitado, u.fechaDeshabilitado)) <= 0)
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
-- /*---------------------------------------------------------------------------------------*/

-- Esta funcion de filtrar usuarios, filtra los usuarios por participacion en experimentos y todas sus variables
-- si el experimento existe los filtra por eso, osea filtra por experimento + filtros de usuario 
-- si el experimento = 0 saca los que han participado en cualquier experimento  + filtros de usuario
-- si el experimento es nulo, solo los filtra con filtros de usuario 
--verificado //  
-- exec SRSP_FiltrarUsuarios 19, null, null, null, null, null, null, null, null, N'F', null, null, null, null, null, null, null, null

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

-- /*---------------------------------------------------------------------------------------*/
--procedure que si le dan un experimento, saca las sesiones
CREATE PROCEDURE [dbo].[SRSP_VerSesionesdeExperimento](@idExperimento INT)
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteExperimento(@idExperimento)  = 1)
		BEGIN
			SELECT  idSesion as [ID Sesion], fk_experimento as Experimento, fecha as Fecha, horaInicio as [Hora de Inicio], horaFinal as [Hora Final], CASE WHEN lleno = 1 THEN 'Si' ELSE 'No' END AS Lleno
			FROM dbo.Sesion as s
			WHERE s.fk_experimento  = @idExperimento 
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

--CRUD USUARIOS

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
			fechaRegistro, fechaDeshabilitado)
				VALUES(@Nombre, @Apellido1, @Apellido2,	@Cedula, @Email, @Especialidad, @Nacionalidad, @GradoEstudio,
					@Genero, @Habilitado, @Estudiante, @fechaNacimiento, @Telefono, @AnnoIngreso, @FechaRegistro, @FechaDeshabilitado)
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

-- Procedimiento para insertar un Usuario con paremetros

/*--------------------------------------------------------------------------------------------------------*/

-- ver usuarios 

CREATE VIEW [dbo].[ViewUsuarios]
AS
SELECT        idUsuario AS [ID Usuario], nombre AS Nombre, apellido1 AS [Primer Apellido], apellido2 AS [Segundo Apellido], numeroCedula AS [Numero de Cedula], email AS Email, especialidad AS Especialidad, 
                         nacionalidad AS Nacionalidad, gradoEstudio AS [Grado Estudio], genero AS Genero, habilitado AS Habilitado, estudiante AS Estudiante, fechaNacimiento AS [Fecha de Nacimiento], telefono AS Telefono, annoIngreso AS [Anno Ingreso Carrera], 
                         fechaRegistro AS [Fecha Registro], fechaDeshabilitado AS [Fecha Desabilitado]
FROM            dbo.Usuario


/*--------------------------------------------------------------------------------------------------------*/



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
--Procedimiento para actualizar un usuario
/*--------------------------------------------------------------------------------------------------------*/


CREATE PROCEDURE [dbo].[SRSP_EliminarUsuario](@Cedula VARCHAR(50))
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteUsuario(@Cedula)  = 1)			-- Validación de alguna existencia previa del usuario (FN).
		BEGIN
			DELETE FROM dbo.Usuario
				WHERE numeroCedula = @Cedula
			RETURN 1
		END
		ELSE
			RETURN 0
	END TRY
	BEGIN CATCH
		RETURN @@ERROR * -1
	END CATCH
END

-- Procedimiento para eliminar un Usuario.
/*--------------------------------------------------------------------------------------------------------*/