USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_VerUsuario]    Script Date: 10/4/2018 11:29:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_VerUsuario](@email varchar(50))
AS
BEGIN
	
		BEGIN
			SELECT u.*
			FROM dbo.Usuario u 
			WHERE u.email = @email
				RETURN 1
		END	
END
GO


