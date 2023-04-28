USE [master]
GO
/****** Object:  Database [Excell-On-Db]    Script Date: 28/04/2023 18:25:34 ******/
CREATE DATABASE [Excell-On-Db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Excell-On-Db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Excell-On-Db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Excell-On-Db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Excell-On-Db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Excell-On-Db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Excell-On-Db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Excell-On-Db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Excell-On-Db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Excell-On-Db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Excell-On-Db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Excell-On-Db] SET ARITHABORT OFF 
GO
ALTER DATABASE [Excell-On-Db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Excell-On-Db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Excell-On-Db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Excell-On-Db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Excell-On-Db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Excell-On-Db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Excell-On-Db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Excell-On-Db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Excell-On-Db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Excell-On-Db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Excell-On-Db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Excell-On-Db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Excell-On-Db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Excell-On-Db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Excell-On-Db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Excell-On-Db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Excell-On-Db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Excell-On-Db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Excell-On-Db] SET  MULTI_USER 
GO
ALTER DATABASE [Excell-On-Db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Excell-On-Db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Excell-On-Db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Excell-On-Db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Excell-On-Db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Excell-On-Db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Excell-On-Db] SET QUERY_STORE = OFF
GO
USE [Excell-On-Db]
GO
/****** Object:  Table [dbo].[Banking]    Script Date: 28/04/2023 18:25:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateCreate] [date] NULL,
	[Money] [float] NULL,
	[Deleted] [bit] NULL,
	[Status] [bit] NULL,
	[OrderId] [int] NULL,
	[CustomerId] [int] NULL,
 CONSTRAINT [PK_Banking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardPayment]    Script Date: 28/04/2023 18:25:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardPayment](
	[id] [int] NOT NULL,
	[CustomerId] [int] NULL,
	[CardNumber] [int] NULL,
	[CVV] [int] NULL,
	[DateExpired] [date] NULL,
 CONSTRAINT [PK_CardPayment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 28/04/2023 18:25:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](255) NULL,
	[CustomerPhone] [varchar](255) NULL,
	[CustomerEmail] [varchar](255) NULL,
	[CustomerUserName] [varchar](255) NULL,
	[CustomerPassword] [varchar](255) NULL,
	[CustomerAvatar] [text] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK__Customer__3214EC07E552F113] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 28/04/2023 18:25:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MyCompany]    Script Date: 28/04/2023 18:25:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MyCompany](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](255) NULL,
	[Image] [text] NULL,
	[Description] [varchar](max) NULL,
	[Address] [varchar](255) NULL,
	[TaxIdentificationNumber] [varchar](255) NULL,
	[MyMission] [ntext] NULL,
	[MyVision] [ntext] NULL,
	[MyTarget] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 28/04/2023 18:25:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDetailDateStart] [datetime] NULL,
	[OrderDetailDateEnd] [datetime] NULL,
	[OrderDetailStatus] [int] NULL,
	[OrderDetailNumberOfPeople] [int] NULL,
	[ServiceId] [int] NULL,
	[OrdersId] [int] NULL,
	[DerpartmentId] [int] NULL,
 CONSTRAINT [PK__OrderDet__3214EC07E231B99A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 28/04/2023 18:25:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDateCreate] [varchar](50) NULL,
	[OrderDescription] [text] NULL,
	[OrderTotalCost] [float] NULL,
	[OrderStatus] [int] NULL,
	[CustomerId] [int] NOT NULL,
 CONSTRAINT [PK__Orders__3214EC07AA0285C3] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 28/04/2023 18:25:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 28/04/2023 18:25:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [varchar](255) NULL,
	[ServicePrice] [float] NULL,
	[ServiceDescription] [text] NULL,
	[ServiceImage] [text] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK__Service__3214EC07433C3329] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 28/04/2023 18:25:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StaffEmail] [varchar](255) NULL,
	[StaffGender] [int] NULL,
	[StaffAge] [int] NULL,
	[StaffStatus] [int] NULL,
	[StaffPhone] [varchar](50) NULL,
	[StaffAddress] [varchar](255) NULL,
	[StaffAvatar] [text] NULL,
	[StaffFullName] [varchar](255) NULL,
	[ServiceId] [int] NULL,
	[Deleted] [bit] NULL,
	[DepartmentId] [int] NULL,
 CONSTRAINT [PK__Staff__3214EC07EED9A723] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaffOrderDetail]    Script Date: 28/04/2023 18:25:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffOrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateStart] [datetime] NULL,
	[DateEnd] [datetime] NULL,
	[StaffId] [int] NULL,
	[OrderDetailId] [int] NULL,
 CONSTRAINT [PK__Staff_Or__3214EC07959F77E3] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInFo]    Script Date: 28/04/2023 18:25:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInFo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](255) NULL,
	[UserPassword] [varchar](255) NULL,
	[UserEmail] [varchar](255) NULL,
	[UserAge] [int] NULL,
	[UserPhone] [varchar](50) NULL,
	[UserAddress] [varchar](255) NULL,
	[UserAvatar] [text] NULL,
	[UserFullName] [varchar](255) NULL,
	[Role] [varchar](255) NULL,
 CONSTRAINT [PK__UserInFo__3214EC07EAFC10DC] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Customer_Avatar]  DEFAULT ('~/Public/Image/avt.png') FOR [CustomerAvatar]
GO
ALTER TABLE [dbo].[UserInFo] ADD  CONSTRAINT [DF_UserInFo_User_Avatar]  DEFAULT ('~/Public/Image/avt.png') FOR [UserAvatar]
GO
ALTER TABLE [dbo].[Banking]  WITH CHECK ADD  CONSTRAINT [FK__Banking__Custome__412EB0B6] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Banking] CHECK CONSTRAINT [FK__Banking__Custome__412EB0B6]
GO
ALTER TABLE [dbo].[Banking]  WITH CHECK ADD  CONSTRAINT [FK__Banking__OrderId__4222D4EF] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[Banking] CHECK CONSTRAINT [FK__Banking__OrderId__4222D4EF]
GO
ALTER TABLE [dbo].[CardPayment]  WITH CHECK ADD  CONSTRAINT [FK_CardPayment_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[CardPayment] CHECK CONSTRAINT [FK_CardPayment_Customer]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Order__6319B466] FOREIGN KEY([OrdersId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__Order__6319B466]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Servi__6225902D] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__Servi__6225902D]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Department] FOREIGN KEY([DerpartmentId])
REFERENCES [dbo].[Department] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Department]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__Customer__5F492382] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__Customer__5F492382]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK__Staff__ServiceId__49C3F6B7] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK__Staff__ServiceId__49C3F6B7]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Department]
GO
ALTER TABLE [dbo].[StaffOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__Staff_Ord__Order__7720AD13] FOREIGN KEY([OrderDetailId])
REFERENCES [dbo].[OrderDetail] ([Id])
GO
ALTER TABLE [dbo].[StaffOrderDetail] CHECK CONSTRAINT [FK__Staff_Ord__Order__7720AD13]
GO
ALTER TABLE [dbo].[StaffOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__Staff_Ord__Staff__762C88DA] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([Id])
GO
ALTER TABLE [dbo].[StaffOrderDetail] CHECK CONSTRAINT [FK__Staff_Ord__Staff__762C88DA]
GO
ALTER TABLE [dbo].[UserInFo]  WITH CHECK ADD  CONSTRAINT [FK_UserInFo_Role] FOREIGN KEY([Role])
REFERENCES [dbo].[Role] ([Role])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserInFo] CHECK CONSTRAINT [FK_UserInFo_Role]
GO
USE [master]
GO
ALTER DATABASE [Excell-On-Db] SET  READ_WRITE 
GO
