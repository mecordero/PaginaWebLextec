exec SRSP_VerUsuariosSinParticipar 19,  "Juan", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, NULL

exec SRSP_FiltrarUsuarios 34,"Juan", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, NULL


select u.idUsuario, s.fk_sesion
from Usuario u, SesionxUsuario s
where u.idUsuario = s.fk_usuario and u.idUsuario = 3494

select s.fk_sesion, s.fk_usuario
from  SesionxUsuario s
where s.fk_sesion = 19


-- Declare a variable to return the results of the function. 
DECLARE @ret bit; 

-- Execute the function while passing a value to the @status parameter
EXEC @ret = dbo.SRF_ExisteSesionxUsuario
    @idSesionxUsuario = 394; 

select @ret
-- 3540  4 
exec SRSP_ActualizarSesionxUsuario 1, 3540, 4, 1

exec SRSP_VerSesionxUsuario 395

DECLARE @ret bit; 
exec @ret = SRSP_InsertarSesionxUsuario 3494, 5, 1
select @ret


DECLARE @ret bit; 
exec @ret = dbo.SRF_ExisteUsuarioID @idUsuario = 3494
select @ret

GO 


exec SRSP_EliminarSesionxUsuario 395

exec SRSP_InsertarSesion 34, '2018-05-01', '09:30:11', '11:30:00', 0
go 

DECLARE @ret bit; 
exec @ret = dbo.SRF_ExisteSesion @idSesion = 25
select @ret
go

DECLARE @ret bit; 
exec @ret = dbo.SRF_ExisteSesion @idSesion = 24
select @ret

exec SRSP_ActualizarSesion 19, 24, '2018-05-03', '10:30:11', '12:30:00', 0
go 

exec SRSP_EliminarSesion 24
go 
