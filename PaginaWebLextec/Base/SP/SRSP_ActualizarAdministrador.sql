USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_ActualizarAdministrador]    Script Date: 10/4/2018 11:11:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_ActualizarAdministrador](@Nombre VARCHAR(50), @Apellido1 VARCHAR(50), @Apellido2 VARCHAR(50), @Genero VARCHAR(50), @Email VARCHAR(50), @Admin bit)
AS
BEGIN
	BEGIN TRY
				IF exists (SELECT 1 FROM dbo.Administrador  A 		-- Validación de alguna existencia previa del Administrador.
					WHERE A.email = @Email )
				BEGIN
					UPDATE dbo.Administrador SET  nombre = @Nombre,
													apellido1 = @Apellido1,
													apellido2 = @Apellido2,
													genero = @Genero,
													masterAdm = @Admin
						FROM dbo.Administrador A WHERE	A.email = @Email
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


