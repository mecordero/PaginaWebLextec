USE [master]
GO

/****** Object:  Database [SR1.0]    Script Date: 10/4/2018 10:53:30 PM ******/
CREATE DATABASE [SR1.0]
GO

USE [SR1.0]
GO


/****** Object:  Table [dbo].[Usuario]    Script Date: 10/4/2018 10:56:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido1] [varchar](max) NULL,
	[apellido2] [varchar](max) NULL,
	[numeroCedula] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[especialidad] [varchar](50) NULL,
	[nacionalidad] [varchar](50) NULL,
	[gradoEstudio] [varchar](50) NULL,
	[genero] [char](1) NULL,
	[habilitado] [bit] NULL,
	[estudiante] [bit] NULL,
	[fechaNacimiento] [date] NULL,
	[telefono] [int] NULL,
	[annoIngreso] [int] NULL,
	[fechaRegistro] [datetime] NULL,
	[fechaDeshabilitado] [datetime] NULL,
	[fechaUltimaParticipacion] [datetime] NULL,
	[fk_ultimaSesion] [int] NULL,
	[fk_ultimoExperimento] [int] NULL,
	[cantidadParticipacion] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Administrador]    Script Date: 10/4/2018 10:53:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Administrador](
	[idAdmin] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido1] [varchar](max) NULL,
	[apellido2] [varchar](max) NULL,
	[genero] [char](1) NULL,
	[email] [varchar](max) NULL,
	[contrasenna] [varchar](max) NULL,
	[masterAdm] [bit] NULL,
 CONSTRAINT [PK_Administrador] PRIMARY KEY CLUSTERED 
(
	[idAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [SR1.0]
GO

/****** Object:  Table [dbo].[Clase]    Script Date: 10/4/2018 10:54:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Clase](
	[idClase] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Clase] PRIMARY KEY CLUSTERED 
(
	[idClase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [SR1.0]
GO

/****** Object:  Table [dbo].[Experimento]    Script Date: 10/4/2018 10:54:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Experimento](
	[idExperimento] [int] IDENTITY(1,1) NOT NULL,
	[fk_tipo] [int] NOT NULL,
	[fk_clase] [int] NOT NULL,
	[fk_administrador] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[nombrePublico] [varchar](50) NULL,
	[nota] [varchar](max) NULL,
	[descripcion] [varchar](max) NULL,
	[lugar] [varchar](max) NULL,
	[completado] [bit] NULL,
	[abierto] [bit] NULL,
	[fechaRegistro] [date] NULL,
	[fechaInicio] [datetime] NULL,
	[fechaFinal] [datetime] NULL,
	[mensaje] [varchar](max) NULL,
 CONSTRAINT [PK_Experimento] PRIMARY KEY CLUSTERED 
(
	[idExperimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [SR1.0]
GO

/****** Object:  Table [dbo].[Resultado]    Script Date: 10/4/2018 10:54:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Resultado](
	[idResultado] [int] IDENTITY(1,1) NOT NULL,
	[fk_sesion] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[tipo] [varchar](50) NULL,
	[tamano] [bigint] NULL,
	[archivo] [varbinary](max) NULL,
 CONSTRAINT [PK_Resultado] PRIMARY KEY CLUSTERED 
(
	[idResultado] ASC,
	[fk_sesion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


USE [SR1.0]
GO

/****** Object:  Table [dbo].[Sesion]    Script Date: 10/4/2018 10:55:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Sesion](
	[idSesion] [int] IDENTITY(1,1) NOT NULL,
	[fk_experimento] [int] NOT NULL,
	[fecha] [date] NULL,
	[horaInicio] [time](7) NULL,
	[horaFinal] [time](7) NULL,
	[lleno] [bit] NULL,
	[cupo] [int] NULL,
 CONSTRAINT [PK_Sesion] PRIMARY KEY CLUSTERED 
(
	[idSesion] ASC,
	[fk_experimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [SR1.0]
GO

/****** Object:  Table [dbo].[SesionxUsuario]    Script Date: 10/4/2018 10:55:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SesionxUsuario](
	[idSesionXusuario] [int] IDENTITY(1,1) NOT NULL,
	[fk_usuario] [int] NOT NULL,
	[fk_sesion] [int] NOT NULL,
	[matriculado] [bit] NULL,
	[participo] [int] NULL,
 CONSTRAINT [PK_SesionXUsuario] PRIMARY KEY CLUSTERED 
(
	[idSesionXusuario] ASC,
	[fk_usuario] ASC,
	[fk_sesion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[SesionxUsuario]  WITH CHECK ADD  CONSTRAINT [FK_SesionXUsuario_Usuario] FOREIGN KEY([fk_usuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

USE [SR1.0]
GO

/****** Object:  Table [dbo].[Tipo]    Script Date: 10/4/2018 10:55:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Tipo](
	[idTipo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](max) NULL,
 CONSTRAINT [PK_Tipo_1] PRIMARY KEY CLUSTERED 
(
	[idTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [SR1.0]
GO

ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([fk_ultimaSesion], [fk_ultimoExperimento])
REFERENCES [dbo].[Sesion] ([idSesion], [fk_experimento])
GO

ALTER TABLE [dbo].[SesionxUsuario] CHECK CONSTRAINT [FK_SesionXUsuario_Usuario]
GO


ALTER TABLE [dbo].[Experimento]  WITH NOCHECK ADD  CONSTRAINT [FK_Experimento_Clase] FOREIGN KEY([fk_clase])
REFERENCES [dbo].[Clase] ([idClase])
GO

ALTER TABLE [dbo].[Experimento] NOCHECK CONSTRAINT [FK_Experimento_Clase]
GO

ALTER TABLE [dbo].[Experimento]  WITH CHECK ADD  CONSTRAINT [FK_Experimento_Tipo] FOREIGN KEY([fk_tipo])
REFERENCES [dbo].[Tipo] ([idTipo])
GO

ALTER TABLE [dbo].[Experimento] CHECK CONSTRAINT [FK_Experimento_Tipo]
GO

