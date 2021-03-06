USE [Assignment3]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 20/04/2021 01:06:53 ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 20/04/2021 01:06:53 ******/
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

INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (1, N'BBA')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (2, N'CSE')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (15, N'EEE')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Name], [Address], [Residency], [Gender], [Birthdate], [Photo], [Phone], [DepartmentId]) VALUES (1, N'Name', N'Address', N'Bangladeshi', N'Male', CAST(N'2021-04-23T00:00:00.0000000' AS DateTime2), N'29a3a747-00d4-4719-a50c-e73962ad4c01_photo.jpg', N'01813143424', 1)
INSERT [dbo].[Employee] ([Id], [Name], [Address], [Residency], [Gender], [Birthdate], [Photo], [Phone], [DepartmentId]) VALUES (4, N'Name', N'Address', N'Bangladeshi', N'Male', CAST(N'2021-04-15T00:00:00.0000000' AS DateTime2), NULL, N'01812321343', 15)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department_DepartmentId]
GO
