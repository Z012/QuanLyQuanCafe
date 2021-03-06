USE [master]
GO
/****** Object:  Database [QuanLyQuanCafe]    Script Date: 24-May-17 10:59:27 PM ******/
CREATE DATABASE [QuanLyQuanCafe]
GO
USE [QuanLyQuanCafe]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 24-May-17 10:59:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[UserName] [nvarchar](100) NOT NULL,
	[DisplayName] [nvarchar](100) NOT NULL DEFAULT (N'ABC'),
	[PassWord] [nvarchar](1000) NOT NULL DEFAULT ((0)),
	[Type] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bill]    Script Date: 24-May-17 10:59:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DateCheckIn] [date] NOT NULL DEFAULT (getdate()),
	[DateCheckOut] [date] NULL,
	[idTable] [int] NOT NULL,
	[status] [int] NOT NULL,
	[discount] [int] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillInfo]    Script Date: 24-May-17 10:59:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idBill] [int] NOT NULL,
	[idFood] [int] NOT NULL,
	[count] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Food]    Script Date: 24-May-17 10:59:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL DEFAULT (N'Chưa đặt tên'),
	[idCategory] [int] NOT NULL,
	[price] [float] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FoodCategory]    Script Date: 24-May-17 10:59:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL DEFAULT (N'Chưa đặt tên'),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableFood]    Script Date: 24-May-17 10:59:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableFood](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL DEFAULT (N'Bàn chưa có tên'),
	[status] [nvarchar](100) NULL DEFAULT (N'Trống'),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([UserName], [DisplayName], [PassWord], [Type]) VALUES (N'k10', N'xy78', N'123456', 0)
INSERT [dbo].[Account] ([UserName], [DisplayName], [PassWord], [Type]) VALUES (N'K9', N'Rong k9', N'1', 1)
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount]) VALUES (1, CAST(N'2017-03-24' AS Date), CAST(N'2017-03-24' AS Date), 2, 1, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount]) VALUES (2, CAST(N'2017-03-24' AS Date), CAST(N'2017-03-24' AS Date), 2, 1, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount]) VALUES (3, CAST(N'2017-03-24' AS Date), CAST(N'2017-03-24' AS Date), 4, 1, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount]) VALUES (4, CAST(N'2017-03-24' AS Date), CAST(N'2017-03-24' AS Date), 5, 1, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount]) VALUES (5, CAST(N'2017-03-24' AS Date), CAST(N'2017-03-24' AS Date), 1, 1, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount]) VALUES (6, CAST(N'2017-03-24' AS Date), NULL, 1, 0, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount]) VALUES (7, CAST(N'2017-03-24' AS Date), NULL, 3, 1, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount]) VALUES (8, CAST(N'2017-03-24' AS Date), NULL, 11, 1, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount]) VALUES (9, CAST(N'2017-03-24' AS Date), NULL, 5, 0, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount]) VALUES (10, CAST(N'2017-03-24' AS Date), NULL, 6, 1, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount]) VALUES (11, CAST(N'2017-03-24' AS Date), CAST(N'2017-03-24' AS Date), 12, 1, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount]) VALUES (12, CAST(N'2017-03-24' AS Date), NULL, 13, 1, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount]) VALUES (13, CAST(N'2017-03-25' AS Date), NULL, 9, 0, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount]) VALUES (14, CAST(N'2017-03-25' AS Date), NULL, 12, 1, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount]) VALUES (15, CAST(N'2017-03-25' AS Date), NULL, 11, 1, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount]) VALUES (16, CAST(N'2017-03-25' AS Date), NULL, 12, 1, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount]) VALUES (17, CAST(N'2017-03-25' AS Date), NULL, 6, 1, 3)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount]) VALUES (18, CAST(N'2017-03-25' AS Date), NULL, 11, 1, 20)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount]) VALUES (19, CAST(N'2017-03-25' AS Date), NULL, 7, 0, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount]) VALUES (20, CAST(N'2017-03-25' AS Date), NULL, 10, 1, 50)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount]) VALUES (21, CAST(N'2017-03-25' AS Date), NULL, 2, 0, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount]) VALUES (22, CAST(N'2017-03-25' AS Date), NULL, 12, 1, 50)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount]) VALUES (23, CAST(N'2017-03-28' AS Date), NULL, 12, 1, 50)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount]) VALUES (24, CAST(N'2017-03-28' AS Date), NULL, 12, 0, 0)
SET IDENTITY_INSERT [dbo].[Bill] OFF
SET IDENTITY_INSERT [dbo].[BillInfo] ON 

INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (13, 1, 3, 5)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (15, 2, 1, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (16, 2, 5, 4)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (17, 1, 5, 4)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (18, 3, 5, 4)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (19, 5, 2, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (20, 4, 1, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (21, 3, 2, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (22, 1, 5, 4)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (28, 1, 8, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (30, 10, 9, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (31, 12, 14, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (32, 11, 30, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (33, 11, 35, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (34, 11, 3, 5)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (35, 11, 9, 5)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (36, 10, 6, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (37, 10, 16, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (42, 1, 1, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (43, 13, 8, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (44, 13, 1, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (45, 13, 3, 5)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (46, 13, 4, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (47, 13, 16, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (48, 13, 6, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (49, 13, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (50, 14, 1, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (51, 14, 8, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (52, 14, 16, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (53, 14, 26, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (54, 14, 5, 4)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (55, 14, 6, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (56, 8, 1, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (57, 8, 8, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (58, 8, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (59, 15, 1, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (60, 16, 1, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (61, 17, 5, 4)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (62, 17, 15, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (63, 18, 1, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (64, 7, 1, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (65, 19, 1, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (66, 20, 1, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (67, 20, 8, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (68, 20, 6, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (69, 9, 1, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (70, 9, 8, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (71, 9, 9, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (72, 9, 11, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (73, 9, 6, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (74, 1, 6, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (75, 21, 6, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (76, 21, 9, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (77, 21, 10, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (78, 21, 2, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (79, 21, 1, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (80, 21, 3, 5)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (81, 19, 3, 5)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (82, 19, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (83, 1, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (84, 22, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (85, 22, 15, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (86, 22, 34, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (87, 22, 5, 4)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (88, 23, 1, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (89, 23, 4, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (90, 23, 19, 15)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (91, 23, 3, 5)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (92, 23, 6, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (93, 24, 1, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (94, 6, 1, 10)
SET IDENTITY_INSERT [dbo].[BillInfo] OFF
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (1, N'Mực nướng', 1, 500000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (2, N'Heo rừng', 2, 6000000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (3, N'Cơm rang thập cẩm', 6, 20000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (4, N'Phở nam định', 6, 15000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (5, N'Cafe sữa', 7, 10000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (6, N'Cocacola', 7, 6000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (7, N'Pesi', 7, 6000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (8, N'Tôm chiên', 1, 50000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (9, N'Cá rô phi', 3, 5000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (10, N'Cá kho', 3, 35000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (11, N'Cơm tám', 4, 25000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (12, N'Cơm tẻ', 4, 35000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (14, N'Cafe không đường', 7, 15000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (15, N'Cafe phin', 7, 25000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (16, N'Cốm xào dừa', 8, 25000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (17, N'Khoai lang chiên', 8, 15000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (18, N'Miến lươn', 8, 30000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (19, N'Nem chua', 6, 3000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (20, N'Phở gà', 8, 25000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (21, N'Mỳ Quảng', 9, 25000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (22, N'Bánh xèo', 9, 30000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (23, N'Bún bò Huế', 9, 30000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (24, N'Bánh canh cua', 10, 35000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (25, N'Chè thưng', 10, 15000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (26, N'Bò nướng muối ớt', 11, 100000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (27, N'Mực xiên nướng', 11, 50000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (28, N'Tôm he nướng', 11, 50000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (29, N'Sò huyết nướng ', 11, 50000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (30, N'Sườn nướng xả ớt', 11, 60000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (31, N'Cafe chồn', 7, 35000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (32, N'Cafe Latte Macchiato', 7, 30000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (33, N'Cafe kem', 7, 15000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (34, N'Cafe đá', 7, 14000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (35, N'Espresso ', 7, 20000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (36, N'Cafe vối', 7, 50000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (37, N'Cafe Arabica', 7, 55000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (38, N'Cafe Culi ', 7, 35000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (39, N'Cafe Cherry', 7, 31000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (40, N'Cafe nguyên chất', 7, 38000)
SET IDENTITY_INSERT [dbo].[Food] OFF
SET IDENTITY_INSERT [dbo].[FoodCategory] ON 

INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (1, N'Hải sản')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (2, N'Lâm sản')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (3, N'Thủy sản')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (4, N'Nông sản')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (5, N'Nước')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (6, N'Truyền thống')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (7, N'Đồ uống')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (8, N'Ẩm thực miền Bắc')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (9, N'Ẩm thực miền Trung')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (10, N'Ẩm thực miền Nam')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (11, N'Món nướng')
SET IDENTITY_INSERT [dbo].[FoodCategory] OFF
SET IDENTITY_INSERT [dbo].[TableFood] ON 

INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (1, N'Bàn 0', N'Có người')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (2, N'Bàn 1', N'Có người')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (3, N'Bàn 2', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (4, N'Bàn 3', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (5, N'Bàn 4', N'Có người')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (6, N'Bàn 5', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (7, N'Bàn 6', N'Có người')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (8, N'Bàn 7', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (9, N'Bàn 8', N'Có người')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (10, N'Bàn 9', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (11, N'Bàn 10', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (12, N'Bàn 11', N'Có người')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (13, N'Bàn 12', N'Trống')
SET IDENTITY_INSERT [dbo].[TableFood] OFF
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [fk_bill_table] FOREIGN KEY([idTable])
REFERENCES [dbo].[TableFood] ([id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [fk_bill_table]
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD  CONSTRAINT [fk_billinfo_bill] FOREIGN KEY([idBill])
REFERENCES [dbo].[Bill] ([id])
GO
ALTER TABLE [dbo].[BillInfo] CHECK CONSTRAINT [fk_billinfo_bill]
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD  CONSTRAINT [fk_billinfo_food] FOREIGN KEY([idFood])
REFERENCES [dbo].[Food] ([id])
GO
ALTER TABLE [dbo].[BillInfo] CHECK CONSTRAINT [fk_billinfo_food]
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [fk_food_foodcategory] FOREIGN KEY([idCategory])
REFERENCES [dbo].[FoodCategory] ([id])
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [fk_food_foodcategory]
GO
/****** Object:  StoredProcedure [dbo].[Dsp_BillInfo]    Script Date: 24-May-17 10:59:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Dsp_BillInfo]
@idBill int, @idFood int, @count int
as
begin
	declare @isExitsBillInfo int
	declare @foodCount int = 1

	select @isExitsBillInfo = id, @foodCount = b.count
	from BillInfo b 
	where b.idBill = @idBill and idFood = @idFood

	if (@isExitsBillInfo > 0)
	begin 
		declare @newCount int = @foodCount + @count
		if (@newCount > 0)
			update BillInfo set count = @foodCount + @count
			where idFood = @idFood
		else
			delete BillInfo where idBill = @idBill and idFood = @idFood
	end
	else
	begin
		insert BillInfo
		( idBill, idFood, count)
		values 
		(@idBill, @idFood, @count)
	end


end
GO
/****** Object:  StoredProcedure [dbo].[usp_switchTable]    Script Date: 24-May-17 10:59:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_switchTable] 
@idTable1 int,
@idTable2 int
as
begin
	
	Declare @idFirstBill int
	declare @idSeconrBill int

	select @idSeconrBill = id from Bill where idTable = @idTable2 and status = 0
	select @idFirstBill = id from Bill where idTable = @idTable1 and status = 0

	if (@idFirstBill is null)
	begin
		insert into Bill (DateCheckIn, DateCheckOut, idTable, status)
		values (getdate(), null, @idTable1, 0)

		select @idFirstBill = MAX (id) from Bill where idTable = @idTable1 and status = 0
	end

	-- is null ko phai = null
	if (@idSeconrBill is null)
	begin
		insert into Bill (DateCheckIn, DateCheckOut, idTable, status)
		values (getdate(), null, @idTable2, 0)

		select @idSeconrBill = MAX (id) from Bill where idTable = @idTable2 and status = 0
	end
	
	select id into IdBillInfoTable from BillInfo where idBill = @idSeconrBill 
	
	update BillInfo set idBill = @idSeconrBill where idBill = @idFirstBill
	update BillInfo set idBill = @idFirstBill where id in (select * from IdBillInfoTable)
	
	drop table IdBillInfoTable
end

GO
USE [master]
GO
ALTER DATABASE [QuanLyQuanCafe] SET  READ_WRITE 
GO
