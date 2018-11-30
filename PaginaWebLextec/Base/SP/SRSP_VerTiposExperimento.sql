USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_VerTiposExperimento]    Script Date: 10/4/2018 11:29:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SRSP_VerTiposExperimento]
AS
	SELECT idTipo, nombre
	FROM Tipo;

GO


