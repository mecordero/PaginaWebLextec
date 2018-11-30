USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_UsuarioMatriculadoNoEnTipo]    Script Date: 10/4/2018 11:25:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_UsuarioMatriculadoNoEnTipo](@IDexp int ,@IDusu int)
AS
BEGIN

  BEGIN TRY
			declare @tipo varchar(50) ='';
			SELECT @tipo=Tipo.nombre FROM Experimento join Tipo on Tipo.idTipo = Experimento.fk_tipo where Experimento.idExperimento = @IDexp
			SELECT 1
			WHERE @tipo not in (SELECT Tipo.nombre FROM Usuario join ExperimentoXusuario on fk_usuario=Usuario.idUsuario join Experimento on ExperimentoXusuario.fk_experimento = Experimento.idExperimento join Tipo on Experimento.fk_tipo = Tipo.idTipo
			WHERE ExperimentoXusuario.matriculado='True' and Usuario.idUsuario=@IDusu)
  END TRY
  BEGIN CATCH
    RETURN @@ERROR * -1
  END CATCH
END
GO


