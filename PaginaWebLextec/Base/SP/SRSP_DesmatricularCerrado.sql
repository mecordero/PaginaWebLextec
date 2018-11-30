USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_DesmatricularCerrado]    Script Date: 10/4/2018 11:16:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create procedure  [dbo].[SRSP_DesmatricularCerrado](@email varchar(50), @idSesion int)
AS
BEGIN
   update SesionxUsuario
   set matriculado = 0
   FROM 
   SesionxUsuario su, Usuario U
   where su.fk_sesion = @idSesion and U.email = @email and U.idUsuario = su.fk_usuario;

   update Sesion
   set cupo = cupo + 1
   FROM  Sesion S
   where   S.idSesion = @idSesion;
END

GO


