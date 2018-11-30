USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_VerResultado]    Script Date: 10/4/2018 11:26:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SRSP_VerResultado](@idResultado INT)
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteResultado(@idResultado)  = 1)
		BEGIN
			SELECT  idResultado as [ID Resultado],  fk_sesion as [ID Sesion], nombre as Nombre, tipo as Tipo, tamano as Tamaño, archivo as [Archivo en Bin]
			FROM dbo.Resultado
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


