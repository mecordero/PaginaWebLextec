-- copiar datos de base vieja a nueva 
--administrador
SET IDENTITY_INSERT [dbo].[Administrador] ON
INSERT INTO [dbo].[Administrador] ([idAdmin], [nombre], [apellido1], [apellido2], [genero], [email], [contrasenna], [masterAdm]) VALUES (1, N'Alexander', N'Castillo', N'Bruno', N'M', N'alexufo27@gmail.com', N'hola123', NULL)
INSERT INTO [dbo].[Administrador] ([idAdmin], [nombre], [apellido1], [apellido2], [genero], [email], [contrasenna], [masterAdm]) VALUES (6, N'Martin', N'Solis', N'Salazar', N'M', N'martin12cr@yahoo.com', N'martin12cr', 1)
INSERT INTO [dbo].[Administrador] ([idAdmin], [nombre], [apellido1], [apellido2], [genero], [email], [contrasenna], [masterAdm]) VALUES (20, N'Ximena', N'Bolanos', N'Fonseca', N'F', N'xbolanosfonseca@gmail.com', N'83711747pAPI', 0)
INSERT INTO [dbo].[Administrador] ([idAdmin], [nombre], [apellido1], [apellido2], [genero], [email], [contrasenna], [masterAdm]) VALUES (21, N'karolina', N'pereira', N'coronel', N'F', N'karopc9644@gmail.com', N'karopc9644', 0)
INSERT INTO [dbo].[Administrador] ([idAdmin], [nombre], [apellido1], [apellido2], [genero], [email], [contrasenna], [masterAdm]) VALUES (22, N'Joselyne', N'Najera', N'Fernandez', N'F', N'jnajera@itcr.ac.cr', N'jnajera', 0)
INSERT INTO [dbo].[Administrador] ([idAdmin], [nombre], [apellido1], [apellido2], [genero], [email], [contrasenna], [masterAdm]) VALUES (23, N'Monica', N'Navarro', N'Calvo', N'F', N'monavarro@itcr.ac.cr', N'monavarro', 0)
SET IDENTITY_INSERT [dbo].[Administrador] OFF

-- tipo 

SET IDENTITY_INSERT [dbo].[Tipo] ON
INSERT INTO [dbo].[Tipo] ([idTipo], [nombre]) VALUES (9, N'random')
INSERT INTO [dbo].[Tipo] ([idTipo], [nombre]) VALUES (10, N'Intelligence Emotional')
INSERT INTO [dbo].[Tipo] ([idTipo], [nombre]) VALUES (11, N'Economía')
INSERT INTO [dbo].[Tipo] ([idTipo], [nombre]) VALUES (12, N'Financias')
INSERT INTO [dbo].[Tipo] ([idTipo], [nombre]) VALUES (13, N'taxes')
INSERT INTO [dbo].[Tipo] ([idTipo], [nombre]) VALUES (14, N'Inversion_agro')
INSERT INTO [dbo].[Tipo] ([idTipo], [nombre]) VALUES (15, N'invmt')
SET IDENTITY_INSERT [dbo].[Tipo] OFF


--clase

SET IDENTITY_INSERT [dbo].[Clase] ON
INSERT INTO [dbo].[Clase] ([idClase], [nombre]) VALUES (11, N'Lab')
INSERT INTO [dbo].[Clase] ([idClase], [nombre]) VALUES (12, N'Internet')
INSERT INTO [dbo].[Clase] ([idClase], [nombre]) VALUES (13, N'Campo')
SET IDENTITY_INSERT [dbo].[Clase] OFF


-- experimentos 

