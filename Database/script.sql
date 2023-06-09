/****** Object:  Database [Excell-On-Db]    Script Date: 21/05/2023 21:59:34 ******/
CREATE DATABASE [Excell-On-Db]  (EDITION = 'Standard', SERVICE_OBJECTIVE = 'S0', MAXSIZE = 250 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [Excell-On-Db] SET COMPATIBILITY_LEVEL = 150
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
ALTER DATABASE [Excell-On-Db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Excell-On-Db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Excell-On-Db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Excell-On-Db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Excell-On-Db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Excell-On-Db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Excell-On-Db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Excell-On-Db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Excell-On-Db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Excell-On-Db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Excell-On-Db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Excell-On-Db] SET  MULTI_USER 
GO
ALTER DATABASE [Excell-On-Db] SET ENCRYPTION ON
GO
ALTER DATABASE [Excell-On-Db] SET QUERY_STORE = ON
GO
ALTER DATABASE [Excell-On-Db] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[Banking]    Script Date: 21/05/2023 21:59:34 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardPayment]    Script Date: 21/05/2023 21:59:34 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 21/05/2023 21:59:34 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 21/05/2023 21:59:34 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MyCompany]    Script Date: 21/05/2023 21:59:34 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 21/05/2023 21:59:34 ******/
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
	[DepartmentId] [int] NULL,
 CONSTRAINT [PK__OrderDet__3214EC07E231B99A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 21/05/2023 21:59:34 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 21/05/2023 21:59:34 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 21/05/2023 21:59:34 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 21/05/2023 21:59:34 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaffOrderDetail]    Script Date: 21/05/2023 21:59:34 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInFo]    Script Date: 21/05/2023 21:59:34 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Banking] ON 

