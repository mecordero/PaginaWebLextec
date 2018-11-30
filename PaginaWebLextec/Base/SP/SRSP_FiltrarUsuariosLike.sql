USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_FiltrarUsuariosLike]    Script Date: 10/4/2018 11:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_FiltrarUsuariosLike]

	@Like varchar(400),
	@Especialidad Varchar(50),
	@Nacionalidad Varchar(50),
	@Grado Varchar(50),
	@Sexo CHAR(1),
	@Estudiante bit, 
	@fechaInicio date, 
	@fechaFinal date,
	@cantidadParticipacionInicio int,
	@cantidadParticipacionFin int,
	@idTipoExperimento int,
	@fechaInicioRegistro date, 
	@fechaFinalRegistro date
AS
begin
	SELECT  DISTINCT U.* 
	FROM Usuario U
    WHERE (U.genero=@Sexo or @Sexo ='N')and( U.gradoEstudio=@Grado or @Grado='N') AND (U.especialidad=@Especialidad or @Especialidad ='N') AND(U.nacionalidad=@Nacionalidad or @Nacionalidad ='N') and (U.estudiante = ISNULL(@Estudiante, U.estudiante)) and ((U.nombre LIKE '%'+@Like+'%' ) or (U.apellido1 LIKE '%'+@Like+'%') or (U.apellido2 LIKE '%'+@Like+'%' ) or (U.email LIKE '%'+@Like+'%' ) or (U.numeroCedula LIKE '%'+@Like+'%' ) or (@Like = 'N'))
			and ((U.fechaUltimaParticipacion IS NULL) OR ((DATEDIFF(day, U.fechaUltimaParticipacion, isnull(@fechaInicio, U.fechaUltimaParticipacion)) <= 0) and (DATEDIFF(day, U.fechaUltimaParticipacion, isnull(@fechaFinal, U.fechaUltimaParticipacion)) >= 0))) and 
			((U.fechaRegistro IS NULL) OR ((DATEDIFF(day, U.fechaRegistro, isnull(@fechaInicioRegistro, U.fechaRegistro)) <= 0) and (DATEDIFF(day, U.fechaRegistro, isnull(@fechaFinalRegistro, U.fechaRegistro)) >= 0))) and 
			(U.cantidadParticipacion >= ISNULL(@cantidadParticipacionInicio, cantidadParticipacion) and (U.cantidadParticipacion <= ISNULL(@cantidadParticipacionFin, cantidadParticipacion))) and 
			U.idUsuario not in
				(Select DISTINCT U2.idUsuario
				From Usuario U2, SesionxUsuario, Sesion, Experimento e 
				Where SesionxUsuario.fk_usuario=U2.idUsuario and SesionxUsuario.fk_sesion=Sesion.idSesion and Sesion.fk_experimento=e.idExperimento and e.fk_tipo=@idTipoExperimento)
		RETURN 1 
RETURN 0
end
GO


