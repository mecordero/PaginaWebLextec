USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_VerNombresExperimentos]    Script Date: 10/4/2018 11:26:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_VerNombresExperimentos]
AS
	SELECT idExperimento, nombre
	FROM Experimento;
GO


