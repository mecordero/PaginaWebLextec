USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_SeleccionarInvitacionesXCorreo]    Script Date: 10/4/2018 11:24:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_SeleccionarInvitacionesXCorreo](@email varchar(50))
AS
BEGIN 
	SELECT e.nombre, s.idSesion ,s.fecha, s.horaInicio, s.horaFinal, s.cupo,sxu.matriculado
	FROM dbo.Usuario u, dbo.Experimento e, dbo.Sesion s, dbo.SesionxUsuario sxu
	WHERE @email=u.email and u.idUsuario=sxu.fk_usuario and sxu.fk_sesion=s.idSesion and s.fk_experimento=e.idExperimento and s.fecha>GETDATE()
END
GO


