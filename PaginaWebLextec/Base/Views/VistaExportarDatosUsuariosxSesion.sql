USE [SR1.0]
GO

/****** Object:  View [dbo].[VistaExportarDatosUsuariosxSesion]    Script Date: 10/4/2018 11:05:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VistaExportarDatosUsuariosxSesion]
AS
SELECT        dbo.Usuario.nombre AS NombreUsuario, dbo.Usuario.apellido1 AS PrimerApellidoUsuario, dbo.Usuario.apellido2 AS SegundoApellidoUsuario, dbo.Usuario.telefono AS TelefonoUsuario, 
                         dbo.Usuario.genero AS GeneroUsuario, dbo.Usuario.numeroCedula AS NumeroCedulaUsuario, dbo.Usuario.email AS EmailUsuario, dbo.Usuario.especialidad AS EspecialidadUsuario, 
                         dbo.Usuario.nacionalidad AS NacionalidadUsuario, dbo.Usuario.estudiante AS EstudianteUsuario, dbo.Usuario.gradoEstudio AS GradoEstudioUsuario, dbo.Usuario.habilitado AS HabilidatoUsuario, 
                         dbo.Usuario.fechaNacimiento AS FechaNacimiento, dbo.Usuario.annoIngreso AS AnnoIngresoCarreraUsuario, dbo.Usuario.fechaRegistro AS FechaRegistroUsuario, dbo.Usuario.fechaDeshabilitado AS FechaDeshabilitadoUsuario, 
                         dbo.Clase.nombre AS Clase, dbo.Experimento.nombre AS Experimento, dbo.Experimento.nombrePublico, dbo.Experimento.nota, dbo.Experimento.descripcion, dbo.Experimento.lugar,  
                         dbo.Experimento.completado, dbo.Experimento.abierto, dbo.Tipo.nombre AS NombreTipo, dbo.Experimento.idExperimento, dbo.Usuario.idUsuario, dbo.Sesion.idSesion AS IDSesion, dbo.Sesion.fecha as Fecha,
						 dbo.Sesion.horaInicio as HoraInicio, dbo.Sesion.horaFinal as HoraFinal
FROM            dbo.Clase INNER JOIN
                         dbo.Experimento ON dbo.Clase.idClase = dbo.Experimento.fk_clase INNER JOIN
                         dbo.Tipo ON dbo.Experimento.fk_tipo = dbo.Tipo.idTipo INNER JOIN
						 dbo.Sesion on dbo.Sesion.fk_experimento = dbo.Experimento.idExperimento INNER JOIN
						 dbo.SesionxUsuario on dbo.SesionxUsuario.fk_sesion = dbo.Sesion.idSesion INNER JOIN 
						 dbo.Usuario on dbo.SesionxUsuario.fk_usuario = dbo.Usuario.idUsuario; 
GO


