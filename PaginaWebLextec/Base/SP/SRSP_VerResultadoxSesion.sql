USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_VerResultadoxSesion]    Script Date: 10/4/2018 11:27:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_VerResultadoxSesion](@idSesion INT)
AS
BEGIN
	BEGIN TRY
		BEGIN
			SELECT  idResultado as [ID Resultado],  fk_sesion as [ID Sesion], nombre as Nombre, tipo as Tipo, tamano as Tamaño, archivo as [Archivo en Bin]
			FROM dbo.Resultado
			WHERE fk_sesion = @idSesion
				RETURN 1
		END
	END TRY
	BEGIN CATCH
		RETURN @@ERROR * -1
	END CATCH
END
GO


