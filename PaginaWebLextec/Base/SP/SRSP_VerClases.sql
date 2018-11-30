USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_VerClases]    Script Date: 10/4/2018 11:25:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_VerClases]
AS
	SELECT idClase, nombre
	FROM Clase;

GO


