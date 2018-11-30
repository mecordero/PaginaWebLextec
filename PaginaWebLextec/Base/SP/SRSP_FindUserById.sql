USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_FindUserById]    Script Date: 10/4/2018 11:21:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_FindUserById]
	@userId int
AS
	SELECT U.email
	FROM dbo.Usuario U
	WHERE U.idUsuario = @userId;
RETURN 0
GO


