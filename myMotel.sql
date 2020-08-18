USE [master]
GO
/****** Object:  Database [myMotel]    Script Date: 09/08/2020 7:22:52 AM ******/
CREATE DATABASE [myMotel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'myMotel', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\myMotel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'myMotel_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\myMotel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [myMotel] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [myMotel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [myMotel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [myMotel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [myMotel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [myMotel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [myMotel] SET ARITHABORT OFF 
GO
ALTER DATABASE [myMotel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [myMotel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [myMotel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [myMotel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [myMotel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [myMotel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [myMotel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [myMotel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [myMotel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [myMotel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [myMotel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [myMotel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [myMotel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [myMotel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [myMotel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [myMotel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [myMotel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [myMotel] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [myMotel] SET  MULTI_USER 
GO
ALTER DATABASE [myMotel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [myMotel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [myMotel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [myMotel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [myMotel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [myMotel] SET QUERY_STORE = OFF
GO
USE [myMotel]
GO
USE [myMotel]
GO
/****** Object:  Sequence [dbo].[hibernate_sequence]    Script Date: 09/08/2020 7:22:52 AM ******/
CREATE SEQUENCE [dbo].[hibernate_sequence] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[Account]    Script Date: 09/08/2020 7:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](500) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Role_ID] [int] NOT NULL,
	[Status_ID] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 09/08/2020 7:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Total] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Status_ID] [int] NOT NULL,
	[Owner] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 09/08/2020 7:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 09/08/2020 7:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Birthdate] [date] NOT NULL,
	[Sex] [bit] NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Details]    Script Date: 09/08/2020 7:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Details](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Bill_ID] [int] NOT NULL,
	[Room_ID] [int] NOT NULL,
	[ElectricNumber] [int] NOT NULL,
	[WaterNumber] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fee]    Script Date: 09/08/2020 7:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Electric] [int] NOT NULL,
	[Water] [int] NOT NULL,
	[Other] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Fee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History]    Script Date: 09/08/2020 7:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[Status_ID] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Power]    Script Date: 09/08/2020 7:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Power](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Room_ID] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Category_ID] [int] NOT NULL,
 CONSTRAINT [PK_Electric] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 09/08/2020 7:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 09/08/2020 7:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Room_Number] [nvarchar](5) NOT NULL,
	[Owner] [nvarchar](50) NOT NULL,
	[Status_ID] [int] NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room_Customer]    Script Date: 09/08/2020 7:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room_Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Room_ID] [int] NOT NULL,
	[Customer_ID] [int] NOT NULL,
 CONSTRAINT [PK_Room_Member] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 09/08/2020 7:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([Username], [Password], [Fullname], [Role_ID], [Status_ID]) VALUES (N'leminhtuan', N'$2a$10$7VZ1Ix02nIjw2Dlgjjn6luICzE9zEEutwJte8rlkDio7bIizCqk3q', N'Lê Minh Tuấn', 1, 1)
INSERT [dbo].[Account] ([Username], [Password], [Fullname], [Role_ID], [Status_ID]) VALUES (N'naruto', N'$2a$10$2a3Zd89nydF5KRR8lnRG8uabKAiGw1EeaihgCy1dlxtPaYBmwYlx2', N'Uzumaki Naruto', 2, 1)
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([ID], [Total], [Date], [Status_ID], [Owner]) VALUES (8, 1247000, CAST(N'2020-08-08' AS Date), 1, N'leminhtuan')
INSERT [dbo].[Bill] ([ID], [Total], [Date], [Status_ID], [Owner]) VALUES (9, 1205000, CAST(N'2020-08-08' AS Date), 1, N'leminhtuan')
SET IDENTITY_INSERT [dbo].[Bill] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Category]) VALUES (1, N'Electric')
INSERT [dbo].[Category] ([ID], [Category]) VALUES (2, N'Water')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([ID], [Name], [Birthdate], [Sex], [Phone], [Email]) VALUES (1, N'Nguyễn Văn Tèo', CAST(N'1999-06-26' AS Date), 1, N'0123456789', N'teopro@gmail.com')
INSERT [dbo].[Customer] ([ID], [Name], [Birthdate], [Sex], [Phone], [Email]) VALUES (2, N'Lý Thị Liễu', CAST(N'1997-07-23' AS Date), 0, N'0321123321', N'lieult@gmail.com')
INSERT [dbo].[Customer] ([ID], [Name], [Birthdate], [Sex], [Phone], [Email]) VALUES (3, N'Trần Thị Cà Chua', CAST(N'1998-09-29' AS Date), 0, NULL, N'cachua@gmail.com')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Details] ON 

INSERT [dbo].[Details] ([ID], [Bill_ID], [Room_ID], [ElectricNumber], [WaterNumber]) VALUES (5, 8, 1, 134, 10)
INSERT [dbo].[Details] ([ID], [Bill_ID], [Room_ID], [ElectricNumber], [WaterNumber]) VALUES (6, 9, 2, 100, 15)
SET IDENTITY_INSERT [dbo].[Details] OFF
SET IDENTITY_INSERT [dbo].[Fee] ON 

INSERT [dbo].[Fee] ([ID], [Electric], [Water], [Other], [Date]) VALUES (1, 3000, 12000, 25000, CAST(N'2020-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[Fee] OFF
SET IDENTITY_INSERT [dbo].[History] ON 

INSERT [dbo].[History] ([ID], [Customer_ID], [Status_ID], [Date]) VALUES (1, 1, 3, CAST(N'2020-06-10' AS Date))
INSERT [dbo].[History] ([ID], [Customer_ID], [Status_ID], [Date]) VALUES (2, 2, 3, CAST(N'2020-06-10' AS Date))
INSERT [dbo].[History] ([ID], [Customer_ID], [Status_ID], [Date]) VALUES (3, 3, 3, CAST(N'2020-06-09' AS Date))
SET IDENTITY_INSERT [dbo].[History] OFF
SET IDENTITY_INSERT [dbo].[Power] ON 

INSERT [dbo].[Power] ([ID], [Room_ID], [Number], [Date], [Category_ID]) VALUES (1, 1, 1000, CAST(N'2020-06-10' AS Date), 1)
INSERT [dbo].[Power] ([ID], [Room_ID], [Number], [Date], [Category_ID]) VALUES (2, 1, 100, CAST(N'2020-06-10' AS Date), 2)
INSERT [dbo].[Power] ([ID], [Room_ID], [Number], [Date], [Category_ID]) VALUES (3, 2, 1000, CAST(N'2020-06-10' AS Date), 1)
INSERT [dbo].[Power] ([ID], [Room_ID], [Number], [Date], [Category_ID]) VALUES (4, 2, 100, CAST(N'2020-06-10' AS Date), 2)
INSERT [dbo].[Power] ([ID], [Room_ID], [Number], [Date], [Category_ID]) VALUES (5, 3, 1000, CAST(N'2020-06-10' AS Date), 1)
INSERT [dbo].[Power] ([ID], [Room_ID], [Number], [Date], [Category_ID]) VALUES (6, 3, 100, CAST(N'2020-06-10' AS Date), 2)
INSERT [dbo].[Power] ([ID], [Room_ID], [Number], [Date], [Category_ID]) VALUES (7, 1, 1100, CAST(N'2020-07-10' AS Date), 1)
INSERT [dbo].[Power] ([ID], [Room_ID], [Number], [Date], [Category_ID]) VALUES (8, 1, 110, CAST(N'2020-07-10' AS Date), 2)
INSERT [dbo].[Power] ([ID], [Room_ID], [Number], [Date], [Category_ID]) VALUES (9, 2, 1100, CAST(N'2020-07-10' AS Date), 1)
INSERT [dbo].[Power] ([ID], [Room_ID], [Number], [Date], [Category_ID]) VALUES (10, 2, 110, CAST(N'2020-07-10' AS Date), 2)
INSERT [dbo].[Power] ([ID], [Room_ID], [Number], [Date], [Category_ID]) VALUES (11, 3, 1100, CAST(N'2020-07-10' AS Date), 1)
INSERT [dbo].[Power] ([ID], [Room_ID], [Number], [Date], [Category_ID]) VALUES (12, 3, 110, CAST(N'2020-07-10' AS Date), 2)
INSERT [dbo].[Power] ([ID], [Room_ID], [Number], [Date], [Category_ID]) VALUES (17, 1, 1234, CAST(N'2020-08-08' AS Date), 1)
INSERT [dbo].[Power] ([ID], [Room_ID], [Number], [Date], [Category_ID]) VALUES (18, 1, 120, CAST(N'2020-08-08' AS Date), 2)
INSERT [dbo].[Power] ([ID], [Room_ID], [Number], [Date], [Category_ID]) VALUES (19, 2, 1200, CAST(N'2020-08-08' AS Date), 1)
INSERT [dbo].[Power] ([ID], [Room_ID], [Number], [Date], [Category_ID]) VALUES (20, 2, 125, CAST(N'2020-08-08' AS Date), 2)
SET IDENTITY_INSERT [dbo].[Power] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [Role]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([ID], [Role]) VALUES (2, N'Member')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([ID], [Room_Number], [Owner], [Status_ID], [Price]) VALUES (1, N'001', N'leminhtuan', 5, 700000)
INSERT [dbo].[Room] ([ID], [Room_Number], [Owner], [Status_ID], [Price]) VALUES (2, N'002', N'leminhtuan', 5, 700000)
INSERT [dbo].[Room] ([ID], [Room_Number], [Owner], [Status_ID], [Price]) VALUES (3, N'003', N'leminhtuan', 6, 700000)
SET IDENTITY_INSERT [dbo].[Room] OFF
SET IDENTITY_INSERT [dbo].[Room_Customer] ON 

INSERT [dbo].[Room_Customer] ([ID], [Room_ID], [Customer_ID]) VALUES (1, 1, 1)
INSERT [dbo].[Room_Customer] ([ID], [Room_ID], [Customer_ID]) VALUES (2, 2, 2)
INSERT [dbo].[Room_Customer] ([ID], [Room_ID], [Customer_ID]) VALUES (3, 2, 3)
SET IDENTITY_INSERT [dbo].[Room_Customer] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([ID], [Status]) VALUES (1, N'Active')
INSERT [dbo].[Status] ([ID], [Status]) VALUES (2, N'InActive')
INSERT [dbo].[Status] ([ID], [Status]) VALUES (3, N'Come')
INSERT [dbo].[Status] ([ID], [Status]) VALUES (4, N'Out')
INSERT [dbo].[Status] ([ID], [Status]) VALUES (5, N'Rented')
INSERT [dbo].[Status] ([ID], [Status]) VALUES (6, N'Free')
INSERT [dbo].[Status] ([ID], [Status]) VALUES (7, N'Deleted')
SET IDENTITY_INSERT [dbo].[Status] OFF
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([Role_ID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Status] FOREIGN KEY([Status_ID])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Status]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Status] FOREIGN KEY([Status_ID])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Status]
GO
ALTER TABLE [dbo].[Details]  WITH CHECK ADD  CONSTRAINT [FK_Details_Bill] FOREIGN KEY([Bill_ID])
REFERENCES [dbo].[Bill] ([ID])
GO
ALTER TABLE [dbo].[Details] CHECK CONSTRAINT [FK_Details_Bill]
GO
ALTER TABLE [dbo].[Details]  WITH CHECK ADD  CONSTRAINT [FK_Details_Room] FOREIGN KEY([Room_ID])
REFERENCES [dbo].[Room] ([ID])
GO
ALTER TABLE [dbo].[Details] CHECK CONSTRAINT [FK_Details_Room]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Member] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Member]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Status] FOREIGN KEY([Status_ID])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Status]
GO
ALTER TABLE [dbo].[Power]  WITH CHECK ADD  CONSTRAINT [FK_Power_Category] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Power] CHECK CONSTRAINT [FK_Power_Category]
GO
ALTER TABLE [dbo].[Power]  WITH CHECK ADD  CONSTRAINT [FK_Power_Room] FOREIGN KEY([Room_ID])
REFERENCES [dbo].[Room] ([ID])
GO
ALTER TABLE [dbo].[Power] CHECK CONSTRAINT [FK_Power_Room]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Status] FOREIGN KEY([Status_ID])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Status]
GO
ALTER TABLE [dbo].[Room_Customer]  WITH CHECK ADD  CONSTRAINT [FK_Room_Member_Member] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Room_Customer] CHECK CONSTRAINT [FK_Room_Member_Member]
GO
ALTER TABLE [dbo].[Room_Customer]  WITH CHECK ADD  CONSTRAINT [FK_Room_Member_Room] FOREIGN KEY([Room_ID])
REFERENCES [dbo].[Room] ([ID])
GO
ALTER TABLE [dbo].[Room_Customer] CHECK CONSTRAINT [FK_Room_Member_Room]
GO
USE [master]
GO
ALTER DATABASE [myMotel] SET  READ_WRITE 
GO
