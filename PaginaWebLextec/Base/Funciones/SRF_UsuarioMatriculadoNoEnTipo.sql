USE [SR1.0]
GO

/****** Object:  UserDefinedFunction [dbo].[SRF_UsuarioMatriculadoNoEnTipo]    Script Date: 10/17/2018 8:44:47 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Function [dbo].[SRF_UsuarioMatriculadoNoEnTipo](@IDexp int ,@IDusu int)
RETURNS BIT
AS
BEGIN
			declare @tipo varchar(50) ='';
			declare @resultado bit =0;
			SELECT @tipo=Tipo.nombre FROM Experimento join Tipo on Tipo.idTipo = Experimento.fk_tipo where Experimento.idExperimento = @IDexp
			SELECT @resultado=1
			WHERE @tipo not in (SELECT Tipo.nombre FROM Usuario join SesionxUsuario on fk_usuario=Usuario.idUsuario join Sesion on idSesion=SesionxUsuario.fk_sesion
			join Experimento on Sesion.fk_experimento = Experimento.idExperimento join Tipo on Experimento.fk_tipo = Tipo.idTipo
			WHERE SesionxUsuario.matriculado='True' and Usuario.idUsuario=@IDusu)
			return @resultado
END
GO


