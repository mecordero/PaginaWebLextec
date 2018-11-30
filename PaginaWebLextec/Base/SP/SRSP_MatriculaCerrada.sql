USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_MatriculaCerrada]    Script Date: 10/4/2018 11:24:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_MatriculaCerrada](@EmailUsuario VARCHAR(50), @IdExp INT, @Codigo INT)
AS
BEGIN
  DECLARE @IdUsuario INT
  SELECT @IdUsuario = U.idUsuario FROM Usuario U WHEre U.email = @EmailUsuario
  BEGIN TRY
    IF (dbo.SRF_ExisteRelacion(@IdUsuario, @IdExp) = 1 and dbo.SRF_VerificarNoMatriculado(@IdUsuario, @IdExp) = 1)			-- Validación de alguna existencia previa de la relacion en la tabla.
    BEGIN
      IF (dbo.SRF_VerificarCodigo(@IdExp, @Codigo) = 1)     -- Valida que el codigo ingresado por el usuario sea igual al codigo del Experimento.
      BEGIN
        IF (dbo.SRF_VerificarCupo(@IdExp) = 1and dbo.SRF_VerificarCerrado(@IdExp) = 1 )              -- Valida si aun queda espacio en el experimento.
		begin
        UPDATE dbo.ExperimentoXusuario SET 	matriculado = 1
					FROM dbo.ExperimentoXusuario ExU WHERE ExU.fk_usuario = @IdUsuario AND ExU.fk_experimento = @IdExp
        DECLARE @Cupo INT
	  SELECT @Cupo = E.cupo FROM Experimento E WHEre E.idExperimento = @IdExp
	  SET @Cupo = @Cupo-1
	  UPDATE dbo.Experimento SET 	cupo = @Cupo
		 FROM dbo.Experimento E WHERE E.idExperimento = @IdExp                          -- Reduce un campo en el cupo del experimento
      RETURN 1                       -- Reduce un campo en el cupo del experimento
       end
      END
    END
    ELSE
      RETURN 0
  END TRY
  BEGIN CATCH
    RETURN @@ERROR * -1
  END CATCH
END
GO


