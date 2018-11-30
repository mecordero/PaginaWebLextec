USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_InsertarAdministrador]    Script Date: 10/4/2018 11:21:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_InsertarAdministrador](@Nombre VARCHAR(50), @Apellido1 VARCHAR(50), @Apellido2 VARCHAR(50), @Genero VARCHAR(50), @Email VARCHAR(50), @Contrasenna VARCHAR(50),@Admin Bit,@AdminReal VARCHAR(50))
AS
BEGIN
	BEGIN TRY
	IF exists( Select 1 from dbo.Administrador A
				where @AdminReal=a.email and A.masterAdm='True')
		begin
		IF (dbo.SRF_ExisteAdministrador(@Email) = 0)			-- Validación de alguna existencia previa del Departamento (FN).
		BEGIN
			INSERT INTO dbo.Administrador(nombre, apellido1, apellido2, genero, email, contrasenna,masterAdm)
				VALUES(@Nombre, @Apellido1, @Apellido2, @Genero, @Email, @Contrasenna,@Admin)
			RETURN 1
		END
		ELSE
			RETURN 0
	end
	ELSE
			RETURN 0
	END TRY
	BEGIN CATCH
		RETURN @@ERROR * -1
	END CATCH
END

GO


