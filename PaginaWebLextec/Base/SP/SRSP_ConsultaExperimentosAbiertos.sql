USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_ConsultaExperimentosAbiertos]    Script Date: 10/4/2018 11:14:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SRSP_ConsultaExperimentosAbiertos]
as
begin

	   select DISTINCT E.idExperimento, E.nombrePublico,T.nombre as 'tipo', E.descripcion,E.lugar,E.fechaInicio,E.fechaFinal  
				from Experimento E,Tipo T
		Where E.completado = 0 and E.fechaFinal >= (SYSDATETIME())
			   and E.abierto = 1 and T.idTipo = E.fk_tipo

end
GO


