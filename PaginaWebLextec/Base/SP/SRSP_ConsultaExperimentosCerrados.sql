USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_ConsultaExperimentosCerrados]    Script Date: 10/4/2018 11:15:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SRSP_ConsultaExperimentosCerrados] (@email nchar(50))
as
begin
SELECT E.idExperimento,  E.nombrePublico,T.nombre as 'Tipo', E.descripcion, E.lugar, E.fechaInicio, E.fechaFinal 
		FROM Experimento AS E INNER JOIN Sesion as S on E.idExperimento = S.fk_experimento inner join 
		SesionxUsuario AS SU
		ON S.idSesion = SU.fk_sesion INNER JOIN Usuario AS U ON SU.fk_usuario = U.idUsuario inner join Tipo as T on 
		T.idTipo = E.fk_tipo
		 WHERE (E.completado = 0) AND (E.fechaFinal >= SYSDATETIME()) AND 
		 (U.email = @email) AND (E.abierto = 0) 

end

GO


