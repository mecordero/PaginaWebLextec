USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_MatriculaAbierta]    Script Date: 10/4/2018 11:24:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[SRSP_MatriculaAbierta](@EmailUsuario VARCHAR(50), @IdExp INT)
AS
BEGIN
  DECLARE @IdUsuario INT
  SELECT @IdUsuario = U.idUsuario FROM Usuario U where U.email = @EmailUsuario
  BEGIN TRY
    IF (dbo.SRF_ExisteRelacion(@IdUsuario, @IdExp) = 0)			-- Validación de alguna existencia previa de la relacion en la tabla.
    BEGIN
      IF (dbo.SRF_VerificarCupo(@IdExp) = 1 and dbo.SRF_VerificarAbierto(@IdExp) = 1)                -- Valida si aun queda espacio en el experimento.
	  begin
      INSERT INTO dbo.ExperimentoXusuario (fk_usuario, fk_experimento, matriculado)
        VALUES(@IdUsuario, @idExp, 1)
      DECLARE @Cupo INT
	  SELECT @Cupo = E.cupo FROM Experimento E WHEre E.idExperimento = @IdExp
	  SET @Cupo = @Cupo-1
	  UPDATE dbo.Experimento SET 	cupo = @Cupo
		 FROM dbo.Experimento E WHERE E.idExperimento = @IdExp                          -- Reduce un campo en el cupo del experimento
      RETURN 1
	  end
    END
    ELSE
      RETURN 0
  END TRY
  BEGIN CATCH
    RETURN @@ERROR * -1
  END CATCH
END


/*Procedimiento para realizar la matricula Cerrada*/

GO


