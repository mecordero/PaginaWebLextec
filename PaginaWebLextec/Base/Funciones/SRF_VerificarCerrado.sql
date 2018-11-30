USE [SR1.0]
GO

/****** Object:  UserDefinedFunction [dbo].[SRF_VerificarCerrado]    Script Date: 10/17/2018 8:45:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[SRF_VerificarCerrado](@IdExp int)
RETURNS BIT
AS
BEGIN
	DECLARE @Resultado BIT
	SET @Resultado = 0
	DECLARE @exist INT
	SELECT @exist = count(*) FROM Experimento E , Sesion S Where E.idExperimento = @IdExp AND E.abierto = 'False' AND S.fk_experimento = E.idExperimento AND S.cupo > 0; 
	IF @exist > 0
		BEGIN
		SET @Resultado = 1
		END
	RETURN @Resultado
END
GO


