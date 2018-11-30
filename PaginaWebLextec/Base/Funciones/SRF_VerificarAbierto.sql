USE [SR1.0]
GO

/****** Object:  UserDefinedFunction [dbo].[SRF_VerificarAbierto]    Script Date: 10/17/2018 8:45:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[SRF_VerificarAbierto](@idExp int)
RETURNS BIT
AS
BEGIN
	DECLARE @Resultado BIT
	SET @Resultado = 0
	DECLARE @exist INT
	SELECT @exist = count(*) FROM Experimento E, Sesion s Where E.abierto = 'True' and s.fk_experimento = E.idExperimento and s.cupo > 0; 
	IF @exist > 0
		BEGIN
		SET @Resultado = 1
		END
	RETURN @Resultado
END

GO


