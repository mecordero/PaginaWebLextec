USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[Matricular_Usuario]    Script Date: 10/4/2018 11:10:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Matricular_Usuario](@idSesion int, @email varchar(50))
AS
BEGIN
	Declare @idExperimento int; 
	Declare @counts int; 
	select @idExperimento = e.idExperimento
	from Experimento e, Sesion s 
	where s.idSesion=@idSesion and e.idExperimento=s.fk_experimento


	select @counts = ISNULL(COUNT(s.idSesion), 0) 
	from Sesion s, SesionxUsuario sxu,  Usuario u
	where u.email=@email and s.idSesion= sxu.fk_sesion and s.fk_experimento=@idExperimento and u.idUsuario= sxu.fk_usuario and sxu.matriculado=1
	group by s.fk_experimento
	
	BEGIN TRY 
	 IF (@counts<>0)
		RETURN 0

	ELSE
			BEGIN
			UPDATE dbo.SesionxUsuario SET matriculado=1, participo=1
			FROM dbo.SesionxUsuario sxu, dbo.Usuario u, dbo.Sesion s
			Where u.email=@email and u.idUsuario=sxu.fk_usuario and s.idSesion=sxu.fk_sesion and s.idSesion=@idSesion
			
			DECLARE @Cupo INT
			SELECT @Cupo = S.cupo FROM Sesion S WHEre S.idSesion = @idSesion
			SET @Cupo = @Cupo-1
			
			UPDATE dbo.Sesion SET 	cupo = @Cupo
			FROM dbo.Sesion S WHERE S.idSesion = @idSesion and S.cupo>0
			
			IF(@Cupo=0)
			BEGIN
			UPDATE dbo.Sesion SET 	lleno = 1
			FROM dbo.Sesion S WHERE S.idSesion = @idSesion and S.cupo=0
			END 

			RETURN 1
		END
      
	
	END TRY
	BEGIN CATCH
		RETURN @@ERROR * -1
	END CATCH
END
GO


