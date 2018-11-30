USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_VisualizarExperimento]    Script Date: 10/4/2018 11:29:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_VisualizarExperimento](@fechaInicio varchar(30), @FechaFinal varchar(30))
AS
BEGIN
	BEGIN TRY		
	       IF @fechaInicio = 'N' or @FechaFinal ='N'
		      Begin
			  if @fechaInicio = 'N' and @FechaFinal ='N'
				begin
		   		select E.idExperimento, E.nombre, E.nombrePublico,E.nota,E.descripcion,E.lugar,E.completado,E.abierto,E.fechaRegistro,E.fechaInicio,E.fechaFinal,T.nombre AS'tipo',C.nombre AS 'clase' from Experimento E join Tipo T ON T.idTipo = E.fk_tipo JOIN Clase C ON C.idClase= E.fk_clase
				end
			  else
				begin
				if @fechaInicio = 'N' and @FechaFinal !='N'
					begin
						set @FechaFinal =  (SELECT CONVERT( datetime, @FechaFinal, 120))
							 select E.idExperimento, E.nombre, E.nombrePublico,E.nota,E.descripcion,E.lugar,E.completado,E.abierto,E.fechaRegistro,E.fechaInicio,E.fechaFinal,T.nombre AS'tipo',C.nombre AS 'clase' from Experimento E join Tipo T ON T.idTipo = E.fk_tipo JOIN Clase C ON C.idClase= E.fk_clase
							 where (E.fechaFinal <= @FechaFinal)
					end
				else
					begin
							set @fechaInicio = (SELECT CONVERT(datetime,@fechaInicio, 120))
							select E.idExperimento, E.nombre, E.nombrePublico,E.nota,E.descripcion,E.lugar,E.completado,E.abierto,E.fechaRegistro,E.fechaInicio,E.fechaFinal,T.nombre AS'tipo',C.nombre AS 'clase' from Experimento E join Tipo T ON T.idTipo = E.fk_tipo JOIN Clase C ON C.idClase= E.fk_clase
							where  (E.fechaInicio >= @fechaInicio)
					end
				end
			  end
		   else
		   begin
		   set @fechaInicio = (SELECT CONVERT(datetime,@fechaInicio, 120))
		   set @FechaFinal =  (SELECT CONVERT( datetime, @FechaFinal, 120))
		   select E.idExperimento, E.nombre, E.nombrePublico,E.nota,E.descripcion,E.lugar,E.completado,E.abierto,E.fechaRegistro,E.fechaInicio,E.fechaFinal,T.nombre AS'tipo',C.nombre AS 'clase' from Experimento E join Tipo T ON T.idTipo = E.fk_tipo JOIN Clase C ON C.idClase= E.fk_clase
		   where  (E.fechaInicio >= @fechaInicio)and(E.fechaFinal <= @FechaFinal)

		   end 
	END TRY
	BEGIN CATCH
		RETURN @@ERROR * -1
	END CATCH			 
END
GO


