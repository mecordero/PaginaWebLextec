USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_FiltrarUsuariosHabilitados]    Script Date: 10/4/2018 11:20:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_FiltrarUsuariosHabilitados](@Sexo CHAR(1), @Grado Varchar(50), @Especialidad Varchar(50),@Nacionalidad Varchar(50),@Tipo Varchar(50))
AS
BEGIN

  BEGIN TRY
			
			SELECT Usuario.nombre, Usuario.apellido1, Usuario.apellido2,Usuario.numeroCedula,Usuario.email,Usuario.especialidad,Usuario.nacionalidad,Usuario.gradoEstudio,Usuario.genero,Usuario.habilitado,Usuario.estudiante,Usuario.fechaNacimiento,Usuario.telefono,Usuario.annoIngreso,Usuario.fechaRegistro,Usuario.fechaDeshabilitado FROM Usuario, Experimento, Sesion, SesionxUsuario
			WHERE (Usuario.genero=@Sexo or @Sexo ='N')and( Usuario.gradoEstudio=@Grado or @Grado='N') AND (Usuario.especialidad=@Especialidad or @Especialidad ='N') AND(Usuario.nacionalidad=@Nacionalidad or @Nacionalidad ='N') AND Usuario.habilitado='True' AND Usuario.email not in (SELECT Usuario.email FROM Usuario join SesionxUsuario on fk_usuario=Usuario.idUsuario join Sesion on idSesion=SesionxUsuario.fk_sesion join Experimento on Sesion.fk_experimento = Experimento.idExperimento join Tipo on Experimento.fk_tipo = Tipo.idTipo
			WHERE (Usuario.genero=@Sexo or @Sexo ='N')and( Usuario.gradoEstudio=@Grado or @Grado='N') AND (Usuario.especialidad=@Especialidad or @Especialidad ='N') AND(Usuario.nacionalidad=@Nacionalidad or @Nacionalidad ='N') AND Usuario.habilitado='True' and Tipo.nombre=@Tipo and SesionxUsuario.matriculado='True')
			GROUP BY  Usuario.nombre, Usuario.apellido1, Usuario.apellido2,Usuario.numeroCedula,Usuario.email,Usuario.especialidad,Usuario.nacionalidad,Usuario.gradoEstudio,Usuario.genero,Usuario.habilitado,Usuario.estudiante,Usuario.fechaNacimiento,Usuario.telefono,Usuario.annoIngreso,Usuario.fechaRegistro,Usuario.fechaDeshabilitado;
  END TRY
  BEGIN CATCH
    RETURN @@ERROR * -1
  END CATCH
END
GO


