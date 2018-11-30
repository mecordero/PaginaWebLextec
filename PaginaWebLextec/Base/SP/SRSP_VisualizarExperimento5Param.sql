USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_VisualizarExperimento5Param]    Script Date: 10/4/2018 11:30:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_VisualizarExperimento5Param](@idExperimento int, @idTipo int, @idClase int, @fechaInicio varchar(30), @FechaFinal varchar(30))
AS
BEGIN
	BEGIN TRY		
			SELECT E.idExperimento, E.nombre, E.nombrePublico,E.nota,E.descripcion,E.lugar,E.completado,E.abierto,E.fechaRegistro,E.fechaInicio,E.fechaFinal,T.nombre AS'tipo',C.nombre AS 'clase' from Experimento E join Tipo T ON T.idTipo = E.fk_tipo JOIN Clase C ON C.idClase= E.fk_clase
			WHERE (E.idExperimento = ISNULL(@idExperimento, E.idExperimento)) and (E.fk_tipo = ISNULL(@idTipo, E.fk_tipo)) and (E.fk_clase = ISNULL(@idClase, E.fk_clase)) and 
			(DATEDIFF(day, E.fechaInicio, isnull(@fechaInicio, E.fechaInicio)) <= 0) and (DATEDIFF(day, E.fechaFinal, isnull(@fechaInicio, E.fechaFinal)) <= 0) and 
			(DATEDIFF(day, E.fechaInicio, isnull(@FechaFinal, E.fechaInicio)) >= 0) and (DATEDIFF(day, E.fechaFinal, isnull(@FechaFinal, E.fechaFinal)) >= 0)
			RETURN 1; 	
	END TRY
	BEGIN CATCH
		RETURN @@ERROR * -1
	END CATCH			 
END
GO


