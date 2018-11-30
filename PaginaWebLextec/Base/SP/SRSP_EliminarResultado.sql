USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_EliminarResultado]    Script Date: 10/4/2018 11:17:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SRSP_EliminarResultado](@idResultado INT)
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteResultado(@idResultado)  = 1)
		BEGIN
			DELETE FROM dbo.Resultado
				WHERE idResultado = @idResultado
			RETURN 1
		END
		ELSE
			RETURN 0
	END TRY
	BEGIN CATCH
		RETURN @@ERROR * -1
	END CATCH
END

GO