INSERT [dbo].[Banking] ([Id], [DateCreate], [Money], [Deleted], [Status], [OrderId], [CustomerId]) VALUES (6, CAST(N'2021-09-01' AS Date), 117370, NULL, 1, 65, 39)
INSERT [dbo].[Banking] ([Id], [DateCreate], [Money], [Deleted], [Status], [OrderId], [CustomerId]) VALUES (7, CAST(N'2021-09-01' AS Date), 79200, NULL, 1, 25, 30)
INSERT [dbo].[Banking] ([Id], [DateCreate], [Money], [Deleted], [Status], [OrderId], [CustomerId]) VALUES (8, CAST(N'2021-09-01' AS Date), 30000, NULL, 1, 26, 30)
INSERT [dbo].[Banking] ([Id], [DateCreate], [Money], [Deleted], [Status], [OrderId], [CustomerId]) VALUES (9, CAST(N'2021-09-01' AS Date), 90000, NULL, 1, 27, 30)
INSERT [dbo].[Banking] ([Id], [DateCreate], [Money], [Deleted], [Status], [OrderId], [CustomerId]) VALUES (10, CAST(N'2021-09-01' AS Date), 87300, NULL, 1, 62, 30)
INSERT [dbo].[Banking] ([Id], [DateCreate], [Money], [Deleted], [Status], [OrderId], [CustomerId]) VALUES (11, CAST(N'2021-09-01' AS Date), 222615, NULL, 1, 64, 30)
INSERT [dbo].[Banking] ([Id], [DateCreate], [Money], [Deleted], [Status], [OrderId], [CustomerId]) VALUES (12, CAST(N'2021-09-01' AS Date), 180000, NULL, 1, 66, 30)
INSERT [dbo].[Banking] ([Id], [DateCreate], [Money], [Deleted], [Status], [OrderId], [CustomerId]) VALUES (13, CAST(N'2021-09-01' AS Date), 420825, NULL, 1, 90, 64)
INSERT [dbo].[Banking] ([Id], [DateCreate], [Money], [Deleted], [Status], [OrderId], [CustomerId]) VALUES (14, CAST(N'2021-09-01' AS Date), 45000, NULL, 1, 89, 64)
INSERT [dbo].[Banking] ([Id], [DateCreate], [Money], [Deleted], [Status], [OrderId], [CustomerId]) VALUES (15, CAST(N'2021-09-01' AS Date), 90000, NULL, 1, 88, 64)
INSERT [dbo].[Banking] ([Id], [DateCreate], [Money], [Deleted], [Status], [OrderId], [CustomerId]) VALUES (16, CAST(N'2021-09-01' AS Date), 287550, NULL, 1, 87, 64)
INSERT [dbo].[Banking] ([Id], [DateCreate], [Money], [Deleted], [Status], [OrderId], [CustomerId]) VALUES (17, CAST(N'2021-09-01' AS Date), 22500, NULL, 1, 84, 63)
INSERT [dbo].[Banking] ([Id], [DateCreate], [Money], [Deleted], [Status], [OrderId], [CustomerId]) VALUES (18, CAST(N'2021-09-01' AS Date), 80000, NULL, 1, 82, 63)
INSERT [dbo].[Banking] ([Id], [DateCreate], [Money], [Deleted], [Status], [OrderId], [CustomerId]) VALUES (19, CAST(N'2021-09-01' AS Date), 63000, NULL, 1, 81, 63)
INSERT [dbo].[Banking] ([Id], [DateCreate], [Money], [Deleted], [Status], [OrderId], [CustomerId]) VALUES (20, CAST(N'2021-09-01' AS Date), 77600, NULL, 1, 83, 63)
INSERT [dbo].[Banking] ([Id], [DateCreate], [Money], [Deleted], [Status], [OrderId], [CustomerId]) VALUES (21, CAST(N'2021-09-01' AS Date), 160000, NULL, 1, 82, 63)
INSERT [dbo].[Banking] ([Id], [DateCreate], [Money], [Deleted], [Status], [OrderId], [CustomerId]) VALUES (24, CAST(N'2021-09-01' AS Date), 33000, NULL, 1, 98, 66)
INSERT [dbo].[Banking] ([Id], [DateCreate], [Money], [Deleted], [Status], [OrderId], [CustomerId]) VALUES (25, CAST(N'2021-09-01' AS Date), 128925, 0, 1, 99, 67)
INSERT [dbo].[Banking] ([Id], [DateCreate], [Money], [Deleted], [Status], [OrderId], [CustomerId]) VALUES (26, CAST(N'2021-09-02' AS Date), 33000, 0, 1, 71, 39)
INSERT [dbo].[Banking] ([Id], [DateCreate], [Money], [Deleted], [Status], [OrderId], [CustomerId]) VALUES (27, CAST(N'2021-09-02' AS Date), 324450, 0, 1, 101, 66)
INSERT [dbo].[Banking] ([Id], [DateCreate], [Money], [Deleted], [Status], [OrderId], [CustomerId]) VALUES (28, CAST(N'2021-09-02' AS Date), 246225, 0, 1, 102, 30)
INSERT [dbo].[Banking] ([Id], [DateCreate], [Money], [Deleted], [Status], [OrderId], [CustomerId]) VALUES (29, CAST(N'2021-09-03' AS Date), 64020, 0, 1, 103, 30)
INSERT [dbo].[Banking] ([Id], [DateCreate], [Money], [Deleted], [Status], [OrderId], [CustomerId]) VALUES (30, CAST(N'2021-09-03' AS Date), 261900, 0, 1, 104, 31)
SET IDENTITY_INSERT [dbo].[Banking] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerUserName], [CustomerPassword], [CustomerAvatar], [Deleted]) VALUES (30, N'loc', N'11111111111', N'huyducle1109@gmail.com', N'customer1', N'$2a$11$6p1sFnDud2CUppgnOz2afeg9rzqaJjTiPtpHxe3MTxZ3bkXHqhuga', N'/Public/Image/th (4).jfif', 1)
INSERT [dbo].[Customer] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerUserName], [CustomerPassword], [CustomerAvatar], [Deleted]) VALUES (31, N'Customer 02', N'09999999999', N'customer@gmail.com', N'customer2', N'$2a$11$6p1sFnDud2CUppgnOz2afeg9rzqaJjTiPtpHxe3MTxZ3bkXHqhuga', N'https://res.cloudinary.com/locnguyen2409/image/upload/v1683553418/fysfg2pbtnexst3cenvx.gif', NULL)
INSERT [dbo].[Customer] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerUserName], [CustomerPassword], [CustomerAvatar], [Deleted]) VALUES (32, N'Customer 3', N'000000003', N'hauphan040@gmail.com', N'customer3', N'$2a$11$6p1sFnDud2CUppgnOz2afeg9rzqaJjTiPtpHxe3MTxZ3bkXHqhuga', N'/Public/Image/user4.png', NULL)
INSERT [dbo].[Customer] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerUserName], [CustomerPassword], [CustomerAvatar], [Deleted]) VALUES (33, N'Customer 4', N'000000004', N'maithanhhuyen@gmail.com', N'customer4', N'$2a$11$6p1sFnDud2CUppgnOz2afeg9rzqaJjTiPtpHxe3MTxZ3bkXHqhuga', N'/Public/Image/user5.png', NULL)
INSERT [dbo].[Customer] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerUserName], [CustomerPassword], [CustomerAvatar], [Deleted]) VALUES (34, N'Customer 5', N'000000005', N'phamngocquynh@gmail.com', N'customer5', N'$2a$11$fKjFur.vGLQfb7DzQTgm2u5a0.CFH33uxxkWLH.8X57wZm/uzwbSy', N'/Public/Image/user6.png', NULL)
INSERT [dbo].[Customer] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerUserName], [CustomerPassword], [CustomerAvatar], [Deleted]) VALUES (35, N'Customer 6', N'000000006', N'buithuha@gmail.com', N'customer6', N'$2a$11$fKjFur.vGLQfb7DzQTgm2u5a0.CFH33uxxkWLH.8X57wZm/uzwbSy', N'/Public/Image/th (12).jfif', NULL)
INSERT [dbo].[Customer] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerUserName], [CustomerPassword], [CustomerAvatar], [Deleted]) VALUES (36, N'Customer 7', N'000000007', N'nguyenvantuan@gmail.com', N'customer7', N'$2a$11$fKjFur.vGLQfb7DzQTgm2u5a0.CFH33uxxkWLH.8X57wZm/uzwbSy', N'/Public/Image/th (4).jfif', NULL)
INSERT [dbo].[Customer] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerUserName], [CustomerPassword], [CustomerAvatar], [Deleted]) VALUES (37, N'Customer 8', N'000000008', N'leminhhieu@gmail.com', N'customer8', N'$2a$11$fKjFur.vGLQfb7DzQTgm2u5a0.CFH33uxxkWLH.8X57wZm/uzwbSy', N'/Public/Image/th (3).jfif', NULL)
INSERT [dbo].[Customer] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerUserName], [CustomerPassword], [CustomerAvatar], [Deleted]) VALUES (38, N'Customer 9', N'000000009', N'nguyenthanhhuyen@gmail.com', N'customer9', N'$2a$11$fKjFur.vGLQfb7DzQTgm2u5a0.CFH33uxxkWLH.8X57wZm/uzwbSy', N'/Public/Image/th (7).jfif', NULL)
INSERT [dbo].[Customer] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerUserName], [CustomerPassword], [CustomerAvatar], [Deleted]) VALUES (39, N'Customer 10', N'0000000010', N'leminhhai@gmail.com', N'customer10', N'$2a$11$fKjFur.vGLQfb7DzQTgm2u5a0.CFH33uxxkWLH.8X57wZm/uzwbSy', N'/Public/Image/th (8).jfif', NULL)
INSERT [dbo].[Customer] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerUserName], [CustomerPassword], [CustomerAvatar], [Deleted]) VALUES (40, N'Customer 11', N'0000000011', N'customer.11@gmail.com', N'customer11', N'$2a$11$fKjFur.vGLQfb7DzQTgm2u5a0.CFH33uxxkWLH.8X57wZm/uzwbSy', N'/Public/Image/th (9).jfif', NULL)
INSERT [dbo].[Customer] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerUserName], [CustomerPassword], [CustomerAvatar], [Deleted]) VALUES (41, N'Customer 12', N'0000000012', N'customer.12@gmail.com', N'customer12', N'$2a$11$fKjFur.vGLQfb7DzQTgm2u5a0.CFH33uxxkWLH.8X57wZm/uzwbSy', N'/Public/Image/th (11).jfif', NULL)
INSERT [dbo].[Customer] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerUserName], [CustomerPassword], [CustomerAvatar], [Deleted]) VALUES (42, N'Customer 13', N'0000000013', N'customer.13@gmail.com', N'customer13', N'$2a$11$fKjFur.vGLQfb7DzQTgm2u5a0.CFH33uxxkWLH.8X57wZm/uzwbSy', N'/Public/Image/th (13).jfif', NULL)
INSERT [dbo].[Customer] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerUserName], [CustomerPassword], [CustomerAvatar], [Deleted]) VALUES (43, N'Customer 14', N'0000000014', N'customer.14@gmail.com', N'customer14', N'$2a$11$fKjFur.vGLQfb7DzQTgm2u5a0.CFH33uxxkWLH.8X57wZm/uzwbSy', N'/Public/Image/th (14).jfif', NULL)
INSERT [dbo].[Customer] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerUserName], [CustomerPassword], [CustomerAvatar], [Deleted]) VALUES (44, N'Customer 15', N'0000000015', N'customer.15@gmail.com', N'customer15', N'$2a$11$fKjFur.vGLQfb7DzQTgm2u5a0.CFH33uxxkWLH.8X57wZm/uzwbSy', N'/Public/Image/th (15).jfif', NULL)
INSERT [dbo].[Customer] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerUserName], [CustomerPassword], [CustomerAvatar], [Deleted]) VALUES (61, N'Nguyen Trung Quan', N'0938417229', N'nguyentrungquan@gmail.com', N'nguyentrungquan', N'$2a$11$wgdEne51wxncXGpJHRNJnejV7hN3ILhmdQ3WsyzGkcatRJ2NK5/Yq', N'/Public/Image/a17.jfif', NULL)
INSERT [dbo].[Customer] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerUserName], [CustomerPassword], [CustomerAvatar], [Deleted]) VALUES (62, N'Phan Khanh Linh', N'0754112356', N'phankhanhlinh@gmail.com', N'phankhanhlinh', N'$2a$11$e52ZWXk4swEnBFNNbopEg.Ew2pMdeotXtvaUv5joZ0UN/9oq6QNTO', N'/Public/Image/a19.jfif', NULL)
INSERT [dbo].[Customer] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerUserName], [CustomerPassword], [CustomerAvatar], [Deleted]) VALUES (63, N'Do Manh Cuong', N'0456284778', N'domanhcuong@gmail.com', N'domanhcuong', N'$2a$11$5ua0eUOEYmiMPasUz74P4ugTONHpJCJrQmTTZiY4hEjY1ELZJKHz2', N'/Public/Image/a17.jfif', NULL)
INSERT [dbo].[Customer] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerUserName], [CustomerPassword], [CustomerAvatar], [Deleted]) VALUES (64, N'Pham Duc Manh', N'0123458812', N'phamducmanh@gmail.com', N'phamducmanh', N'$2a$11$AXKckjy2oFsT4MQlE52GGu5EGomFvCLx799FSNdQGtpF7K12R3zKq', N'/Public/Image/a10.jfif', NULL)
INSERT [dbo].[Customer] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerUserName], [CustomerPassword], [CustomerAvatar], [Deleted]) VALUES (65, N'TEST2', N'TEST2', N'ASDASD2', NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerUserName], [CustomerPassword], [CustomerAvatar], [Deleted]) VALUES (66, N'test_customer_2', N'0938417229', N'123456789@gmail.com', N'123456789', N'$2a$11$NVqgTHwX8gozzYjFLt/rSO2/m40Tlc0QClpn85peE3FZ5wNZC3E8q', N'/Public/Image/th (1).jfif', NULL)
INSERT [dbo].[Customer] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerUserName], [CustomerPassword], [CustomerAvatar], [Deleted]) VALUES (67, N'LeThiKhanhLinh', N'0765182374', N'lethikhanhlinh@gmail.com', N'khanhlinh123', N'$2a$11$6qU.bMP7Fx0X1lqB49mbIepxXPjMoMBnQP6PsXB78DYIqY.W1e7pu', N'/Public/Image/a19.jfif', NULL)
INSERT [dbo].[Customer] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerUserName], [CustomerPassword], [CustomerAvatar], [Deleted]) VALUES (68, N'loc123', N'123456', N'loc123@gmail.com', N'loc nguyen', N'$2a$11$o86x1eCWhSgCdarLzXjCA.2Dk1PbDeudMxTpsj5PSfQ.ZMupE.M4W', N'string', 0)
INSERT [dbo].[Customer] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerUserName], [CustomerPassword], [CustomerAvatar], [Deleted]) VALUES (69, N'Elizabeth', N'980797778', N'elizabeth@mail', N'eli', N'$2a$11$vbElFfJgumim8Oob7LXAjebeIk/ueuLhMPUQqwDGEaBGdcLmZSx/G', N'https://res.cloudinary.com/locnguyen2409/image/upload/v1684476449/sivazetpef8sfjjdrqqn.gif', NULL)
INSERT [dbo].[Customer] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerUserName], [CustomerPassword], [CustomerAvatar], [Deleted]) VALUES (70, N'Loc Fuho', N'908989989', N'fuhoratvui@gmail.com', N'loc', N'$2a$11$Od1Rpvj104rOXmQwSOKA5eaiUwdRxd3ONUoy42qrgOCbfzXRMdMpe', N'https://res.cloudinary.com/locnguyen2409/image/upload/v1684494321/nrmgxhfijkyocq6wwyb6.gif', NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Name], [Description]) VALUES (1, N'HR Management', NULL)
INSERT [dbo].[Department] ([Id], [Name], [Description]) VALUES (2, N'Administration', NULL)
INSERT [dbo].[Department] ([Id], [Name], [Description]) VALUES (3, N'Service', NULL)
INSERT [dbo].[Department] ([Id], [Name], [Description]) VALUES (4, N'Training', NULL)
INSERT [dbo].[Department] ([Id], [Name], [Description]) VALUES (5, N'Internet Security', NULL)
INSERT [dbo].[Department] ([Id], [Name], [Description]) VALUES (6, N'Auditors', NULL)
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[MyCompany] ON 

