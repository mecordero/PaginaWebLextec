USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_SesionExportarUsuarios]    Script Date: 10/4/2018 11:25:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_SesionExportarUsuarios](@idSesion int)
AS
BEGIN

  BEGIN TRY
			SELECT idUsuario AS [Usuario - ID], u.nombre AS Nombre, u.apellido1 AS [Primer Apellido], u.apellido2 AS [Segundo Apellido], u.numeroCedula AS [Numero de Cedula], u.email AS Email, u.especialidad AS Especialidad, 
                         u.nacionalidad AS Nacionalidad, u.gradoEstudio AS [Grado Estudio], u.genero AS Genero, u.habilitado AS Habilitado, u.estudiante AS Estudiante, u.fechaNacimiento AS [Fecha de Nacimiento], u.telefono AS Telefono, u.annoIngreso AS [Anno Ingreso Carrera], 
                         u.fechaRegistro AS [Fecha Registro], u.fechaDeshabilitado AS [Fecha Desabilitado], s.idSesion as [Sesion Id] , s.fecha as [Fecha de la Sesión], su.matriculado as [Usuario matriculado], su.participo as [Participacion]
			FROM Usuario u, Sesion s, SesionxUsuario su 
			WHERE su.matriculado=1 and (su.fk_sesion = @idSesion) and (su.fk_usuario = u.idUsuario) and (s.idSesion = @idSesion)
			RETURN 1                      

  END TRY
  BEGIN CATCH
    RETURN @@ERROR * -1
  END CATCH
END
GO


