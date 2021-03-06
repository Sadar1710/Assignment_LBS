USE [master]
GO
/****** Object:  Database [Assignment2]    Script Date: 15/04/2021 16:04:34 ******/
CREATE DATABASE [Assignment2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Assignment2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Assignment2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Assignment2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment2] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Assignment2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment2] SET RECOVERY FULL 
GO
ALTER DATABASE [Assignment2] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Assignment2', N'ON'
GO
ALTER DATABASE [Assignment2] SET QUERY_STORE = OFF
GO
USE [Assignment2]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 15/04/2021 16:04:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 15/04/2021 16:04:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Residency] [nvarchar](max) NULL,
	[Gender] [nvarchar](max) NULL,
	[Birthdate] [datetime2](7) NOT NULL,
	[Photo] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (1, N'CSE')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (2, N'EEE')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (3, N'BBA')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Name], [Address], [Residency], [Gender], [Birthdate], [Photo], [Phone], [DepartmentId]) VALUES (3, N'Name', N'Address', N'Bangladeshi', N'Male', CAST(N'2021-04-04T00:00:00.0000000' AS DateTime2), N'2aefce93-d0f8-4891-b129-2676dca3419f_avatar.jpg', N'01341241233', 3)
INSERT [dbo].[Employee] ([Id], [Name], [Address], [Residency], [Gender], [Birthdate], [Photo], [Phone], [DepartmentId]) VALUES (4, N'Name', N'Address', N'Non-Bangladeshi', N'Female', CAST(N'2021-04-16T00:00:00.0000000' AS DateTime2), N'c1d003a3-70af-4e9c-a8b8-26c8c2c9bdc2_avatar.jpg', N'01734353423', 3)
INSERT [dbo].[Employee] ([Id], [Name], [Address], [Residency], [Gender], [Birthdate], [Photo], [Phone], [DepartmentId]) VALUES (6, N'Name', N'Address', N'Non-Bangladeshi', N'Female', CAST(N'2021-04-16T00:00:00.0000000' AS DateTime2), N'4ba2b804-3f42-4a88-a621-14d792b333ff_avatar.jpg', N'01912424233', 2)
INSERT [dbo].[Employee] ([Id], [Name], [Address], [Residency], [Gender], [Birthdate], [Photo], [Phone], [DepartmentId]) VALUES (7, N'Name', N'Address', N'Bangladeshi', N'Male', CAST(N'2021-04-17T00:00:00.0000000' AS DateTime2), NULL, N'01835423434', 1)
INSERT [dbo].[Employee] ([Id], [Name], [Address], [Residency], [Gender], [Birthdate], [Photo], [Phone], [DepartmentId]) VALUES (8, N'Name', N'Address', N'Non-Bangladeshi', N'Female', CAST(N'2021-04-14T00:00:00.0000000' AS DateTime2), NULL, N'01712321323', 3)
INSERT [dbo].[Employee] ([Id], [Name], [Address], [Residency], [Gender], [Birthdate], [Photo], [Phone], [DepartmentId]) VALUES (9, N'Name', N'Address', N'Non-Bangladeshi', N'Female', CAST(N'2021-04-10T00:00:00.0000000' AS DateTime2), NULL, N'01712312432', 1)
INSERT [dbo].[Employee] ([Id], [Name], [Address], [Residency], [Gender], [Birthdate], [Photo], [Phone], [DepartmentId]) VALUES (10, N'Name', N'Address', N'Non-Bangladeshi', N'Female', CAST(N'2021-04-16T00:00:00.0000000' AS DateTime2), NULL, N'01812341233', 2)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
/****** Object:  Index [IX_Employee_DepartmentId]    Script Date: 15/04/2021 16:04:34 ******/
CREATE NONCLUSTERED INDEX [IX_Employee_DepartmentId] ON [dbo].[Employee]
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department_DepartmentId]
GO
USE [master]
GO
ALTER DATABASE [Assignment2] SET  READ_WRITE 
GO