INSERT [dbo].[MyCompany] ([Id], [Title], [Image], [Description], [Address], [TaxIdentificationNumber], [MyMission], [MyVision], [MyTarget]) VALUES (1, N'Few Words About Us!', N'/Public/Image/95-telemarketing.jpg', N'Excell-On-Db Consulting Services (ECS) helps organizations develop innovative business and commerce strategies and solutions. These solutions allow their (organizations, say clients of Excell-On-Db Consulting Services) customers to capitalize on new technologies to create innovative products and services for the economy. Their consulting team stays focused on defining, optimizing, and aligning their client’s business and IT strategies.', N'So 8 - Ton That Thuyet - Ha Noi -Viet Nam', N'152422asqwe', N'Creating useful solutions for companies in today''s 4.0 era and more...', N'We strive to be one of the best quality service companies in Vietnam.', N'Excell-On-Db has segregated themselves into various branches based on the various services that they offer to their clients, so as to meet the requirements of organizations i.e., of their clients.')
SET IDENTITY_INSERT [dbo].[MyCompany] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (27, CAST(N'2021-08-05T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 3, 10, 1, 1, 2)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (28, CAST(N'2021-08-06T00:00:00.000' AS DateTime), CAST(N'2021-08-12T00:00:00.000' AS DateTime), 3, 20, 1, 2, 3)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (29, CAST(N'2021-08-20T00:00:00.000' AS DateTime), CAST(N'2021-08-30T00:00:00.000' AS DateTime), 2, 3, 1, 3, 5)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (30, CAST(N'2021-08-06T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 2, 5, 2, 4, 4)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (31, CAST(N'2021-08-20T00:00:00.000' AS DateTime), CAST(N'2021-08-21T00:00:00.000' AS DateTime), 2, 4, 1, 5, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (32, CAST(N'2021-08-08T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 2, 6, 3, 6, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (33, CAST(N'2021-08-08T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 2, 6, 3, 7, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (38, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 2, 2, 1, 12, 3)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (39, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 2, 2, 2, 12, 6)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (40, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 2, 2, 3, 12, 2)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (41, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 2, 7, 2, 13, 3)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (42, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 2, 6, 3, 13, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (47, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 3, 10, 1, 21, 4)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (48, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 3, 15, 1, 22, 2)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (49, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 3, 10, 1, 23, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (50, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 3, 10, 1, 24, 2)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (51, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 2, 5, 1, 25, 4)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (52, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 2, 5, 2, 25, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (53, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 2, 5, 3, 25, 2)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (87, CAST(N'2021-08-17T00:00:00.000' AS DateTime), CAST(N'2021-08-18T00:00:00.000' AS DateTime), 2, 5, 1, 26, 3)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (88, CAST(N'2021-08-18T00:00:00.000' AS DateTime), CAST(N'2021-08-19T00:00:00.000' AS DateTime), 2, 10, 2, 27, 4)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (89, CAST(N'2021-08-20T00:00:00.000' AS DateTime), CAST(N'2021-08-22T00:00:00.000' AS DateTime), 2, 10, 1, 62, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (90, CAST(N'2021-08-22T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 2, 10, 1, 63, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (91, CAST(N'2021-08-23T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 2, 17, 1, 64, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (92, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 2, 11, 3, 65, 4)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (93, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 2, 15, 2, 66, 5)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (105, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 2, 15, 2, 78, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (106, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 2, 8, 2, 79, 2)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (107, CAST(N'2021-08-26T00:00:00.000' AS DateTime), CAST(N'2021-08-28T00:00:00.000' AS DateTime), 3, 12, 3, 80, 5)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (108, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-28T00:00:00.000' AS DateTime), 2, 9, 3, 81, 2)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (109, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 1, 10, 1, 82, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (110, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 1, 10, 2, 82, 4)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (111, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 1, 10, 3, 82, 5)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (112, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 1, 5, 1, 83, 5)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (113, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 1, 5, 2, 83, 5)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (114, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 1, 5, 3, 83, 5)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (115, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-05T00:00:00.000' AS DateTime), 1, 7, 1, 84, 5)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (116, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 2, 8, 1, 85, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (117, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 2, 8, 3, 85, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (118, CAST(N'2021-09-04T00:00:00.000' AS DateTime), CAST(N'2021-09-05T00:00:00.000' AS DateTime), 99, 5, 1, 86, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (120, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 99, 5, 1, 87, 2)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (133, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-11T00:00:00.000' AS DateTime), 99, 15, 3, 87, 2)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (134, CAST(N'2021-08-27T00:00:00.000' AS DateTime), CAST(N'2021-08-29T00:00:00.000' AS DateTime), 2, 10, 1, 88, 3)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (135, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-09T00:00:00.000' AS DateTime), 99, 10, 1, 89, 5)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (137, CAST(N'2021-09-05T00:00:00.000' AS DateTime), CAST(N'2021-09-08T00:00:00.000' AS DateTime), 99, 15, 2, 90, 3)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (138, CAST(N'2021-09-05T00:00:00.000' AS DateTime), CAST(N'2021-09-08T00:00:00.000' AS DateTime), 99, 10, 3, 90, 2)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (139, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-09T00:00:00.000' AS DateTime), 3, 7, 1, 91, 6)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (141, CAST(N'2021-09-10T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 3, 8, 3, 93, 2)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (143, CAST(N'2021-11-01T00:00:00.000' AS DateTime), CAST(N'2021-11-02T00:00:00.000' AS DateTime), 3, 20, 2, 96, 2)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (144, CAST(N'2021-09-06T00:00:00.000' AS DateTime), CAST(N'2021-09-07T00:00:00.000' AS DateTime), 99, 1, 1, 97, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (154, CAST(N'2021-09-14T00:00:00.000' AS DateTime), CAST(N'2021-09-15T00:00:00.000' AS DateTime), 99, 6, 3, 98, 5)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (155, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 99, 6, 3, 71, 5)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (159, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 99, 10, 1, 99, 3)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (162, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 0, 4, 1, 100, 4)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (163, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 99, 15, 2, 101, 3)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (165, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 99, 5, 1, 101, 4)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (167, CAST(N'2021-09-18T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 99, 5, 2, 102, 2)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (168, CAST(N'2021-09-18T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 99, 10, 3, 102, 3)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (171, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 99, 6, 3, 103, 5)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (174, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 99, 15, 1, 104, 5)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (175, CAST(N'2023-05-13T15:56:01.260' AS DateTime), CAST(N'2023-05-13T15:56:01.260' AS DateTime), 1, 10, 1, 105, 2)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (176, CAST(N'2023-05-13T15:56:01.260' AS DateTime), CAST(N'2023-05-13T15:56:01.260' AS DateTime), 1, 12, 2, 105, 3)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (177, CAST(N'2023-05-25T17:00:00.000' AS DateTime), CAST(N'2023-05-27T17:00:00.000' AS DateTime), 1, 15, 2, 108, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (178, CAST(N'2023-05-26T17:00:00.000' AS DateTime), CAST(N'2023-05-29T17:00:00.000' AS DateTime), 1, 12, 1, 108, 3)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (179, CAST(N'2023-05-18T17:00:00.000' AS DateTime), CAST(N'2023-05-30T17:00:00.000' AS DateTime), 1, 30, 2, 112, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (180, CAST(N'2023-05-18T17:00:00.000' AS DateTime), CAST(N'2023-05-30T17:00:00.000' AS DateTime), 1, 30, 2, 116, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (181, CAST(N'2023-05-18T17:00:00.000' AS DateTime), CAST(N'2023-05-30T17:00:00.000' AS DateTime), 1, 20, 1, 117, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (182, CAST(N'2023-05-18T17:00:00.000' AS DateTime), CAST(N'2023-05-30T17:00:00.000' AS DateTime), 1, 50, 3, 117, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (183, CAST(N'2023-05-18T17:00:00.000' AS DateTime), CAST(N'2023-05-30T17:00:00.000' AS DateTime), 1, 15, 3, 124, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderDetailDateStart], [OrderDetailDateEnd], [OrderDetailStatus], [OrderDetailNumberOfPeople], [ServiceId], [OrdersId], [DepartmentId]) VALUES (184, CAST(N'2023-05-18T17:00:00.000' AS DateTime), CAST(N'2023-06-03T17:00:00.000' AS DateTime), 1, 23, 2, 124, 4)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (1, N'August/03/2021', N'abc', 0, 3, 30)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (2, N'August/03/2021', N'abc', 831600, 3, 31)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (3, N'August/04/2021', N'abc', 133650, 2, 32)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (4, N'August/04/2021', N'abc', 118800, 2, 33)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (5, N'August/05/2021', N'abc', 17820, 2, 34)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (6, N'August/06/2021', N'abc', 65340, 2, 35)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (7, N'August/06/2021', N'abc', 66000, 2, 36)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (12, N'August/10/2021', N'abc', 23000, 2, 38)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (13, N'August/14/2021', N'abc', 74250, 3, 39)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (21, N'August/15/2021', N'abc', 0, 3, 30)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (22, N'August/15/2021', N'abc', 67500, 3, 30)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (23, N'August/15/2021', N'abc', 45000, 3, 30)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (24, N'August/15/2021', N'abc', 0, 3, 30)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (25, N'August/16/2021', N'abc', 79200, 2, 30)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (26, N'August/16/2021', N'abc', 30000, 2, 30)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (27, N'August/17/2021', N'abc', 90000, 2, 30)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (62, N'August/19/2021', N'Test cusomer new', 87300, 2, 30)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (63, N'August/19/2021', N'Customer 2 Description', 43650, 2, 31)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (64, N'August/20/2021', N'asdasd', 222615, 2, 30)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (65, N'August/21/2021', N'no', 117370, 2, 39)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (66, N'August/21/2021', N'asdad ads sgfadawd', 180000, 2, 30)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (71, N'August/22/2021', N'nothing', 33000, 99, 39)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (78, N'August/23/2021', N'No', 180000, 2, 61)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (79, N'August/23/2021', N'No', 96000, 2, 62)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (80, N'August/23/2021', N'', 132000, 3, 39)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (81, N'August/23/2021', N'nothing', 192060, 2, 63)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (82, N'August/23/2021', N'', 160000, 1, 63)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (83, N'August/23/2021', N'dadas', 77600, 1, 63)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (84, N'August/23/2021', N'', 63000, 1, 63)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (85, N'August/23/2021', N'', 80000, 2, 64)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (86, N'August/23/2021', N'sadasdsa', 22500, 99, 64)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (87, N'August/23/2021', N'2', 287550, 99, 64)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (88, N'August/24/2021', N'2', 90000, 2, 64)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (89, N'August/30/2021', N'', 45000, 99, 64)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (90, N'August/30/2021', N'', 420825, 99, 64)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (91, N'August/30/2021', N'', 31185, 3, 64)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (92, N'August/30/2021', N'', 0, 3, 64)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (93, N'August/30/2021', N'', 82240, 3, 64)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (94, N'August/30/2021', N'', 0, 3, 64)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (95, N'August/30/2021', N'abc', 0, 3, 64)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (96, N'September/01/2021', N'', 120000, 3, 30)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (97, N'September/01/2021', N'', 4500, 99, 39)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (98, N'September/01/2021', N'', 33000, 99, 66)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (99, N'September/01/2021', N'I need some have', 128925, 99, 67)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (100, N'September/01/2021', N'', 54000, 0, 67)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (101, N'September/02/2021', N'', 324450, 99, 66)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (102, N'September/02/2021', N'', 246225, 99, 30)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (103, N'September/03/2021', N'', 64020, 99, 30)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (104, N'September/03/2021', N'', 261900, 99, 31)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (105, N'13/05/2023', N'', 500000, 1, 68)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (106, N'5/18/2023 10:32:03 AM', N'', 71000, 1, 31)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (107, N'5/18/2023 11:05:20 AM', N'', 33500, 1, 31)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (108, N'18/05/2023 16:46:02', N'', 144000, 1, 31)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (109, N'18/05/2023', N'', 0, 0, 30)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (110, N'18/05/2023', N'', 0, 0, 69)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (111, N'5/19/2023 3:37:15 PM', N'', 41000, 1, 31)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (112, N'19/05/2023 18:32:20', N'', 180000, 1, 31)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (113, N'5/19/2023 6:06:27 PM', N'', 81500, 1, 70)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (114, N'5/19/2023 6:17:12 PM', N'', 99500, 1, 70)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (115, N'5/19/2023 6:23:21 PM', N'', 88500, 1, 70)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (116, N'19/05/2023 18:35:16', N'', 180000, 1, 31)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (117, N'19/05/2023 18:40:26', N'', 365000, 1, 31)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (118, N'5/19/2023 6:50:13 PM', N'', 39000, 1, 70)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (119, N'5/19/2023 7:03:46 PM', N'', 22500, 1, 70)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (120, N'5/19/2023 7:04:55 PM', N'', 9000, 1, 70)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (121, N'5/19/2023 7:07:13 PM', N'', 22500, 1, 70)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (122, N'5/19/2023 7:14:07 PM', N'', 60000, 1, 70)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (123, N'5/19/2023 7:18:41 PM', N'', 30000, 1, 70)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (124, N'19/05/2023 19:25:14', N'', 220500, 1, 70)
INSERT [dbo].[Orders] ([Id], [OrderDateCreate], [OrderDescription], [OrderTotalCost], [OrderStatus], [CustomerId]) VALUES (125, N'5/19/2023 7:33:14 PM', N'', 96000, 1, 70)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Role]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Id], [Role]) VALUES (2, N'HR')
INSERT [dbo].[Role] ([Id], [Role]) VALUES (3, N'IT')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([Id], [ServiceName], [ServicePrice], [ServiceDescription], [ServiceImage], [Deleted]) VALUES (1, N'In-bounds', 4500, N'The In-bound service is a service in which one can only receive the calls from the customers. These call centers provide 24 hours service to all customers. The primary goal of these call centers are to receive product orders, help customers both technically and non-technically, to find dealer location.', N'https://res.cloudinary.com/locnguyen2409/image/upload/v1683017082/samples/imagecon-group.jpg', 0)
INSERT [dbo].[Service] ([Id], [ServiceName], [ServicePrice], [ServiceDescription], [ServiceImage], [Deleted]) VALUES (2, N'Out-bound', 6000, N'The Out-bound service is a service in which the employees of Excell-On-Db call the customers for product promotions, for checking with the customer satisfaction on the services they provide, and for the telemarketing. Outbound Call Centers depends on the technological solutions, extensive experience, quality assurance programs and commitment to customer service excellence that further ensures maximum results from the direct marketing efforts for its success.', N'https://res.cloudinary.com/locnguyen2409/image/upload/v1683204551/tlemarket_qn1vrc.jpg', 0)
INSERT [dbo].[Service] ([Id], [ServiceName], [ServicePrice], [ServiceDescription], [ServiceImage], [Deleted]) VALUES (3, N'Tele Marketing', 5500, N'The Tele Marketing service is a service which is purely for the promotion of marketing or sales of the products and services.', N'https://res.cloudinary.com/locnguyen2409/image/upload/v1683203731/bg_affcio.jpg', 0)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188022, N'nv1@gmail.com', 0, 22, 1, N'123456789', N'Cau Giay - Ha Noi', N'/Public/Image/a11.jfif', N'Nguyen Van 1', 1, 0, 5)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188023, N'nv2@gmail.com', 0, 21, 1, N'000000002', N'HN', N'/Public/Image/user2.png', N'Nguyen Van 2', 1, 1, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188024, N'nv3@gmail.com', 0, 21, 1, N'000000003', N'HN', N'/Public/Image/user4.png', N'Nguyen Van 3', 1, 1, 3)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188025, N'nv4@gmail.com', 1, 21, 1, N'000000004', N'HN', N'https://res.cloudinary.com/locnguyen2409/image/upload/v1684252050/ix1a8nc0b4bffidacxbb.jpg', N'Nguyen Van 4', 1, NULL, 4)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188026, N'nv5@gmail.com', 1, 21, 1, N'000000005', N'HN', N'/Public/Image/user6.png', N'Nguyen Van 5', 1, 1, 5)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188027, N'nv6@gmail.com', 0, 21, 1, N'000000006', N'HN', N'/Public/Image/th (12).jfif', N'Nguyen Van 6', 1, NULL, 1)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188028, N'nv7@gmail.com', 0, 21, 0, N'000000007', N'HN', N'/Public/Image/th (4).jfif', N'Nguyen Van 7', 1, NULL, 1)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188029, N'nv8@gmail.com', 0, 21, 0, N'000000008', N'HN', N'/Public/Image/th (3).jfif', N'Nguyen Van 8', 1, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188030, N'nv9@gmail.com', 0, 21, 0, N'000000009', N'HN', N'/Public/Image/th (7).jfif', N'Nguyen Van 9', 1, NULL, 3)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188031, N'nv10@gmail.com', 0, 21, 0, N'0000000010', N'HN', N'/Public/Image/th (8).jfif', N'Nguyen Van 10', 1, NULL, 4)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188032, N'nv11@gmail.com', 0, 21, 0, N'0000000011', N'HN', N'/Public/Image/th (9).jfif', N'Nguyen Van 11', 1, NULL, 5)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188033, N'nv12@gmail.com', 0, 21, 0, N'0000000012', N'HN', N'/Public/Image/th (11).jfif', N'Nguyen Van 12', 1, NULL, 6)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188034, N'nv13@gmail.com', 0, 21, 0, N'0000000013', N'HN', N'/Public/Image/th (13).jfif', N'Nguyen Van 13', 1, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188035, N'nv14@gmail.com', 0, 21, 0, N'0000000014', N'HN', N'/Public/Image/th (14).jfif', N'Nguyen Van 14', 1, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188036, N'nv15@gmail.com', 0, 21, 0, N'0000000015', N'HN', N'/Public/Image/th (15).jfif', N'Nguyen Van 15', 1, NULL, 5)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188037, N'nv16@gmail.com', 0, 21, 0, N'0000000016', N'HN', N'/Public/Image/th.jfif', N'Nguyen Van 16', 1, NULL, 3)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188038, N'nv17@gmail.com', 0, 21, 0, N'0000000017', N'HN', N'/Public/Image/user1.png', N'Nguyen Van 17', 1, NULL, 3)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188039, N'nv18@gmail.com', 0, 21, 0, N'0000000018', N'HN', N'/Public/Image/th (3).jfif', N'Nguyen Van 18', 1, NULL, 5)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188040, N'nv19@gmail.com', 0, 21, 0, N'0000000019', N'HN', N'/Public/Image/th (12).jfif', N'Nguyen Van 19', 1, NULL, 1)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188041, N'nv20@gmail.com', 0, 21, 0, N'0000000020', N'HN', N'/Public/Image/th (15).jfif', N'Nguyen Van 20', 1, NULL, 3)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188042, N'nv21@gmail.com', 0, 21, 0, N'0000000021', N'HN', N'/Public/Image/avt.png', N'Nguyen Van 21', 1, NULL, 4)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188043, N'nv22@gmail.com', 0, 21, 0, N'0000000022', N'HN', N'/Public/Image/avt.png', N'Nguyen Van 22', 1, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188044, N'nv23@gmail.com', 0, 21, 0, N'0000000023', N'HN', N'/Public/Image/avt.png', N'Nguyen Van 23', 1, NULL, 1)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188045, N'nv24@gmail.com', 0, 21, 0, N'0000000024', N'HN', N'/Public/Image/avt.png', N'Nguyen Van 24', 1, NULL, 1)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188046, N'nv25@gmail.com', 0, 21, 0, N'0000000025', N'HN', N'/Public/Image/avt.png', N'Nguyen Van 25', 1, NULL, 1)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188047, N'nv26@gmail.com', 0, 21, 0, N'0000000026', N'HN', N'/Public/Image/avt.png', N'Nguyen Van 26', 1, NULL, 1)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188048, N'nv27@gmail.com', 0, 21, 0, N'0000000027', N'HN', N'/Public/Image/avt.png', N'Nguyen Van 27', 1, NULL, 1)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188049, N'nv28@gmail.com', 0, 21, 0, N'0000000028', N'HN', N'/Public/Image/avt.png', N'Nguyen Van 28', 1, NULL, 3)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188050, N'nv29@gmail.com', 0, 21, 0, N'0000000029', N'HN', N'/Public/Image/avt.png', N'Nguyen Van 29', 1, NULL, 3)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188051, N'nv30@gmail.com', 0, 21, 0, N'0000000030', N'HN', N'/Public/Image/avt.png', N'Nguyen Van 30', 1, NULL, 3)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188052, N'nv30@gmail.com', 1, 21, 1, N'0000000030', N'HN', N'/Public/Image/avt.png', N'Do thi 30', 2, 0, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188053, N'nv31@gmail.com', 1, 21, 1, N'0000000031', N'HN', N'/Public/Image/avt.png', N'Do thi 31', 2, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188054, N'nv32@gmail.com', 1, 21, 1, N'0000000032', N'HN', N'/Public/Image/avt.png', N'Do thi 32', 2, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188055, N'nv33@gmail.com', 1, 21, 1, N'0000000033', N'HN', N'/Public/Image/avt.png', N'Do thi 33', 2, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188056, N'nv34@gmail.com', 1, 21, 1, N'0000000034', N'HN', N'/Public/Image/avt.png', N'Do thi 34', 2, NULL, 1)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188057, N'nv35@gmail.com', 1, 21, 1, N'0000000035', N'HN', N'/Public/Image/avt.png', N'Do thi 35', 2, NULL, 1)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188058, N'nv36@gmail.com', 1, 21, 1, N'0000000036', N'HN', N'/Public/Image/avt.png', N'Do thi 36', 2, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188059, N'nv37@gmail.com', 1, 21, 1, N'0000000037', N'HN', N'/Public/Image/avt.png', N'Do thi 37', 2, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188060, N'nv38@gmail.com', 1, 21, 0, N'0000000038', N'HN', N'/Public/Image/avt.png', N'Do thi 38', 2, NULL, 6)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188061, N'nv39@gmail.com', 1, 21, 0, N'0000000039', N'HN', N'/Public/Image/avt.png', N'Do thi 39', 2, NULL, 6)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188062, N'nv40@gmail.com', 1, 21, 0, N'0000000040', N'HN', N'/Public/Image/avt.png', N'Do thi 40', 2, NULL, 4)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188063, N'nv41@gmail.com', 1, 21, 0, N'0000000041', N'HN', N'/Public/Image/avt.png', N'Do thi 41', 2, NULL, 1)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188064, N'nv42@gmail.com', 1, 21, 0, N'0000000042', N'HN', N'/Public/Image/avt.png', N'Do thi 42', 2, NULL, 1)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188065, N'nv43@gmail.com', 1, 21, 0, N'0000000043', N'HN', N'/Public/Image/avt.png', N'Do thi 43', 2, NULL, 1)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188066, N'nv44@gmail.com', 1, 21, 0, N'0000000044', N'HN', N'/Public/Image/avt.png', N'Do thi 44', 2, NULL, 1)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188067, N'nv45@gmail.com', 1, 21, 0, N'0000000045', N'HN', N'/Public/Image/avt.png', N'Do thi 45', 2, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188068, N'nv46@gmail.com', 1, 21, 0, N'0000000046', N'HN', N'/Public/Image/avt.png', N'Do thi 46', 2, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188069, N'nv47@gmail.com', 1, 21, 0, N'0000000047', N'HN', N'/Public/Image/avt.png', N'Do thi 47', 2, NULL, 3)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188070, N'nv48@gmail.com', 1, 21, 0, N'0000000048', N'HN', N'/Public/Image/avt.png', N'Do thi 48', 2, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188071, N'nv49@gmail.com', 1, 21, 0, N'0000000049', N'HN', N'/Public/Image/avt.png', N'Do thi 49', 2, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188072, N'nv50@gmail.com', 1, 21, 0, N'0000000050', N'HN', N'/Public/Image/avt.png', N'Do thi 50', 2, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188073, N'nv51@gmail.com', 1, 21, 0, N'0000000051', N'HN', N'/Public/Image/avt.png', N'Do thi 51', 2, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188074, N'nv52@gmail.com', 1, 21, 0, N'0000000052', N'HN', N'/Public/Image/avt.png', N'Do thi 52', 2, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188075, N'nv53@gmail.com', 1, 21, 0, N'0000000053', N'HN', N'/Public/Image/avt.png', N'Do thi 53', 2, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188076, N'nv54@gmail.com', 1, 21, 0, N'0000000054', N'HN', N'/Public/Image/avt.png', N'Do thi 54', 2, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188077, N'nv55@gmail.com', 1, 21, 0, N'0000000055', N'HN', N'/Public/Image/avt.png', N'Do thi 55', 2, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188078, N'nv56@gmail.com', 1, 21, 0, N'0000000056', N'HN', N'/Public/Image/avt.png', N'Do thi 56', 2, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188079, N'nv57@gmail.com', 1, 21, 0, N'0000000057', N'HN', N'/Public/Image/avt.png', N'Do thi 57', 2, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188080, N'nv58@gmail.com', 1, 21, 0, N'0000000058', N'HN', N'/Public/Image/avt.png', N'Do thi 58', 2, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188081, N'nv59@gmail.com', 1, 21, 0, N'0000000059', N'HN', N'/Public/Image/avt.png', N'Do thi 59', 2, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188082, N'nv60@gmail.com', 1, 21, 0, N'0000000060', N'HN', N'/Public/Image/avt.png', N'Do thi 60', 2, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188083, N'nv60@gmail.com', 1, 21, 1, N'0000000060', N'HN', N'/Public/Image/1761894.png', N'Tran thi 60', 3, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188084, N'nv61@gmail.com', 1, 21, 1, N'0000000061', N'HN', N'/Public/Image/1761894.png', N'Tran thi 61', 3, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188085, N'nv62@gmail.com', 1, 21, 1, N'0000000062', N'HN', N'/Public/Image/1761894.png', N'Tran thi 62', 3, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188086, N'nv63@gmail.com', 1, 21, 1, N'0000000063', N'HN', N'/Public/Image/1761894.png', N'Tran thi 63', 3, NULL, 3)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188087, N'nv64@gmail.com', 1, 21, 1, N'0000000064', N'HN', N'/Public/Image/1761894.png', N'Tran thi 64', 3, NULL, 5)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188088, N'nv65@gmail.com', 1, 21, 1, N'0000000065', N'HN', N'/Public/Image/1761894.png', N'Tran thi 65', 3, NULL, 3)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188089, N'nv66@gmail.com', 1, 21, 1, N'0000000066', N'HN', N'/Public/Image/1761894.png', N'Tran thi 66', 3, NULL, 5)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188090, N'nv67@gmail.com', 1, 21, 1, N'0000000067', N'HN', N'/Public/Image/1761894.png', N'Tran thi 67', 3, NULL, 3)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188091, N'nv68@gmail.com', 1, 21, 1, N'0000000068', N'HN', N'/Public/Image/1761894.png', N'Tran thi 68', 3, NULL, 5)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188092, N'nv69@gmail.com', 1, 21, 0, N'0000000069', N'HN', N'/Public/Image/1761894.png', N'Tran thi 69', 3, NULL, 3)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188093, N'nv70@gmail.com', 1, 21, 0, N'0000000070', N'HN', N'/Public/Image/1761894.png', N'Tran thi 70', 3, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188094, N'nv71@gmail.com', 1, 21, 0, N'0000000071', N'HN', N'/Public/Image/1761894.png', N'Tran thi 71', 3, NULL, 3)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188095, N'nv72@gmail.com', 1, 21, 0, N'0000000072', N'HN', N'/Public/Image/1761894.png', N'Tran thi 72', 3, NULL, 5)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188096, N'nv73@gmail.com', 1, 21, 0, N'0000000073', N'HN', N'/Public/Image/1761894.png', N'Tran thi 73', 3, NULL, 1)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188097, N'nv74@gmail.com', 1, 21, 0, N'0000000074', N'HN', N'/Public/Image/1761894.png', N'Tran thi 74', 3, NULL, 3)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188098, N'nv75@gmail.com', 1, 21, 0, N'0000000075', N'HN', N'/Public/Image/1761894.png', N'Tran thi 75', 3, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188099, N'nv76@gmail.com', 1, 21, 0, N'0000000076', N'HN', N'/Public/Image/1761894.png', N'Tran thi 76', 3, NULL, 3)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188100, N'nv77@gmail.com', 1, 21, 0, N'0000000077', N'HN', N'/Public/Image/1761894.png', N'Tran thi 77', 3, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188101, N'nv78@gmail.com', 1, 21, 0, N'0000000078', N'HN', N'/Public/Image/1761894.png', N'Tran thi 78', 3, NULL, 6)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188102, N'nv79@gmail.com', 1, 21, 0, N'0000000079', N'HN', N'/Public/Image/1761894.png', N'Tran thi 79', 3, NULL, 5)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188103, N'nv80@gmail.com', 1, 21, 0, N'0000000080', N'HN', N'/Public/Image/1761894.png', N'Tran thi 80', 3, NULL, 4)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188104, N'nv81@gmail.com', 1, 21, 0, N'0000000081', N'HN', N'/Public/Image/1761894.png', N'Tran thi 81', 3, NULL, 3)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188105, N'nv82@gmail.com', 1, 21, 0, N'0000000082', N'HN', N'/Public/Image/1761894.png', N'Tran thi 82', 3, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188106, N'nv83@gmail.com', 1, 21, 0, N'0000000083', N'HN', N'/Public/Image/1761894.png', N'Tran thi 83', 3, NULL, 1)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188107, N'nv84@gmail.com', 1, 21, 0, N'0000000084', N'HN', N'/Public/Image/1761894.png', N'Tran thi 84', 3, NULL, 3)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188108, N'nv85@gmail.com', 1, 21, 0, N'0000000085', N'HN', N'/Public/Image/1761894.png', N'Tran thi 85', 3, NULL, 5)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188109, N'nv86@gmail.com', 1, 21, 0, N'0000000086', N'HN', N'/Public/Image/1761894.png', N'Tran thi 86', 3, NULL, 6)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188110, N'nv87@gmail.com', 1, 21, 0, N'0000000087', N'HN', N'/Public/Image/1761894.png', N'Tran thi 87', 3, NULL, 5)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188111, N'nv88@gmail.com', 1, 21, 0, N'0000000088', N'HN', N'/Public/Image/1761894.png', N'Tran thi 88', 3, NULL, 4)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188112, N'nv89@gmail.com', 1, 21, 0, N'0000000089', N'HN', N'/Public/Image/1761894.png', N'Tran thi 89', 3, NULL, 1)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188113, N'nv90@gmail.com', 1, 21, 0, N'0000000090', N'HN', N'/Public/Image/1761894.png', N'Tran thi 90', 3, NULL, 3)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188114, N'quang@gmail.com', 1, 20, NULL, N'123456787', N'123 Fuho', N'https://res.cloudinary.com/locnguyen2409/image/upload/v1683799832/boyi4ydpysvmjhsorvjn.jpg', N'QuangCuliFuho', 1, NULL, 2)
INSERT [dbo].[Staff] ([Id], [StaffEmail], [StaffGender], [StaffAge], [StaffStatus], [StaffPhone], [StaffAddress], [StaffAvatar], [StaffFullName], [ServiceId], [Deleted], [DepartmentId]) VALUES (188115, N'quang123@gmail.com', 0, 23, NULL, N'123456785', N'123 Fuho', N'https://res.cloudinary.com/locnguyen2409/image/upload/v1683806793/rqpffskg7a0gqz77qdbu.jpg', N'QuangCuliFuho123', 3, NULL, 2)
SET IDENTITY_INSERT [dbo].[Staff] OFF
GO
SET IDENTITY_INSERT [dbo].[StaffOrderDetail] ON 

INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (31, CAST(N'2021-08-20T00:00:00.000' AS DateTime), CAST(N'2021-08-30T00:00:00.000' AS DateTime), 188022, 29)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (32, CAST(N'2021-08-20T00:00:00.000' AS DateTime), CAST(N'2021-08-30T00:00:00.000' AS DateTime), 188023, 29)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (33, CAST(N'2021-08-20T00:00:00.000' AS DateTime), CAST(N'2021-08-30T00:00:00.000' AS DateTime), 188024, 29)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (34, CAST(N'2021-08-06T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 188052, 30)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (35, CAST(N'2021-08-06T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 188053, 30)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (36, CAST(N'2021-08-06T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 188054, 30)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (37, CAST(N'2021-08-06T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 188055, 30)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (38, CAST(N'2021-08-06T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 188056, 30)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (39, CAST(N'2021-08-20T00:00:00.000' AS DateTime), CAST(N'2021-08-21T00:00:00.000' AS DateTime), 188025, 31)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (40, CAST(N'2021-08-20T00:00:00.000' AS DateTime), CAST(N'2021-08-21T00:00:00.000' AS DateTime), 188026, 31)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (41, CAST(N'2021-08-20T00:00:00.000' AS DateTime), CAST(N'2021-08-21T00:00:00.000' AS DateTime), 188027, 31)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (42, CAST(N'2021-08-20T00:00:00.000' AS DateTime), CAST(N'2021-08-21T00:00:00.000' AS DateTime), 188028, 31)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (49, CAST(N'2021-08-08T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 188089, 33)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (50, CAST(N'2021-08-08T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 188090, 33)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (51, CAST(N'2021-08-08T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 188091, 33)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (52, CAST(N'2021-08-08T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 188092, 33)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (53, CAST(N'2021-08-08T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 188093, 33)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (54, CAST(N'2021-08-08T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 188094, 33)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (103, CAST(N'2021-08-08T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 188086, 32)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (104, CAST(N'2021-08-08T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 188087, 32)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (105, CAST(N'2021-08-08T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 188088, 32)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (106, CAST(N'2021-08-08T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 188095, 32)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (107, CAST(N'2021-08-08T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 188096, 32)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (108, CAST(N'2021-08-08T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 188097, 32)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (119, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 188057, 39)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (120, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 188058, 39)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (121, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 188083, 40)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (122, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 188084, 40)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (123, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188059, 41)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (124, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188060, 41)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (125, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188061, 41)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (126, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188062, 41)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (127, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188063, 41)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (128, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188064, 41)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (129, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188065, 41)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (130, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188085, 42)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (131, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188098, 42)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (132, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188099, 42)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (133, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188100, 42)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (134, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188101, 42)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (135, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188102, 42)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (234, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188032, 51)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (235, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188033, 51)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (236, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188034, 51)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (237, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188035, 51)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (238, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188036, 51)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (239, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188066, 52)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (240, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188067, 52)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (241, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188068, 52)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (242, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188069, 52)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (243, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188070, 52)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (244, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188103, 53)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (245, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188104, 53)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (246, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188105, 53)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (247, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188106, 53)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (248, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 188107, 53)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (430, CAST(N'2021-08-20T00:00:00.000' AS DateTime), CAST(N'2021-08-22T00:00:00.000' AS DateTime), 188029, 89)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (431, CAST(N'2021-08-20T00:00:00.000' AS DateTime), CAST(N'2021-08-22T00:00:00.000' AS DateTime), 188030, 89)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (432, CAST(N'2021-08-20T00:00:00.000' AS DateTime), CAST(N'2021-08-22T00:00:00.000' AS DateTime), 188031, 89)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (433, CAST(N'2021-08-20T00:00:00.000' AS DateTime), CAST(N'2021-08-22T00:00:00.000' AS DateTime), 188037, 89)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (434, CAST(N'2021-08-20T00:00:00.000' AS DateTime), CAST(N'2021-08-22T00:00:00.000' AS DateTime), 188038, 89)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (435, CAST(N'2021-08-20T00:00:00.000' AS DateTime), CAST(N'2021-08-22T00:00:00.000' AS DateTime), 188039, 89)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (436, CAST(N'2021-08-20T00:00:00.000' AS DateTime), CAST(N'2021-08-22T00:00:00.000' AS DateTime), 188040, 89)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (437, CAST(N'2021-08-20T00:00:00.000' AS DateTime), CAST(N'2021-08-22T00:00:00.000' AS DateTime), 188041, 89)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (438, CAST(N'2021-08-20T00:00:00.000' AS DateTime), CAST(N'2021-08-22T00:00:00.000' AS DateTime), 188042, 89)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (439, CAST(N'2021-08-20T00:00:00.000' AS DateTime), CAST(N'2021-08-22T00:00:00.000' AS DateTime), 188043, 89)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (443, CAST(N'2021-08-22T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188028, 90)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (446, CAST(N'2021-08-22T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188034, 90)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (449, CAST(N'2021-08-22T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188044, 90)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (450, CAST(N'2021-08-22T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188045, 90)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (451, CAST(N'2021-08-22T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188046, 90)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (452, CAST(N'2021-08-22T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188047, 90)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (453, CAST(N'2021-08-22T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188048, 90)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (454, CAST(N'2021-08-22T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188049, 90)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (455, CAST(N'2021-08-22T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188050, 90)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (456, CAST(N'2021-08-22T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188051, 90)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (457, CAST(N'2021-08-23T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188025, 91)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (458, CAST(N'2021-08-23T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188026, 91)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (459, CAST(N'2021-08-23T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188027, 91)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (460, CAST(N'2021-08-23T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188029, 91)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (461, CAST(N'2021-08-23T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188030, 91)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (462, CAST(N'2021-08-23T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188031, 91)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (463, CAST(N'2021-08-23T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188032, 91)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (464, CAST(N'2021-08-23T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188033, 91)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (465, CAST(N'2021-08-23T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188035, 91)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (466, CAST(N'2021-08-23T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188036, 91)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (467, CAST(N'2021-08-23T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188037, 91)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (468, CAST(N'2021-08-23T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188038, 91)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (469, CAST(N'2021-08-23T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188039, 91)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (470, CAST(N'2021-08-23T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188040, 91)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (471, CAST(N'2021-08-23T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188041, 91)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (472, CAST(N'2021-08-23T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188042, 91)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (473, CAST(N'2021-08-23T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188043, 91)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (474, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188089, 92)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (475, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188090, 92)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (476, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188091, 92)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (477, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188092, 92)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (478, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188093, 92)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (479, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188094, 92)
GO
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (480, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188086, 92)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (481, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188087, 92)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (482, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188088, 92)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (483, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188095, 92)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (484, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188096, 92)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (485, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188052, 93)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (486, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188053, 93)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (487, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188054, 93)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (488, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188055, 93)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (489, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188056, 93)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (490, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188057, 93)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (491, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188058, 93)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (492, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188059, 93)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (493, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188060, 93)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (494, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188061, 93)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (495, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188062, 93)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (496, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188063, 93)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (497, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188064, 93)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (498, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188065, 93)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (499, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 188066, 93)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (522, CAST(N'2021-08-17T00:00:00.000' AS DateTime), CAST(N'2021-08-18T00:00:00.000' AS DateTime), 188022, 87)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (523, CAST(N'2021-08-17T00:00:00.000' AS DateTime), CAST(N'2021-08-18T00:00:00.000' AS DateTime), 188023, 87)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (524, CAST(N'2021-08-17T00:00:00.000' AS DateTime), CAST(N'2021-08-18T00:00:00.000' AS DateTime), 188024, 87)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (525, CAST(N'2021-08-17T00:00:00.000' AS DateTime), CAST(N'2021-08-18T00:00:00.000' AS DateTime), 188025, 87)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (526, CAST(N'2021-08-17T00:00:00.000' AS DateTime), CAST(N'2021-08-18T00:00:00.000' AS DateTime), 188026, 87)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (590, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188052, 105)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (591, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188053, 105)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (592, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188054, 105)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (593, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188055, 105)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (594, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188056, 105)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (595, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188057, 105)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (596, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188058, 105)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (597, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188059, 105)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (598, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188060, 105)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (599, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188061, 105)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (600, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188062, 105)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (601, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188063, 105)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (602, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188064, 105)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (603, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188065, 105)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (604, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188066, 105)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (605, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188071, 106)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (606, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188072, 106)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (607, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188073, 106)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (608, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188074, 106)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (609, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188075, 106)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (610, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188076, 106)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (611, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188077, 106)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (612, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 188078, 106)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (625, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-28T00:00:00.000' AS DateTime), 188108, 108)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (626, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-28T00:00:00.000' AS DateTime), 188109, 108)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (627, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-28T00:00:00.000' AS DateTime), 188110, 108)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (628, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-28T00:00:00.000' AS DateTime), 188111, 108)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (629, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-28T00:00:00.000' AS DateTime), 188112, 108)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (630, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-28T00:00:00.000' AS DateTime), 188113, 108)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (631, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-28T00:00:00.000' AS DateTime), 188083, 108)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (632, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-28T00:00:00.000' AS DateTime), 188084, 108)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (633, CAST(N'2021-08-24T00:00:00.000' AS DateTime), CAST(N'2021-08-28T00:00:00.000' AS DateTime), 188085, 108)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (635, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188023, 109)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (636, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188024, 109)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (637, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188025, 109)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (638, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188026, 109)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (639, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188027, 109)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (640, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188028, 109)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (641, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188032, 109)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (642, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188033, 109)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (643, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188034, 109)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (645, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188080, 110)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (646, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188081, 110)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (647, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188082, 110)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (648, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188052, 110)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (649, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188053, 110)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (650, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188054, 110)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (651, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188055, 110)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (652, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188056, 110)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (653, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188059, 110)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (654, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188085, 111)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (655, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188086, 111)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (656, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188087, 111)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (657, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188088, 111)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (658, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188089, 111)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (659, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188090, 111)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (660, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188091, 111)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (661, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188092, 111)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (662, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188093, 111)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (663, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188094, 111)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (664, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 188029, 112)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (665, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 188030, 112)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (666, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 188031, 112)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (667, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 188035, 112)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (668, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 188036, 112)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (669, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 188060, 113)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (670, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 188061, 113)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (671, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 188062, 113)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (672, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 188063, 113)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (673, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 188064, 113)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (674, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 188095, 114)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (675, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 188096, 114)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (676, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 188097, 114)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (677, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 188098, 114)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (678, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 188099, 114)
GO
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (679, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-05T00:00:00.000' AS DateTime), 188022, 115)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (680, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-05T00:00:00.000' AS DateTime), 188023, 115)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (681, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-05T00:00:00.000' AS DateTime), 188024, 115)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (682, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-05T00:00:00.000' AS DateTime), 188025, 115)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (683, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-05T00:00:00.000' AS DateTime), 188026, 115)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (684, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-05T00:00:00.000' AS DateTime), 188027, 115)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (685, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-05T00:00:00.000' AS DateTime), 188028, 115)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (686, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188032, 116)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (687, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188033, 116)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (688, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188034, 116)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (689, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188037, 116)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (690, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188038, 116)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (691, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188039, 116)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (692, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188040, 116)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (693, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188041, 116)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (694, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188085, 117)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (695, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188086, 117)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (696, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188087, 117)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (697, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188088, 117)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (698, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188089, 117)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (699, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188090, 117)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (700, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188091, 117)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (701, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188092, 117)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (707, CAST(N'2021-09-04T00:00:00.000' AS DateTime), CAST(N'2021-09-05T00:00:00.000' AS DateTime), 188044, 118)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (708, CAST(N'2021-09-04T00:00:00.000' AS DateTime), CAST(N'2021-09-05T00:00:00.000' AS DateTime), 188046, 118)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (709, CAST(N'2021-09-04T00:00:00.000' AS DateTime), CAST(N'2021-09-05T00:00:00.000' AS DateTime), 188048, 118)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (710, CAST(N'2021-09-04T00:00:00.000' AS DateTime), CAST(N'2021-09-05T00:00:00.000' AS DateTime), 188049, 118)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (711, CAST(N'2021-09-04T00:00:00.000' AS DateTime), CAST(N'2021-09-05T00:00:00.000' AS DateTime), 188050, 118)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (722, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188042, 120)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (723, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188043, 120)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (724, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188045, 120)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (725, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188047, 120)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (726, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188051, 120)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (918, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-11T00:00:00.000' AS DateTime), 188089, 133)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (919, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-11T00:00:00.000' AS DateTime), 188090, 133)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (920, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-11T00:00:00.000' AS DateTime), 188091, 133)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (921, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-11T00:00:00.000' AS DateTime), 188092, 133)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (922, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-11T00:00:00.000' AS DateTime), 188093, 133)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (923, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-11T00:00:00.000' AS DateTime), 188094, 133)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (924, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-11T00:00:00.000' AS DateTime), 188086, 133)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (925, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-11T00:00:00.000' AS DateTime), 188087, 133)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (926, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-11T00:00:00.000' AS DateTime), 188088, 133)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (927, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-11T00:00:00.000' AS DateTime), 188095, 133)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (928, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-11T00:00:00.000' AS DateTime), 188096, 133)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (929, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-11T00:00:00.000' AS DateTime), 188097, 133)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (930, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-11T00:00:00.000' AS DateTime), 188083, 133)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (931, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-11T00:00:00.000' AS DateTime), 188084, 133)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (932, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-11T00:00:00.000' AS DateTime), 188085, 133)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (933, CAST(N'2021-08-27T00:00:00.000' AS DateTime), CAST(N'2021-08-29T00:00:00.000' AS DateTime), 188025, 134)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (934, CAST(N'2021-08-27T00:00:00.000' AS DateTime), CAST(N'2021-08-29T00:00:00.000' AS DateTime), 188026, 134)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (935, CAST(N'2021-08-27T00:00:00.000' AS DateTime), CAST(N'2021-08-29T00:00:00.000' AS DateTime), 188027, 134)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (936, CAST(N'2021-08-27T00:00:00.000' AS DateTime), CAST(N'2021-08-29T00:00:00.000' AS DateTime), 188028, 134)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (937, CAST(N'2021-08-27T00:00:00.000' AS DateTime), CAST(N'2021-08-29T00:00:00.000' AS DateTime), 188029, 134)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (938, CAST(N'2021-08-27T00:00:00.000' AS DateTime), CAST(N'2021-08-29T00:00:00.000' AS DateTime), 188030, 134)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (939, CAST(N'2021-08-27T00:00:00.000' AS DateTime), CAST(N'2021-08-29T00:00:00.000' AS DateTime), 188031, 134)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (940, CAST(N'2021-08-27T00:00:00.000' AS DateTime), CAST(N'2021-08-29T00:00:00.000' AS DateTime), 188032, 134)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (941, CAST(N'2021-08-27T00:00:00.000' AS DateTime), CAST(N'2021-08-29T00:00:00.000' AS DateTime), 188033, 134)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (942, CAST(N'2021-08-27T00:00:00.000' AS DateTime), CAST(N'2021-08-29T00:00:00.000' AS DateTime), 188034, 134)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (943, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-09T00:00:00.000' AS DateTime), 188022, 135)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (944, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-09T00:00:00.000' AS DateTime), 188023, 135)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (945, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-09T00:00:00.000' AS DateTime), 188024, 135)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (946, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-09T00:00:00.000' AS DateTime), 188025, 135)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (947, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-09T00:00:00.000' AS DateTime), 188026, 135)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (948, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-09T00:00:00.000' AS DateTime), 188027, 135)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (949, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-09T00:00:00.000' AS DateTime), 188028, 135)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (950, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-09T00:00:00.000' AS DateTime), 188032, 135)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (951, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-09T00:00:00.000' AS DateTime), 188033, 135)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (952, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-09T00:00:00.000' AS DateTime), 188034, 135)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (996, CAST(N'2021-09-05T00:00:00.000' AS DateTime), CAST(N'2021-09-08T00:00:00.000' AS DateTime), 188054, 137)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (997, CAST(N'2021-09-05T00:00:00.000' AS DateTime), CAST(N'2021-09-08T00:00:00.000' AS DateTime), 188057, 137)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (998, CAST(N'2021-09-05T00:00:00.000' AS DateTime), CAST(N'2021-09-08T00:00:00.000' AS DateTime), 188060, 137)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (999, CAST(N'2021-09-05T00:00:00.000' AS DateTime), CAST(N'2021-09-08T00:00:00.000' AS DateTime), 188061, 137)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1000, CAST(N'2021-09-05T00:00:00.000' AS DateTime), CAST(N'2021-09-08T00:00:00.000' AS DateTime), 188062, 137)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1001, CAST(N'2021-09-05T00:00:00.000' AS DateTime), CAST(N'2021-09-08T00:00:00.000' AS DateTime), 188063, 137)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1002, CAST(N'2021-09-05T00:00:00.000' AS DateTime), CAST(N'2021-09-08T00:00:00.000' AS DateTime), 188064, 137)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1003, CAST(N'2021-09-05T00:00:00.000' AS DateTime), CAST(N'2021-09-08T00:00:00.000' AS DateTime), 188065, 137)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1004, CAST(N'2021-09-05T00:00:00.000' AS DateTime), CAST(N'2021-09-08T00:00:00.000' AS DateTime), 188066, 137)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1005, CAST(N'2021-09-05T00:00:00.000' AS DateTime), CAST(N'2021-09-08T00:00:00.000' AS DateTime), 188067, 137)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1006, CAST(N'2021-09-05T00:00:00.000' AS DateTime), CAST(N'2021-09-08T00:00:00.000' AS DateTime), 188068, 137)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1007, CAST(N'2021-09-05T00:00:00.000' AS DateTime), CAST(N'2021-09-08T00:00:00.000' AS DateTime), 188069, 137)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1008, CAST(N'2021-09-05T00:00:00.000' AS DateTime), CAST(N'2021-09-08T00:00:00.000' AS DateTime), 188070, 137)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1009, CAST(N'2021-09-05T00:00:00.000' AS DateTime), CAST(N'2021-09-08T00:00:00.000' AS DateTime), 188071, 137)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1010, CAST(N'2021-09-05T00:00:00.000' AS DateTime), CAST(N'2021-09-08T00:00:00.000' AS DateTime), 188072, 137)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1092, CAST(N'2021-09-06T00:00:00.000' AS DateTime), CAST(N'2021-09-07T00:00:00.000' AS DateTime), 188022, 144)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1146, CAST(N'2021-09-14T00:00:00.000' AS DateTime), CAST(N'2021-09-15T00:00:00.000' AS DateTime), 188089, 154)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1147, CAST(N'2021-09-14T00:00:00.000' AS DateTime), CAST(N'2021-09-15T00:00:00.000' AS DateTime), 188090, 154)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1148, CAST(N'2021-09-14T00:00:00.000' AS DateTime), CAST(N'2021-09-15T00:00:00.000' AS DateTime), 188091, 154)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1149, CAST(N'2021-09-14T00:00:00.000' AS DateTime), CAST(N'2021-09-15T00:00:00.000' AS DateTime), 188092, 154)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1150, CAST(N'2021-09-14T00:00:00.000' AS DateTime), CAST(N'2021-09-15T00:00:00.000' AS DateTime), 188093, 154)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1151, CAST(N'2021-09-14T00:00:00.000' AS DateTime), CAST(N'2021-09-15T00:00:00.000' AS DateTime), 188094, 154)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1152, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188093, 155)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1153, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188094, 155)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1154, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188100, 155)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1155, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188101, 155)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1156, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188102, 155)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1157, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 188103, 155)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1194, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188030, 159)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1195, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188031, 159)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1196, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188035, 159)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1197, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188036, 159)
GO
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1198, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188037, 159)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1199, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188038, 159)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1200, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188039, 159)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1201, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188040, 159)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1202, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188041, 159)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1203, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188042, 159)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1224, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188029, 162)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1225, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188043, 162)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1226, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188044, 162)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1227, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188045, 162)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1228, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188052, 163)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1229, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188053, 163)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1230, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188054, 163)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1231, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188055, 163)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1232, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188056, 163)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1233, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188057, 163)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1234, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188058, 163)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1235, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188059, 163)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1236, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188060, 163)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1237, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188061, 163)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1238, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188062, 163)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1239, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188063, 163)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1240, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188064, 163)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1241, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188065, 163)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1242, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188066, 163)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1253, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188046, 165)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1254, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188047, 165)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1255, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188048, 165)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1256, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188049, 165)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1257, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-12T00:00:00.000' AS DateTime), 188050, 165)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1258, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188065, 110)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1274, CAST(N'2021-09-18T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188079, 167)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1275, CAST(N'2021-09-18T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188052, 167)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1276, CAST(N'2021-09-18T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188053, 167)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1277, CAST(N'2021-09-18T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188054, 167)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1278, CAST(N'2021-09-18T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188055, 167)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1279, CAST(N'2021-09-18T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188089, 168)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1280, CAST(N'2021-09-18T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188090, 168)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1281, CAST(N'2021-09-18T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188091, 168)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1282, CAST(N'2021-09-18T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188092, 168)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1283, CAST(N'2021-09-18T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188093, 168)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1284, CAST(N'2021-09-18T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188094, 168)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1285, CAST(N'2021-09-18T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188086, 168)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1286, CAST(N'2021-09-18T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188087, 168)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1287, CAST(N'2021-09-18T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188088, 168)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1288, CAST(N'2021-09-18T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188095, 168)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1289, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 188037, 109)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1301, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188083, 171)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1302, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188084, 171)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1303, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188085, 171)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1304, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188096, 171)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1305, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188097, 171)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1306, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188098, 171)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1332, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188022, 174)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1333, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188023, 174)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1334, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188024, 174)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1335, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188025, 174)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1336, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188026, 174)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1337, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188027, 174)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1338, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188028, 174)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1339, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188032, 174)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1340, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188033, 174)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1341, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188034, 174)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1342, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188035, 174)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1343, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188036, 174)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1344, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188029, 174)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1345, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188030, 174)
INSERT [dbo].[StaffOrderDetail] ([Id], [DateStart], [DateEnd], [StaffId], [OrderDetailId]) VALUES (1346, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 188031, 174)
SET IDENTITY_INSERT [dbo].[StaffOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[UserInFo] ON 

INSERT [dbo].[UserInFo] ([Id], [UserName], [UserPassword], [UserEmail], [UserAge], [UserPhone], [UserAddress], [UserAvatar], [UserFullName], [Role]) VALUES (4, N'loc', N'$2a$11$HdQcKPXOrK4i7pbBlayM5.SJH16EPcGbwLvg1qkb08w8nhNB4M2bO', N'loc@gmail.com', 18, N'0393649927', N'HCMC', N'https://res.cloudinary.com/locnguyen2409/image/upload/v1683288718/of0hitaqsu44twcvjonk.jpg', N'NTL', N'Admin')
INSERT [dbo].[UserInFo] ([Id], [UserName], [UserPassword], [UserEmail], [UserAge], [UserPhone], [UserAddress], [UserAvatar], [UserFullName], [Role]) VALUES (5, N'CEO', N'$2a$11$DzCSknehePwzon8oLnu8ruwQlpaFl6BBykTWwU21KxWasV8lKkhTG', N'hauphan040@gmail.com', 20, N'0384896044', N'CG-HN', N'/Public/Image/user5.png', N'Phan Thi Hau', N'Admin')
INSERT [dbo].[UserInFo] ([Id], [UserName], [UserPassword], [UserEmail], [UserAge], [UserPhone], [UserAddress], [UserAvatar], [UserFullName], [Role]) VALUES (6, N'Manager', N'$2a$11$.SLGn4vOouxI.ftf8Hbei.PxEhZY6R72JLO0YWiK.7dXjPexRR5oi', N'Manager123@gmail.com', 23, N'0988776655', N'HBT - HN', N'/Public/Image/a17.jfif', N'Nguyen Thu Huyen', NULL)
INSERT [dbo].[UserInFo] ([Id], [UserName], [UserPassword], [UserEmail], [UserAge], [UserPhone], [UserAddress], [UserAvatar], [UserFullName], [Role]) VALUES (11, N'nguyenkhanhlinh', N'$2a$11$jYV2a8tanL5KOpLgmkkO1u7/6YZgFFwOq1PK2sea45iwkpNdKMxcO', N'khanhlinh123@gmail.com', 20, N'0982129658', N'Hai Ba Trung - Ha Noi', N'/Public/Image/a19.jfif', N'Nguyen Khanh Linh', NULL)
INSERT [dbo].[UserInFo] ([Id], [UserName], [UserPassword], [UserEmail], [UserAge], [UserPhone], [UserAddress], [UserAvatar], [UserFullName], [Role]) VALUES (12, N'tranvannam', N'$2a$11$ISQ/EtnbzTfPV0MFZ5JHeu.X/0f31pvR3.qbiSUUP2EU3Yrmf5LLW', N'tranvannam@gmail.com', 23, N'0948139586', N'Tay Ho - Ha Noi', N'/Public/Image/th (13).jfif', N'Tran Van Nam', NULL)
INSERT [dbo].[UserInFo] ([Id], [UserName], [UserPassword], [UserEmail], [UserAge], [UserPhone], [UserAddress], [UserAvatar], [UserFullName], [Role]) VALUES (30, N'QuangCuli', N'$2a$11$XPvdRU9itkSWFmjUXFONZub/lmjwAvq6xjygBm4FBWC6XjzBkSVFe', N'quang123@gmail.com', 25, N'123456786', N'123 Fuho', N'https://res.cloudinary.com/locnguyen2409/image/upload/v1683466220/gan86jwwgqqahm9zaa3l.jpg', N'QuangCuliFuho', N'IT')
SET IDENTITY_INSERT [dbo].[UserInFo] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Role__DA15413E34AAA98E]    Script Date: 21/05/2023 21:59:40 ******/
ALTER TABLE [dbo].[Role] ADD UNIQUE NONCLUSTERED 
(
	[Role] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Department] FOREIGN KEY([DepartmentId])
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
ALTER DATABASE [Excell-On-Db] SET  READ_WRITE 
GO
