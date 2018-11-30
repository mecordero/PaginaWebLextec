USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_VerSesionInvitado]    Script Date: 10/4/2018 11:28:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SRSP_VerSesionInvitado](@email varchar(50), @idExp int)
AS
/* 
Dado el correo y el experimento, que probablemente lo seleccionó el usuario, dice a cual sesion está invitado
*/
BEGIN
	SELECT S.idSesion
	FROM Experimento AS E Inner join Sesion AS S on E.idExperimento = S.fk_experimento INNER JOIN SesionxUsuario AS SU ON S.idSesion = SU.fk_sesion INNER JOIN Usuario AS U ON SU.fk_usuario = U.idUsuario 
	WHERE (E.idExperimento = @idExp) AND (E.completado = 0) AND(E.fechaFinal >= SYSDATETIME()) AND (U.email = @email) AND (E.abierto = 0)
END
GO


