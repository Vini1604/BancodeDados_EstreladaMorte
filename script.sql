/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2016
    Target Database Engine Edition : Microsoft SQL Server Express Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [EstrelaDaMorte]    Script Date: 03/10/2021 12:45:12 ******/
CREATE DATABASE [EstrelaDaMorte]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EstrelaDaMorte', FILENAME = N'C:\Users\vinic\EstrelaDaMorte.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EstrelaDaMorte_log', FILENAME = N'C:\Users\vinic\EstrelaDaMorte_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EstrelaDaMorte] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EstrelaDaMorte].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EstrelaDaMorte] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EstrelaDaMorte] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EstrelaDaMorte] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EstrelaDaMorte] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EstrelaDaMorte] SET ARITHABORT OFF 
GO
ALTER DATABASE [EstrelaDaMorte] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EstrelaDaMorte] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EstrelaDaMorte] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EstrelaDaMorte] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EstrelaDaMorte] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EstrelaDaMorte] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EstrelaDaMorte] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EstrelaDaMorte] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EstrelaDaMorte] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EstrelaDaMorte] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EstrelaDaMorte] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EstrelaDaMorte] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EstrelaDaMorte] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EstrelaDaMorte] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EstrelaDaMorte] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EstrelaDaMorte] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EstrelaDaMorte] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EstrelaDaMorte] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EstrelaDaMorte] SET  MULTI_USER 
GO
ALTER DATABASE [EstrelaDaMorte] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EstrelaDaMorte] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EstrelaDaMorte] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EstrelaDaMorte] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EstrelaDaMorte] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EstrelaDaMorte] SET QUERY_STORE = OFF
GO
USE [EstrelaDaMorte]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [EstrelaDaMorte]
GO
/****** Object:  Table [dbo].[HistoricoViagens]    Script Date: 03/10/2021 12:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoricoViagens](
	[IdNave] [int] NOT NULL,
	[IdPiloto] [int] NOT NULL,
	[DtSaida] [datetime] NOT NULL,
	[DtChegada] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Naves]    Script Date: 03/10/2021 12:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Naves](
	[IdNave] [int] NOT NULL,
	[Nome] [varchar](100) NOT NULL,
	[Modelo] [varchar](150) NOT NULL,
	[Capacidade] [int] NOT NULL,
	[Carga] [float] NOT NULL,
 CONSTRAINT [PK_Naves] PRIMARY KEY CLUSTERED 
(
	[IdNave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pilotos]    Script Date: 03/10/2021 12:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pilotos](
	[IdPiloto] [int] NOT NULL,
	[Nome] [varchar](200) NOT NULL,
	[AnoNascimento] [varchar](10) NOT NULL,
	[Patente] [varchar](100) NOT NULL,
	[IdPlaneta] [int] NOT NULL,
 CONSTRAINT [PK_Pilotos] PRIMARY KEY CLUSTERED 
(
	[IdPiloto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PilotosNaves]    Script Date: 03/10/2021 12:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PilotosNaves](
	[IdPiloto] [int] NOT NULL,
	[IdNave] [int] NOT NULL,
	[FlagAutorizado] [bit] NOT NULL,
 CONSTRAINT [PK_PilotosNaves] PRIMARY KEY CLUSTERED 
(
	[IdPiloto] ASC,
	[IdNave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Planetas]    Script Date: 03/10/2021 12:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Planetas](
	[IdPlaneta] [int] NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Rotacao] [float] NOT NULL,
	[Orbita] [float] NOT NULL,
	[Diametro] [float] NOT NULL,
	[Satelite] [int] NOT NULL,
	[Clima] [varchar](50) NOT NULL,
	[Populacao] [int] NOT NULL,
 CONSTRAINT [PK_Planetas] PRIMARY KEY CLUSTERED 
(
	[IdPlaneta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PilotosNaves] ADD  CONSTRAINT [DF_PilotosNaves_FlagAutorizado]  DEFAULT ((1)) FOR [FlagAutorizado]
GO
ALTER TABLE [dbo].[HistoricoViagens]  WITH CHECK ADD  CONSTRAINT [FK_HistoricoViagens_PilotosNaves] FOREIGN KEY([IdPiloto], [IdNave])
REFERENCES [dbo].[PilotosNaves] ([IdPiloto], [IdNave])
GO
ALTER TABLE [dbo].[HistoricoViagens] CHECK CONSTRAINT [FK_HistoricoViagens_PilotosNaves]
GO
ALTER TABLE [dbo].[Pilotos]  WITH CHECK ADD  CONSTRAINT [FK_Pilotos_Planetas] FOREIGN KEY([IdPlaneta])
REFERENCES [dbo].[Planetas] ([IdPlaneta])
GO
ALTER TABLE [dbo].[Pilotos] CHECK CONSTRAINT [FK_Pilotos_Planetas]
GO
ALTER TABLE [dbo].[PilotosNaves]  WITH CHECK ADD  CONSTRAINT [FK_PilotosNaves_Naves] FOREIGN KEY([IdNave])
REFERENCES [dbo].[Naves] ([IdNave])
GO
ALTER TABLE [dbo].[PilotosNaves] CHECK CONSTRAINT [FK_PilotosNaves_Naves]
GO
ALTER TABLE [dbo].[PilotosNaves]  WITH CHECK ADD  CONSTRAINT [FK_PilotosNaves_Pilotos] FOREIGN KEY([IdPiloto])
REFERENCES [dbo].[Pilotos] ([IdPiloto])
GO
ALTER TABLE [dbo].[PilotosNaves] CHECK CONSTRAINT [FK_PilotosNaves_Pilotos]
GO
USE [master]
GO
ALTER DATABASE [EstrelaDaMorte] SET  READ_WRITE 
GO
