USE [SR1.0]
GO

/****** Object:  View [dbo].[ViewUsuarios]    Script Date: 10/4/2018 11:05:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ViewUsuarios]
AS
SELECT        idUsuario AS [Usuario - ID], nombre AS Nombre, apellido1 AS [Primer Apellido], apellido2 AS [Segundo Apellido], numeroCedula AS [Numero de Cedula], email AS Email, especialidad AS Especialidad, 
                         nacionalidad AS Nacionalidad, gradoEstudio AS [Grado Estudio], genero AS Genero, habilitado AS Habilitado, estudiante AS Estudiante, fechaNacimiento AS [Fecha de Nacimiento], telefono AS Telefono, annoIngreso AS [Anno Ingreso Carrera], 
                         fechaRegistro AS [Fecha Registro], fechaDeshabilitado AS [Fecha Desabilitado]
FROM            dbo.Usuario
GO