SET IDENTITY_INSERT [dbo].[Experimento] ON
INSERT INTO [dbo].[Experimento] ([idExperimento], [fk_tipo], [fk_clase], [fk_administrador], [nombre], [nombrePublico], [nota], [descripcion], [lugar], [cupo], [completado], [abierto], [fechaRegistro], [fechaInicio], [fechaFinal], [mensaje]) VALUES (19, 13, 11, 0, N'impuestos2017', N'juegot', N'Juego aplicado en setiembre 2017 sobre impuestos', N'El experimento consiste en un juego de toma de decisiones haciendo uso de la computadora en el  Labo', N'TEC CARTAGO', 0, 0, 1, N'2017-09-07', N'2017-09-13 08:00:00', N'2017-09-20 16:00:00', N'Estimado (a) estudiante 

Usted se había inscrito a la base de datos del Laboratorio de Economía E')
INSERT INTO [dbo].[Experimento] ([idExperimento], [fk_tipo], [fk_clase], [fk_administrador], [nombre], [nombrePublico], [nota], [descripcion], [lugar], [cupo], [completado], [abierto], [fechaRegistro], [fechaInicio], [fechaFinal], [mensaje]) 
VALUES (34, 15, 11, 0, N'juegoc', N'juegoc', N'Juego sobre Dota - Café, Octubre 2017', N'Juego de toma de decisiones, utilizando las computadoras del laboratorio', N'TEC Cartago', 0, 0, 1, N'2017-10-23', N'2017-10-26 09:30:00', N'2017-11-02 15:30:00', NULL)

SET IDENTITY_INSERT [dbo].[Experimento] OFF
GO

-- sesion 

CREATE PROCEDURE [dbo].[transformarExp2Sesiones](@idExperimento int, @tmp1 int, @tipo int, @clase int, @admi int, @nombre varchar(50), @nombrePublico varchar(50), @nota varchar(200), @descripcion varchar(200), @lugar varchar(200), @cupo int, @completado int, @abierto int, @fechaRegistro date, @fechaInicio datetime, @fechaFinal datetime, @mensaje varchar(100))
--, @Fecha DATETIME, @horaInicio TIME, @horaFinal TIME, @lleno bit
AS
BEGIN
		INSERT INTO dbo.Sesion(fk_experimento, fecha, horaInicio, horaFinal, lleno)
			VALUES(@idExperimento, @fechaInicio, (select convert(char(8), @fechaInicio, 108) as [hh:mm:ss]), (select convert(char(8), @fechaFinal, 108) as [hh:mm:ss]), 1)
			RETURN 1
END
GO 

exec dbo.transformarExp2Sesiones 19,19, 13, 11, 0, N'impuestos2017.2', N'juegot', N'Juego aplicado en setiembre 2017 sobre impuestos', N'El experimento consiste en un juego de toma de decisiones haciendo uso de la computadora en el  Labo', N'TEC CARTAGO', 0, 0, 1, N'2017-09-07', N'2017-09-13 08:00:00', N'2017-09-13 09:15:00', N'Estimado (a) estudiante 

Usted se había inscrito a la base de datos del Laboratorio de Economía E'
exec dbo.transformarExp2Sesiones 19,20, 13, 11, 0, N'impuestos2017.3', N'juegot', N'Juego aplicado en setiembre 2017 sobre impuestos', N'El experimento consiste en un juego de toma de decisiones haciendo uso de la computadora en el  Labo', N'TEC CARTAGO', 0, 0, 1, N'2017-09-07', N'2017-09-13 13:30:00', N'2017-09-13 14:45:00', N'Estimado (a) estudiante 

Usted se había inscrito a la base de datos del Laboratorio de Economía E'
exec dbo.transformarExp2Sesiones 19,22, 13, 11, 0, N'impuestos2017.4', N'juegot', N'Juego aplicado en setiembre 2017 sobre impuestos', N'El experimento consiste en un juego de toma de decisiones haciendo uso de la computadora en el  Labo', N'TEC CARTAGO', 0, 0, 1, N'2017-09-07', N'2017-09-13 16:00:00', N'2017-09-13 17:15:00', NULL
exec dbo.transformarExp2Sesiones 19,23, 13, 11, 0, N'impuestos2017.1', N'juegot', N'Juego aplicado en setiembre 2017 sobre impuestos', N'El experimento consiste en un juego de toma de decisiones haciendo uso de la computadora en el  Labo', N'TEC CARTAGO', 0, 0, 1, N'2017-09-07', N'2017-09-12 15:00:00', N'2017-09-12 16:15:00', N'Estimado (a) estudiante 

Usted se había inscrito a la base de datos del Laboratorio de Economía E'
exec dbo.transformarExp2Sesiones 19,27, 13, 11, 0, N'impuestos2017.5', N'juegot', N'Juego aplicado en setiembre 2017 sobre impuestos', N'juego de toma de decisiones haciendo uso de la computadora ', N'TEC CARTAGO', 0, 0, 1, N'2017-09-12', N'2017-09-14 15:00:00', N'2017-09-14 16:00:00', NULL
exec dbo.transformarExp2Sesiones 19,28, 13, 11, 0, N'impuestos2017.6', N'juegot', N'Juego aplicado en setiembre 2017 sobre impuestos', N'juego de toma de decisiones haciendo uso de la computadora ', N'TEC CARTAGO', 0, 0, 1, N'2017-09-12', N'2017-09-19 09:30:00', N'2017-09-19 10:30:00', NULL
exec dbo.transformarExp2Sesiones 19,29, 13, 11, 0, N'impuestos2017.7', N'juegot', N'Juego aplicado en setiembre 2017 sobre impuestos', N'juego de toma de decisiones haciendo uso de la computadora ', N'TEC CARTAGO', 0, 0, 1, N'2017-09-12', N'2017-09-19 15:00:00', N'2017-09-19 16:00:00', NULL
exec dbo.transformarExp2Sesiones 19,30, 13, 11, 0, N'impuestos2017.8', N'juegot', N'Juego aplicado en setiembre 2017 sobre impuestos', N'juego de toma de decisiones haciendo uso de la computadora ', N'TEC CARTAGO', 0, 0, 1, N'2017-09-12', N'2017-09-20 08:00:00', N'2017-09-20 09:00:00', NULL
exec dbo.transformarExp2Sesiones 19,31, 13, 11, 0, N'impuestos2017.9', N'juegot', N'Juego aplicado en setiembre 2017 sobre impuestos', N'juego de toma de decisiones haciendo uso de la computadora ', N'TEC CARTAGO', 0, 0, 1, N'2017-09-12', N'2017-09-20 13:30:00', N'2017-09-20 14:30:00', NULL
exec dbo.transformarExp2Sesiones 19,32, 13, 11, 0, N'impuestos2017.10', N'juegot', N'Juego aplicado en setiembre 2017 sobre impuestos', N'juego de toma de decisiones haciendo uso de la computadora ', N'TEC CARTAGO', 0, 0, 1, N'2017-09-12', N'2017-09-20 16:00:00', N'2017-09-20 17:00:00', NULL

exec transformarExp2Sesiones 34 , 34, 15, 11, 0, N'juegoc', N'juegoc', N'Juego sobre Dota - Café, Octubre 2017', N'Juego de toma de decisiones, utilizando las computadoras del laboratorio', N'TEC Cartago', 0, 0, 1, N'2017-10-23', N'2017-10-26 09:30:00', N'2017-10-26 10:30:00', NULL
exec transformarExp2Sesiones 34 , 35, 15, 11, 0, N'juegoc.2', N'juegoc', N'Juego sobre Dota - Café, Octubre 2017 - Sesión 2', N'Juego de toma de decisiones, utilizando las computadoras del laboratorio', N'TEC Cartago', 0, 0, 1, N'2017-10-26', N'2017-10-31 09:30:00', N'2017-10-31 10:30:00', NULL
exec transformarExp2Sesiones 34 , 36, 15, 11, 0, N'juegoc.3', N'juegoc', N'Juego sobre Dota - Café, Octubre 2017 - Sesión 3', N'Juego de toma de decisiones, utilizando las computadoras del laboratorio', N'TEC Cartago', 0, 0, 1, N'2017-10-26', N'2017-10-31 13:30:00', N'2017-10-31 14:30:00', NULL
exec transformarExp2Sesiones 34 , 37, 15, 11, 0, N'juegoc.4', N'juegoc', N'Juego sobre Dota - Café, Octubre 2017 - Sesión 4', N'Juego de toma de decisiones, utilizando las computadoras del laboratorio', N'TEC Cartago', 0, 0, 1, N'2017-10-26', N'2017-10-31 15:30:00', N'2017-10-31 16:30:00', NULL
exec transformarExp2Sesiones 34 , 38, 15, 11, 0, N'juegoc.5', N'juegoc', N'Juego sobre Dota - Café, Octubre 2017 - Sesión 5', N'Juego de toma de decisiones, utilizando las computadoras del laboratorio', N'TEC Cartago', 0, 0, 1, N'2017-10-26', N'2017-11-02 09:30:00', N'2017-11-02 10:30:00', NULL
exec transformarExp2Sesiones 34 , 39, 15, 11, 0, N'juegoc.6', N'juegoc', N'Juego sobre Dota - Café, Octubre 2017 - Sesión 6', N'Juego de toma de decisiones, utilizando las computadoras del laboratorio', N'TEC Cartago', 0, 0, 1, N'2017-10-26', N'2017-11-02 13:30:00', N'2017-11-02 14:30:00', NULL
exec transformarExp2Sesiones 34 , 40, 15, 11, 0, N'juegoc.7', N'juegoc', N'Juego sobre Dota - Café, Octubre 2017 - Sesión 7', N'Juego de toma de decisiones, utilizando las computadoras del laboratorio', N'TEC Cartago', 0, 0, 1, N'2017-10-26', N'2017-11-02 15:30:00', N'2017-11-02 16:30:00', NULL
go 


-- USUARIOS
CREATE PROCEDURE [dbo].[SRSP_transInsertarUsuarioxNuevo](@idUser int, @Nombre VARCHAR(200), @Apellido1 VARCHAR(200), @Apellido2 VARCHAR(200),
@Cedula VARCHAR(200), @Email VARCHAR(200), @Especialidad VARCHAR(200), @Nacionalidad VARCHAR(200), @GradoEstudio VARCHAR(200),
@Genero VARCHAR(200), @Habilitado BIT, @Estudiante BIT, @Edad INT, @Telefono INT, @AnnoCarrera INT, @FechaRegistro DATE, @FechaDeshabilitado DATE)
AS
BEGIN

			INSERT INTO dbo.Usuario(idUsuario, nombre, apellido1, apellido2, numeroCedula, email, especialidad,
				nacionalidad, gradoEstudio, genero, habilitado, estudiante, fechaNacimiento, telefono, annoIngreso,
			fechaRegistro, fechaDeshabilitado)
				VALUES(@idUser, @Nombre, @Apellido1, @Apellido2, @Cedula, @Email, @Especialidad, @Nacionalidad, @GradoEstudio,
					@Genero, @Habilitado, @Estudiante, (SELECT CAST(CAST((select DATEPART(yy, @FechaRegistro) - @Edad as anno) AS varchar) + '-01-01' AS DATETIME) AS FECHA), @Telefono, (select DATEPART(yy, @FechaRegistro) - @AnnoCarrera as annoIngreso), @FechaRegistro, @FechaDeshabilitado)
			RETURN 1

END
go 
-- Procedimiento para eliminar un Usuario con paremetros la Cedula.

SET IDENTITY_INSERT [dbo].[Usuario] ON
EXEC SRSP_transInsertarUsuarioxNuevo  23, N'Maria', N'Rojas', N'Brenes', N'304520514', N'mariarobre1991@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 26, 87355489, 4, N'2017-05-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  24, N'Daniela', N'Cervantes', N'Chaves', N'116910571', N'danielacervantes1932@hotmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 19, 88647601, 3, N'2017-05-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  25, N'Franklin', N'Ledezma', N'Bustos', N'114640801', N'fledezma17@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 26, 87364522, 2, N'2017-05-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  26, N'Oscar', N'Martinez', N'Arias', N'504050532', N'omartinez-95@hotmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 21, 89102791, 3, N'2017-05-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  27, N'Carlos', N'Alpizar', N'Marin', N'305040879', N'carlosalp97@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 19, 85333529, 3, N'2017-05-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  28, N'Alvaro', N'Solís', N'Alvarado', N'116920119', N'a.solis3377@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 19, 85509740, 2, N'2017-05-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  29, N'Eyner', N'Palacios', N'Juarez', N'155823106636', N'elpj08@gmail.com', N'Ciencias Economicas', N'Otro Latinoamericano', N'Bachillerato', N'M', 1, 1, 23, 86797755, 2, N'2017-05-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  30, N'Yerelin', N'Umana', N'Aguilar', N'702440997', N'yerelin.umaaaguilar@gmail.com', N'Ciencias Sociale', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 20, 84528739, 4, N'2017-05-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  31, N'Keylor', N'Mendez', N'Jimenez', N'305110545', N'kmendez2498@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 19, 85632062, 2, N'2017-05-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  32, N'Karol', N'Sandovl', N'Hidalgo', N'304960924', N'karolsh12@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 21, 87522879, 3, N'2017-05-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  33, N'Fabian', N'Moya', N'Fonseca', N'304960687', N'famoyafonsek@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 87822498, 2, N'2017-05-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  34, N'Diego', N'Muñoz', N'Campos', N'116780404', N'diego1997mc@gmail.com', N'Otra', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 87928668, 3, N'2017-05-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  35, N'Esteban', N'Retana', N'Solano', N'116610927', N'esteban@retanacr.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 86723003, 3, N'2017-05-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  36, N'Natalia', N'Navarro', N'Cerdas', N'305110741', N'natynavcer@hotmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 19, 87144921, 2, N'2017-05-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  37, N'KevinGerardo', N'Arguedas', N'Guevara', N'207710273', N'kevingerardoag0410@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 19, 61741802, 3, N'2017-05-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  38, N'Luis Fernando', N'Quesada', N'Arias', N'116610455', N'luisfernandoqa12@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 83863280, 3, N'2017-05-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  40, N'Lisandro', N'Brenes', N'Calderon', N'305150010', N'lisandrobrenes99@gmail.com', N'Otra', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 18, 85802824, 2, N'2017-05-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  41, N'Miriam', N'Otarola', N'Dittel', N'304990567', N'miriamotarola04@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 20, 86100082, 3, N'2017-05-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  42, N'Katherine', N'Nuñez', N'Soto', N'702510135', N'katy.ns97@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 20, 84610649, 3, N'2017-05-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  43, N'Hazel', N'Calderon', N'Ramirez', N'305010381', N'hazeel2011@hotmail.com', N'Ciencias Sociale', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 20, 86453992, 2, N'2017-05-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  44, N'Joselyn', N'Valverde', N'Cornejo', N'116730798', N'josvalcor18@hotmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 20, 60013867, 2, N'2017-05-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  45, N'Diego', N'Castro', N'Barahona', N'116630592', N'dics_96@hotmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 89370329, 2, N'2017-05-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  46, N'Melanny', N'Tencio', N'Pereira', N'305080371', N'melanny2997@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 19, 89823097, 3, N'2017-05-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  57, N'María', N'Abarca', N'Cisneros', N'60954958', N'mariabarca21@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 60954958, NULL, N'2016-05-10 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  58, N'Eddy', N'Abarca', N'Flores', N'87624031', N'eddyabarcaf@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87624031, NULL, N'2017-03-15 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  59, N'Marísol', N'Abarca', N'Fuentes', N'85527177', N'mari95af@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 85527177, NULL, N'2016-05-10 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  61, N'Denice', N'Agüero', N'Barrientos', N'86421025', N'niciaguero@hotmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 86421025, NULL, N'2017-03-16 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  62, N'Keren', N'Agüero', N'León', N'87818939', N'kheren07@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 87818939, NULL, N'2016-10-06 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  63, N'Luis', N'Aguilar', NULL, N'89352903', N'luiscosconta@gmail.com', N'Computación', NULL, NULL, N'M', 1, 1, NULL, 89352903, NULL, N'2016-10-06 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  64, N'Irene', N'Aguilar', N'López', N'89203474', N'ireal0796@gmail.com', N'Administración de Tecnología de Información', NULL, NULL, N'F', 1, 1, NULL, 89203474, NULL, N'2016-10-06 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  65, N'Suseth', N'Aguilar', N'Suazo', N'84357613', N'asuseth@gmail.com', N'Administra de Empresas', NULL, NULL, N'F', 1, 1, NULL, 84357613, NULL, N'2016-10-05 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  66, N'Nathalie', N'Alcázar', N'Coles', N'60852930', N'nath.612@gmail.com', N'Administrsción de Empresas', NULL, NULL, N'F', 1, 1, NULL, 60852930, NULL, N'2016-10-05 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  67, N'Alexandra', N'Obando', N'Garita', N'84076862', N'alee.obando@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 84076862, NULL, N'2016-10-03 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  68, N'Jose', N'Alfaro', N'Jiménez', N'86123622', N'chemaalfaroj@gmail.com', N'Matemática', NULL, NULL, N'M', 1, 1, NULL, 86123622, NULL, N'2016-10-07 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  69, N'Joel', N'Alpizar', NULL, N'89509950', N'13.jjac@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89509950, NULL, N'2016-10-06 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  70, N'Javier', N'Alpizar', N'Ortiz', N'89382912', N'andyalpor@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89382912, NULL, N'2017-03-16 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  71, N'Amanda', N'Alpizar', N'Rodríguez', N'60509646', N'amandaalpizar97@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 60509646, NULL, N'2017-03-18 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  72, N'Kenneth', N'Alvarado', N'Méndez', N'86472905', N'kennethjeanpolalmen96@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 86472905, NULL, N'2016-10-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  73, N'José', N'Angulo', NULL, N'87892462', N'jpablo192@hotmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87892462, NULL, N'2017-03-15 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  74, N'Marco', N'Acuña', N'Zamora', N'87014990', N'manzanocr@yahoo.com.mx', NULL, NULL, NULL, N'M', 1, 1, NULL, 87014990, NULL, N'2016-10-06 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  75, N'Jorge', N'Araya', N'Arguedas', N'86066041', N'jorgearayatec@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 86066041, NULL, N'2016-10-07 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2920, N'Emmanuel', N'Araya', N'Gamboa', N'87273703', N'emmanuelaraya114@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87273703, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2921, N'Iván', N'Araya', N'Quirós', N'83091896', N'iearayaquiros@gmail.com', N'Biotecnología', NULL, NULL, N'M', 1, 1, NULL, 83091896, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2922, N'José Miguel', N'Araya', N'Quirós', N'60620085', N'josemiguel13579@hotmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 60620085, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2923, N'Jeison', N'Araya', N'Salas', N'83175221', N'jeisonaraya20@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 83175221, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2924, N'Stwart', N'Araya', N'Solis', N'87032196', N'st.aas@Hotmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87032196, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2925, N'Antony', N'Arce', N'Cespedes', N'60044840', N'antonycr20@hotmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 60044840, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2926, N'Ana', N'Arce', N'Quesada', N'84109330', N'apaq0797@hotmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 84109330, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2927, N'Nathalie Gábrielle', N'Ardón', N'Arias', N'85598759', N'nathalie.aa15@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 85598759, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2928, N'David', N'Arguedas', N'Carpio', N'87574643', N'davidarguedas96@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 87574643, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2929, N'Brauny', N'Arguedas', N'Marchena', N'89972817', N'braunyam@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89972817, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2930, N'Marci', N'Arias', N'null', N'72054025', N'marcoab88@gmail.com', N'Otro', NULL, NULL, N'M', 1, 1, NULL, 72054025, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2931, N'Yostin', N'Arias', N'null', N'62805656', N'yariec1592@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 62805656, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2932, N'Kevin', N'Arias', N'Chinchilla', N'85174176', N'kevinarias66@gmail.com', N'Computación', NULL, NULL, N'M', 1, 1, NULL, 85174176, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2934, N'Daniela', N'Arias', N'Segura', N'89234426', N'das9694@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 89234426, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2935, N'Jurgen', N'Arley', N'Elizondo', N'84428966', N'jur9526@gmail.com', NULL, NULL, NULL, N'M', 1, 1, NULL, 84428966, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2936, N'Christopher', N'Arredondo', NULL, N'72654781', N'chrisarredondo2010@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 72654781, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2937, N'Orlando', N'Arrieta', N'Castro', N'1', N'arrietaorlando14@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 1, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2938, N'Dimas', N'Arrieta', N'Chaves', N'89475592', N'kche2991@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89475592, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2939, N'Erick', N'Arroyo', N'Jiménez', N'61221845', N'erickyd4@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 61221845, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2940, N'Adriana', N'Astorga', N'Molina', N'85913092', N'aastorga10@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 85913092, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2941, N'Jonathan', N'Aymerich', N'Pacheco', N'86363908', N'gatoaymerich@hotmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 86363908, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2942, N'Carlos', N'Azofeifa', N'Calderón', N'89865875', N'azofeifa1616@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89865875, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2944, N'Birllil', N'Babb', NULL, N'83371680', N'bllil1_@hotmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 83371680, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2945, N'Mónica', N'Badilla', N'Centeno', N'89470123', N'mlidiab.21@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 89470123, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2946, N'Juan Miguel', N'Badilla', N'Rodriguez', N'87501824', N'badirodri@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87501824, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2947, N'Yasmín', N'Badilla', N'Ureña', N'2', N'ange9491@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 2, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2949, N'Andrea', N'Barboza', N'Elizondo', N'85183603', N'elizondo.bar.andre77@hotmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 85183603, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2951, N'Aliria', N'Barboza', N'Marín', N'88274013', N'alibm03@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 88274013, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2952, N'Reishell', N'Barnes', N'Rodríguez', N'84171599', N'r_barnesro@hotmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 84171599, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2954, N'Erick', N'Barquero', N'Meneses', N'71346032', N'erickbarquero42@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 71346032, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2955, N'Cindy', N'Barrantes', N'Calvo', N'83847444', N'cindy.barrantes4@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 83847444, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2956, N'Jonathan', N'Barrantes', N'Cortés', N'84843622', N'barrantes34@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 84843622, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2957, N'Maikol', N'Barrantes', N'García', N'5292845', N'mabaga1501@gmail.com', N'Otro', NULL, NULL, N'M', 1, 1, NULL, 5292845, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2958, N'José', N'Barrantes', N'Salazar', N'85601805', N'jmbs931@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 85601805, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2959, N'Kendar', N'Barrantes', N'Vega', N'89452610', N'kbarrantes15@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 89452610, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2960, N'Mauricio', N'Becerra', N'Soto', N'85447446', N'timap940@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 85447446, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2961, N'Aldair', N'Bejarano', N'Tortós', N'83338705', N'aldairesteban@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 83338705, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2962, N'Debbie', N'Benavides', N'Zúñiga', N'72296299', N'decebezu@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 72296299, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2963, N'Lenynd', N'Bermúdez', NULL, N'61596625', N'lenynd9559@hotmail.com', N'Administración en Tecnología de Información', NULL, NULL, N'M', 1, 1, NULL, 61596625, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2964, N'Gabriel', N'Bermúdez', N'Chacón', N'87933279', N'gbbermudezch@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87933279, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2965, N'María', N'Bermúdez', N'Vásquez', N'88592767', N'marijo_395@hotmail.com', N'Biotecnología', NULL, NULL, N'F', 1, 1, NULL, 88592767, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2966, N'Ariana', N'Bermúdez', N'Venegas', N'60990312', N'bermudezarii@gmail.com', N'Computación', NULL, NULL, N'F', 1, 1, NULL, 60990312, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2967, N'María Laura', N'Berrick', N'Acuña', N'84433772', N'lalisberrick18@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 84433772, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2968, N'Francisco', N'Bianchini', N'Quirós', N'83316617', N'fbq200@hotmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 83316617, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2969, N'Indiana', N'Biassetty', N'Hernández', N'86500998', N'indibh29@hotmail.com', N'Administración en Tecnología de Información', NULL, NULL, N'F', 1, 1, NULL, 86500998, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2970, N'Pablo', N'Bogantes', N'Portuguez', N'85835803', N'pabloboga2@gmail.com', N'Biología', NULL, NULL, N'M', 1, 1, NULL, 85835803, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2971, N'Ligia', N'Bolaños', NULL, N'62936635', N'ligiabmejia@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 62936635, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2972, N'Luis', N'Bolaños', N'Berrocal', N'60901868', N'luisjose1327@gmail.com', N'Administración en Tecnología de Información', NULL, NULL, N'M', 1, 1, NULL, 60901868, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2973, N'Aquim', N'Bonilla', N'Gregory', N'25917873', N'kleonard.bonilla@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 25917873, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2974, N'David', N'Bonilla', N'Picado', N'89907208', N'davidbonillapicado@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89907208, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2975, N'Sofía', N'Bonilla', N'Sanabria', N'83269328', N'sobsanabria95@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 83269328, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2976, N'Frank', N'Brenes', N'Alvarado', N'89512070', N'fbrenes7@gmail.com', N'Administración en Tecnología de Información', NULL, NULL, N'M', 1, 1, NULL, 89512070, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2977, N'Jose Andres', N'Brenes', N'Cordero', N'86255497', N'anndresbr@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 86255497, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2978, N'Rodrigo', N'Brenes', N'Fonseca', N'83030739', N'robrefon@hotmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 83030739, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2979, N'YanCarlos', N'Brenes', N'Navarro', N'86983307', N'calobrenes126@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 86983307, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2980, N'Josuath', N'Bustos', NULL, N'85567896', N'abcabc8991@gmail.com', N'Computación', NULL, NULL, N'M', 1, 1, NULL, 85567896, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2981, N'Josuath', N'Bustos', NULL, N'85567896', N'josuath8991@gmail.com', N'Computación', NULL, NULL, N'M', 1, 1, NULL, 85567896, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2982, N'Pedro', N'Cabezas', N'Naranjo', N'88893207', N'pedro1997cn@gmail.com', N'Computación', NULL, NULL, N'M', 1, 1, NULL, 88893207, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2983, N'Alonso', N'Calderón', N'Alvarado', N'87652292', N'dagner1996@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87652292, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2984, N'Marcos', N'Calderón', N'Badilla', N'86215127', N'calde1509@gmail.com', N'Computación', NULL, NULL, N'M', 1, 1, NULL, 86215127, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2985, N'María José', N'Calderón', N'Guevara', N'86576812', N'mariajose.calderon.g@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 86576812, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2986, N'María', N'Calleja', N'Trujillo', N'3', N'macallejat@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 3, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2987, N'Marvin', N'Calvo', NULL, N'71027636', N'marvingabr@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 71027636, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2988, N'Valeria', N'Calvo', N'Badilla', N'89811545', N'vac.ba21@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 89811545, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2989, N'Jose', N'Calvo', N'Monge', N'89608610', N'robercamo29@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89608610, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2991, N'Yendry', N'Camacho', N'Camacho', N'70194952', N'yendry041194@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 70194952, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2992, N'Elias', N'Campos', NULL, N'4', N'ecamposm.95@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 4, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2993, N'José', N'Campos', N'Cifuentes', N'84803950', N'andres-298@hotmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 84803950, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2994, N'Daniel', N'Campos', N'Vallejos', N'88136583', N'dacampos30@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 88136583, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2995, N'Daronne', N'Cano', N'Contreras', N'87563886', N'daronnecano@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87563886, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2996, N'Alberto', N'Cano', N'Coto', N'71035557', N'alcaco92@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 71035557, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2997, N'Yuriana', N'Carmona', N'Barrantes', N'89262360', N'yuricarmona@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 89262360, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  2998, N'Paola', N'Carpio', N'Calderón', N'83467057', N'pvcc29@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 83467057, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3000, N'Laura', N'Carvajal', N'Segura', N'85012099', N'danycarse@gmail.com', N'Administración en Tecnología de Información', NULL, NULL, N'F', 1, 1, NULL, 85012099, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3001, N'Carlos', N'Castillo', N'Castillo', N'89588292', N'carlos16cr@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89588292, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3002, N'Cristopher', N'Castillo', N'Fallas', N'89756106', N'crisden13@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89756106, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3003, N'Tifany', N'Castillo', N'Fonseca', N'83262012', N'tifcf15@gmail.com', N'Matemática', NULL, NULL, N'F', 1, 1, NULL, 83262012, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3004, N'Steven', N'Castillo', N'Hernández', N'89699477', N'scastillohernandez11@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89699477, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3005, N'Josué', N'Castillo', N'Villalobos', N'71106513', N'josueccc@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 71106513, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3006, N'Manuel', N'Castro', N'null', N'86339784', N'mamelandres95@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 86339784, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3007, N'Stephanie', N'Castro', N'Aguilar', N'85310730', N'10.fefi@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 85310730, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3008, N'Estefanía', N'Castro', N'Alvarado', N'71664451', N'pefi1997@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 71664451, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3009, N'Olman', N'Castro', N'Hernández', N'87032028', N'kstro379@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87032028, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3010, N'Ignacio', N'Castro', N'Hidalgo', N'85656278', N'ignaciocastroh@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 85656278, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3011, N'María', N'Castro', N'Jiménez', N'89448269', N'mafecj23@hotmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 89448269, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3012, N'Daniel', N'Castro', N'Sanchez', N'84079187', N'daescastros@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 84079187, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3013, N'Carlos Mario', N'Centeno', N'Esquivel', N'83207671', N'centeno.240@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 83207671, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3015, N'Alfonso', N'Chacon', N'Campos', N'83817767', N'alfonso27chacon@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 83817767, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3016, N'Evelyn', N'Chacón', N'Ramírez', N'5', N'echacon030@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 5, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3017, N'Alexander', N'Chanto', N'Sánchez', N'62333375', N'amcs8@live.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 62333375, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3018, N'Daniela', N'Chavarría', N'Umaña', N'86275737', N'nani.2496@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 86275737, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3020, N'Nicole', N'Chaves', NULL, N'86025417', N'niki.chj@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 86025417, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3021, N'Jesús', N'Chaves', N'Arias', N'89407283', N'jesusca07@hotmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 89407283, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3022, N'Raizeth', N'Chaves', N'Arias', N'87913279', N'raizethchavesarias@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 87913279, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3023, N'Liza', N'Chaves', N'Carranza', N'89634800', N'lizchavca@gmail.com', N'Administración en Tecnología de Información', NULL, NULL, N'F', 1, 1, NULL, 89634800, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3024, N'Lucy', N'Chaves', N'Gamboa', N'84275817', N'lucy.chaves.gamboa@gmail.com', N'Computación', NULL, NULL, N'F', 1, 1, NULL, 84275817, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3025, N'Joseth', N'Chaves', N'Marín', N'88266376', N'joseth5@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 88266376, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3026, N'Samuel', N'Chaves', N'Monge', N'87023979', N'schaves71@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87023979, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3027, N'Luis', N'Chaves', N'Núñez', N'71608494', N'alonso0296@hotmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 71608494, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3028, N'Mario', N'Chaves', N'Rodríguez', N'85477740', N'maralbertoCCC@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 85477740, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3029, N'José Ignacio', N'Chaves', N'Varela', N'83163733', N'jichavesvarela@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 83163733, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3030, N'Maikol', N'Chaves', N'Vásquez', N'86042947', N'machavespi@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 86042947, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3031, N'Haiwen', N'Chen', N'Coloma', N'6', N'haiwenc@hotmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 6, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3032, N'Miguel', N'Chinchilla', N'Olivares', N'85189868', N'mchinchilla97@hotmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 85189868, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3033, N'Laura Gabriela', N'Chinchilla', N'Sánchez', N'84941444', N'laugaby1612@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 84941444, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3035, N'Rosario', N'Condori', NULL, N'84794713', N'rosario.condori@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 84794713, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3036, N'martin', N'Contreras', NULL, N'86865941', N'martincontreras1985@gmail.com', N'Matemática', NULL, NULL, N'M', 1, 1, NULL, 86865941, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3037, N'Marcela', N'Contreras', N'Monge', N'85165532', N'marcela.contrerasmonge22@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 85165532, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3038, N'Alisson', N'Cordero', N'Alfaro', N'86276396', N'valeria.cordero@hotmail.es', N'Filosofía', NULL, NULL, N'F', 1, 1, NULL, 86276396, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3039, N'David', N'Cordero', N'Chavarría', N'88769167', N'dcorderoch@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 88769167, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3040, N'David', N'Cordero', N'Quesada', N'83776615', N'davidcorderoq@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 83776615, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3041, N'Teresita', N'Cordero', N'Robles', N'86115510', N'teresitacorderorobles@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 86115510, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3042, N'Mauricio', N'Córdoba', N'Fernández', N'86351051', N'm.a.u.9514@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 86351051, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3043, N'Jose Pablo', N'Corrales', N'Mora', N'87409026', N'syntaxsugarcr@gmail.com', N'Administración en Tecnología de Información', NULL, NULL, N'M', 1, 1, NULL, 87409026, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3044, N'Pablo', N'Corrales', N'Mora', N'87409026', N'jopablo13@gmail.com', N'Computación', NULL, NULL, N'M', 1, 1, NULL, 87409026, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3045, N'Luis', N'Corrales', N'Navarro', N'88730495', N'luiscorrana@gmail.com', N'Administración en Tecnología de Información', NULL, NULL, N'M', 1, 1, NULL, 88730495, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3047, N'Paulo', N'Cortés', N'Artavia', N'27166333', N'fcortez93@outlook.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 27166333, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3048, N'Alejandro', N'Coto', NULL, N'89914031', N'cotoskate@yahoo.es', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89914031, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3049, N'Andrés', N'Coto', N'Brenes', N'83804412', N'afeli36@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 83804412, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3050, N'Luis Roberto', N'Coto', N'Chinchilla', N'83349047', N'robertocoto10@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 83349047, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3051, N'Estefanía', N'Coto', N'Solano', N'88773668', N'estefa27@hotmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 88773668, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3052, N'Fabricio', N'Coto', N'Vílchez', N'87301134', N'fabricovi@hotmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87301134, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3053, N'Federico', N'Coto', N'Vílchez', N'87018839', N'federicocoto@hotmail.com', N'Física', NULL, NULL, N'M', 1, 1, NULL, 87018839, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3054, N'Sophía', N'Cruz', N'Godínez', N'86880977', N'sphcz5@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 86880977, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3055, N'Eunice', N'Cruz', N'Méndez', N'85309433', N'elinicen16@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 85309433, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3056, N'Andres', N'Cubero', N'Chaves', N'89551618', N'chala9719@hotmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 89551618, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3057, N'María José', N'Cubero', N'Masís', N'89645533', N'majocm07@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 89645533, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3058, N'Luis', N'Del Valle ', N'Corrales', N'89425944', N'luigidelco23.ldvc@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 89425944, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3059, N'Yoeslin', N'Delgado', N'Noguera', N'87257761', N'jo.lie23@hotmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 87257761, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3060, N'Daniel', N'Delgado', N'Segura', N'7', N'ddelgado14@outlook.com', N'Computación', NULL, NULL, N'M', 1, 1, NULL, 7, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3061, N'Christopher', N'Díaz', N'Mora', N'84466198', N'chrisalex971@gmail.com', N'Otro', NULL, NULL, N'M', 1, 1, NULL, 84466198, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3062, N'Francisco', N'Díaz', N'Palma', N'85567166', N'fpalma2008@gmail.com', N'Administración en Tecnología de Información', NULL, NULL, N'M', 1, 1, NULL, 85567166, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3063, N'Stephanie', N'Díaz', N'Valverde', N'70763725', N'stephaniediazv@hotmail.com', N'Administración en Tecnología de Información', NULL, NULL, N'F', 1, 1, NULL, 70763725, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3064, N'Daniela', N'Durán', NULL, N'89067812', N'daniduranperez04@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 89067812, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3066, N'Lorena', N'Elescano', N'Loayza', N'86405488', N'loreavril2@gmail.com', N'Otro', NULL, NULL, N'F', 1, 1, NULL, 86405488, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3067, N'Shelly', N'Elizondo', N'Sánchez', N'86064261', N'sheelisan02@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 86064261, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3068, N'Catalina', N'Espinoza', N'Quesada', N'85748558', N'cataes95@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 85748558, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3070, N'Claudia', N'Esquivel', N'Cordero', N'86269007', N'claudiaesq@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 86269007, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3071, N'Abigail', N'Esquivel', N'Jaubert', N'86507254', N'abbyesquiv@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 86507254, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3073, N'Brayan', N'Fajardo', N'Alvarado', N'60432826', N'brayan.f.a07@gmail.com', N'Computación', NULL, NULL, N'M', 1, 1, NULL, 60432826, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3074, N'Maria', N'Fallas', N'Madriz', N'87198663', N'mfallasmadriz@gmail.com', N'Administración en Tecnología de Información', NULL, NULL, N'F', 1, 1, NULL, 87198663, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3075, N'Jose', N'Fernandez', N'Cordero', N'70757865', N'jferco94@gmail.com', N'Administración en Tecnología de Información', NULL, NULL, N'M', 1, 1, NULL, 70757865, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3076, N'Verónica', N'Fernández', N'De', N'85872702', N'verofdelaa@gmail.com', N'Otro', NULL, NULL, N'F', 1, 1, NULL, 85872702, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3077, N'Maria Pia', N'Fernandez', N'Mora', N'85180690', N'pia.fernandez.97@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 85180690, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3078, N'Raquel', N'Fernández', N'Rodríguez', N'83211185', N'raquel_fernandezr@hotmail.com', N'Biotecnología', NULL, NULL, N'F', 1, 1, NULL, 83211185, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3079, N'Jhoel', N'Fernández', N'Vega', N'89392996', N'simplementejohel@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89392996, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3080, N'William', N'Flores', N'Fuentes', N'84248623', N'twfflores@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 84248623, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3081, N'Jorge Adrián', N'Fonseca', N'Blanco', N'88032623', N'jafonbla@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 88032623, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3082, N'Mauricio', N'Fonseca', N'Vallejos', N'87542990', N'maurifv76@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87542990, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3083, N'Cynthia', N'Forrest', N'Fernández', N'89639250', N'cynfor0703@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 89639250, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3084, N'Jose Rodolfo', N'Gadea', N'Ramirez', N'86138214', N'jrodolfogadea@icloud.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 86138214, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3085, N'Andrés', N'Gamboa', N'Chacón', N'62668642', N'andresgamboachacon@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 62668642, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3086, N'Paula', N'Gamboa', N'Oviedo', N'60367940', N'paumariela@hotmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 60367940, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3087, N'Pablo', N'Garcia', N'Brenes', N'89406807', N'pablod_garcia@hotmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89406807, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3088, N'Andrés', N'García', N'Soto', N'89429018', N'andresmcvago@gmail.com', N'Computación', NULL, NULL, N'M', 1, 1, NULL, 89429018, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3089, N'Ariana', N'García', N'Villalobos', N'84252025', N'arianagarca@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 84252025, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3090, N'Mariane', N'Garita', N'Mora', N'89876127', N'mariianesofia@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 89876127, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3091, N'Yanci Cristina', N'Garro', N'Ureña', N'89627129', N'yangarro3547@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 89627129, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3092, N'Quirós', N'Gómez', NULL, N'84379499', N'josuequirosgomez@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 84379499, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3093, N'Johana', N'Gómez', N'Araya', N'84200451', N'johamga@gmail.com', N'Matemática', NULL, NULL, N'F', 1, 1, NULL, 84200451, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3094, N'Roxana', N'Gómez', N'Gómez', N'2013096957', N'rocagogo01@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 2013096957, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3095, N'Gladys', N'Gómez', N'Montero', N'86991978', N'kgm1907@hotmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 86991978, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3096, N'Ana Jazmin', N'Gomez', N'Soza', N'63387896', N'gsjana@hotmal.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 63387896, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3097, N'Irene', N'Gómez', N'Valverde', N'83401408', N'iregv2988@hotmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 83401408, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3098, N'Esteban', N'González', NULL, N'87543699', N'egonzarg@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 87543699, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3099, N'Ofelia', N'Gonzalez', N'Castro', N'62120589', N'goncaazucena@outlook.es', NULL, NULL, NULL, N'F', 1, 1, NULL, 62120589, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3100, N'Laura', N'González', N'Durán', N'84188869', N'lauragodu30@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 84188869, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3101, N'Huberth', N'González', N'Gairaud', N'87647447', N'gonzalezhuberth@hotmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87647447, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3102, N'Daniel', N'González', N'Ramírez', N'72937595', N'daniel.agr13@hotmail.com', N'Biotecnología', NULL, NULL, N'M', 1, 1, NULL, 72937595, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3103, N'Jorlan', N'González', N'Sanabria', N'87377314', N'jorlan1595@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 87377314, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3105, N'Jair', N'Granados', N'Chacón', N'85084654', N'jairgrch@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 85084654, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3106, N'Edwin', N'Granados', N'Gómez', N'83280570', N'edwimgra22@hotmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 83280570, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3107, N'Chantel', N'Green', N'Segura', N'87286804', N'chantygreen08@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 87286804, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3108, N'Kembly', N'Guevara', NULL, N'71745426', N'priscygueva@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 71745426, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3109, N'Allison', N'Gutiérrez', N'Fernández', N'87837922', N'allisongutierrezf@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 87837922, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3111, N'Jonathan', N'Guzman', N'Araya', N'87319598', N'jonathana1196@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87319598, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3112, N'Cristina', N'Guzman', N'Arias', N'70125671', N'cris_guzman55@hotmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 70125671, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3113, N'Karlton', N'Hall', N'Mora', N'85796939', N'karltonhall12@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 85796939, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3114, N'Jake', N'Herera', NULL, N'70534285', N'jkherera96@outlook.com', N'Computación', NULL, NULL, N'M', 1, 1, NULL, 70534285, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3115, N'Ricardo', N'Hernández', N'Calderón', N'84336062', N'cone971@hotmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 84336062, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3116, N'Daniel', N'Hernández', N'Gutiérrez', N'86429736', N'daher170397@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 86429736, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3117, N'Felipe', N'Hernández', N'Molina', N'8', N'felipepphm@hotmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 8, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3118, N'Jerson', N'Hernández', N'Rojas', N'84176355', N'jeyohr@hotmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 84176355, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3119, N'Diego', N'Hernandez', N'Valerin', N'71505825', N'diegohv16@gmail.com', N'Administración en Tecnología de Información', NULL, NULL, N'M', 1, 1, NULL, 71505825, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3121, N'Daniela', N'Herrera', N'Arias', N'84417735', N'daniha9118@hotmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 84417735, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3122, N'María Melissa', N'Herrera', N'Suazo', N'72611013', N'mherres1511@gmail.com', N'null', NULL, NULL, N'F', 1, 1, NULL, 72611013, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3123, N'María Fernanda', N'Hidalgo', N'Alpízar', N'84322684', N'ferha863@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 84322684, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3124, N'Julián', N'Hidalgo', N'Chacón', N'86045958', N'jhidalgo2035@outlook.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 86045958, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3126, N'Darim', N'Horton', NULL, N'83086048', N'darim.horton@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 83086048, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3127, N'Esteban', N'Hurtado', N'Aguirre', N'88598333', N'esteban_colo@live.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 88598333, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3128, N'Amanda', N'Infante', N'Alfaro', N'86454679', N'infa92@gmail.com', N'Otro', NULL, NULL, N'F', 1, 1, NULL, 86454679, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3129, N'Luis', N'Irías', N'Madrigal', N'89507347', N'irias.diego@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89507347, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3130, N'Kevin', N'Jiménez', N'Araya', N'83747598', N'kejimenez17@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 83747598, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3131, N'Sleider', N'Jiménez', N'Delgado', N'63903049', N'alejimenezde27@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 63903049, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3132, N'Dylan', N'Jiménez', N'Marin', N'88693487', N'dylanjosue03@estudiantec.cr', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 88693487, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3133, N'Tannia', N'Jimenez', N'Mena', N'62540170', N'tannyap25@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 62540170, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3134, N'Karina', N'Jiménez', N'Piedra', N'9', N'karinajp1910@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 9, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3135, N'Carlos Eduardo', N'Jiménez', N'Vargas', N'88139340', N'cajim20@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 88139340, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3137, N'Valeria', N'Lacayo', N'Barquero', N'83355684', N'valerialacayo@hotmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 83355684, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3138, N'Jason', N'Latouche', NULL, N'86664732', N'96jaslat@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 86664732, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3139, N'Kenneth', N'Laurent', N'Alvarado', N'83105991', N'kennethglaurent@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 83105991, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3140, N'Silvia', N'Leitón', N'Elizondo', N'89889179', N'silvialeitonelizondo@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 89889179, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3141, N'Jason', N'Leitón', N'Jiménez', N'71000041', N'ljjasonj017@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 71000041, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3142, N'Kevin', N'Leiva', N'Brenes', N'60968924', N'blak_2294@hotmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 60968924, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3143, N'Diana', N'Leiva', N'Chinchilla', N'86588411', N'diana.leiva.chinchilla@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 86588411, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3144, N'James', N'Leon', N'Herrera', N'62713299', N'jaleonh11@hotmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 62713299, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3145, N'Arianna', N'Leon', N'Perez', N'83780145', N'ariannaleonperez@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 83780145, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3146, N'Luis Fernando', N'León', N'Segura', N'88054721', N'luisfernandoleons@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 88054721, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3147, N'Candy', N'Lizano', NULL, N'83404624', N'cantl9513@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 83404624, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3148, N'Roy', N'Lizano', NULL, N'87851958', N'roy_12liz@hotmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87851958, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3149, N'Benjamín', N'Loaiza', N'Loaiza', N'86776410', N'benjaminloaiza24@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 86776410, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3150, N'Francisco', N'Loaiza', N'Vallejos', N'84376405', N'franciscovall95@gmail.com', N'Computación', NULL, NULL, N'M', 1, 1, NULL, 84376405, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3151, N'Fabián', N'López', N'Bermúdez', N'72101185', N'bermudezfab@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 72101185, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3152, N'Adriana', N'López', N'Bolaños', N'88014126', N'adjolobo@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 88014126, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3153, N'Alisson', N'López', N'Bravo', N'85126750', N'alilopbra@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 85126750, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3154, N'Nazareth', N'López', N'Carranza', N'83096233', N'naza.lopez.ca@gmail.com', N'Biotecnología', NULL, NULL, N'F', 1, 1, NULL, 83096233, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3155, N'Aaron', N'Lopez', N'Hidalgo', N'10', N'aaronlphg@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 10, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3156, N'Manuel', N'López', N'Madrigal', N'87125208', N'm.lopezmadri@gmail.com', N'Computación', NULL, NULL, N'M', 1, 1, NULL, 87125208, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3157, N'Geisel', N'López', N'Navarro', N'85554789', N'lopeznavarrogeisel@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 85554789, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3158, N'Maria', N'Lopez', N'Rodriguez', N'89695881', N'marilpr66@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 89695881, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3160, N'Dilan', N'Loría', N'Quesada', N'89551143', N'dilan.loria@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89551143, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3161, N'Luis', N'Luis', N'Alejandro', N'86462802', N'alexvilla741@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 86462802, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3162, N'Mariana', N'Madrigal', NULL, N'83338560', N'mrfallasmadrigal@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 83338560, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3163, N'Valerie', N'Madrigal', N'Abarca', N'87027090', N'valeriemadrigal1113@gmail.com', N'Matemática', NULL, NULL, N'F', 1, 1, NULL, 87027090, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3164, N'Catalina', N'Madrigal', N'García', N'83497958', N'ca.ma.ga.0795@gmail.com', N'Biotecnología', NULL, NULL, N'F', 1, 1, NULL, 83497958, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3165, N'Carolina', N'Madrigal', N'Murillo', N'62624162', N'poascarolina94@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 62624162, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3166, N'Dennis', N'Marín', N'Miranda', N'84991175', N'dennis.003@hotmail.es', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 84991175, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3167, N'Fabio', N'Marín', N'Navarro', N'86098871', N'fabmana@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 86098871, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3168, N'Alejandro', N'Marín', N'Sandí', N'72870187', N'alejesmarsan@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 72870187, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3169, N'Kevin', N'Maroto', N'Fonseca', N'88504491', N'kevin.maroto.fonseca@gmail.com', N'null', NULL, NULL, N'M', 1, 1, NULL, 88504491, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3171, N'Oscar', N'Martinez', N'Arias', N'89102791', N'omartinez-95@hotmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 89102791, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3172, N'Andrey', N'Martínez', N'Hernández', N'86461403', N'andreygerardo30@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 86461403, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3173, N'Steven', N'Martínez', N'López', N'86462193', N'martinezlopez.mau@gmail.com', N'Computación', NULL, NULL, N'M', 1, 1, NULL, 86462193, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3174, N'Natalia', N'Martínez', N'Mendoza', N'60481816', N'naty_mar09@hotmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 60481816, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3175, N'Wendy', N'Martínez', N'Pichardo', N'60709511', N'dywen09@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 60709511, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3176, N'Hugo', N'Martínez', N'Sandoval', N'89623143', N'hugoms17@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 89623143, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3177, N'Nestor', N'Martinez', N'Soto', N'89620458', N'arnoldheaven7@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89620458, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3178, N'Luis Angel', N'Martínez', N'Wilson', N'84397604', N'luigillo0310@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 84397604, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3179, N'Billy', N'Mata', N'Fernández', N'86835552', N'billymaf@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 86835552, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3180, N'Fabian', N'Mata', N'Figueroa', N'11', N'milton95mtb@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 11, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3181, N'Daniela', N'Mata', N'Maroto', N'83353792', N'da_nim_05@hotmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 83353792, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3182, N'Leonardo', N'Mata', N'Mora', N'84810696', N'leomata97@gmail.com', N'Computación', NULL, NULL, N'M', 1, 1, NULL, 84810696, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3183, N'Ignacio David', N'Mata', N'Quesada', N'84546473', N'igndavidmq@hotmail.com', N'Administración en Tecnología de Información', NULL, NULL, N'M', 1, 1, NULL, 84546473, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3186, N'Ashley', N'Mc Laren', N'Quesada', N'86325746', N'ash02mclaren@hotmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 86325746, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3187, N'Abril', N'Medrano', N'Espinoza', N'88283904', N'abrilmedrano94@gmail.com', N'Biología', NULL, NULL, N'F', 1, 1, NULL, 88283904, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3188, N'Jocelyn', N'Mejia', NULL, N'12', N'josy_96_tmp@hotmail.com', N'Otro', NULL, NULL, N'F', 1, 1, NULL, 12, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3189, N'Maria', N'Melendez', NULL, N'89769022', N'danimel_1408@hotmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 89769022, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3190, N'Alfiery', N'Meléndez', N'Rodríguez', N'72679429', N'alfierimr@gmail.com', N'Matemática', NULL, NULL, N'M', 1, 1, NULL, 72679429, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3191, N'Romell', N'Meléndez', N'Soto', N'85943608', N'rms2295@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 85943608, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3192, N'Geancarlo', N'Mena', N'López', N'86890366', N'geancarlomena@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 86890366, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3193, N'Keylor', N'Mena', N'venegas', N'87662633', N'kmena281@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87662633, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3195, N'Sebastián', N'Méndez', N'Hidalgo', N'61056359', N'sebasmendez0998@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 61056359, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3196, N'Alejandro', N'Méndez', N'Monge', N'87659443', N'alemendezmonge@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 87659443, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3197, N'Mary Daniela', N'Méndez', N'Navarro', N'86374895', N'mdanim_77@hotmail.com', N'Biotecnología', NULL, NULL, N'F', 1, 1, NULL, 86374895, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3199, N'Maria', N'Meneses', NULL, N'13', N'marymenedi@hotmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 13, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3200, N'Santiago', N'Meneses', NULL, N'14', N'santiagomeneseso@hotmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 14, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3201, N'María Alejandra', N'Merino', N'Zapata', N'86363013', N'merino.ale97@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 86363013, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3202, N'Andres', N'Miranda', N'Arias', N'87078389', N'an.co15@hotmail.com', N'Computación', NULL, NULL, N'M', 1, 1, NULL, 87078389, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3203, N'Harold', N'Miranda', N'Sandoval', N'60546468', N'harold1094@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 60546468, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3204, N'Sara', N'Molina', N'Quesada', N'86643631', N'samolina117@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 86643631, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3205, N'Ricardo', N'Molina', N'Robles', N'83650611', N'rjmolinazx@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 83650611, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3206, N'Darío', N'Monge', N'Arce', N'85280751', N'100dario@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 85280751, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3207, N'Heber', N'Monge', N'Arias', N'87992370', N'heberma94@gmail.com', N'Biotecnología', NULL, NULL, N'M', 1, 1, NULL, 87992370, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3208, N'Steven', N'Monge', N'González', N'88347053', N'stevemonge@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 88347053, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3209, N'Luis', N'Monge', N'Rojas', N'87553025', N'dmongerojas@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87553025, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3210, N'María Fernanda', N'Monge', N'Vargas', N'87333971', N'mafemova2094@gmail.com', N'Administración en Tecnología de Información', NULL, NULL, N'F', 1, 1, NULL, 87333971, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3211, N'Fabrizzio', N'Montalto', N'Lizano', N'88993118', N'famontalto25@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 88993118, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3212, N'Federico', N'Montero', N'Ramírez', N'84204000', N'fjmr1397@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 84204000, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3213, N'Lashmi', N'Monterrosa', N'Madriz', N'87585014', N'lashmimonterrosa@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 87585014, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3214, N'Alemán', N'Mora', NULL, N'60066000', N'hectoram95@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 60066000, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3215, N'Verónica', N'Mora', NULL, N'86392496', N'vroimora@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 86392496, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3216, N'Joselyn', N'Mora', N'Alvarado', N'63046917', N'joselyn.162@gmail.com', N'Otro', NULL, NULL, N'F', 1, 1, NULL, 63046917, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3217, N'Rafael Ignacio', N'Mora', N'Jiménez', N'86640751', N'ignacimo98@hotmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 86640751, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3218, N'Maureen', N'Mora', N'Lezcano', N'61314890', N'maureencristinaml@gmail.com', N'Matemática', NULL, NULL, N'F', 1, 1, NULL, 61314890, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3219, N'Almudena', N'Mora', N'Quintanilla', N'83151621', N'amoraq23@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 83151621, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3220, N'Jose Pablo', N'Mora', N'Salas', N'70181624', N'jp.mora@hotmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 70181624, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3221, N'Fanuel', N'Mora', N'Salazar', N'83510282', N'fanumora@estudiantec.cr', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 83510282, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3223, N'Steven', N'Moraga', N'Cerdas', N'87377677', N'smoragacerdas@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87377677, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3224, N'Nicolás', N'Morales', NULL, N'15', N'nivo1996@gmail.com', N'Química', NULL, NULL, N'M', 1, 1, NULL, 15, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3225, N'Gabriel', N'Morales', N'Castro', N'88499750', N'gabrielmor28@gmail.col', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 88499750, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3226, N'Diana', N'Morales', N'Hidalgo', N'85814600', N'dianamohi19@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 85814600, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3227, N'Luis Alonso', N'Morera', NULL, N'61747433', N'lsequeiramorera@gmail.com', N'Administración en Tecnología de Información', NULL, NULL, N'M', 1, 1, NULL, 61747433, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3228, N'Moises', N'Morera', N'Alfaro', N'16', N'mochemore@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 16, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3229, N'Ayrton', N'Muñoz', N'Valerio', N'86524038', N'ayrton.mzv29@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 86524038, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3230, N'Joselyn', N'Murillo', NULL, N'88169754', N'joselinm97@hotmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 88169754, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3231, N'Luis', N'Murillo', N'González', N'83034028', N'luisf1908@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 83034028, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3232, N'Gloriana', N'Murillo', N'Herrera', N'85656916', N'glory.muhe@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 85656916, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3233, N'Olman', N'Narvaez', N'Chevez', N'84486953', N'olman2012@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 84486953, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3234, N'Nicolás', N'Navarro', NULL, N'87705518', N'nclsnavarro@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87705518, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3235, N'Cristel', N'Navarro', N'Morales', N'83851786', N'crisdnm05@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 83851786, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3236, N'Lucía', N'Noboa', N'Jiménez', N'83198905', N'lucianoboa99@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 83198905, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3237, N'Catalina', N'Nunez', NULL, N'85806242', N'canual@estudiantec.cr', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 85806242, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3238, N'Gilberth', N'Obando', N'Quesada', N'84792364', N'gilobaqu@gmail.com', N'Computación', NULL, NULL, N'M', 1, 1, NULL, 84792364, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3239, N'Marcelo', N'Ocampo', NULL, N'89225278', N'mosdecri@gmail.com', N'Computación', NULL, NULL, N'M', 1, 1, NULL, 89225278, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3240, N'Dualok', N'Ordonez', NULL, N'84229888', N'dualok.j@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 84229888, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3241, N'Maria elena', N'Ordoñez', N'villalobos', N'85672795', N'elenaovcr@hotmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 85672795, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3242, N'Henry', N'Orias', N'Rodriguez', N'17', N'hwor10@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 17, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3243, N'Byron', N'Orozco', NULL, N'88010527', N'bayov24@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 88010527, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3244, N'Frederik', N'Orozco', N'Reyes', N'89158818', N'frederik.for@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89158818, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3245, N'Victor', N'Ortega', N'Méndez', N'62866594', N'eduardoom_95@hotmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 62866594, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3246, N'Plus', N'Ortiz', NULL, N'62060293', N'saoc.97@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 62060293, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3247, N'Joseph', N'Oviedo', N'Ramírez', N'83202257', N'alejandrooviedoramirez@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 83202257, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3248, N'Laura', N'Oviedo', N'Salazar', N'86039187', N'lauos195@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 86039187, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3249, N'Deborah', N'Pacheco', N'Vallejo', N'88218212', N'debpacheco16@hotmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 88218212, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3250, N'Michael', N'Pao', N'Meza', N'60375636', N'mpao94@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 60375636, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3251, N'Isaac', N'Peña', N'Pereira', N'86130545', N'isaaczypp@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 86130545, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3252, N'Mariana', N'Peralta', NULL, N'87472525', N'marianapbrenes@gmail.com', N'Otro', NULL, NULL, N'F', 1, 1, NULL, 87472525, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3253, N'Jason', N'Pereira', NULL, N'83369800', N'jason281186@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 83369800, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3254, N'Jesus', N'Pereira', NULL, N'61993942', N'jesus.pereiraq@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 61993942, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3255, N'Shirley', N'Pereira', N'Bonilla', N'84643770', N'shirley.pereira.bonilla@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 84643770, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3257, N'María Fernanda', N'Pereira', N'Jiménez', N'86539013', N'pereirafernanda27@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 86539013, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3258, N'Rosa', N'Pereira', N'Quirós', N'83803625', N'rositapq11@gmail.com', N'Otro', NULL, NULL, N'F', 1, 1, NULL, 83803625, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3259, N'Jerry', N'Pérez', N'Aguilar', N'72000521', N'jpereza78@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 72000521, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3260, N'Sebastián', N'Pérez', N'Campos', N'88053679', N'sebastian_29-@hotmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 88053679, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3261, N'Luis Diego', N'Perez', N'Jimenez', N'87694733', N'luisdiegop94@gmail.com', N'Otro', NULL, NULL, N'M', 1, 1, NULL, 87694733, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3262, N'Rebecca', N'Pessoa', N'Albertazzi', N'88795241', N'beki96pessoa@hotmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 88795241, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3263, N'Milagro', N'Picado', NULL, N'83085416', N'nmpvalverde@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 83085416, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3264, N'Omar', N'Porras', N'Ramírez', N'86269962', N'oporras100@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 86269962, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3265, N'Fabrizio', N'Protti', NULL, N'60500848', N'prottif@hotmail.com', N'Administración en Tecnología de Información', NULL, NULL, N'M', 1, 1, NULL, 60500848, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3266, N'Diego', N'Quesada', NULL, N'70621532', N'dquesadaz19@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 70621532, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3267, N'Manuel', N'Quesada', NULL, N'88502925', N'mhquesada22@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 88502925, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3268, N'Nancy', N'Quesada', NULL, N'70195969', N'nancy.pq13@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 70195969, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3269, N'Daniel', N'Quesada', N'Corrales', N'87869458', N'Danielquesadacr@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 87869458, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3270, N'kimberly', N'Quesada', N'Jimenez', N'86573438', N'kiimquesada97@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 86573438, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3271, N'María', N'Quesada', N'Montero', N'83300829', N'marisqm@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 83300829, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3272, N'Monserrat', N'Quesada', N'Pérez', N'71033981', N'monse1694@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 71033981, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3273, N'Mario', N'Quesada', N'Quirós', N'83341259', N'mariofgm@gmail.com', N'null', NULL, NULL, N'M', 1, 1, NULL, 83341259, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3274, N'Maria Jose', N'Quesada', N'Solis', N'18', N'chesolis18@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 18, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3275, N'Jaqueline', N'Quintero', NULL, N'84865048', N'jakelin41@gmail.com', N'Biotecnología', NULL, NULL, N'F', 1, 1, NULL, 84865048, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3276, N'Jorge', N'Quirós', NULL, N'84116217', N'jorgequirosp@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 84116217, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3277, N'Marianna', N'Quirós', NULL, N'84171773', N'marianaquirosf@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 84171773, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3278, N'Evelyn', N'Quirós', N'Acuña', N'86939346', N'evyquiros.7@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 86939346, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3279, N'Jose', N'Quirós', N'Alpízar', N'89431800', N'rquiros20@hotmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89431800, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3280, N'Víctor', N'Quirós', N'Barquero', N'89547486', N'vic4443@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89547486, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3281, N'Grec', N'Quirós', N'Sanchez', N'89906837', N'gquiross07@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 89906837, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3282, N'Roberto', N'Ramírez', N'Alarcón', N'86884309', N'robertojose24@hotmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 86884309, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3283, N'Carlos', N'Ramírez', N'Cerdas', N'71050570', N'carlos19ramirez@hotmail.com', N'Administración en Tecnología de Información', NULL, NULL, N'M', 1, 1, NULL, 71050570, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3284, N'María', N'Ramírez', N'Delgado', N'86444192', N'maria271095@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 86444192, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3285, N'Rodolfo', N'Ramírez', N'Picado', N'86731092', N'cachirulito666@rocketmail.com', N'Otro', NULL, NULL, N'M', 1, 1, NULL, 86731092, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3287, N'Dessire', N'Retana', N'Astua', N'70180950', N'dessire.retanaa@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 70180950, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3288, N'Elvira', N'Retana', N'Fernàndez', N'88098586', N'elvisretana@gmail.com', N'Otro', NULL, NULL, N'F', 1, 1, NULL, 88098586, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3289, N'Alejandra', N'Retana', N'Piedra', N'19', N'aretanapiedra@hotmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 19, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3290, N'Ericka', N'Ríos', N'Zamora', N'83612836', N'eri.rios14@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 83612836, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3291, N'Irene', N'Rivera', N'Arrieta', N'89812235', N'betz.93@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 89812235, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3292, N'Isabo', N'Robles', NULL, N'61925442', N'isalein596@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 61925442, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3293, N'Bryan', N'Rodriguez', NULL, N'87440310', N'33bryan17@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 87440310, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3294, N'José Rodolfo', N'Rodríguez', NULL, N'84065549', N'jorodolfo03@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 84065549, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3295, N'Mauro', N'Rodriguez', NULL, N'85818923', N'maurorr94.rr@gmail.com', N'null', NULL, NULL, N'M', 1, 1, NULL, 85818923, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3296, N'Ricardo', N'Rodriguez', NULL, N'85143045', N'ricardo.18_4@yahoo.es', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 85143045, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3297, N'Javier', N'Rodriguez', N'Calvo', N'89759325', N'machojavi@live.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89759325, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3298, N'Nestor', N'Rodríguez', N'Castro', N'84190335', N'nestorrodriguezcastro@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 84190335, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3299, N'Andres', N'Rodriguez', N'Comandini', N'83191466', N'a.r.comandini@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 83191466, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3300, N'David', N'Rodriguez', N'Gomez', N'84482906', N'davidrogo@live.com', N'null', NULL, NULL, N'M', 1, 1, NULL, 84482906, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3301, N'Mariana', N'Rodríguez', N'Montero', N'85836887', N'marodzmo@hotmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 85836887, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3302, N'Bryan', N'Rodríguez', N'Murillo', N'89676145', N'bralib21@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89676145, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3303, N'Darío', N'Rodríguez', N'Obando', N'20', N'darior1227@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 20, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3304, N'Esteban', N'Rodríguez', N'Rodríguez', N'83915318', N'estrod04@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 83915318, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3305, N'José Joaquín', N'Rodríguez', N'Rojas', N'87061004', N'juaco2r@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87061004, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3307, N'Hector', N'Rodriguez', N'Ruiz', N'60617706', N'hectorr.0304@gmail.com', N'Otro', NULL, NULL, N'M', 1, 1, NULL, 60617706, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3308, N'Fabián', N'Rodríguez', N'Sáenz', N'87189470', N'brian_xd96@hotmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87189470, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3310, N'Daniela', N'Rojas', NULL, N'86430507', N'nanirojas25@hotmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 86430507, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3311, N'Karol', N'Rojas', N'Álvarez', N'83644343', N'krojas3092@gmail.com', N'null', NULL, NULL, N'F', 1, 1, NULL, 83644343, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3312, N'kevin', N'Rojas', N'Cubero', N'87475743', N'keanrocu1997@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87475743, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3313, N'Carlos Esteban', N'Rojas', N'Espinoza', N'88343830', N'carlos.rojas.es@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 88343830, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3314, N'Zamid', N'Rojas', N'Fonseca', N'87519632', N'zmd.vong19@gmail.com', N'Computación', NULL, NULL, N' ', 1, 1, NULL, 87519632, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3315, N'Álvaro', N'Rojas', N'Guerrero', N'87471018', N'varogue95@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87471018, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3317, N'Andrés', N'Rojas', N'Obando', N'84308355', N'arojasobando@hotmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 84308355, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3318, N'Angelet', N'Rojas', N'Prado', N'88523047', N'angeleth@hotmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 88523047, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3319, N'Rolando', N'Rojas', N'Valverde', N'83137516', N'rrvalverde15@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 83137516, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3320, N'Stephanie', N'Rojas', N'villafuerte', N'88625882', N'sdrojas94@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 88625882, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3321, N'María', N'Román', N'González', N'88665738', N'romanmariadelmar@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 88665738, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3323, N'Jenny', N'Romero', N'Boniche', N'83661413', N'jenboniche@gmail.com', N'Matemática', NULL, NULL, N'F', 1, 1, NULL, 83661413, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3324, N'Seydy', N'Roque', N'Granados', N'83530344', N'zehidyroqueg@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 83530344, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3325, N'María Teresa', N'Rosales', N'López', N'87660918', N'rosalestere@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 87660918, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3326, N'David', N'Roses', N'Maroto', N'87221412', N'david13roses@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87221412, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3327, N'Geronimo', N'Ruepert', NULL, N'87228819', N'gerorb11@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87228819, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3329, N'Luis Diego', N'Ruiz', N'Cordero', N'87537667', N'lruizcordero10@hotmail.es', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 87537667, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3330, N'Johan Joseph', N'Saborio', N'JImenez', N'88027186', N'josajiturismocr@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 88027186, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3331, N'Gabriel', N'Sáenz', N'González', N'88302837', N'gosaenz@hotmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 88302837, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3333, N'Daniela', N'Salas', N'Calvo', N'89626325', N'danisalasc17@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 89626325, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3334, N'Andrei', N'Salazar', NULL, N'89046292', N'triandrei@gmail.com', N'Administración en Tecnología de Información', NULL, NULL, N'M', 1, 1, NULL, 89046292, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3335, N'Andrés', N'Salazar', NULL, N'83168980', N'andresalbre@gmail.com', N'Computación', NULL, NULL, N'M', 1, 1, NULL, 83168980, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3336, N'Jefferson', N'Salazar', NULL, N'86131613', N'jeffersonsalazar88@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 86131613, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3337, N'Joseph', N'Salazar', N'Acuña', N'87108989', N'joshsa1197@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87108989, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3338, N'Keilyn', N'Salazar', N'Brenes', N'61278683', N'ksalazarbrenes@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 61278683, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3339, N'Osvaldo', N'Salazar', N'Cubero', N'89084885', N'osvaldosalazar5093@gmail.com', N'null', NULL, NULL, N'M', 1, 1, NULL, 89084885, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3340, N'Diego', N'Salazar', N'Sibaja', N'86232247', N'cariari12@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 86232247, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3341, N'Treicer', N'Salmeron', N'Quesada', N'89410594', N'eduardote1097@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89410594, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3342, N'María José', N'Sanabria', NULL, N'83095908', N'marijosq97@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 83095908, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3343, N'Daniel', N'Sanabria', N'García', N'70111718', N'daniel.97s@outlook.com', N'null', NULL, NULL, N'M', 1, 1, NULL, 70111718, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3344, N'Andrés', N'Sanabria', N'Picado', N'86016537', N'asanabria06@gmail.com', N'null', NULL, NULL, N'M', 1, 1, NULL, 86016537, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3345, N'Jorge', N'Sanchez', NULL, N'87145600', N'jore.sanchez146@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87145600, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3346, N'Daniel', N'Sánchez', N'Leiva', N'89626770', N'dsanchez698@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89626770, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3347, N'Kevin', N'Sandí', N'Cascante', N'70390949', N'ksandi27@hotmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 70390949, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3349, N'Emanuel', N'Sandoval', NULL, N'63163939', N'emanuelsandoval11698@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 63163939, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3350, N'Ileana', N'Sandoval', NULL, N'88013009', N'ilesc19@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 88013009, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3351, N'Denisse', N'Santamaría', N'Rojas', N'84349135', N'deniz.sr@hotmail.com', N'Biotecnología', NULL, NULL, N'F', 1, 1, NULL, 84349135, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3352, N'Deivid Stiven', N'Segura', N'Romero', N'88586406', N'deividssr@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 88586406, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3354, N'Massiel', N'Sequeira', NULL, N'86059985', N'massiesequeira@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 86059985, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3355, N'Arlin', N'Sequeira', N'Requenes', N'84436231', N'arlinseqreq@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 84436231, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3356, N'Maureen', N'Serrano', NULL, N'85828225', N'mauserram02@hotmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 85828225, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3357, N'Denis', N'Serrano', N'Alpízar', N'87865571', N'denisserrano2897@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 87865571, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3358, N'Susana', N'Sevilla', N'Soto', N'83629677', N'susanasevillasoto@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 83629677, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3359, N'JAIME', N'Solano', NULL, N'71116866', N'andreskin69@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 71116866, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3360, N'Zuricks', N'Solano', NULL, N'84501715', N'zuripss18@hotmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 84501715, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3361, N'Kimberly Gloriana', N'Solano', N'Azofeifa', N'88253405', N'kimberly.glori@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 88253405, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3362, N'Flor', N'Solano', N'Quesada', N'22', N'florn36@hotmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 22, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3363, N'Gabriela', N'Solano', N'Schosinsky', N'88787066', N'marigab23@hotmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 88787066, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3364, N'Emanuel', N'Solano', N'Zúñiga', N'89642069', N'emasolano@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89642069, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3365, N'Idania', N'Solis', NULL, N'88711166', N'idaniasm@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 88711166, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3366, N'Pablo', N'Solis', NULL, N'84886598', N'pa_so_que@hotmail.com', N'Biotecnología', NULL, NULL, N'M', 1, 1, NULL, 84886598, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3367, N'David', N'Solís', N'Martínez', N'88749011', N'cdavidsm13@gmail.com', N'null', NULL, NULL, N'M', 1, 1, NULL, 88749011, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3368, N'Martín', N'Solís', N'Salazar', N'83234483', N'martin12cr@yahoo.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 83234483, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3369, N'Roy', N'Solís', N'Sánchez', N'85275246', N'royxno308@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 85275246, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3370, N'Priscilla', N'Solórzano', NULL, N'89540150', N'pri.solorzano.perez@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 89540150, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3372, N'Arturo', N'Sotela', NULL, N'83758959', N'arturosl95@hotmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 83758959, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3373, N'Sebastian', N'Tencio', NULL, N'84078650', N'stencio@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 84078650, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3374, N'Rubén', N'Tencio', N'Monge', N'87705457', N'tenciomonge@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87705457, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3375, N'José', N'Trejos', N'Ramírez', N'84492489', N'pab10.trejos10@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 84492489, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3376, N'María', N'Ulate', NULL, N'61912423', N'angelesulate51@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 61912423, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3377, N'Luis', N'Ulate', N'Marin', N'83886265', N'luisulate2009@hotmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 83886265, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3378, N'Anthony', N'Ulloa', N'Acuña', N'86278834', N'anthonyulloa94@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 86278834, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3380, N'Pablo', N'Umaña', NULL, N'83099136', N'pablo.umana.miranda@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 83099136, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3381, N'Miller', N'Urbina', NULL, N'86965715', N'milleniumruiz@gmail.com', N'Administración en Tecnología de Información', NULL, NULL, N'M', 1, 1, NULL, 86965715, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3382, N'Luis', N'Ureña', NULL, N'83121692', N'luisure9@hotmail.con', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 83121692, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3383, N'MIlena', N'Ureña', N'Herrera', N'87208687', N'mile6616@gmail.com', N'Biotecnología', NULL, NULL, N'F', 1, 1, NULL, 87208687, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3384, N'Jorge Esteban', N'Usaga', N'Vargas', N'89250870', N'usaga24@gmail.com', N'null', NULL, NULL, N'M', 1, 1, NULL, 89250870, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3385, N'Ricardo', N'Valdez', N'Calderón', N'85998597', N'ravc50@outlook.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 85998597, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3386, N'Erick', N'Valerin', N'Ramirez', N'85907188', N'erifravalram@gmail.com', N'Matemática', NULL, NULL, N'M', 1, 1, NULL, 85907188, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3387, N'Daniela', N'Valerio', N'null', N'84787029', N'gdvc19@gmail.com', N'Administración en Tecnología de Información', NULL, NULL, N'F', 1, 1, NULL, 84787029, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3388, N'Carlos', N'Valerio', N'Méndez', N'85280790', N'cvalerio61@gmail.com', N'Computación', NULL, NULL, N'M', 1, 1, NULL, 85280790, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3389, N'Lopez', N'Valverde', NULL, N'72325821', N'joss1003@hotmail.es', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 72325821, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3390, N'Luis Fernando', N'Valverde', N'Segura', N'70300845', N'luisxemnaroth@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 70300845, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3391, N'Adriana', N'Valverde', N'Garita', N'86657030', N'avalverdegarita@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 86657030, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3392, N'Kimberly', N'Valverde', N'Hernández', N'70186466', N'kimvalverde96@hotmail.com', N'null', NULL, NULL, N'F', 1, 1, NULL, 70186466, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3393, N'Jose', N'Valverde', N'Pérez', N'89795560', N'jose67val@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89795560, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3394, N'Anthony Enrique', N'Valverde', N'Rojas', N'84327721', N'aevalverde.93@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 84327721, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3395, N'Brandon', N'Varela', N'Suarez', N'88495496', N'brandonvasu@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 88495496, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3396, N'Edison', N'Vargas', NULL, N'71106900', N'edisondecr@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 71106900, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3397, N'Oscar', N'Vargas', NULL, N'62458423', N'coco122794@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 62458423, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3400, N'Erick', N'Vargas', N'Barrantes', N'88561227', N'erick.itcr@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 88561227, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3401, N'Diana', N'Vargas', N'Bolaños', N'85231505', N'dianapalmares@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 85231505, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3402, N'Adriana', N'Vargas', N'Corrales', N'86137099', N'adri.var13@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 86137099, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3403, N'Bryan', N'Vargas', N'Fernández', N'86470737', N'bryanvargasf2110@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 86470737, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3404, N'Julian', N'Vargas', N'Garita', N'61606544', N'jul.vg98@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 61606544, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3405, N'Katherine', N'Vargas', N'Jiménez', N'88115474', N'vargaskatthy@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 88115474, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3406, N'Bryan', N'Vargas', N'Mora', N'62413778', N'bryanvm1897@gmail.com', N'Matemática', NULL, NULL, N'M', 1, 1, NULL, 62413778, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3408, N'Melanny Ariela', N'Vargas', N'Salas', N'85902598', N'melavargas2909@hotmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 85902598, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3409, N'Eva', N'Vargas', N'Solís', N'89410332', N'evesvaso06@gmail.com', N'Otro', NULL, NULL, N'F', 1, 1, NULL, 89410332, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3410, N'Sofia', N'Vega', NULL, N'89447810', N'Sofi.vega.c@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 89447810, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3412, N'David', N'Vega', N'Porras', N'24', N'davidvvpp1412@yahoo.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 24, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3413, N'Jeremy', N'Vega', N'Sánchez', N'89429922', N'jeremyvega711@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 89429922, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3414, N'Gustavo', N'Villalobos', NULL, N'87037191', N'tavocvn@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 87037191, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3415, N'Amanda', N'Villalobos', N'Jiménez', N'85504983', N'amandalucia94@gmail.com', N'Biotecnología', NULL, NULL, N'F', 1, 1, NULL, 85504983, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3416, N'Ángel Antonio', N'Villalobos', N'Peña', N'85040356', N'tony.villalobos96@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 85040356, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3417, N'Katerin', N'Villalobos', N'Peña', N'83468543', N'katydilanvp15@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 83468543, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3418, N'Edgar', N'Villalta', N'Coto', N'88034406', N'edgarvillaltacoto@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 88034406, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3419, N'William', N'Villavicencio', N'Quesada', N'87271010', N'wivike@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 87271010, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3420, N'Erick', N'Viquez', N'Brenes', N'85630828', N'emviquezbrenes@gmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 85630828, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3421, N'Mauro', N'Víquez', N'González', N'83046450', N'mauvi5@hotmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 83046450, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3422, N'Emerson', N'Víquez', N'Herrera', N'89606041', N'emersonvquez@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89606041, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3423, N'Julio Antonio', N'Viquez', N'Murillo', N'89888074', N'jviquez2@gmail.com', N'Computación', NULL, NULL, N'M', 1, 1, NULL, 89888074, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3424, N'María', N'Zeledón', N'Rivera', N'87031388', N'milarive11@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 87031388, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3425, N'Eugenia', N'Zúñiga', NULL, N'25', N'eugeniazs2323@gmail.com', N'Administración de Empresas', NULL, NULL, N'F', 1, 1, NULL, 25, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3426, N'Benjamin', N'Zuñiga', N'Arrieta', N'88889791', N'dilier@hotmail.com', N'Administración de Empresas', NULL, NULL, N'M', 1, 1, NULL, 88889791, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3427, N'Sebastian', N'Zuniga', N'Brenes', N'86793239', N'aszb22@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 86793239, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3431, N'Jose Miguel', N'Zuñiga', N'Picado', N'89639059', N'josegtir@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 89639059, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3432, N'María', N'Zúñiga', N'Rodríguez', N'87116709', N'alema1895@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 87116709, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3433, N'Betzabé', N'Zúñiga', N'Sancho', N'86154166', N'betzazuniga.ingmateriales@gmail.com', N'Ingeniería', NULL, NULL, N'F', 1, 1, NULL, 86154166, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3434, N'David Filaldelfo', N'Zuñiga', N'Serrano', N'87050898', N'd14041995@gmail.com', N'Ingeniería', NULL, NULL, N'M', 1, 1, NULL, 87050898, NULL, NULL, NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3436, N'Carlos', N'Murillo', N'Barrios', N'207640192', N'pri_rwc@hotmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 50131129, 2, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3437, N'Valeria ', N'Acuna', N'Ramirez', N'115170248', N'va.acuna.r@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 24, 87657920, 4, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3438, N'Esteban', N'Flores', N'Aguilar', N'115790439', N'esteban.flores94@gmail.com', N'Ingenieria', N'Costa Rica', N'', N'M', 1, 0, 23, 89911208, 0, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3439, N'Elizabeth', N'Mendez', N'Hidalgo', N'116000445', N'elizabethmh26@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 23, 72113534, 5, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3440, N'Katherine', N'Vega', N'Mora', N'304740620', N'kpvm1993@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 23, 87890355, 6, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3441, N'adan', N'mora', N'viales', N'114920684', N'adnmovi@gmail.com', N'Ingenieria', N'Costa Rica', N'Maestria', N'M', 1, 1, 25, 86262430, 1, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3442, N'Kenneth', N'Laurent', N'Alvarado', N'604300062', N'kennethlaurent@hotmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 83105991, 4, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3443, N'Isela', N'Murillo', N'Ugalde', N'207410032', N'imurillougalde@gmail.com', N'Otra', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 22, 87429957, 5, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3444, N'Andres', N'Gutierrez', N'Salas', N'115280816', N'andreguti333@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 24, 86149497, 3, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3445, N'Rebeca', N'Madriz', N'Romero', N'304820492', N'rebemadriz.r@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 22, 60909939, 5, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3446, N'Oscar', N'Araya', N'Carballo', N'7169425', N'scar240@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 31, 88242254, 5, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3447, N'marco', N'arias', N'barrantes', N'0113450573', N'marcoab88@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 29, 72054025, 5, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3448, N'Sofia', N'Bonilla', N'Ruiz', N'117220197', N'sofybon8@hotmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 19, 70118275, 1, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3449, N'Viviana', N'Moya', N'Fernandez', N'304520513', N'vivicofdz@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 25, 89154864, 6, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3450, N'Andrés', N'Urenna', N'Villalobos', N'114880237', N'afurvi@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 25, 84663749, 6, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3451, N'Yisley', N'Granados', N'Chaves', N'111240762', N'yisleygranadosch@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 35, 89976594, 1, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3452, N'Oscar', N'Ulate', N'Alpizar', N'207260577', N'oscarjosue94@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 23, 87114535, 4, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3453, N'Mainor', N'Lizano', N'Jimenez', N'207140036', N'mainorg.19@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 24, 89490442, 6, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3454, N'Monserrath', N'Vega', N'Cardenas', N'115920856', N'monserratvega21@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 22, 83377843, 5, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3455, N'José Pablo', N'Delgado', N'Navarro', N'116640470', N'jp2996@hotmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 87204003, 2, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3456, N'Silvia Paola', N'Leiton', N'Elizondo', N'207240774', N'silvialeitonelizondo@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 23, 89889179, 4, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3457, N'Alexa', N'Moya', N'Morales', N'115650567', N'alitamcr@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 23, 89284903, 3, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3458, N'Priscilla', N'Gonzalez', N'Calderon', N'116730438', N'prisgc29@gmail.com', N'Ciencias Sociale', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 20, 88082222, 2, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3459, N'Anderson', N'Jimenez', N'Bonilla', N'305090779', N'ander.02.5.98@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 19, 87077539, 2, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3461, N'Pablo', N'Tencio', N'Cascante', N'116030197', N'Pablotencio95@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 22, 87684541, 4, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3462, N'Carla', N'Aguilar', N'Cruz', N'207470588', N'kaguilaruz@gmail.com', N'Otra', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 21, 86867262, 4, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3463, N'Maria Fernanda', N'Avila', N'Marin', N'116430270', N'mariafer50121@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 21, 83783876, 2, N'2017-08-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3464, N'James', N'Leon', N'Herrera', N'17080548', N'jaleonh11@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 19, 60747351, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3465, N'Gabriel', N'Fernandez', N'Vicente', N'115730339', N'gabofdz@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 23, 89820973, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3466, N'María Fernanda', N'Monge', N'Vargas', N'304790364', N'mafemova2094@gmail.com', N'Otra', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 23, 87333971, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3467, N'Juan', N'Vasquez', N'Alfaro', N'207590419', N'vasquez-12@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 20, 86119185, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3468, N'Karol', N'Munoz', N'Hernandez', N'604320646', N'karomu.her@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 21, 87605821, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3469, N'Mauro', N'Artavia', N'Benavides', N'115750530', N'mauroartavia1994@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 23, 71525543, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3470, N'Kimberly', N'Valverde', N'Hernandez', N'116520311', N'kijulivalverde@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 20, 60181996, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3471, N'Diana', N'hidalgo', N'Jara', N'115890745', N'dianaflores371@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 22, 86286023, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3472, N'Hanniel', N'Leon', N'Torres', N'402240535', N'hanniel9415@gmail.com', N'Otra', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 86400845, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3473, N'Karina', N'Rodriguez', N'Alfaro', N'402270925', N'karyra7@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 22, 83455206, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3474, N'Paula', N'Rodriguez', N'Perez', N'116310189', N'rodriguezpaula.p@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 21, 85559143, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3475, N'Mariam', N'Jimenez', N'Gutierrez', N'115700087', N'mariihjimenez@gmail.com', N'Ingenieria', N'Colombia', N'Licenciatura', N'F', 1, 1, 23, 88169758, 5, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3476, N'Jose Adrian', N'Castro', N'Ruiz', N'116210079', N'gemelo1331@hotmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 86280154, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3477, N'Luis Diego ', N'Leon', N'Segura', N'304990088', N'luisdiego1996@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 86516091, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3478, N'Enrique', N'Hernandez', N'Bonilla', N'116020184', N'quique04.95@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 83428000, 5, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3479, N'Daniela', N'Jimenez', N'Escude', N'115960161', N'Danielajimenezescude@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 22, 89502517, 5, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3480, N'Mariam', N'Cordero', N'Jimenez', N'402250952', N'mari2695@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 22, 84901777, 5, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3481, N'Derick', N'Ramirez', N'Portocarrero', N'115660675', N'derick9405@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 23, 85394055, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3482, N'Rebeca', N'Corrales', N'Brenes ', N'116050884', N'becki.corrales2595@gmai.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 22, 62871633, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3483, N'Maria', N'Porras', N'Mondol', N'117340953', N'mariaporrasmondol@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 18, 85669168, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3484, N'Daniela ', N'Maroto', N'Calderón ', N'304830247', N'dannymc0694@hotmail.es', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 22, 86399015, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3485, N'Roy', N'Lizano', N'Otarola', N'604270826', N'roy_12liz@hotmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 87851958, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3486, N'Michael', N'Granados', N'Menani', N'116570483', N'migramenani@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 88092111, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3487, N'María Jesús', N'Rodriguez', N'Zuniga', N'207450189', N'rodriguezmariajesus03@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 21, 84076865, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3488, N'Axel', N'Porras', N'Segura', N'116240660', N'axel1795@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 89979089, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3489, N'Yendry', N'Diaz', N'Solis', N'304890267', N'yenmari11@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 21, 86179000, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3490, N'Romell', N'Melendez', N'Soto', N'115950722', N'rms2295@gmail.com', N'Ingenieria', N'Costa Rica', N'Tecnico', N'M', 1, 1, 22, 85943608, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3491, N'Andres', N'Arias', N'Corrales', N'116930478', N'afac97@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 19, 83085910, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3492, N'Melissa', N'Calderon', N'Chinchilla', N'115260912', N'meliangelvw@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 24, 87964185, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3493, N'Andres', N'Salazar', N'Navarro', N'604380338', N'jasn4558@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 20, 88257984, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3494, N'Juan', N'Escalante', N'Karr', N'117190198', N'escalantekarrjuanjose@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 19, 86258542, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3495, N'Carolina', N'Gamboa', N'Picado', N'116400701', N'carogampi4@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 83215470, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3496, N'Diana', N'Zuniga', N'DAvanzo', N'304970568', N'diana031096@yahoo.es', N'Otra', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 20, 84228905, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3497, N'Dagoberto', N'Rojas', N'Juarez', N'504100316', N'Krojas96ce@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 87660519, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3498, N'Anthony', N'Méndez', N'Sánchez', N'305000658', N'amendezsan67@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 18, 61281234, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3499, N'Carolina', N'Villegas', N'Caligara', N'115870407', N'ccaligara7@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 22, 86241352, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3500, N'Cristian', N'Vargas', N'Abarca', N'116790514', N'Christiandva97@hotmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 86613023, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3501, N'Ignacio', N'Gomez', N'Chaverri', N'115990234', N'nacho_budokay@hotmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 22, 83173260, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3502, N'Kevin', N'Rojas', N'Cubero', N'116940473', N'kevinrojas1@hotmail.es', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 19, 87475743, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3503, N'Nickolas', N'Rodriguez', N'Cordero', N'305000397', N'nickolasrc7@live.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 20, 86269324, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3504, N'Jean', N'Moreno', N'Fuentes', N'801090152', N'jcarlos97@hotmail.es', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 20, 84361464, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3505, N'Carlos', N'Coto', N'Rodriguez', N'115230611', N'carlos.coto8@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 24, 87509817, 6, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3506, N'Jose Andres', N'Barboza', N'Gonzalez', N'207600470', N'jose.andresbg@gmail.com', N'Otra', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 20, 87428504, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3507, N'Fernando', N'Corrales', N'Quiros', N'115260455', N'fernandocq9@hotmail.com', N'Otra', N'Costa Rica', N'Tecnico', N'M', 1, 1, 24, 85638982, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3508, N'Fabiola', N'Leandro', N'Valverde', N'304870356', N'fabileandro16@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 22, 83206907, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3509, N'Ariana ', N'Sanabria', N'Garcia', N'116300067', N'asanabriag17@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 21, 86501279, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3510, N'Natalia', N'Martinez', N'Mendoza', N'148400222324', N'n98martinez@gmail.com', N'Ciencias Economicas', N'Mexico', N'Bachillerato', N'F', 1, 1, 18, 60481816, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3511, N'Carlos', N'Boschini', N'Castillo', N'117110622', N'boschini.98@hotmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 19, 87189369, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3512, N'Yorlan', N'Azofeifa', N'Delgado', N'116330280', N'yorazo1296@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 21, 61920786, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3513, N'Gabriel', N'Quiros', N'Obando', N'304940782', N'gabrielquiros10@gmail.com', N'Otra', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 21, 85941459, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3514, N'Ana', N'Rojas', N'Madrigal', N'116900390', N'anaisa.rmadrigal@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 20, 85433948, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3515, N'Angie', N'Bejarano', N'Gomez', N'304980580', N'pamelabej3010@gmail.com', N'Ingenieria', N'Costa Rica', N'Tecnico', N'F', 1, 1, 20, 89086125, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3516, N'Gabriela', N'Solano', N'Schosinsky', N'117150220', N'marigab23@hotmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 19, 88787066, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3517, N'Santiago ', N'Castro', N'Gomez ', N'115710577', N'castrosantiago0570@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 23, 89072424, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3518, N'Maria Jose', N'Vargas', N'Mendez', N'117480711', N'maria99j@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 18, 85334013, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3519, N'Ariel', N'Rodriguez', N'Jimenez', N'402310851', N'arieli13.10@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 21, 86995525, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3520, N'Esteban ', N'Fernandez', N'Rivera', N'304590748', N'esfernandez92@cmail.com', N'Ciencias Economicas', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 25, 84516403, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3522, N'Felipe ', N'Mora', N'Cordero', N'207770481', N'felomora@hotmail.es', N'Ciencias Economicas', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 19, 88155512, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3523, N'Valeria', N'Barquero', N'Vargas', N'117080310', N'valeriabarquero966@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 19, 84089803, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3524, N'Andres', N'Roman', N'Quiros', N'207750353', N'aromqui19@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 19, 86145918, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3525, N'Andres', N'Miranda', N'Arias', N'116220523', N'andres.mirandaarias@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 21, 87078389, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3526, N'Blanca Rosa', N'Mata', N'Villalta', N'503650632', N'blankis88@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 29, 88194103, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3527, N'Anthony', N'Cascante', N'Quiros', N'305030884', N'rafant2097@gmail.com', N'Otra', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 20, 86806741, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3528, N'Sebastián', N'Quesada', N'Vargas', N'117670043', N'sebasqusada13@gmail.com', N'Otra', N'Costa Rica', N'Otro', N'M', 1, 1, 17, 84125936, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3529, N'Valeria', N'Lacayo', N'Barquero', N'117360353', N'valerialacayo@hotmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 18, 83355684, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3530, N'Ana Maria', N'Gonzalez', N'Saborio', N'115820468', N'anni.gonz@gmail.com', N'Ciencias Sociale', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 22, 87393699, 6, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3531, N'Sergio', N'Fonseca', N'Segura', N'116640565', N'sergio.fonseca2712@hotmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 86294264, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3532, N'Priscilla', N'Rivera', N'Avila', N'116630530', N'maryprira@hotmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 20, 60694433, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3533, N'Ricardo', N'Bonilla', N'Mendez', N'115060007', N'rowoski@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 26, 88736003, 5, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3534, N'Alessandro', N'Rodriguez', N'Rojas', N'305080020', N'Alessandro-josue@hotmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 60418974, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3535, N'Katherine', N'Fallas', N'Rojas', N'117490594', N'kathfr22@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 18, 72058104, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3536, N'Daniela', N'Castro', N'Rodriguez', N'402430083', N'danicastro582@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 18, 86268784, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3537, N'Bruce', N'Chung', N'Ulloa', N'116530995', N'brucechungulloa@outlook.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 20, 72954444, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3538, N'Denice', N'Aguero', N'Barrientos', N'115300697', N'niciaguero@hotmail.com', N'Ingenieria', N'Costa Rica', N'Otro', N'F', 1, 1, 24, 86421025, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3539, N'Daniela', N'Calvo', N'Villalta', N'117180029', N'dani16_29@hotmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 19, 83447721, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3540, N'Jose Gabriel', N'Esquivel', N'Pereira', N'304920487', N'gabrielesquivelpereira@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 21, 72041483, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3541, N'Mariana', N'Mora', N'Valenciano', N'117200734', N'maricrpz10@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 18, 87069252, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3542, N'Steven', N'Rojas', N'Cubero', N'207870606', N'stevenrojascubero@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 18, 60130073, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3543, N'Sebastian', N'Leon', N'Carvajal', N'117280130', N'Sebaslc4@hotmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 18, 86281314, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3544, N'Marco', N'Gomez', N'Salas', N'116730759', N'marcoleandro14@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 20, 88965739, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3545, N'Marcelo', N'Coto', N'Rodriguez', N'116660203', N'Cotomarcelo22@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 72954408, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3546, N'Jose', N'Elizondo', N'Medina', N'604340724', N'josefem@hotmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 89265276, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3547, N'Daniel', N'Mata', N'Sanchez', N'2017076429', N'danielmatasanchez@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 18, 86321275, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3548, N'Esteban', N'Esquivel', N'Barboza', N'116920820', N'eadan97@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 19, 61354759, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3549, N'Juan José', N'Varela', N'Calderon', N'304830034', N'juanjovc23@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 87354485, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3550, N'Jordan', N'Zuniga', N'Gutierrez', N'116040743', N'jjzuniga23@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 61485385, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3551, N'Carolina ', N'Robles', N'Uribe', N'115800962', N'carolina.310894@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 22, 83097614, 5, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3552, N'Andrés', N'Madrigal', N'Vargas', N'115940312', N'amadrigal1001@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 87952301, 5, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3553, N'Catalina', N'Nunez', N'Alvarez', N'304310374', N'canual1@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 28, 85806242, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3554, N'Arturo', N'Blanco', N'Naranjo', N'304900762', N'turobn1995@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 85672596, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3555, N'Luis', N'Zuniga', N'Zuniga', N'402370583', N'Lezuniga98@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 19, 87425586, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3556, N'Yessica', N'Rivera', N'Soto', N'305020213', N'yessica04597@gmail.com', N'Ciencias Sociale', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 20, 85278714, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3557, N'Stephanie Estrella ', N'Ubau ', N'Piedra', N'115540271', N'ubau185@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 23, 86262676, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3558, N'María Celeste', N'Monge', N'Naranjo', N'305050378', N'maceleste.monge@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 19, 85587630, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3559, N'MarieJose', N'Morales', N'Granados', N'505110182', N'mariajosemoralesgranados@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 19, 87913705, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3560, N'Allan', N'Gonzalez', N'Villalobos', N'117160504', N'aljo98govi@live.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 19, 89440171, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3561, N'Angie', N'Cerdas', N'Morales', N'305100858', N'angielena25@hotmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 19, 86262582, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3562, N'Carlos', N'Roman', N'Rodriguez', N'305070976', N'cmrr270198@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 19, 87117649, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3563, N'Bruno', N'Sardi', N'Villalobos', N'115530020', N'Brunos.v@hotmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 23, 86059136, 6, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3564, N'Daniel', N'Estrada', N'Hernandez', N'304970936', N'dan20oct@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 72495461, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3565, N'Maria', N'Montero', N'Brenes ', N'117270252', N'mariajosemonterob@gmail.com', N'Otra', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 18, 60160118, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3566, N'Ronny', N'Zarate', N'Ferreto', N'113790573', N'ronnyzarate@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 28, 87023131, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3567, N'Michael', N'Gonzalez', N'Vega', N'115790958', N'michgv94@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 23, 86613443, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3568, N'Valeria', N'Solano', N'Cordero', N'305080248', N'98213v@gmail.com', N'Ingenieria', N'Costa Rica', N'Otro', N'F', 1, 1, 19, 86196711, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3569, N'Gabriela', N'Avila', N'Quesada', N'207240700', N'magaby.tec@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 23, 83158898, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3570, N'Nathan', N'Castillo', N'Coto', N'116730316', N'nat.cas01@gmail.cin', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 20, 70162833, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3571, N'Daniel', N'Cortes', N'Navarro', N'305190615', N'Cortes838@hotmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 18, 87010230, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3572, N'Luis', N'Picado', N'Valverde', N'304930292', N'lfpicado96@gmail.com', N'Otra', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 21, 85188023, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3573, N'Diego', N'Povedano ', N'Rivas', N'117640419', N'Dapovedano99@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 17, 71048379, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3574, N'Camila', N'Gomez', N'Molina', N'402310029', N'camilagm994@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 21, 84189316, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3575, N'Junior ', N'Loza', N'Peralta ', N'117100331', N'junniorlozaperalta@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 19, 62189871, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3576, N'Francini', N'Solorzano', N'Diaz', N'702430518', N'fsd9696@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 21, 85356859, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3577, N'David', N'Solorzano', N'Pacheco', N'207890637', N'david.jose.0503@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 18, 61386062, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3578, N'MARIA', N'CORTES', N'ARIAS', N'702470997', N'MARCORARI96@GMAIL.COM', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 20, 85337903, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3579, N'Eugenia', N'Carrillo', N'Cardenas', N'116610407', N'eucarrilloc@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 20, 83938700, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3580, N'Tamara', N'Rojas', N'Mendez', N'901080507', N'tamyrome25@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 19, 87863003, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3581, N'Ronny', N'Ramirez', N'Sanchez', N'116330146', N'rramirez3094@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 71147923, 5, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3582, N'Adrian ', N'Jimenez', N'Calderon', N'117570843', N'qadrianjimenez@gmail.com', N'Ingenieria', N'Costa Rica', N'Doctorado', N'M', 1, 1, 17, 86624704, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3583, N'Megan', N'Miller', N'Brown', N'117540914', N'megmillerbrown@gmail.com ', N'Ciencias Sociale', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 17, 72083455, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3584, N'Geovanny', N'Espinoza', N'Quiros', N'116050598', N'a.espqui@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 87568227, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3585, N'Alfredo', N'Marrero', N'Viquez', N'304630092', N'bernardo.marreroviquez@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 25, 86814685, 6, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3586, N'Olger Luis', N'Araya', N'Morera', N'114510522', N'oaraya16@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 26, 83357955, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3587, N'Arleth', N'Porras', N'Granados', N'604280006', N'avporras.08@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 21, 61908547, 5, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3588, N'Byron', N'Vargas', N'Mendez', N'115750986', N'byron8vargas@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 23, 61388184, 5, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3589, N'Leonard', N'Bonilla', N'Gregory', N'304870535', N'kleonard.bonilla@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 22, 86024938, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3590, N'Gabriela', N'Morales', N'Murillo', N'207560980', N'gab.mo09@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 20, 87128648, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3591, N'Michael', N'Pao', N'Meza', N'155816262727', N'mpao94@gmail.com', N'Ciencias Sociale', N'Otro Latinoamericano', N'Bachillerato', N'M', 1, 1, 22, 60375636, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3592, N'Karlton', N'Hall', N'Mora', N'116630599', N'karltonhall12@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 85796939, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3593, N'Andrey', N'Calvo', N'Montoya', N'115620234', N'andreycalvo10@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 23, 85509154, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3594, N'Cristopher', N'Vega', N'Araya', N'304970249', N'alejandrovear09@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 20, 61342817, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3595, N'Matías José', N'Blanco', N'León', N'116410465', N'matiblanco141@hotmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 88802460, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3596, N'Angelo', N'Isaac', N'Bonilla', N'117110081', N'angeloibcr@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 19, 87024333, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3597, N'Seydy', N'Roque', N'Granados', N'30410519', N'zehidyroqueg@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 31, 83530344, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3598, N'Mario', N'Delgado', N'Vargas', N'115360733', N'mario.alberto.365@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 24, 88759872, 5, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3599, N'Jessica', N'Vega', N'Fernandez', N'305080794', N'Jessivega163@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 20, 71022698, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3600, N'Sergio', N'Solorzano', N'Alfaro', N'117170433', N'sergiosolorzanoalfaro@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 19, 87745086, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3601, N'Kenneth', N'Corrales', N'Lizano', N'116560429', N'kcorrales33@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 89834843, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3602, N'Alonso Jose', N'Lopez', N'Serrano', N'304790003', N'aljolose2@gmail.com', N'Ciencias Agroalimentarias', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 23, 85802378, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3603, N'sloder', N'arguedas', N'perez', N'702660727', N'arguedassloder.sa@gmail.com', N'Educacion', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 18, 61653008, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3604, N'John', N'Hernandez', N'Sanchez', N'402280109', N'jhs1252@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 83736993, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3605, N'Maria', N'Fernandez', N'Romero', N'304890586', N'marijo_ferome@hotmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 21, 83219385, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3606, N'Carlos', N'Saenz ', N'Gonzalez ', N'30478008', N'crsaenz07@gmail.com ', N'Ingenieria', N'Costa Rica', N'', N'M', 1, 0, 23, 89245789, 0, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3607, N'Alejandro', N'Gutierrez', N'Solano', N'304860660', N'alejandrogutierrez616@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 22, 84450471, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3608, N'Manuel', N'Bojorge', N'Araya', N'304440643', N'duendenener@gmail.com', N'Otra', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 27, 84926004, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3609, N'Daniel', N'Brenes', N'Navarro', N'116670032', N'dabn424@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 86467898, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3610, N'Jonathan', N'Torres', N'Acuna', N'205180276', N'jonathanjta@live.com', N'Ingenieria', N'Costa Rica', N'Otro', N'M', 1, 1, 18, 60160542, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3611, N'Jorge Esteban', N'Lizano', N'Roldan', N'115700964', N'jorgelizano94@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 23, 83022998, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3612, N'Sofia', N'Molina', N'Brenes', N'116990897', N'sofimoli65cs@hotmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 19, 83011819, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3613, N'Oscar', N'Porras', N'Chacon', N'116680479', N'taticadios@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 84906149, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3614, N'Juan ', N'Lopez', N'Rojas', N'901120699', N'juanfylopez12@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 18, 85152893, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3615, N'Ariadna', N'Alvarado', N'Chavarria', N'402210071', N'arriadna-10@hotmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 23, 84982939, 5, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3616, N'Mariana', N'Jarquin', N'Saenz', N'117540520', N'angelm.j.s@live.com', N'Otra', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 17, 84050618, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3617, N'Beatriz', N'Vega', N'Funes', N'304980599', N'beatriz.vega2910@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 20, 61789065, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3618, N'Stephanie', N'Diaz', N'Valverde', N'115900018', N'stephaniediazv@hotmail.com', N'Otra', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 22, 70635543, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3619, N'Dago', N'Amador', N'Martinez', N'304350228', N'dago01amador@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 28, 87390234, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3620, N'Christopher', N'Casasola', N'Urena', N'702420535', N'casasola881@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 72310508, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3621, N'Jose Ernesto', N'Quesada', N'Bonilla', N'305010180', N'jose_qb12@hotmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 20, 88516285, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3622, N'Fabrizio', N'Lazo', N'Rojas', N'115950632', N'falaro1@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 22, 89816564, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3623, N'Carolina', N'Jimenez', N'Vargas', N'207740937', N'jvcaro1998@gmail.com', N'Letras', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 19, 62326241, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3624, N'María Laura', N'Molina', N'Cordero', N'305200214', N'marialau.8@hotmail.com', N'Ciencias Sociale', N'Colombia', N'Bachillerato', N'F', 1, 1, 17, 86143655, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3625, N'Alexander', N'Castro', N'Lara', N'155824226720', N'alexandercl.mas@gmail.com', N'Ingenieria', N'Otro Latinoamericano', N'Licenciatura', N'M', 1, 1, 19, 89563921, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3626, N'Alejandro', N'Varela', N'Fonseca', N'402380214', N'varela.ale33@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 19, 86162784, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3627, N'Alexander', N'Picado', N'Ledezma', N'109610594', N'alesspicado@hotmail.com', N'Ingenieria', N'Costa Rica', N'Tecnico', N'M', 1, 1, 40, 8361787, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3628, N'Jose', N'Ruiz', N'Jara', N'116480957', N'joruiz@ic-itcr.ac.cr', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 21, 60064810, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3629, N'John', N'Largaespada', N'Perez', N'901270149', N'jolape04@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 25, 87328618, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3630, N'Brenda', N'Zuniga', N'Reyes', N'604500045', N'brendiszr@hotmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 18, 89707923, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3631, N'Ashley', N'Piñeiro', N'Conejo', N'207790305', N'ashleypc0598@live.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 19, 86174786, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3632, N'Guillermo', N'Avila', N'Chaves', N'207470117', N'gach151195@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 62959193, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3633, N'Alvaro ', N'Villalobos', N'Campos', N'604230480', N'alvarovica35@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 84134336, 5, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3634, N'Ignacio', N'Mora', N'Jimenez', N'207810941', N'ignacimo98@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 19, 86640751, 2, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3635, N'Sofía', N'Zuniga', N'Campos', N'304780656', N'sofiazcampos23@gmail.com', N'Otra', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 24, 88917544, 5, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3636, N'Marian', N'Rodriguez', N'Soto', N'304870357', N'marii16rs@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 22, 83034970, 5, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3637, N'LuisDiego', N'Aguilar', N'Acunnia', N'115890273', N'luiscosconta@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 22, 89352903, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3638, N'Albin', N'Mora', N'Valverde', N'116160963', N'albin.moravalverde@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 88655613, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3639, N'Veronica', N'Vargas', N'Mora', N'114560725', N'veronikamvm@gmail.com', N'Otra', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 26, 85385773, 5, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3640, N'Fabiola', N'Jimenez', N'Arias', N'115710399', N'fabiola2694@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 23, 70757517, 6, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3641, N'Jonathan', N'Paez', N'Padilla', N'114730305', N'jonapaez@live.com', N'Ingenieria', N'Costa Rica', N'Otro', N'M', 1, 1, 25, 86838491, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3642, N'Erick', N'Carballo', N'Porras', N'116500754', N'ercp0823@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 87521888, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3643, N'Mariana', N'Solano', N'Arevalo', N'117300687', N'msol0998@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 18, 88331376, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3644, N'Jonathan', N'Canizales', N'Gomez', N'116000048', N'jon.canizales1995@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 22, 83142618, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3645, N'Andrey', N'Sanchez', N'Delgado', N'116380293', N's.4ndrey@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 21, 84371692, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3646, N'Adrian', N'Sanchez', N'Anderson', N'304780391', N'adrian_sa12@outlook.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 23, 86110700, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3647, N'Eddie', N'Gomez', N'Serrano', N'115450221', N'geddiesoj@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 23, 86187410, 4, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3648, N'Alonso', N'Montero', N'Marin', N'117370394', N'alonso.monterom61@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 18, 89301253, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3649, N'Jose', N'Sanchez', N'Moreno', N'117010792', N'Josdsm27@hotmail.es', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 19, 85469875, 3, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3650, N'Sofia', N'Brenes', N'Piza', N'117530611', N'sofia.brenes.piza@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 18, 83824439, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3651, N'Jonathan', N'Vallejos', N'Salazar', N'603380455', N'vallejosforestal@gmail.com', N'Ingenieria', N'Costa Rica', N'', N'M', 1, 0, 33, 89921024, 0, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3652, N'Vinicio', N'Mora', N'Herrera', N'604100900', N'viniciomor@gmail.com', N'Otra', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 24, 89117853, 6, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3653, N'Maria', N'Zeledon', N'Rivera', N'117170861', N'milarive11@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Otro', N'F', 1, 1, 19, 87031388, 1, N'2017-08-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3654, N'Andrea', N'Obando', N'Arriola', N'503880505', N'aobandoa192@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 25, 84693196, 6, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3655, N'Diana', N'Cordero', N'Perez', N'117530523', N'diana-pao24@hotmail.com', N'Ingenieria', N'Costa Rica', N'Otro', N'F', 1, 1, 18, 70171695, 1, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3656, N'Adrian', N'Alfaro', N'Hernandez', N'116780383', N'adrianalfaro97@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 85795608, 3, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3657, N'Ruben', N'Tencio', N'Monge', N'115810145', N'tenciomonge@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 87705457, 5, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3658, N'José Andrés', N'Chaves', N'Williams', N'117330588', N'Joseandreschw21@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 18, 87224199, 2, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3659, N'Brenda', N'Coto', N'Valverde', N'304910081', N'Brenda9525@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 21, 71703252, 1, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3660, N'Kevin', N'Matamoros', N'Serrano', N'504050127', N'k.andres0620@gmail.com', N'Ciencias Sociale', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 60574185, 3, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3661, N'Stuart', N'Leon', N'Aguilar', N'116290391', N'sleon230696@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 88791040, 4, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3662, N'Genesis ', N'Guevara', N'Fallas', N'304780851', N'genegueva94@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 23, 84242437, 3, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3663, N'Luis', N'Ramirez', N'Gonzalez', N'305000554', N'l.d.r.g122@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 20, 83032324, 3, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3664, N'Alejandro', N'Diaz', N'Pereira', N'402410587', N'diaza913@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 18, 86015474, 1, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3665, N'Sandro', N'Ugalde', N'Rojas', N'205860986', N'zhandrougalde@hotmail.com', N'Ciencias Economicas', N'Costa Rica', N'Maestria', N'M', 1, 1, 33, 72258312, 1, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3666, N'Yadir', N'Vega', N'Espinoza', N'504130866', N'vegayadi96@gmail.com', N'Educacion', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 64513348, 2, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3667, N'Andrea', N'Vargas', N'Quiros', N'117470367', N'anvaquico@gmail.com', N'Ciencias Basicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 18, 89607450, 1, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3668, N'Alberto', N'Sandi', N'Ibarra', N'702620505', N'joseasi2003@hotmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 18, 83311056, 2, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3669, N'Luis', N'Perez', N'Jimenez', N'115850096', N'luisdiegop94@gmail.com', N'Ciencias Agroalimentarias', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 87694733, 4, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3670, N'Marlon', N'Gudino', N'Salas', N'115970771', N'nmarlongudino@gmail.com', N'Ciencias Basicas', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 60440709, 5, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3671, N'Maria Fernanda', N'Navarro', N'Avalos', N'115550715', N'mf.na0@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 23, 88853945, 5, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3672, N'Daniel', N'Brenes', N'Quiros', N'304560143', N'danybre@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 25, 88061422, 1, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3673, N'diego', N'solano', N'delgado', N'304900228', N'diegosolano95.d@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 86578743, 6, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3674, N'Valeria', N'Alfaro', N'Diaz', N'116670510', N'Valealfaro8297@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 20, 86359764, 4, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3675, N'Giancarlo', N'Jimenez', N'Montalban', N'901110183', N'giancarlojimenez@99.com', N'Otra', N'Costa Rica', N'Tecnico', N'M', 1, 1, 18, 71022008, 1, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3676, N'Daniel', N'Castro', N'Vargas', N'117270818', N'danielcreador@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 18, 85292688, 1, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3677, N'Edwin', N'Segura', N'Salas', N'20770569', N'andressegsal@gmail.com', N'Otra', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 19, 85434558, 2, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3678, N'Veronica', N'Brenes', N'Benzoni', N'116650530', N'vero.brenes23@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 20, 71105621, 3, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3679, N'Debbie', N'Benavides ', N'Zúñiga ', N'901100254', N'devic05@hotmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 19, 72296299, 2, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3680, N'Karina', N'Martinez ', N'Guerrero', N'117110372', N'Karinamguerrero98@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 19, 88061341, 1, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3681, N'Veronica', N'Cespedes', N'Gutierrez', N'117540859', N'verocespede@hotmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 17, 85402008, 1, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3682, N'Jose', N'Gutierrez', N'Garita', N'304920504', N'jose07-12@hotmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 21, 89478966, 2, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3683, N'Jasson', N'Rodriguez', N'Mendez', N'207820951', N'jassonrm@icloud.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 18, 89719489, 1, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3684, N'Karolina', N'Batista', N'Guzman', N'116910186', N'kbg2597@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 19, 87310867, 3, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3685, N'Allan', N'Rodriguez', N'Coto', N'115990009', N'arc60023@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 83837135, 4, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3686, N'Jorge', N'Duran', N'Blanco', N'115620849', N'eduran2807@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 24, 87881033, 3, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3687, N'Ariadna', N'Hernandez', N'Montoya', N'305120907', N'ariadna.hm20@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 18, 85600714, 2, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3688, N'Laura', N'Madrigal', N'Coto', N'304950671', N'laura.tuc96@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 21, 88797673, 4, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3689, N'Evelyn', N'Navarro', N'Porras', N'304600385', N'enavarro92.cr@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 25, 89712917, 6, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3690, N'Osvaldo', N'Carranza', N'Romero', N'304920218', N'osvkza@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 21, 83162594, 3, N'2017-08-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3691, N'Luis', N'Sequeira', N'Morera', N'207830921', N'lsequeiramorera@gmail.com', N'Otra', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 18, 61747433, 2, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3692, N'Cesar', N'Briceno', N'Munoz', N'115390140', N'Jces.bric@gmail.com', N'Ingenieria', N'Costa Rica', N'Tecnico', N'M', 1, 1, 24, 84303704, 5, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3693, N'Byron', N'Orozco', N'Villalobos', N'305060078', N'byronorozcovillalobos@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 19, 88010527, 3, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3694, N'Susan', N'Quesada', N'Jimenez', N'304910785', N'suquesada.23@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 21, 86573460, 4, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3695, N'Fiorella', N'Mora', N'Campos', N'117530008', N'fioremora@hotmail.es', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 17, 89897811, 1, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3696, N'Andrés', N'Quesada', N'Barrantes', N'116700717', N'rafaelandresquesada@gmail.com', N'Ingenieria', N'Costa Rica', N'', N'M', 1, 0, 20, 62805548, 0, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3697, N'Leonardo', N'Castro', N'Barrantes', N'304870793', N'lbarrantes145@gmail.com', N'Otra', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 86651385, 3, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3698, N'Joseph', N'Jimenez  ', N'Zuniga ', N'116800085', N'josephdjz@hotmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 86662909, 2, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3699, N'Jorge', N'Jaen', N'Rios', N'107230977', N'jbjrjaen@gmail.com', N'Otra', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 49, 88870648, 1, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3701, N'Katherine', N'Cubeto', N'Arias', N'207750776', N'katherinecuberoarias@gmail.com', N'Ciencias Agroalimentarias', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 19, 85710537, 2, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3702, N'Karolina', N'Murillo', N'Barrientos', N'115980594', N'karo.barrientos15@gmail.com', N'Ciencias Agroalimentarias', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 22, 86828882, 3, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3703, N'Kenenth', N'Cortes', N'Granados', N'304430591', N'kennethcortes90@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Otro', N'M', 1, 1, 25, 89088337, 5, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3704, N'Carolina', N'Pereira', N'Coronel', N'3504350', N'karopc9644@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 19, 86362628, 2, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3705, N'Dilan', N'Castro', N'Enriquez', N'116370262', N'dylancastro96@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 86576459, 2, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3706, N'Ana', N'Ramirez', N'Marin', N'112330148', N'catalina24@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 32, 87084668, 1, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3707, N'Veronica', N'Mora', N'Lezcano', N'604060934', N'vroimora@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 24, 86392496, 4, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3708, N'Ricardo', N'Araya', N'Ramirez', N'207550938', N'ricardoara7896@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 85105975, 4, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3709, N'Kennier', N'Vindas', N'Gonzalez', N'304700658', N'kennier93@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 24, 84594671, 3, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3710, N'Melisa', N'Carvajal', N'Monge', N'114110453', N'melisacarvajal63@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Maestria', N'F', 1, 1, 28, 83866364, 2, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3711, N'rafael', N'vargas', N'solis', N'116100124', N'rafael9530@hotmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 71132840, 3, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3712, N'Anderson', N'Taylor', N'Cordero', N'7247518', N'andertaylor85@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 20, 84316702, 3, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3713, N'Ariel', N'Dickerman', N'Gonzalez', N'115440859', N'adickerman.tec@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 24, 88184330, 5, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3714, N'Andres', N'Herrera', N'Portuguez', N'117130084', N'andres.herreraport@hotmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 19, 83095603, 2, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3715, N'Avi', N'Goldgewicht', N'Villalobos', N'117380584', N'avigold33@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 18, 87099986, 1, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3716, N'Andres', N'Perez', N'Picado', N'304890960', N'andre.r-2p@hotmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 21, 87363019, 4, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3717, N'Randall', N'Rivera', N'Hernandez', N'2017074297', N'randallriverah@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 18, 86826661, 1, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3718, N'Jose', N'Rodriguez', N'Tencio', N'117340346', N'josepablo07rt@estudiantec.cr', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 18, 86316203, 1, N'2017-08-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3719, N'Maria Jorcemy', N'Mayorga', N'Jimenez', N'305140751', N'jorcemy@hotmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 18, 62477651, 2, N'2017-08-15 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3720, N'Oscar', N'Vega', N'Ramirez', N'303990624', N'oscarvegaramirez@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 32, 87901007, 4, N'2017-08-15 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3721, N'Eduardo', N'Ulloa', N'Ovares', N'117110313', N'Eduulloa98@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 19, 89842228, 2, N'2017-08-15 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3722, N'Alejandro', N'Meza', N'Solano', N'305070153', N'alejandroms2497@outlook.com', N'Ciencias Agroalimentarias', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 19, 89447552, 1, N'2017-08-15 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3723, N'Christian ', N'Saenz', N'Silva', N'116040893', N'crisaenz111@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 89544802, 4, N'2017-08-15 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3724, N'Angie', N'Rodriguez', N'Rosales', N'504140654', N'im.angierod@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 20, 60832475, 5, N'2017-08-15 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3725, N'Diego', N'Matamoros', N'Naranjo', N'115720139', N'diegomaxtergame@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 62900815, 5, N'2017-08-15 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3726, N'Sebastian', N'Marin', N'Rojas', N'116840787', N'c-bas_102@hotmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 24, 83080945, 1, N'2017-08-15 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3727, N'Keilyn', N'Salazar', N'Brenes', N'116320882', N'ksalazarbrenes@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 21, 61278683, 4, N'2017-08-15 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3728, N'Daniela', N'Zuniga', N'Rivera', N'10168900568', N'dazuri97@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 19, 84071217, 3, N'2017-08-15 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3729, N'Larissa', N'Carter', N'Rodriguez', N'115230312', N'lacarter73@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 24, 89962058, 6, N'2017-08-16 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3730, N'Carlos', N'Rojas', N'Espinoza', N'1015940269', N'carlos.rojas.es@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 88343830, 3, N'2017-08-16 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3731, N'Varo', N'Rojas', N'Guerrero', N'207420680', N'varogue95@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 87471018, 4, N'2017-08-16 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3732, N'Gerald', N'Vindas', N'Villalobos', N'604490568', N'gevindas@hotmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 18, 86350177, 1, N'2017-08-16 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3733, N'Jose', N'Camacho', N'Saborio', N'112410195', N'marticamacho@gmail.com', N'Ingenieria', N'Costa Rica', N'Tecnico', N'M', 1, 1, 32, 88435245, 3, N'2017-08-16 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3734, N'Ludwin', N'Arias', N'Paniagua', N'116990015', N'Aaronlg2698@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 19, 71873805, 1, N'2017-08-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3735, N'Anthonny', N'Chaves', N'Montiel', N'402330547', N'antcha_crr@hotmail.com', N'Ciencias Agroalimentarias', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 20, 88010117, 3, N'2017-08-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3736, N'Sleider', N'Jimenez', N'Delgado', N'304940804', N'alejimenezde27@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 63903049, 4, N'2017-08-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3737, N'Oscar Mario', N'Jimenez', N'Rocha', N'604550614', N'jimenezoscarxd@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 17, 84979786, 1, N'2017-08-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3738, N'Humberto', N'Vargas', N'Mejia', N'402350601', N'humberavm@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 89523795, 3, N'2017-08-19 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3739, N'Oscar ', N'Hernandez', N'Lobo', N'116040534', N'oslobo95@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 71092218, 4, N'2017-08-20 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3740, N'Juan', N'Castro', N'Porras', N'116190053', N'juan.castro2695@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 86363051, 5, N'2017-08-21 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3741, N'Stuart', N'Leon', N'Aguilar', N'10162900391', N'sleon230696@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 88791040, 4, N'2017-08-21 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3742, N'Danny', N'Lobo', N'Villalobos', N'702440863', N'd.lobov96@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 71094045, 4, N'2017-08-21 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3743, N'Daniel', N'Alvarado', N'Brenes', N' 304390835', N'lmalobrenes@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 27, 89980107, 4, N'2017-08-21 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3744, N'Juan', N'Vasquez', N'Castro', N'117280190', N'juanvascas@me.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 18, 87692222, 1, N'2017-08-22 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3745, N'JuanCarlos', N'Segura', N'coto', N'304020992', N'jcsegurac@cfia.or.cr', N'Ingenieria', N'Costa Rica', N'Maestria', N'M', 1, 1, 32, 83137389, 2, N'2017-08-24 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3746, N'Kenneth', N'Cespedes', N'Garbanzo', N'115340137', N'kecesga.93@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 24, 86561258, 4, N'2017-09-05 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3747, N'Martin', N'Solis', N'Salazar', N'205860912', N'martin12cr@gmail.com', N'Otra', N'Honduras', NULL, N'M', 1, 0, 34, 83234483, 0, N'2017-09-07 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3748, N'Raquel', N'Gutierrez', N'Mora', N'116080610', N'rakgr1395@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 22, 89507557, 1, N'2017-09-07 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3749, N'Keller', N'Martinez', N'Solis', N'115520636', N'kelleru6@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 23, 87173214, 5, N'2017-09-07 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3750, N'Andres', N'Mora', N'Campos', N'116210487', N'andresmoracampos@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 83310050, 1, N'2017-09-07 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3751, N'Karol ', N'Rojas', N'Alvarez', N'304600088', N'krojas3092@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'', N'F', 1, 0, 25, 83644343, 0, N'2017-09-07 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3752, N'Pablo ', N'Trejos', N'Ramirez ', N'115980027', N'pab10.trejos10@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 22, 84492489, 5, N'2017-09-07 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3753, N'daniel', N'Sanabria', N'garcia ', N'305070938', N'daniel.97s@outlook.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 19, 70111718, 3, N'2017-09-07 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3754, N'Mario', N'Delgado', N'Vargas', N'115360732', N'mario.alberto.365@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 24, 88759872, 6, N'2017-09-07 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3755, N'Mauro', N'Viquez', N'Gonzalez', N'116520655', N'mauvi5@hitmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 83046450, 3, N'2017-09-07 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3756, N'Danny', N'Mejias', N'Anchia', N'207420716', N'dgmanchia@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 22, 89739380, 4, N'2017-09-07 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3757, N'Santiago', N'Lopez', N'Rojas', N'116600593', N'santiago241996@gmail.com', N'Ingenieria', N'Otra', N'Bachillerato', N'M', 1, 1, 21, 89640767, 4, N'2017-09-07 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3758, N'Luis', N'Merayo', N'Gatica', N'207590654', N'merayo05@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 20, 88417004, 4, N'2017-09-07 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3759, N'Sebastian', N'Perez', N'Campos', N'116660823', N'frikilix29@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 85286877, 2, N'2017-09-07 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3760, N'MariaJose', N'Morales', N'Granados', N'305110182', N'mariajosemoralesgranados@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 19, 87913705, 2, N'2017-09-07 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3761, N'Sergio', N'Solorzano', N'Alfaro', N'117170434', N'sergiosolorzanoalfaro@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 19, 87745086, 2, N'2017-09-07 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3762, N'Katerin Dilana', N'Villalobos', N'Peña', N'504110795', N'katydilanvp15@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 21, 83468543, 3, N'2017-09-07 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3763, N'Daniela', N'Suarez', N'Quiros', N'207630507', N'jdsuarez97@hotmail.es', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 20, 86977544, 3, N'2017-09-07 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3764, N'Paula', N'Roman', N'Quesada', N'116460798', N'paurt20@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 21, 88888265, 4, N'2017-09-07 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3765, N'Verónica', N'Brenes', N'Benzoni', N'10166500530', N'vero.brenes23@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 20, 71105621, 3, N'2017-09-07 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3766, N'Rebecca', N'Pessoa', N'Albertazzi', N'116560224', N'beki96pessoa@hotmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 20, 88795241, 4, N'2017-09-07 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3767, N'Johan', N'Saborio', N'Jimenez', N'304640888', N'josaborioj@gmail.com', N'Ciencias Agroalimentarias', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 25, 88027186, 3, N'2017-09-07 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3768, N'Johan', N'Saborio', N'Jimenez', N'304640088', N'josajiturismocr@gmail.com', N'Ciencias Agroalimentarias', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 25, 8, 3, N'2017-09-08 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3770, N'Jorge Esteban', N'Lizano', N'Roldan', N'115700965', N'jorgelizano94@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 23, 83022998, 4, N'2017-09-08 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3771, N'Jose', N'Valverde', N'Perez', N'207300555', N'jose67val@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 89795560, 5, N'2017-09-08 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3772, N'Teresa', N'Rosales', N'Lopez', N'304670808', N'rosalestere@gmail.com', N'Otra', N'Costa Rica', N'', N'F', 1, 0, 24, 87660918, 0, N'2017-09-08 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3773, N'Sebastián', N'Quesada', N'Centeno', N'116370431', N'saponita9611@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 21, 85923847, 4, N'2017-09-08 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3774, N'Kimberly', N'Cordero', N'Cruz', N'304940595', N'kimcocru@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 21, 85684173, 4, N'2017-09-08 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3775, N'Daniel', N'Alvarado', N'Brenes', N'304390835', N'lmalobrenes@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 27, 89980107, 4, N'2017-09-08 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3776, N'Cristopher', N'Vega', N'Araya', N'304970349', N'alejandrovear09@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 20, 61342817, 1, N'2017-09-09 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3777, N'Frederik', N'Orozco', N'Reyes', N'117000865804', N'frederik.for@gmail.com', N'Ingenieria', N'Colombia', N'Bachillerato', N'M', 1, 1, 20, 89158818, 2, N'2017-09-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3778, N'Emanuel', N'Alvarado', N'Perez', N'117600746', N'ema.alv045@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 17, 84135505, 1, N'2017-09-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3779, N'Jorge', N'Sanchez', N'Castro', N'402290787', N'jore.sanchez146@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 87145600, 4, N'2017-09-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3780, N'Gabriel', N'Villarreal', N'Alfaro', N'114780014', N'gvalfaro14@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 25, 83164965, 5, N'2017-09-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3781, N'Massiel', N'Sequeira', N'Obando', N'155800114414', N'massiesequeira@gmail.com', N'Ciencias Economicas', N'Otra', N'Bachillerato', N'F', 1, 1, 25, 86059985, 2, N'2017-09-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3782, N'mauro', N'rodriguez', N'rojas', N'304830415', N'maurorr94.rr@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 85818923, 3, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3783, N'Dessire', N'Retana', N'Astua', N'116250966', N'dessire.retanaa@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 21, 70180950, 4, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3784, N'Paula', N'Munoz', N'Araya', N'116690807', N'Paulam0103@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 20, 85939750, 2, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3785, N'Kimberly', N'Quesada', N'Jiménez', N'305000482', N'kiimquesada97@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 20, 86573438, 2, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3786, N'Roy', N'Solis ', N'Sanchez', N'304780622', N'royxno308@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 23, 85275246, 5, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3787, N'David', N'Arias', N'Cano', N'800980970', N'davidarca0395@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 86179480, 4, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3788, N'Octavio', N'Sanchez', N'Varela', N'801040881', N'octavio0427@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 20, 85037353, 4, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3789, N'Sebastian', N'Tencio', N'Ramirez', N'116750385', N'stencio@gmail.com', N'Otra', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 84078650, 2, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3790, N'Evelyn', N'Quiros', N'Acuna', N'304970699', N'evyquiros.7@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 20, 86939346, 3, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3791, N'Naslhy', N'Cortes', N'Camargo', N'800950031', N'ncortescamargo@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 21, 71053570, 4, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3792, N'Roberto', N'Ramirez', N'Alarcon', N'702410283', N'robertojose24@hotmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 86884309, 4, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3793, N'David', N'Zuniga', N'Serrano', N'304850966', N'd14041995@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 87050898, 4, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3794, N'Jose Antonio', N'Cespedes', N'Downing', N'504260594', N'tonio782009@hotmail.com', N'Ingenieria', N'Costa Rica', N'Otro', N'M', 1, 1, 18, 85861247, 1, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3795, N'Julian', N'Vargas', N'Garita', N'117030429', N'jul.vg98@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 19, 61606544, 2, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3796, N'John ', N'Junier', N'Thomas', N'702490858', N'juneths96@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 20, 83677511, 3, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3797, N'Laura', N'Chinchilla', N'Sanchez', N'116380348', N'laugaby1612@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 21, 84941444, 4, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3798, N'Catalina', N'Madrigal', N'Garcia ', N'116240197', N'ca.ma.ga.0795@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 21, 83497958, 3, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3799, N'Julio', N'Viquez', N'Murillo', N'207630995', N'jviquez2@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 89888074, 3, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3800, N'Maria', N'Meneses', N'Dittel', N'304770763', N'Marymenedi@hotnail.com', N'Ciencias Agroalimentarias', N'Costa Rica', N'Otro', N'F', 1, 1, 23, 83095746, 3, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3801, N'Alfiery', N'Melendez', N'Rodriguez', N'115280494', N'Alfierimr@gmail.com', N'Educacion', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 26, 72679429, 4, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3802, N'Harold', N'Miranda', N'Sandoval', N'304820377', N'harold1094@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 60546468, 5, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3803, N'Julian', N'Hidalgo', N'Chacon', N'304450342', N'jhidalgo2035@outlook.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 27, 86045958, 6, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3804, N'Indiana', N'Biassetty', N'Hernandez', N'504100497', N'indibh29@hotmail.com', N'Otra', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 21, 86500998, 3, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3805, N'Maria', N'Hidalgo', N'Alpizar', N'207550800', N'ferha863@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 21, 84322684, 4, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3806, N'Manuel', N'Castro', N'Delgado', N'402290738', N'manuelandrescastrod@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 21, 86339784, 3, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3807, N'Marcela', N'Coghi', N'Azofeifa', N'305080304', N'marcoghi2302@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 19, 83039753, 2, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3808, N'Alexander', N'Chanto', N'Sánchez', N'304990693', N'amcs8@live.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 20, 62333375, 3, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3809, N'Adriana', N'Lopez ', N'Bolanos', N'207340581', N'adjolobo@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 22, 88014126, 4, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3810, N'Cynthia', N'Forrest', N'Fernandez', N'304520211', N'cynfor0703@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 26, 89639250, 1, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3811, N'Paulo', N'Cortés', N'Artavia', N'702240703', N'pcortez2893@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 23, 86394869, 2, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3812, N'David', N'Cordero', N'Chavarria', N'115020180', N'dacoch215@estudiantec.cr', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 25, 88769167, 4, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3813, N'Diego', N'Hernandez', N'Valerin', N'304920958', N'diegohv16@hormail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 71505825, 4, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3814, N'Luis', N'Martinez', N'Wilson', N'702550692', N'luigillo0310@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 19, 84397604, 2, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3815, N'Roxana ', N'Gómez', N'Gomez', N'304820385', N'rocagogo01@gmail.com ', N'Ciencias Economicas', N'Costa Rica', N'', N'F', 1, 0, 22, 89308530, 0, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3816, N'Jose', N'Mora', N'Salas', N'117250288', N'jp.mora@hotmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 18, 70181624, 2, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3817, N'Rodrigo', N'Brenes', N'Fonseca', N'116640364', N'robrefon@hotmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 83030739, 2, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3818, N'Luis', N'Irias', N'Madrigal', N'402300229', N'irias.diego@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 89507347, 5, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3819, N'LUIs Alejandro', N'Villalobos', N'Arguedas', N'702090933', N'alexvilla741@gmail.com', N'Otra', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 25, 86462802, 6, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3820, N'Jennifer ', N'Navarro', N'Naranjo', N'304980607', N'j3nni06@hotmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 20, 86028835, 2, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3821, N'Jesus', N'Chaves', N'ARIAS', N'305120091', N'jesusca07@hotmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 19, 89407283, 2, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3822, N'sebastian', N'Mendez', N'hidalgo', N'117190921', N'sebasmendez0998@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 19, 61056359, 1, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3823, N'Raizeth', N'Chaves', N'Arias', N'503930449', N'raizethchavesarias@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 24, 87913279, 6, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3824, N'Dimas', N'Arrieta', N'Chaves', N'503800093', N'kche2991@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 26, 89475592, 4, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3825, N'Kervin', N'Mora', N'Carvajal', N'304930737', N'kervinmora@hotmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 21, 88416369, 2, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3826, N'Steven', N'Castillo', N'Hernandez', N'304680587', N'scastillohernandez11@gmail.com', N'Ingenieria', N'Costa Rica', N'', N'M', 1, 0, 24, 89699477, 0, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3827, N'Alisson', N'Lopez', N'Bravo', N'504230004', N'alilopbra@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 19, 85126750, 2, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3828, N'Sebastian', N'Bonilla', N'Valverde', N'116770068', N'sebas_15bonilla@hotmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 86558804, 3, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3829, N'Esteban', N'Hurtado', N'Aguirre', N'117000299421', N'esteban_colo@live.com', N'Ingenieria', N'Colombia', N'Bachillerato', N'M', 1, 1, 23, 88598333, 2, N'2017-09-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3830, N'Pablo', N'Garcia', N'Brenes', N'304990568', N'pablod.garciab@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 20, 89406807, 3, N'2017-09-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3831, N'Daniel', N'Quesada', N'Corrales', N'304930917', N'danielquesadacr@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 21, 87869458, 3, N'2017-09-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3832, N'Martin', N'Contreras', N'Rivas', N'17209355', N'martincontreras1985@gmail.com', N'Ingenieria', N'Otra', N'Licenciatura', N'M', 1, 1, 32, 86865941, 5, N'2017-09-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3833, N'Brayan', N'Fajardo', N'Alvarado', N'702200578', N'brayan.f.a07@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 24, 60432826, 3, N'2017-09-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3834, N'Jose', N'campos', N'cifuentes', N'117190194', N'andres-298@hotmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 19, 64230613, 2, N'2017-09-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3835, N'Santiago', N'Meneses', N'Obando', N'117030701', N'Santiagomeneseso@hotmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 19, 87902759, 2, N'2017-09-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3836, N'María Isabel', N'Vallejos', N'Rodríguez', N'504090865', N'Kape1296@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 21, 60884525, 3, N'2017-09-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3837, N'Jose ', N'Araya', N'Quiros', N'305030229', N'josemiguel135790@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 60620085, 2, N'2017-09-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3838, N'Edmons', N'Vega', N'Araya', N'304870813', N'eyva5795@gmail.com', N'Ciencias Basicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 22, 60064485, 2, N'2017-09-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3839, N'Steven', N'Moraga', N'Cerdas', N'604410679', N'smoragacerdas@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 19, 87377677, 3, N'2017-09-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3840, N'Luis ', N'Acuña', N'Campos', N'207420303', N'luisdavidcampos007@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 86261050, 4, N'2017-09-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3841, N'Federico', N'Coto', N'Vilchez', N'115140041', N'federicococoto@hotmail.com', N'Ciencias Basicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 25, 87018839, 4, N'2017-09-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3842, N'Esteban', N'Gonzalez', N'Arguedas', N'115850696', N'egonzarg@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 22, 87543699, 3, N'2017-09-14 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3843, N'Maureen Cristina', N'Mora', N'Lezcano', N'116890829', N'maureencristinaml@gmail.com', N'Ingenieria', N'Costa Rica', N'Tecnico', N'F', 1, 1, 19, 61314890, 2, N'2017-09-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3844, N'Jerson', N'Hernandez', N'Rojas', N'304220821', N'jeyohr@hotmail.com', N'Ciencias Sociale', N'Costa Rica', N'Otro', N'M', 1, 1, 30, 84176355, 3, N'2017-09-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3845, N'Andres', N'Garcia', N'Soto', N'117360658', N'andresmcvago@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 18, 89429018, 1, N'2017-09-19 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3846, N'Eunice', N'Cruz', N'Mendez', N'603640215', N'elinicen16@gmail.com', N'Otra', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 30, 85309433, 2, N'2017-09-19 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3847, N'Fiorella', N'Solano', N'Arguedas', N'604330750', N'fiosa1309@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 21, 72499164, 4, N'2017-09-25 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3848, N'Nikole', N'Porras', N'Mora', N'115890264', N'nikporras@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 22, 86091238, 4, N'2017-09-27 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3849, N'Jairo', N'Vindas', N'Sojo', N'304550468', N'jairovnds@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 26, 83099285, 5, N'2017-10-23 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3850, N'Armando', N'Sandi', N'Guzman', N'304700945', N'arjosandi_23@hotmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 24, 86620351, 4, N'2017-10-23 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3851, N'Nohelia', N'Ramirez', N'Poveda', N'116660956', N'ranohelia@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 20, 85618582, 3, N'2017-10-23 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3852, N'Emiliano', N'De ', N'Toro', N'103200169803', N'e95detoro@gmail.com', N'Ciencias Economicas', N'Otro Latinoamericano', N'Bachillerato', N'M', 1, 1, 22, 84922139, 2, N'2017-10-23 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3853, N'Daniela', N'Herrera', N'Valverde', N'207780466', N'v.danielaherre@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 19, 83042912, 2, N'2017-10-24 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3854, N'Valeria', N'Solis', N'Fonseca', N'117500694', N'valerosa_s.f@hotmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 18, 87039404, 1, N'2017-10-24 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3855, N'Josue', N'Quiros', N'Gomez', N'305020425', N'josuequirosgomez@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 84379499, 2, N'2017-10-24 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3856, N'Martin', N'contreras', N'rivas', N'76981924', N'martincontreras1985@gmail.com', N'Ingenieria', N'Otra', N'Licenciatura', N'M', 1, 1, 32, 86865941, 4, N'2017-10-25 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3857, N'Monica', N'Navarro', N'Calvo', N'304730100', N'monavarro@itcr.ac.cr', N'Ciencias Economicas', N'Costa Rica', N'', N'F', 1, 0, 24, 86385891, 0, N'2017-10-26 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3858, N'María', N'Abarca', N'Cisneros', N'116650840', N'mariabarca21@gmail.com', N'Otra', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 20, 60954958, 2, N'2017-10-26 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3859, N'Elena', N'Garzona', N'Moya', N'305170071', N'egarzona33@hotmai.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 18, 70106575, 1, N'2017-10-26 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3860, N'Yasmin', N'Badilla', N'Urena', N'115930258', N'ange9491@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 22, 84439032, 4, N'2017-10-26 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3861, N'kevin', N'Sanabria', N'Sanabria', N'304990076', N'kgsc06@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 20, 84838397, 3, N'2017-10-26 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3862, N'Isaac', N'Pena', N'Pereira', N'117040115', N'isaaczypp@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 86130546, 3, N'2017-10-26 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3863, N'Gustavo', N'Carvajal', N'Bonilla', N'116320531', N'tavocarvajalb@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 87025625, 3, N'2017-10-26 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3864, N'Sharon', N'Vargas', N'Jimenez', N'207680708', N'sharondaniela.97@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 20, 85599583, 3, N'2017-10-26 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3865, N'Deivid', N'Herrera', N'Castro', N'207240136', N'deivid94hc@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 23, 85825464, 5, N'2017-10-26 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3866, N'Sara', N'Molina', N'Quesada', N'115890923', N'samolina117@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 22, 86643631, 6, N'2017-10-26 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3867, N'Tifany', N'Castillo', N'Fonseca', N'304810434', N'tifcf15@gmail.com', N'Educacion', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 23, 83262012, 2, N'2017-10-26 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3868, N'David', N'Araya', N'Rodríguez', N'207230615', N'arayarod123@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 23, 86235909, 5, N'2017-10-26 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3869, N'Stephanie ', N'Rojas', N'Villafuerte ', N'116380645', N'sdrojas94@gnail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 21, 88625882, 2, N'2017-10-26 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3870, N'Eduardo', N'Obando', N'Marin', N'116410744', N'eobandomarin@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 86234739, 4, N'2017-10-26 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3871, N'Carlos', N'Rojas', N'Salazar', N'304690935', N'lesorcier12@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 24, 86074211, 5, N'2017-10-26 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3872, N'Daniela', N'Leung', N'Ching', N'116640942', N'nanileung@hotmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 20, 8430888, 3, N'2017-10-26 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3873, N'Sebastian', N'Gamboa', N'Chacon', N'305230213', N'segamboachacon@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 18, 60981011, 1, N'2017-10-26 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3874, N'Lorena ', N'Elescano', N'Loayza', N'160400243436', N'loreavril2@gmail.com', N'Ingenieria', N'Otro Latinoamericano', N'Bachillerato', N'F', 1, 1, 27, 64548227, 4, N'2017-10-26 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3875, N'Frank', N'Brenes', N'Alvarado', N'1-1522-0167', N'Fbrenes7@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 24, 89512070, 5, N'2017-10-26 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3876, N'Marco', N'Leiva', N'Ramirez', N'304970638', N'mleiva.vr@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 86656999, 4, N'2017-10-26 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3877, N'arturo', N'Sotela', N'Lutz', N'116290999', N'arturosl95@hotmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 83758959, 4, N'2017-10-26 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3878, N'Ricardo', N'Bustos', N'Herrera', N'604150899', N'rbustoscr25@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 23, 87328465, 3, N'2017-10-26 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3879, N'Dilxia', N'Ceciliano', N'Morales', N'116270066', N'dil.ceciliano@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 21, 84601744, 4, N'2017-10-26 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3880, N'Irene ', N'Aguilar', N'López', N'304950645', N'ireal0796@gmail.com', N'Bellas Artes', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 21, 89203474, 2, N'2017-10-26 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3881, N'Emmanuel', N'Araya', N'Gamboa', N'305010689', N'emmanuelaraya114@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 87273703, 3, N'2017-10-27 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3882, N'Daniela', N'Salas', N'Calvo', N'30510885', N'dannysc_98@hotmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 19, 89626325, 1, N'2017-10-27 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3883, N'Gabriela', N'Solano', N'Schosinsky', N'1-1715-0220', N'marigab23@hotmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 19, 88787066, 2, N'2017-10-27 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3884, N'Jonathan', N'Umana', N'Rojas', N'303670628', N'john.a.umaro@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 37, 72619480, 2, N'2017-10-27 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3885, N'David', N'Vega', N'Porras', N'115700613', N'davidvvpp1412@yahoo.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 23, 60003150, 5, N'2017-10-28 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3886, N'Yaxiri', N'Azofeifa', N'Garcia', N'604060074', N'yaxiri191@gmail.com', N'Otra', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 24, 84773107, 3, N'2017-10-29 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3887, N'Mariana', N'Fallas', N'Madrigal', N'115350611', N'mrfallasmadrigal@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 24, 83338560, 6, N'2017-10-30 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3888, N'Reishell', N'Barnes', N'Rodriguez', N'117330473', N'r_barnesro@hotmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 19, 84171599, 1, N'2017-10-30 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3889, N'Daniel', N'Brenes', N'Cespedes', N'207240825', N'danielbrenes14@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 23, 87221680, 6, N'2017-10-31 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3890, N'Jose Ricardo', N'Vasquez', N'Barrionuevo', N'115600468', N'jrvb25@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 23, 88991645, 5, N'2017-10-31 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3891, N'Luis', N'Solis', N'Chacon', N'207750340', N'solisalonso98@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 19, 83108622, 2, N'2017-11-01 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3892, N'Natalia', N'Jimenez', N'Cabezas', N'115950783', N'natjicab@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 22, 85847805, 5, N'2017-11-01 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3893, N'Julissa', N'Bosque', N'Chaves', N'604380482', N'j_uly13@hotmail.es', N'Ciencias Basicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 20, 89669356, 3, N'2017-11-01 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3894, N'Samuel', N'Chaves', N'Monge', N'116820379', N'schaves71@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 20, 87023979, 2, N'2017-11-01 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3895, N'Randall', N'Rivera', N'Hernandez', N'702680551', N'randallriverah@gmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 18, 86826661, 1, N'2017-11-02 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3896, N'Andrea', N'Gomez', N'Bonilla', N'116170382', N'agbon31@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 22, 85959359, 5, N'2017-11-02 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3897, N'Felipe', N'Romero', N'Romero', N'115640083', N'l.f.r.p2702@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 23, 85434944, 5, N'2017-11-03 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3898, N'Hillary', N'Ramirez', N'Gonzalez', N'207580637', N'hiramirez96@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 21, 84419749, 3, N'2017-11-03 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3899, N'Esteban', N'Monge', N'Fernandez', N'116160551', N'estebanmong@hotmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 22, 88895816, 4, N'2017-11-05 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3900, N'Johan', N'Chaves', N'Zamora', N'702630584', N'Andres126313@hotmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 19, 88119129, 3, N'2017-11-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3901, N'Pablo', N'Chacon', N'Canales', N'504210700', N'Josepablo_95@hotmail.es', N'Otra', N'Costa Rica', N'', N'M', 1, 0, 22, 86228231, 0, N'2017-11-18 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3902, N'David', N'Espinoza', N'Soto', N'305080945', N'david1998es16@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 19, 86622013, 2, N'2017-11-25 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3903, N'Harold', N'Jimenez', N'Palma', N'111270205', N'haroldjp@Gmail.com', N'Ciencias Economicas', N'Costa Rica', N'', N'M', 1, 0, 35, 70177946, 0, N'2017-12-11 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3904, N'Cristhian Alonso', N'Batista', N'Castillo', N'117370971', N'batistaroker@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 18, 89233675, 1, N'2018-01-23 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3905, N'Diana', N'Villalobos', N'Sanchez', N'116560102', N'diana_vs1096@hotmail.com', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 21, 84029614, 4, N'2018-02-08 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3906, N'Anthony', N'Rojas', N'Ramirez', N'207670617', N'rojasr.anthony@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 20, 88046288, 4, N'2018-02-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3907, N'Ricardo', N'Serracin ', N'Blanco', N'116480196', N'ricardoserracinb27@hotmail.es', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 87571992, 4, N'2018-02-12 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3908, N'Ignacio', N'Calderon', N'Alfaro', N'117570675', N'ignacio.calderon99@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 18, 60040810, 2, N'2018-02-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3909, N'Joshua', N'Asenjo', N'Barahona', N'305080571', N'joshua.asenjo26@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 19, 84714689, 2, N'2018-02-13 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3910, N'Bryan', N'Hernandez', N'Ortiz', N'304940231', N'hernandez.bryan.ho@gmail.com', N'Ingenieria', N'Costa Rica', N'Tecnico', N'M', 1, 1, 22, 61035439, 3, N'2018-02-16 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3911, N'Jimena ', N'Gómez ', N'Obando ', N'17790059', N'jimena.gomez00@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 18, 61717458, 1, N'2018-02-17 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3912, N'Pamela', N'Montero', N'Fuentes', N'116440907', N'pamemontero.26@gmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 21, 83173116, 4, N'2018-02-23 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3913, N'Fabiola ', N'Gonzalez', N'Moya', N'304920927', N'fabigonmo_21@hotmail.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 22, 63805897, 5, N'2018-02-23 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3914, N'Victor', N'Rivera', N'Hernandez', N'304930543', N'vrivera1503@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 21, 86555137, 5, N'2018-02-23 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3915, N'Huberth', N'Gonzalez', N'Gairaud', N'117210103', N'gonzalezhuberth@hotmail.com', N'Otra', N'Costa Rica', N'Otro', N'M', 1, 1, 19, 87647447, 3, N'2018-03-05 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3916, N'Julian', N'Bloise', N'Gomez', N'116900965', N'J1bl8g@gmail.com', N'Otra', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 83149132, 1, N'2018-03-06 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3917, N'Danny', N'Chaves', N'Chaves', N'604320033', N'dxnnx@me.com', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 21, 84545686, 4, N'2018-03-07 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3918, N'Efrén', N'Carvajal', N'Valverde', N'116740214', N'efcarvajal97@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'M', 1, 1, 20, 60083548, 4, N'2018-03-07 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3919, N'Silvia', N'Aguilar', N'Ulloa', N'117180272', N'silvia.aguilarulloa@gmail.com ', N'Ingenieria', N'Costa Rica', N'Bachillerato', N'F', 1, 1, 19, 86741496, 3, N'2018-03-09 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3920, N'Andrey', N'Quiros', N'Zuniga', N'116850224', N'andreyqz@hotmail.com ', N'Ciencias Economicas', N'Costa Rica', N'Bachillerato', N'M', 1, 1, 20, 87103585, 2, N'2018-03-09 00:00:00', NULL
EXEC SRSP_transInsertarUsuarioxNuevo  3921, N'Jimena', N'Gomez', N'Obando', N' 117790059 ', N'jimena.gomez00@gmail.com', N'Ingenieria', N'Costa Rica', N'Licenciatura', N'F', 1, 1, 17, 61717458, 1, N'2018-03-10 00:00:00', NULL
GO 

-- pasa de experimento x usuario a sesion por usuario 

CREATE PROCEDURE [dbo].[SRSP_transExpxSesionxUsuario](@idExperimentoXusuario int, @fk_usuario int, @fk_experimento int, @matriculado int)
--@idUsuario int, @idSesion int, @matriculado bit
AS
BEGIN		
			INSERT INTO dbo.SesionxUsuario(fk_usuario, fk_sesion, matriculado)
			VALUES(@fk_usuario, @fk_experimento, @matriculado)
			RETURN 1

END
GO 


exec SRSP_transExpxSesionxUsuario 14040, 3540, 4, 1
exec SRSP_transExpxSesionxUsuario 14041, 3729, 19, 1
exec SRSP_transExpxSesionxUsuario 14042, 3670, 4, 1
exec SRSP_transExpxSesionxUsuario 14043, 3711, 4, 1
exec SRSP_transExpxSesionxUsuario 14044, 3660, 4, 1
exec SRSP_transExpxSesionxUsuario 14045, 3593, 20, 1
exec SRSP_transExpxSesionxUsuario 14046, 3677, 4, 1
exec SRSP_transExpxSesionxUsuario 14047, 3427, 22, 1
exec SRSP_transExpxSesionxUsuario 14048, 3708, 4, 1
exec SRSP_transExpxSesionxUsuario 14049, 3669, 4, 1
exec SRSP_transExpxSesionxUsuario 14050, 3497, 4, 1
exec SRSP_transExpxSesionxUsuario 14051, 3473, 22, 1
exec SRSP_transExpxSesionxUsuario 14052, 3409, 4, 1
exec SRSP_transExpxSesionxUsuario 14053, 3283, 22, 1
exec SRSP_transExpxSesionxUsuario 14054, 3664, 4, 1
exec SRSP_transExpxSesionxUsuario 14055, 3498, 4, 1
exec SRSP_transExpxSesionxUsuario 14056, 3556, 20, 1
exec SRSP_transExpxSesionxUsuario 14057, 3668, 20, 1
exec SRSP_transExpxSesionxUsuario 14058, 3486, 19, 1
exec SRSP_transExpxSesionxUsuario 14059, 3496, 4, 1
exec SRSP_transExpxSesionxUsuario 14060, 3697, 4, 1
exec SRSP_transExpxSesionxUsuario 14061, 3437, 20, 1
exec SRSP_transExpxSesionxUsuario 14063, 3446, 20, 1
exec SRSP_transExpxSesionxUsuario 14064, 3753, 4, 1
exec SRSP_transExpxSesionxUsuario 14065, 3567, 20, 1
exec SRSP_transExpxSesionxUsuario 14066, 3341, 4, 1
exec SRSP_transExpxSesionxUsuario 14067, 3706, 22, 1
exec SRSP_transExpxSesionxUsuario 14068, 3474, 22, 1
exec SRSP_transExpxSesionxUsuario 14070, 3488, 4, 1
exec SRSP_transExpxSesionxUsuario 14072, 3443, 20, 1
exec SRSP_transExpxSesionxUsuario 14073, 3386, 20, 1
exec SRSP_transExpxSesionxUsuario 14075, 3619, 22, 1
exec SRSP_transExpxSesionxUsuario 14076, 3752, 22, 1
exec SRSP_transExpxSesionxUsuario 14077, 3654, 19, 1
exec SRSP_transExpxSesionxUsuario 14079, 3605, 19, 1
exec SRSP_transExpxSesionxUsuario 14080, 3723, 22, 1
exec SRSP_transExpxSesionxUsuario 14081, 3649, 4, 1
exec SRSP_transExpxSesionxUsuario 14082, 3658, 22, 1
exec SRSP_transExpxSesionxUsuario 14083, 3422, 19, 1
exec SRSP_transExpxSesionxUsuario 14084, 3457, 4, 1
exec SRSP_transExpxSesionxUsuario 14085, 3272, 19, 1
exec SRSP_transExpxSesionxUsuario 14086, 3383, 22, 1
exec SRSP_transExpxSesionxUsuario 14087, 3277, 20, 1
exec SRSP_transExpxSesionxUsuario 14089, 3599, 20, 1
exec SRSP_transExpxSesionxUsuario 14090, 3544, 4, 1
exec SRSP_transExpxSesionxUsuario 14092, 3351, 19, 1
exec SRSP_transExpxSesionxUsuario 14093, 3694, 4, 1
exec SRSP_transExpxSesionxUsuario 14094, 3458, 19, 1
exec SRSP_transExpxSesionxUsuario 14095, 3581, 22, 1
exec SRSP_transExpxSesionxUsuario 14096, 3459, 19, 1
exec SRSP_transExpxSesionxUsuario 14097, 3490, 20, 1
exec SRSP_transExpxSesionxUsuario 14098, 3461, 20, 1
exec SRSP_transExpxSesionxUsuario 14099, 3663, 20, 1
exec SRSP_transExpxSesionxUsuario 14100, 3709, 4, 1
exec SRSP_transExpxSesionxUsuario 14101, 3574, 22, 1
exec SRSP_transExpxSesionxUsuario 14102, 3463, 20, 1
exec SRSP_transExpxSesionxUsuario 14103, 3756, 22, 1
exec SRSP_transExpxSesionxUsuario 14104, 3491, 4, 1
exec SRSP_transExpxSesionxUsuario 14105, 3609, 20, 1
exec SRSP_transExpxSesionxUsuario 14106, 3757, 19, 1
exec SRSP_transExpxSesionxUsuario 14107, 3193, 19, 1
exec SRSP_transExpxSesionxUsuario 14108, 3623, 20, 1
exec SRSP_transExpxSesionxUsuario 14109, 3758, 22, 1
exec SRSP_transExpxSesionxUsuario 14110, 3647, 20, 1
exec SRSP_transExpxSesionxUsuario 14111, 3453, 20, 1
exec SRSP_transExpxSesionxUsuario 14113, 3727, 22, 1
exec SRSP_transExpxSesionxUsuario 14114, 3504, 22, 1
exec SRSP_transExpxSesionxUsuario 14115, 3481, 22, 1
exec SRSP_transExpxSesionxUsuario 14116, 3449, 20, 1
exec SRSP_transExpxSesionxUsuario 14118, 3754, 20, 1
exec SRSP_transExpxSesionxUsuario 14119, 3762, 20, 1
exec SRSP_transExpxSesionxUsuario 14121, 3635, 22, 1
exec SRSP_transExpxSesionxUsuario 14122, 3628, 20, 1
exec SRSP_transExpxSesionxUsuario 14123, 3583, 19, 1
exec SRSP_transExpxSesionxUsuario 14124, 3705, 22, 1
exec SRSP_transExpxSesionxUsuario 14125, 3689, 19, 1
exec SRSP_transExpxSesionxUsuario 14126, 3494, 19, 1
exec SRSP_transExpxSesionxUsuario 14127, 3586, 19, 1
exec SRSP_transExpxSesionxUsuario 14128, 3655, 19, 1
exec SRSP_transExpxSesionxUsuario 14129, 3485, 22, 1
exec SRSP_transExpxSesionxUsuario 14130, 3408, 22, 1
exec SRSP_transExpxSesionxUsuario 14131, 3538, 22, 1
exec SRSP_transExpxSesionxUsuario 14132, 3690, 19, 1
exec SRSP_transExpxSesionxUsuario 14133, 3271, 19, 1
exec SRSP_transExpxSesionxUsuario 14135, 3546, 19, 1
exec SRSP_transExpxSesionxUsuario 14136, 3492, 19, 1
exec SRSP_transExpxSesionxUsuario 14137, 3596, 19, 1
exec SRSP_transExpxSesionxUsuario 14138, 3766, 19, 1
exec SRSP_transExpxSesionxUsuario 14989, 3771, 5, 1
exec SRSP_transExpxSesionxUsuario 14990, 3439, 5, 1
exec SRSP_transExpxSesionxUsuario 14991, 3442, 8, 1
exec SRSP_transExpxSesionxUsuario 14992, 3415, 8, 1
exec SRSP_transExpxSesionxUsuario 14994, 3691, 9, 1
exec SRSP_transExpxSesionxUsuario 14995, 3455, 8, 1
exec SRSP_transExpxSesionxUsuario 14996, 3303, 9, 1
exec SRSP_transExpxSesionxUsuario 15000, 3761, 7, 1
exec SRSP_transExpxSesionxUsuario 15001, 3738, 7, 1
exec SRSP_transExpxSesionxUsuario 15002, 3549, 10, 1
exec SRSP_transExpxSesionxUsuario 15003, 3720, 5, 1
exec SRSP_transExpxSesionxUsuario 15004, 3784, 8, 1
exec SRSP_transExpxSesionxUsuario 15005, 3745, 8, 1
exec SRSP_transExpxSesionxUsuario 15006, 3662, 6, 1
exec SRSP_transExpxSesionxUsuario 15007, 3550, 10, 1
exec SRSP_transExpxSesionxUsuario 15008, 3507, 6, 1
exec SRSP_transExpxSesionxUsuario 15009, 3719, 5, 1
exec SRSP_transExpxSesionxUsuario 15010, 3629, 5, 1
exec SRSP_transExpxSesionxUsuario 15011, 3786, 5, 1
exec SRSP_transExpxSesionxUsuario 15012, 3753, 5, 1
exec SRSP_transExpxSesionxUsuario 15013, 3533, 6, 1
exec SRSP_transExpxSesionxUsuario 15014, 3740, 5, 1
exec SRSP_transExpxSesionxUsuario 15015, 3366, 7, 1
exec SRSP_transExpxSesionxUsuario 15016, 3510, 10, 1
exec SRSP_transExpxSesionxUsuario 15017, 3657, 5, 1
exec SRSP_transExpxSesionxUsuario 15018, 3712, 9, 1
exec SRSP_transExpxSesionxUsuario 15019, 2983, 9, 1
exec SRSP_transExpxSesionxUsuario 15020, 3466, 5, 1
exec SRSP_transExpxSesionxUsuario 15021, 3568, 8, 1
exec SRSP_transExpxSesionxUsuario 15023, 3642, 5, 1
exec SRSP_transExpxSesionxUsuario 15024, 3535, 6, 1
exec SRSP_transExpxSesionxUsuario 15025, 3624, 6, 1
exec SRSP_transExpxSesionxUsuario 15026, 3620, 10, 1
exec SRSP_transExpxSesionxUsuario 15027, 3785, 7, 1
exec SRSP_transExpxSesionxUsuario 15028, 3590, 7, 1
exec SRSP_transExpxSesionxUsuario 15029, 3537, 5, 1
exec SRSP_transExpxSesionxUsuario 15030, 3708, 5, 1
exec SRSP_transExpxSesionxUsuario 15032, 3542, 7, 1
exec SRSP_transExpxSesionxUsuario 15033, 3525, 7, 1
exec SRSP_transExpxSesionxUsuario 15035, 3744, 10, 1
exec SRSP_transExpxSesionxUsuario 15036, 3390, 10, 1
exec SRSP_transExpxSesionxUsuario 15037, 3529, 8, 1
exec SRSP_transExpxSesionxUsuario 15038, 3527, 7, 1
exec SRSP_transExpxSesionxUsuario 15039, 3768, 8, 1
exec SRSP_transExpxSesionxUsuario 15040, 3500, 5, 1
exec SRSP_transExpxSesionxUsuario 15042, 3454, 10, 1
exec SRSP_transExpxSesionxUsuario 15043, 3790, 5, 1
exec SRSP_transExpxSesionxUsuario 15045, 3539, 9, 1
exec SRSP_transExpxSesionxUsuario 15046, 3530, 5, 1
exec SRSP_transExpxSesionxUsuario 15047, 3681, 9, 1
exec SRSP_transExpxSesionxUsuario 15048, 3528, 5, 1
exec SRSP_transExpxSesionxUsuario 15049, 3587, 8, 1
exec SRSP_transExpxSesionxUsuario 15050, 3279, 8, 1
exec SRSP_transExpxSesionxUsuario 15051, 3669, 7, 1
exec SRSP_transExpxSesionxUsuario 15052, 3409, 7, 1
exec SRSP_transExpxSesionxUsuario 15053, 3614, 10, 1
exec SRSP_transExpxSesionxUsuario 15054, 3776, 8, 1
exec SRSP_transExpxSesionxUsuario 15055, 3565, 9, 1
exec SRSP_transExpxSesionxUsuario 15057, 3476, 7, 1
exec SRSP_transExpxSesionxUsuario 15058, 3548, 5, 1
exec SRSP_transExpxSesionxUsuario 15059, 3562, 5, 1
exec SRSP_transExpxSesionxUsuario 15061, 3650, 7, 1
exec SRSP_transExpxSesionxUsuario 15062, 3779, 8, 1
exec SRSP_transExpxSesionxUsuario 15063, 3672, 9, 1
exec SRSP_transExpxSesionxUsuario 15064, 3667, 8, 1
exec SRSP_transExpxSesionxUsuario 15066, 3545, 10, 1
exec SRSP_transExpxSesionxUsuario 15068, 3682, 7, 1
exec SRSP_transExpxSesionxUsuario 15069, 3795, 5, 1
exec SRSP_transExpxSesionxUsuario 15070, 3713, 9, 1
exec SRSP_transExpxSesionxUsuario 15072, 3695, 9, 1
exec SRSP_transExpxSesionxUsuario 15073, 3725, 9, 1
exec SRSP_transExpxSesionxUsuario 15075, 3589, 7, 1
exec SRSP_transExpxSesionxUsuario 15076, 3645, 5, 1
exec SRSP_transExpxSesionxUsuario 15077, 3356, 10, 1
exec SRSP_transExpxSesionxUsuario 15078, 3701, 6, 1
exec SRSP_transExpxSesionxUsuario 15080, 3378, 7, 1
exec SRSP_transExpxSesionxUsuario 15081, 3444, 5, 1
exec SRSP_transExpxSesionxUsuario 15082, 3796, 5, 1
exec SRSP_transExpxSesionxUsuario 15083, 3578, 8, 1
exec SRSP_transExpxSesionxUsuario 15085, 3797, 7, 1
exec SRSP_transExpxSesionxUsuario 15086, 3798, 6, 1
exec SRSP_transExpxSesionxUsuario 15087, 3206, 7, 1
exec SRSP_transExpxSesionxUsuario 15088, 72, 6, 1
exec SRSP_transExpxSesionxUsuario 15089, 3576, 8, 1
exec SRSP_transExpxSesionxUsuario 15090, 3468, 7, 1
exec SRSP_transExpxSesionxUsuario 15091, 3803, 7, 1
exec SRSP_transExpxSesionxUsuario 15092, 3805, 8, 1
exec SRSP_transExpxSesionxUsuario 15093, 3804, 10, 1
exec SRSP_transExpxSesionxUsuario 15094, 3802, 6, 1
exec SRSP_transExpxSesionxUsuario 15095, 3806, 8, 1
exec SRSP_transExpxSesionxUsuario 15096, 3807, 6, 1
exec SRSP_transExpxSesionxUsuario 15097, 3585, 9, 1
exec SRSP_transExpxSesionxUsuario 15098, 3808, 9, 1
exec SRSP_transExpxSesionxUsuario 15100, 3810, 10, 1
exec SRSP_transExpxSesionxUsuario 15101, 3811, 6, 1
exec SRSP_transExpxSesionxUsuario 15103, 3812, 7, 1
exec SRSP_transExpxSesionxUsuario 15104, 3139, 8, 1
exec SRSP_transExpxSesionxUsuario 15105, 3582, 9, 1
exec SRSP_transExpxSesionxUsuario 15107, 3224, 7, 1
exec SRSP_transExpxSesionxUsuario 15108, 3817, 10, 1
exec SRSP_transExpxSesionxUsuario 15110, 3819, 7, 1
exec SRSP_transExpxSesionxUsuario 15111, 3685, 7, 1
exec SRSP_transExpxSesionxUsuario 15112, 74, 8, 1
exec SRSP_transExpxSesionxUsuario 15113, 3183, 6, 1
exec SRSP_transExpxSesionxUsuario 15115, 3079, 8, 1
exec SRSP_transExpxSesionxUsuario 15116, 3822, 10, 1
exec SRSP_transExpxSesionxUsuario 15117, 3085, 9, 1
exec SRSP_transExpxSesionxUsuario 15118, 3000, 10, 1
exec SRSP_transExpxSesionxUsuario 15119, 3823, 8, 1
exec SRSP_transExpxSesionxUsuario 15120, 3653, 6, 1
exec SRSP_transExpxSesionxUsuario 15121, 3179, 10, 1
exec SRSP_transExpxSesionxUsuario 15122, 2958, 8, 1
exec SRSP_transExpxSesionxUsuario 15123, 3032, 8, 1
exec SRSP_transExpxSesionxUsuario 15125, 3821, 9, 1
exec SRSP_transExpxSesionxUsuario 15126, 3825, 10, 1
exec SRSP_transExpxSesionxUsuario 15127, 2947, 10, 1
exec SRSP_transExpxSesionxUsuario 15128, 3193, 10, 1
exec SRSP_transExpxSesionxUsuario 15129, 3775, 10, 1
exec SRSP_transExpxSesionxUsuario 15130, 3584, 10, 1
exec SRSP_transExpxSesionxUsuario 15131, 3066, 6, 1
exec SRSP_transExpxSesionxUsuario 15136, 3536, 9, 1
exec SRSP_transExpxSesionxUsuario 15137, 3078, 10, 1
exec SRSP_transExpxSesionxUsuario 15139, 3011, 9, 1
exec SRSP_transExpxSesionxUsuario 15140, 3686, 6, 1
exec SRSP_transExpxSesionxUsuario 15142, 3080, 6, 1
exec SRSP_transExpxSesionxUsuario 15143, 3608, 6, 1
exec SRSP_transExpxSesionxUsuario 15144, 41, 6, 1
exec SRSP_transExpxSesionxUsuario 15146, 3167, 9, 1
exec SRSP_transExpxSesionxUsuario 15147, 3438, 9, 1
exec SRSP_transExpxSesionxUsuario 15148, 3754, 10, 1
exec SRSP_transExpxSesionxUsuario 15149, 3625, 6, 1
exec SRSP_transExpxSesionxUsuario 15152, 3186, 6, 1
exec SRSP_transExpxSesionxUsuario 15153, 3573, 6, 1
exec SRSP_transExpxSesionxUsuario 15154, 3571, 6, 1
exec SRSP_transExpxSesionxUsuario 15155, 3509, 6, 1
exec SRSP_transExpxSesionxUsuario 15156, 3727, 9, 1
exec SRSP_transExpxSesionxUsuario 15158, 3831, 9, 1
exec SRSP_transExpxSesionxUsuario 15159, 3832, 9, 1
exec SRSP_transExpxSesionxUsuario 15162, 3422, 17, 1
exec SRSP_transExpxSesionxUsuario 15164, 3361, 17, 1
exec SRSP_transExpxSesionxUsuario 15165, 3842, 17, 1
exec SRSP_transExpxSesionxUsuario 15167, 3615, 17, 1
exec SRSP_transExpxSesionxUsuario 15168, 3802, 17, 1
exec SRSP_transExpxSesionxUsuario 15169, 3515, 17, 1
exec SRSP_transExpxSesionxUsuario 15170, 3849, 17, 1
exec SRSP_transExpxSesionxUsuario 15171, 3439, 17, 1
exec SRSP_transExpxSesionxUsuario 15172, 3720, 17, 1
exec SRSP_transExpxSesionxUsuario 15173, 3790, 17, 1
exec SRSP_transExpxSesionxUsuario 15174, 3850, 17, 1
exec SRSP_transExpxSesionxUsuario 15175, 3851, 17, 1
exec SRSP_transExpxSesionxUsuario 15176, 3590, 17, 1
exec SRSP_transExpxSesionxUsuario 15177, 3544, 17, 1
exec SRSP_transExpxSesionxUsuario 15178, 3852, 17, 1
exec SRSP_transExpxSesionxUsuario 15179, 3693, 17, 1
exec SRSP_transExpxSesionxUsuario 15180, 3681, 17, 1
exec SRSP_transExpxSesionxUsuario 15181, 3701, 17, 1
exec SRSP_transExpxSesionxUsuario 15182, 3578, 17, 1
exec SRSP_transExpxSesionxUsuario 15183, 3576, 17, 1
exec SRSP_transExpxSesionxUsuario 15184, 3667, 17, 1
exec SRSP_transExpxSesionxUsuario 15185, 3758, 17, 1
exec SRSP_transExpxSesionxUsuario 15186, 3193, 17, 1
exec SRSP_transExpxSesionxUsuario 15187, 3756, 17, 1
exec SRSP_transExpxSesionxUsuario 15188, 3535, 18, 1
exec SRSP_transExpxSesionxUsuario 15189, 3584, 19, 1
exec SRSP_transExpxSesionxUsuario 15190, 3119, 19, 1
exec SRSP_transExpxSesionxUsuario 15191, 3206, 18, 1
exec SRSP_transExpxSesionxUsuario 15192, 3461, 22, 1
exec SRSP_transExpxSesionxUsuario 15193, 3568, 21, 1
exec SRSP_transExpxSesionxUsuario 15194, 3443, 18, 1
exec SRSP_transExpxSesionxUsuario 15195, 3283, 19, 1
exec SRSP_transExpxSesionxUsuario 15196, 3654, 19, 1
exec SRSP_transExpxSesionxUsuario 15197, 3224, 19, 1
exec SRSP_transExpxSesionxUsuario 15198, 3677, 18, 1
exec SRSP_transExpxSesionxUsuario 15199, 3186, 21, 1
exec SRSP_transExpxSesionxUsuario 15201, 3727, 19, 1
exec SRSP_transExpxSesionxUsuario 15203, 3711, 23, 1
exec SRSP_transExpxSesionxUsuario 15204, 3192, 22, 1
exec SRSP_transExpxSesionxUsuario 15205, 3764, 22, 1
exec SRSP_transExpxSesionxUsuario 15206, 3485, 18, 1
exec SRSP_transExpxSesionxUsuario 15207, 3586, 18, 1
exec SRSP_transExpxSesionxUsuario 15209, 3790, 20, 1
exec SRSP_transExpxSesionxUsuario 15210, 3811, 18, 1
exec SRSP_transExpxSesionxUsuario 15211, 3542, 21, 1
exec SRSP_transExpxSesionxUsuario 15214, 3587, 18, 1
exec SRSP_transExpxSesionxUsuario 15218, 3458, 22, 1
exec SRSP_transExpxSesionxUsuario 15219, 3682, 19, 1
exec SRSP_transExpxSesionxUsuario 15220, 3638, 20, 1
exec SRSP_transExpxSesionxUsuario 15221, 3459, 22, 1
exec SRSP_transExpxSesionxUsuario 15222, 3272, 18, 1
exec SRSP_transExpxSesionxUsuario 15223, 3847, 19, 1
exec SRSP_transExpxSesionxUsuario 15224, 3536, 20, 1
exec SRSP_transExpxSesionxUsuario 15226, 3668, 19, 1
exec SRSP_transExpxSesionxUsuario 15227, 3697, 21, 1
exec SRSP_transExpxSesionxUsuario 15228, 3795, 19, 1
exec SRSP_transExpxSesionxUsuario 15230, 3527, 20, 1
exec SRSP_transExpxSesionxUsuario 15231, 3669, 20, 1
exec SRSP_transExpxSesionxUsuario 15232, 3827, 20, 1
exec SRSP_transExpxSesionxUsuario 15233, 3466, 23, 1
exec SRSP_transExpxSesionxUsuario 15234, 3409, 20, 1
exec SRSP_transExpxSesionxUsuario 15235, 3062, 18, 1
exec SRSP_transExpxSesionxUsuario 15236, 3833, 21, 1
exec SRSP_transExpxSesionxUsuario 15239, 3713, 20, 1
exec SRSP_transExpxSesionxUsuario 15240, 3109, 22, 1
exec SRSP_transExpxSesionxUsuario 15241, 3628, 23, 1
exec SRSP_transExpxSesionxUsuario 15242, 3645, 23, 1
exec SRSP_transExpxSesionxUsuario 15243, 3860, 19, 1
exec SRSP_transExpxSesionxUsuario 15244, 3146, 23, 1
exec SRSP_transExpxSesionxUsuario 15245, 3595, 23, 1
exec SRSP_transExpxSesionxUsuario 15246, 3491, 18, 1
exec SRSP_transExpxSesionxUsuario 15247, 3473, 20, 1
exec SRSP_transExpxSesionxUsuario 15250, 3771, 19, 1
exec SRSP_transExpxSesionxUsuario 15251, 3561, 21, 1
exec SRSP_transExpxSesionxUsuario 15253, 3593, 23, 1
exec SRSP_transExpxSesionxUsuario 15254, 3861, 21, 1
exec SRSP_transExpxSesionxUsuario 15255, 3779, 19, 1
exec SRSP_transExpxSesionxUsuario 15256, 3474, 20, 1
exec SRSP_transExpxSesionxUsuario 15257, 3708, 23, 1
exec SRSP_transExpxSesionxUsuario 15258, 3804, 21, 1
exec SRSP_transExpxSesionxUsuario 15259, 3173, 18, 1
exec SRSP_transExpxSesionxUsuario 15260, 3446, 22, 1
exec SRSP_transExpxSesionxUsuario 15261, 3863, 18, 1
exec SRSP_transExpxSesionxUsuario 15262, 3864, 19, 1
exec SRSP_transExpxSesionxUsuario 15263, 3427, 23, 1
exec SRSP_transExpxSesionxUsuario 15264, 3865, 22, 1
exec SRSP_transExpxSesionxUsuario 15265, 3543, 23, 1
exec SRSP_transExpxSesionxUsuario 15266, 3085, 23, 1
exec SRSP_transExpxSesionxUsuario 15267, 3796, 18, 1
exec SRSP_transExpxSesionxUsuario 15269, 3821, 20, 1
exec SRSP_transExpxSesionxUsuario 15270, 3510, 20, 1
exec SRSP_transExpxSesionxUsuario 15271, 3605, 22, 1
exec SRSP_transExpxSesionxUsuario 15272, 3506, 19, 1
exec SRSP_transExpxSesionxUsuario 15273, 3851, 20, 1
exec SRSP_transExpxSesionxUsuario 15274, 2972, 19, 1
exec SRSP_transExpxSesionxUsuario 15275, 3867, 18, 1
exec SRSP_transExpxSesionxUsuario 15276, 3574, 19, 1
exec SRSP_transExpxSesionxUsuario 15278, 3642, 20, 1
exec SRSP_transExpxSesionxUsuario 15279, 3758, 19, 1
exec SRSP_transExpxSesionxUsuario 15280, 3757, 19, 1
exec SRSP_transExpxSesionxUsuario 15281, 3836, 19, 1
exec SRSP_transExpxSesionxUsuario 15282, 3486, 19, 1
exec SRSP_transExpxSesionxUsuario 15286, 3843, 19, 1
exec SRSP_transExpxSesionxUsuario 15287, 3868, 18, 1
exec SRSP_transExpxSesionxUsuario 15288, 3494, 19, 1
exec SRSP_transExpxSesionxUsuario 15289, 3798, 19, 1
exec SRSP_transExpxSesionxUsuario 15290, 3871, 22, 1
exec SRSP_transExpxSesionxUsuario 15291, 3620, 20, 1
exec SRSP_transExpxSesionxUsuario 15292, 3870, 18, 1
exec SRSP_transExpxSesionxUsuario 15293, 3481, 23, 1
exec SRSP_transExpxSesionxUsuario 15294, 3635, 18, 1
exec SRSP_transExpxSesionxUsuario 15296, 3613, 20, 1
exec SRSP_transExpxSesionxUsuario 15298, 3694, 20, 1
exec SRSP_transExpxSesionxUsuario 15299, 2983, 21, 1
exec SRSP_transExpxSesionxUsuario 15300, 3712, 21, 1
exec SRSP_transExpxSesionxUsuario 15302, 3707, 21, 1
exec SRSP_transExpxSesionxUsuario 15303, 3525, 20, 1
exec SRSP_transExpxSesionxUsuario 15304, 3802, 22, 1
exec SRSP_transExpxSesionxUsuario 15305, 3807, 22, 1
exec SRSP_transExpxSesionxUsuario 15306, 3496, 20, 1
exec SRSP_transExpxSesionxUsuario 15307, 3872, 20, 1
exec SRSP_transExpxSesionxUsuario 15311, 3509, 21, 1
exec SRSP_transExpxSesionxUsuario 15312, 3761, 23, 1
exec SRSP_transExpxSesionxUsuario 15313, 3874, 18, 1
exec SRSP_transExpxSesionxUsuario 15314, 3776, 22, 1
exec SRSP_transExpxSesionxUsuario 15323, 3856, 18, 1
exec SRSP_transExpxSesionxUsuario 15324, 3271, 18, 1
exec SRSP_transExpxSesionxUsuario 15325, 3539, 20, 1
exec SRSP_transExpxSesionxUsuario 15326, 3597, 21, 1
exec SRSP_transExpxSesionxUsuario 15327, 3064, 20, 1
exec SRSP_transExpxSesionxUsuario 15328, 2962, 21, 1
exec SRSP_transExpxSesionxUsuario 15330, 3834, 22, 1
exec SRSP_transExpxSesionxUsuario 15331, 3787, 22, 1
exec SRSP_transExpxSesionxUsuario 15333, 3839, 18, 1
exec SRSP_transExpxSesionxUsuario 15335, 3180, 22, 1
exec SRSP_transExpxSesionxUsuario 15336, 3578, 21, 1
exec SRSP_transExpxSesionxUsuario 15337, 3878, 18, 1
exec SRSP_transExpxSesionxUsuario 15338, 3877, 18, 1
exec SRSP_transExpxSesionxUsuario 15339, 3840, 22, 1
exec SRSP_transExpxSesionxUsuario 15341, 3550, 20, 1
exec SRSP_transExpxSesionxUsuario 15342, 3853, 21, 1
exec SRSP_transExpxSesionxUsuario 15343, 3540, 20, 1
exec SRSP_transExpxSesionxUsuario 15344, 3773, 22, 1
exec SRSP_transExpxSesionxUsuario 15345, 3695, 22, 1
exec SRSP_transExpxSesionxUsuario 15346, 3167, 23, 1
exec SRSP_transExpxSesionxUsuario 15347, 3053, 21, 1
exec SRSP_transExpxSesionxUsuario 15351, 3581, 23, 1
exec SRSP_transExpxSesionxUsuario 15352, 3880, 22, 1
exec SRSP_transExpxSesionxUsuario 15353, 41, 21, 1
exec SRSP_transExpxSesionxUsuario 15354, 3690, 23, 1
exec SRSP_transExpxSesionxUsuario 15355, 3500, 23, 1
exec SRSP_transExpxSesionxUsuario 15356, 3835, 23, 1
exec SRSP_transExpxSesionxUsuario 15357, 3732, 23, 1
exec SRSP_transExpxSesionxUsuario 15358, 3831, 23, 1
exec SRSP_transExpxSesionxUsuario 15359, 3805, 23, 1
exec SRSP_transExpxSesionxUsuario 15360, 3277, 23, 1
exec SRSP_transExpxSesionxUsuario 15361, 3763, 21, 1
exec SRSP_transExpxSesionxUsuario 15362, 70, 22, 1
exec SRSP_transExpxSesionxUsuario 15363, 2934, 22, 1
exec SRSP_transExpxSesionxUsuario 15364, 3449, 23, 1
exec SRSP_transExpxSesionxUsuario 15367, 3748, 23, 1
exec SRSP_transExpxSesionxUsuario 15368, 3730, 22, 1
exec SRSP_transExpxSesionxUsuario 15369, 3663, 22, 1
exec SRSP_transExpxSesionxUsuario 15370, 3576, 21, 1
exec SRSP_transExpxSesionxUsuario 15372, 3794, 21, 1
exec SRSP_transExpxSesionxUsuario 15373, 3659, 21, 1
exec SRSP_transExpxSesionxUsuario 15374, 3308, 21, 1
exec SRSP_transExpxSesionxUsuario 15376, 3589, 21, 1