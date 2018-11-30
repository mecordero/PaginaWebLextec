USE [SR1.0]
GO

/****** Object:  View [dbo].[ViewExperimentos]    Script Date: 10/4/2018 11:03:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ViewExperimentos]
AS
SELECT        dbo.Tipo.nombre AS Tipo, dbo.Clase.nombre AS Clase, dbo.Experimento.idExperimento AS [ID Experimento], dbo.Experimento.nombre AS Experimento, dbo.Experimento.nombrePublico AS [Nombre Publico], 
                         dbo.Experimento.nota, dbo.Experimento.descripcion, dbo.Experimento.lugar, dbo.Experimento.completado, dbo.Experimento.abierto, dbo.Experimento.fechaRegistro AS [Fecha Registro], 
                         dbo.Experimento.fechaFinal AS [Fecha Final], dbo.Experimento.fechaInicio AS [Fecha Inicio], dbo.Tipo.idTipo
FROM            dbo.Clase INNER JOIN
                         dbo.Experimento ON dbo.Clase.idClase = dbo.Experimento.fk_clase INNER JOIN
                         dbo.Tipo ON dbo.Experimento.fk_tipo = dbo.Tipo.idTipo
GO


