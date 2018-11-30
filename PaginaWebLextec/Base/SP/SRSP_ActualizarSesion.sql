USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_ActualizarSesion]    Script Date: 10/4/2018 11:13:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SRSP_ActualizarSesion](@idSesion int, @fecha DATE, @horaInicio TIME, @horaFinal TIME, @lleno bit, @cupo int)
AS
BEGIN
	BEGIN TRY
			IF exists (SELECT 1 FROM dbo.Sesion S
				WHERE S.idSesion = @idSesion)
			BEGIN
				UPDATE dbo.Sesion   SET fecha = IsNull(@Fecha, fecha),
									horaInicio = ISNULL(@horaInicio, horaInicio), 
									horaFinal = ISNULL(@horaFinal, horaFinal), 
									lleno = ISNULL(@lleno, lleno), 
									cupo = ISNULL(@cupo, cupo)
					FROM dbo.Sesion S WHERE S.idSesion = @idSesion
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


