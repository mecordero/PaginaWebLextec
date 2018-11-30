USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_EliminarUsuario]    Script Date: 10/4/2018 11:19:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SRSP_EliminarUsuario](@Cedula VARCHAR(50))
AS
BEGIN
	BEGIN TRY
		IF (dbo.SRF_ExisteUsuario(@Cedula)  = 1)			-- Validación de alguna existencia previa del usuario (FN).
		BEGIN
			DELETE FROM dbo.Usuario
				WHERE numeroCedula = @Cedula
			return 1
		END
		ELSE
			return 0 
	END TRY
	BEGIN CATCH
		return @@error * -1 
	END CATCH
END
GO


