USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_EliminarAdministrador]    Script Date: 10/4/2018 11:16:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_EliminarAdministrador](@Email VARCHAR(50))
AS
BEGIN
	BEGIN TRY
			IF (dbo.SRF_ExisteAdministrador(@Email) = 1)			-- Validación de alguna existencia previa del Administrador (FN).
			BEGIN
				DELETE FROM dbo.Administrador
					WHERE email = @Email
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


