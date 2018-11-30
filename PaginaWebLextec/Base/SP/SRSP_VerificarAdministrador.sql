USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_VerificarAdministrador]    Script Date: 10/4/2018 11:26:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_VerificarAdministrador]
AS
BEGIN
	
	 Select A.email from dbo.Administrador A
				where  A.masterAdm='True'
	
END
GO


