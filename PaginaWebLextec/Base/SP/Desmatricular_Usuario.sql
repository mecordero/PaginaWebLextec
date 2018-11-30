USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[Desmatricular_Usuario]    Script Date: 10/4/2018 11:07:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Desmatricular_Usuario](@idSesion int, @email varchar(50))
AS
BEGIN
	BEGIN TRY 
	UPDATE dbo.SesionxUsuario SET matriculado=0, participo=0
	FROM dbo.SesionxUsuario sxu, dbo.Usuario u, dbo.Sesion s
	Where u.email=@email and u.idUsuario=sxu.fk_usuario and s.idSesion=sxu.fk_sesion and s.idSesion=@idSesion
	DECLARE @Cupo INT
	SELECT @Cupo = S.cupo FROM Sesion S WHEre S.idSesion = @idSesion
	SET @Cupo = @Cupo+1
	UPDATE dbo.Sesion SET 	cupo = @Cupo
    FROM dbo.Sesion S WHERE S.idSesion = @idSesion 
	IF(@Cupo!=0)
			BEGIN
			UPDATE dbo.Sesion SET 	lleno = 0
			FROM dbo.Sesion S WHERE S.idSesion = @idSesion and S.cupo>0
			END 
	RETURN 1
	END TRY
	BEGIN CATCH
		RETURN @@ERROR * -1
	END CATCH
END
GO


