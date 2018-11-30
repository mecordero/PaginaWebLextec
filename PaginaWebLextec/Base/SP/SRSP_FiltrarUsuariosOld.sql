USE [SR1.0]
GO

/****** Object:  StoredProcedure [dbo].[SRSP_FiltrarUsuariosOld]    Script Date: 10/4/2018 11:20:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SRSP_FiltrarUsuariosOld](@Sexo CHAR(1), @Grado Varchar(50), @Especialidad Varchar(50),@Nacionalidad Varchar(50))
AS
BEGIN

  BEGIN TRY
			SELECT * FROM Usuario
			WHERE (Usuario.genero=@Sexo or @Sexo ='N')and( Usuario.gradoEstudio=@Grado or @Grado='N') AND (Usuario.especialidad=@Especialidad or @Especialidad ='N') AND(Usuario.nacionalidad=@Nacionalidad or @Nacionalidad ='N') 
			RETURN 1                      

  END TRY
  BEGIN CATCH
    RETURN @@ERROR * -1
  END CATCH
END
GO


