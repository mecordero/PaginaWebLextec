/*
DECLARE
   @date_start DATETIME = '1900-01-01 00:00:00' ;

EXEC dbo.SRSP_InsertarSesion @date_start, '11:20:00', '12:30:00', 0 
GO 

EXEC dbo.SRSP_EliminarSesion 1 
GO 

EXEC dbo.SRSP_VerSesion 1
GO 

*/


/*------------------------------------------------------------------------*/
DECLARE
   @date_start DATETIME = '1900-01-01 00:00:00' ;

EXEC dbo.SRSP_InsertarSesion @date_start, '11:20:00', '12:30:00', 0 
GO 
