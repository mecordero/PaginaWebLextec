USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_SelectInvitados]    Script Date: 10/4/2018 11:24:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_SelectInvitados]
	@idExperimento int
AS
begin
	select distinct u.email
	from dbo.Usuario u
	join dbo.SesionxUsuario su
	on u.idUsuario = su.fk_usuario
	join dbo.Sesion s
	on su.fk_sesion = s.idSesion
	where s.fk_experimento = @idExperimento
			RETURN 1 
RETURN 0
end
GO


