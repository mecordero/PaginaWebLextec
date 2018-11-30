USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_VerExperimentoInvitado]    Script Date: 10/4/2018 11:26:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SRSP_VerExperimentoInvitado](@email varchar(50))
AS
/* 
Dado el correo, se busca en SesionxUsuario si sale alguna relacion donde este, y como el experimento el abierto = 0 osea cerrado, entonces es como la prueba de que esta invitado*/
BEGIN
	SELECT E.idExperimento
	FROM Experimento AS E Inner join Sesion AS S on E.idExperimento = S.fk_experimento INNER JOIN SesionxUsuario AS SU ON S.idSesion = SU.fk_sesion INNER JOIN Usuario AS U ON SU.fk_usuario = U.idUsuario 
	WHERE(E.completado = 0) AND(E.fechaFinal >= SYSDATETIME()) AND (U.email = @email) AND (E.abierto = 0)
END

GO


