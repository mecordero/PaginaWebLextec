USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_DesmatricularAbierto]    Script Date: 10/4/2018 11:15:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure  [dbo].[SRSP_DesmatricularAbierto](@email varchar(50), @idSesion int)
AS
BEGIN
   DELETE SesionxUsuario FROM  SesionxUsuario su  join Usuario U on U.idUsuario = su.fk_usuario 
   where  su.fk_sesion = @idSesion and U.email = @email;

   update Sesion
   set cupo = cupo + 1
   FROM 
	Sesion s 
   where  s.idSesion = @idSesion;
END

GO


