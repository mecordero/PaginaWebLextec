USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_ActualizarResultado]    Script Date: 10/4/2018 11:13:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_ActualizarResultado](@idResultado int, @idSesion int, @nombre Varchar(50), @tipo varchar(50), @tamano bigint, @archivo varbinary(MAX))
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteResultado(@idResultado)  = 1)
		BEGIN
			UPDATE dbo.Resultado SET   fk_sesion = @idSesion,
										nombre = @nombre, 
										tipo = @tipo, 
										tamano = @tamano,
										archivo = @archivo
					FROM dbo.Resultado R WHERE R.idResultado = @idResultado
		END
		ELSE
			RETURN 0
	END TRY
	BEGIN CATCH
		RETURN @@ERROR * -1
	END CATCH
END
GO


