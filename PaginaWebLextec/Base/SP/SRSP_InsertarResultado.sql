USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_InsertarResultado]    Script Date: 10/4/2018 11:22:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_InsertarResultado](@idSesion int, @nombre Varchar(50), @tipo varchar(50), @tamano bigint, @archivo varbinary(MAX))
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteSesion(@idSesion)  = 1)
		BEGIN
			INSERT INTO dbo.Resultado(fk_sesion, nombre, tipo, tamano, archivo)
			VALUES(@idSesion, @nombre, @tipo, @tamano, @archivo)
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


