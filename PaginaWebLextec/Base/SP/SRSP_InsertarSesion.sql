USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_InsertarSesion]    Script Date: 10/4/2018 11:22:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_InsertarSesion](@idExperimento int, @Fecha DATETIME, @horaInicio TIME, @horaFinal TIME, @lleno bit, @cupo int)
AS
BEGIN
		INSERT INTO dbo.Sesion(fk_experimento, fecha, horaInicio, horaFinal, lleno, cupo)
			VALUES(@idExperimento, @Fecha, @horaInicio, @horaFinal, @lleno, @cupo)
			RETURN 1
END

GO


