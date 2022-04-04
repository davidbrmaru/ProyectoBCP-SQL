USE [master]
GO

/****** Object:  Database [PROYECTOBCP]    Script datetime: 24/03/2022 17:59:51 ******/
CREATE DATABASE [PROYECTOBCP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PROYECTOBCP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PROYECTOBCP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PROYECTOBCP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PROYECTOBCP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PROYECTOBCP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [PROYECTOBCP] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [PROYECTOBCP] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [PROYECTOBCP] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [PROYECTOBCP] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [PROYECTOBCP] SET ARITHABORT OFF 
GO

ALTER DATABASE [PROYECTOBCP] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [PROYECTOBCP] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [PROYECTOBCP] SET AUTO_UPdatetime_STATISTICS ON 
GO

ALTER DATABASE [PROYECTOBCP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [PROYECTOBCP] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [PROYECTOBCP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [PROYECTOBCP] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [PROYECTOBCP] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [PROYECTOBCP] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [PROYECTOBCP] SET  DISABLE_BROKER 
GO

ALTER DATABASE [PROYECTOBCP] SET AUTO_UPdatetime_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [PROYECTOBCP] SET datetime_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [PROYECTOBCP] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [PROYECTOBCP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [PROYECTOBCP] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [PROYECTOBCP] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [PROYECTOBCP] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [PROYECTOBCP] SET RECOVERY FULL 
GO

ALTER DATABASE [PROYECTOBCP] SET  MULTI_USER 
GO

ALTER DATABASE [PROYECTOBCP] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [PROYECTOBCP] SET DB_CHAINING OFF 
GO

ALTER DATABASE [PROYECTOBCP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [PROYECTOBCP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [PROYECTOBCP] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [PROYECTOBCP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [PROYECTOBCP] SET QUERY_STORE = OFF
GO

ALTER DATABASE [PROYECTOBCP] SET  READ_WRITE 
GO


USE [PROYECTOBCP]

GO

/****** Object:  Table [dbo].[APPLICATION]    Script datetimetime: 24/03/2022 17:56:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[APPLICATION](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[COD_APLICACION] [varchar](4) NOT NULL,
	[NOMBRE] [varchar](100) NOT NULL,
	[COD_OWNER] [varchar](50) NOT NULL,
	[ID_SQUAD] [int] NOT NULL,
	[BINDING_BLOCK] [varchar](100) NOT NULL,
	[FEC_INGRESO] [datetimetime] NOT NULL,
	[USUARIO_INGRESA] [varchar](6) NOT NULL,
	[FEC_ACTUALIZA] [datetimetime] NULL,
	[USUARIO_ACTUALIZA] [varchar](6) NULL,
	[FLG_ACTIVO] [int] NOT NULL,
 CONSTRAINT [PK_APPLICATION] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[APPLICATION_TEAM_MEMBER](
	[ID_APPLICATION] [int] NOT NULL,
	[ID_TEAM_MEMBER] [int] NOT NULL,
	[POR_ASIGNADO] [decimal](3, 0) NOT NULL,
	[COMENTARIO] [varchar](1000) NULL,
	[FEC_INGRESO] [datetime] NOT NULL,
	[USUARIO_INGRESA] [varchar](6) NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CHAPTER_AREA_LEADER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[COD_MATRICULA] [varchar](6) NOT NULL,
	[NOMBRES] [varchar](10) NOT NULL,
	[APELLIDO_PATERNO] [varchar](50) NOT NULL,
	[APELLIDO_MATERNO] [varchar](50) NOT NULL,
	[FEC_INGRESO] [datetime] NOT NULL,
	[USUARIO_INGRESA] [varchar](6) NOT NULL,
	[FEC_ACTUALIZA] [datetime] NULL,
	[USUARIO_ACTUALIZA] [varchar](6) NULL,
	[FLG_ACTIVO] [int] NOT NULL,
 CONSTRAINT [PK_CHAPTER_AREA_LEADER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CHAPTER_LEADER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_CHAPTER_AREA_LEADER] [int] NOT NULL,
	[COD_MATRICULA] [varchar](6) NOT NULL,
	[NOMBRES] [varchar](100) NOT NULL,
	[APELLIDO_PATERNO] [varchar](50) NOT NULL,
	[APELLIDO_MATERNO] [varchar](50) NOT NULL,
	[FEC_INGRESO] [datetime] NOT NULL,
	[USUARIO_INGRESA] [varchar](6) NOT NULL,
	[FEC_ACTUALIZA] [datetime] NULL,
	[USUARIO_ACTUALIZA] [varchar](6) NULL,
	[FLG_ACTIVO] [int] NOT NULL,
 CONSTRAINT [PK_CHAPTER_LEADER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SQUAD](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_TRIBE] [int] NOT NULL,
	[NOMBRE] [varchar](100) NOT NULL,
	[FEC_INGRESO] [datetime] NOT NULL,
	[USUARIO_INGRESA] [varchar](6) NOT NULL,
	[FEC_ACTUALIZA] [datetime] NULL,
	[USUARIO_ACTUALIZA] [varchar](6) NULL,
	[FLG_ACTIVO] [int] NOT NULL,
 CONSTRAINT [PK_SQUAD] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TEAM_MEMBER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[COD_MATRICULA] [varchar](6) NOT NULL,
	[NOMBRE] [varchar](100) NOT NULL,
	[APELLIDO_PATERNO] [varchar](50) NOT NULL,
	[APELLIDO_MATERNO] [varchar](50) NOT NULL,
	[ID_CHAPTER_LEADER] [int] NOT NULL,
	[TIPO_PROVEEDOR] [varchar](30) NOT NULL,
	[EMPRESA] [varchar](30) NOT NULL,
	[ROL] [varchar](50) NULL,
	[ROL_INSOURCING] [varchar](50) NULL,
	[ESPECIALIDAD] [varchar](20) NULL,
	[FEC_INGRESO] [datetime] NOT NULL,
	[USUARIO_INGRESA] [varchar](6) NOT NULL,
	[FEC_ACTUALIZA] [datetime] NULL,
	[USUARIO_ACTUALIZA] [varchar](6) NULL,
	[FLG_ACTIVO] [int] NOT NULL,
 CONSTRAINT [PK_TEAM_MEMBER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TRIBE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](100) NOT NULL,
	[TIPO] [varchar](50) NOT NULL,
	[FEC_INGRESO] [datetime] NOT NULL,
	[USUARIO_INGRESA] [varchar](6) NOT NULL,
	[FEC_ACTUALIZA] [datetime] NULL,
	[USUARIO_ACTUALIZA] [varchar](6) NULL,
	[FLG_ACTIVO] [int] NOT NULL,
 CONSTRAINT [PK_TRIBE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[LOG](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Thread] [varchar](255) NOT NULL,
	[Level] [varchar](50) NOT NULL,
	[Logger] [varchar](255) NOT NULL,
	[Message] [varchar](4000) NOT NULL,
	[Exception] [varchar](2000) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[APPLICATION_TEAM_MEMBER]  WITH CHECK ADD  CONSTRAINT [FK_APPLICATION_TEAM_MEMBER_APPLICATION] FOREIGN KEY([ID_APPLICATION])
REFERENCES [dbo].[APPLICATION] ([ID])
GO

ALTER TABLE [dbo].[APPLICATION_TEAM_MEMBER] CHECK CONSTRAINT [FK_APPLICATION_TEAM_MEMBER_APPLICATION]
GO

ALTER TABLE [dbo].[APPLICATION_TEAM_MEMBER]  WITH CHECK ADD  CONSTRAINT [FK_APPLICATION_TEAM_MEMBER_TEAM_MEMBER] FOREIGN KEY([ID_TEAM_MEMBER])
REFERENCES [dbo].[TEAM_MEMBER] ([ID])
GO

ALTER TABLE [dbo].[APPLICATION_TEAM_MEMBER] CHECK CONSTRAINT [FK_APPLICATION_TEAM_MEMBER_TEAM_MEMBER]
GO

ALTER TABLE [dbo].[APPLICATION]  WITH CHECK ADD  CONSTRAINT [FK_APPLICATION_SQUAD] FOREIGN KEY([ID_SQUAD])
REFERENCES [dbo].[SQUAD] ([ID])
GO

ALTER TABLE [dbo].[APPLICATION] CHECK CONSTRAINT [FK_APPLICATION_SQUAD]
GO

ALTER TABLE [dbo].[TEAM_MEMBER]  WITH CHECK ADD  CONSTRAINT [FK_TEAM_MEMBER_CHAPTER_LEADER] FOREIGN KEY([ID_CHAPTER_LEADER])
REFERENCES [dbo].[CHAPTER_LEADER] ([ID])
GO

ALTER TABLE [dbo].[TEAM_MEMBER] CHECK CONSTRAINT [FK_TEAM_MEMBER_CHAPTER_LEADER]
GO

ALTER TABLE [dbo].[SQUAD]  WITH CHECK ADD  CONSTRAINT [FK_SQUAD_TRIBE] FOREIGN KEY([ID_TRIBE])
REFERENCES [dbo].[TRIBE] ([ID])
GO

ALTER TABLE [dbo].[SQUAD] CHECK CONSTRAINT [FK_SQUAD_TRIBE]
GO

ALTER TABLE [dbo].[CHAPTER_LEADER]  WITH CHECK ADD  CONSTRAINT [FK_CHAPTER_LEADER_CHAPTER_AREA_LEADER] FOREIGN KEY([ID_CHAPTER_AREA_LEADER])
REFERENCES [dbo].[CHAPTER_AREA_LEADER] ([ID])
GO

ALTER TABLE [dbo].[CHAPTER_LEADER] CHECK CONSTRAINT [FK_CHAPTER_LEADER_CHAPTER_AREA_LEADER]
GO