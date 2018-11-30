USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_EmailUsuarios]    Script Date: 10/4/2018 11:19:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_EmailUsuarios](@Sexo CHAR(1), @Grado Varchar(50), @Especialidad Varchar(50),@Nacionalidad Varchar(50),@idSesion int,@Tipo Varchar(50))
AS
BEGIN

  BEGIN TRY
			
			SELECT Usuario.email, Experimento.mensaje, Experimento.idExperimento,Experimento.nombre FROM Usuario, Experimento, Sesion, SesionxUsuario
			WHERE (Usuario.genero=@Sexo or @Sexo ='N')and( Usuario.gradoEstudio=@Grado or @Grado='N') AND (Usuario.especialidad=@Especialidad or @Especialidad ='N') AND(Usuario.nacionalidad=@Nacionalidad or @Nacionalidad ='N') AND Usuario.habilitado='True' and SesionxUsuario.fk_sesion = @idSesion AND Usuario.email not in (SELECT Usuario.email FROM Usuario join SesionxUsuario on fk_usuario=Usuario.idUsuario join Sesion on idSesion=SesionxUsuario.fk_sesion join Experimento on idExperimento = Sesion.fk_experimento join Tipo on Experimento.fk_tipo = Tipo.idTipo
			WHERE (Usuario.genero=@Sexo or @Sexo ='N')and( Usuario.gradoEstudio=@Grado or @Grado='N') AND (Usuario.especialidad=@Especialidad or @Especialidad ='N') AND(Usuario.nacionalidad=@Nacionalidad or @Nacionalidad ='N') AND Usuario.habilitado='True' and Tipo.nombre=@Tipo and SesionxUsuario.matriculado='True')
  END TRY
  BEGIN CATCH
    RETURN @@ERROR * -1
  END CATCH
END
GO


