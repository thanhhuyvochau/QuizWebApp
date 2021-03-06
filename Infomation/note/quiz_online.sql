USE [master]
GO
/****** Object:  Database [quiz_online]    Script Date: 2/7/2021 2:18:35 PM ******/
CREATE DATABASE [quiz_online]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'quiz_online', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\quiz_online.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'quiz_online_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\quiz_online_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [quiz_online] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [quiz_online].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [quiz_online] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [quiz_online] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [quiz_online] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [quiz_online] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [quiz_online] SET ARITHABORT OFF 
GO
ALTER DATABASE [quiz_online] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [quiz_online] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [quiz_online] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [quiz_online] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [quiz_online] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [quiz_online] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [quiz_online] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [quiz_online] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [quiz_online] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [quiz_online] SET  DISABLE_BROKER 
GO
ALTER DATABASE [quiz_online] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [quiz_online] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [quiz_online] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [quiz_online] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [quiz_online] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [quiz_online] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [quiz_online] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [quiz_online] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [quiz_online] SET  MULTI_USER 
GO
ALTER DATABASE [quiz_online] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [quiz_online] SET DB_CHAINING OFF 
GO
ALTER DATABASE [quiz_online] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [quiz_online] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [quiz_online] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [quiz_online] SET QUERY_STORE = OFF
GO
USE [quiz_online]
GO
/****** Object:  Table [dbo].[answer]    Script Date: 2/7/2021 2:18:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[answer](
	[answer_id] [int] IDENTITY(1,1) NOT NULL,
	[question_id] [int] NULL,
	[answer_content] [text] NULL,
	[is_correct] [bit] NULL,
 CONSTRAINT [PK_answer] PRIMARY KEY CLUSTERED 
(
	[answer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[questions]    Script Date: 2/7/2021 2:18:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[questions](
	[question_id] [int] IDENTITY(1,1) NOT NULL,
	[question_content] [text] NOT NULL,
	[create_date] [date] NOT NULL,
	[subject_id] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_questions] PRIMARY KEY CLUSTERED 
(
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quiz]    Script Date: 2/7/2021 2:18:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quiz](
	[quiz_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [nvarchar](50) NULL,
	[subject_id] [nvarchar](50) NULL,
	[quiz_date] [date] NULL,
	[total_score] [decimal](6, 2) NULL,
 CONSTRAINT [PK_quiz] PRIMARY KEY CLUSTERED 
(
	[quiz_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quiz_detail]    Script Date: 2/7/2021 2:18:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quiz_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quiz_id] [int] NULL,
	[question_id] [int] NULL,
	[is_right] [bit] NULL,
	[score] [decimal](6, 2) NULL,
	[answer_id] [int] NULL,
 CONSTRAINT [PK_quiz_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subjects]    Script Date: 2/7/2021 2:18:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subjects](
	[subject_id] [nvarchar](50) NOT NULL,
	[subject_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_subjects] PRIMARY KEY CLUSTERED 
(
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2/7/2021 2:18:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [nvarchar](50) NOT NULL,
	[user_name] [nvarchar](50) NOT NULL,
	[is_admin] [bit] NOT NULL,
	[password] [text] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[answer] ON 

INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (1, 1, N'yellow', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (2, 1, N'pink', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (3, 1, N'ok', 1)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (4, 1, N'ha', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (5, 2, N'honeasd', 1)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (6, 2, N'lalala', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (7, 2, N'bebola', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (8, 2, N'beach', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (9, 3, N'kien', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (10, 3, N'table', 1)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (12, 3, N'chair', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (13, 3, N'bike', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (14, 4, N'lutata', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (15, 4, N'kentuti', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (16, 4, N'kigo2', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (17, 4, N'daragon', 1)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (18, 5, N'tinvo', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (19, 5, N'hoangso', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (20, 5, N'masieu', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (21, 5, N'kihkong', 1)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (22, 6, N'black dog', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (23, 6, N'big house', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (24, 6, N'a programing langguae', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (25, 6, N'tinder', 1)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (26, 7, N'badoo', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (27, 7, N'red', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (28, 7, N'hot', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (29, 7, N'take', 1)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (30, 8, N'greate', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (31, 8, N'honda', 1)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (32, 8, N'yamaha', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (33, 8, N'suzuki', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (34, 9, N'It ok', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (35, 9, N'hohoho', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (36, 9, N'Best', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (37, 9, N'tinder', 1)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (38, 10, N'LongSSSS', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (39, 10, N'Cuong', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (40, 10, N'Kim', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (41, 10, N'Huy', 1)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (42, 11, N'black dog', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (43, 11, N'crew up', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (44, 11, N'turn on the radio', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (45, 11, N'keu', 1)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (46, 12, N'good', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (47, 12, N'bad', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (48, 12, N'best', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (49, 12, N'worth', 1)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (50, 13, N'Chill with view', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (51, 13, N'Learning English', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (52, 13, N'a programing langguae', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (53, 13, N'keu', 1)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (54, 14, N'at pool', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (55, 14, N'at car', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (56, 14, N'at table', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (57, 14, N'at homek', 1)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (58, 15, N'black dog', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (59, 15, N'a programing langguae', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (60, 15, N'a programing langguaex', 0)
INSERT [dbo].[answer] ([answer_id], [question_id], [answer_content], [is_correct]) VALUES (61, 15, N'Say Help', 1)
SET IDENTITY_INSERT [dbo].[answer] OFF
GO
SET IDENTITY_INSERT [dbo].[questions] ON 

INSERT [dbo].[questions] ([question_id], [question_content], [create_date], [subject_id], [status]) VALUES (1, N'what is the dogdsad', CAST(N'2020-08-08' AS Date), N'PRJ311', 1)
INSERT [dbo].[questions] ([question_id], [question_content], [create_date], [subject_id], [status]) VALUES (2, N'we update two time2222', CAST(N'2020-08-08' AS Date), N'PRJ311', 0)
INSERT [dbo].[questions] ([question_id], [question_content], [create_date], [subject_id], [status]) VALUES (3, N'which is mineadad', CAST(N'2020-08-08' AS Date), N'PRJ311', 0)
INSERT [dbo].[questions] ([question_id], [question_content], [create_date], [subject_id], [status]) VALUES (4, N'how can you do', CAST(N'2020-09-09' AS Date), N'PRJ321', 1)
INSERT [dbo].[questions] ([question_id], [question_content], [create_date], [subject_id], [status]) VALUES (5, N'We was update', CAST(N'2021-01-31' AS Date), N'PRJ311', 1)
INSERT [dbo].[questions] ([question_id], [question_content], [create_date], [subject_id], [status]) VALUES (6, N'update', CAST(N'2021-01-31' AS Date), N'PRJ321', 1)
INSERT [dbo].[questions] ([question_id], [question_content], [create_date], [subject_id], [status]) VALUES (7, N'What do you want to do if you stuck in bus ? asdsa', CAST(N'2021-01-31' AS Date), N'PRJ311', 1)
INSERT [dbo].[questions] ([question_id], [question_content], [create_date], [subject_id], [status]) VALUES (8, N'What do you want to do if you stuck in bus ? hohoho', CAST(N'2021-01-31' AS Date), N'PRJ311', 1)
INSERT [dbo].[questions] ([question_id], [question_content], [create_date], [subject_id], [status]) VALUES (9, N'how do you think about jJAVA kentiyno', CAST(N'2021-01-31' AS Date), N'PRJ321', 1)
INSERT [dbo].[questions] ([question_id], [question_content], [create_date], [subject_id], [status]) VALUES (10, N'What is your name ?', CAST(N'2021-02-01' AS Date), N'PRJ321', 1)
INSERT [dbo].[questions] ([question_id], [question_content], [create_date], [subject_id], [status]) VALUES (11, N'What do you want to do if you stuck in taxi ? ', CAST(N'2021-02-01' AS Date), N'PRJ321', 0)
INSERT [dbo].[questions] ([question_id], [question_content], [create_date], [subject_id], [status]) VALUES (12, N'how old are you oke', CAST(N'2021-02-01' AS Date), N'PRJ311', 0)
INSERT [dbo].[questions] ([question_id], [question_content], [create_date], [subject_id], [status]) VALUES (13, N'What do you want to do if you stuck in bus ? ', CAST(N'2021-02-01' AS Date), N'PRJ321', 1)
INSERT [dbo].[questions] ([question_id], [question_content], [create_date], [subject_id], [status]) VALUES (14, N'which place we will explore knowleage', CAST(N'2021-02-02' AS Date), N'PRJ321', 0)
INSERT [dbo].[questions] ([question_id], [question_content], [create_date], [subject_id], [status]) VALUES (15, N'korawatawasd shi no me wa', CAST(N'2021-02-02' AS Date), N'PRJ321', 1)
SET IDENTITY_INSERT [dbo].[questions] OFF
GO
SET IDENTITY_INSERT [dbo].[quiz] ON 

INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (2, N'thanhhuyssx123@gmail.com', N'PRJ321', CAST(N'2021-02-02' AS Date), CAST(2.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (3, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(4.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (4, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(2.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (5, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(2.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (6, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(4.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (7, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(6.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (8, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(2.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (9, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(4.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (10, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(2.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (11, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(2.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (12, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (13, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (14, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (15, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (16, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (17, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (18, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (19, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (20, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (21, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (22, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (23, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (24, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (25, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (26, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (27, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (28, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(4.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (29, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(8.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (30, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(2.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (31, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(4.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (32, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(4.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (33, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(4.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (34, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (35, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (36, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(6.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (37, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(4.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (38, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(4.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (39, N'vochauthanhhu22y@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(4.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (40, N'thanhhuyssx123@gmail.com', N'PRJ321', CAST(N'2021-02-02' AS Date), CAST(2.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (41, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(2.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (42, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(2.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (43, N'thanhhuyssx123@gmail.com', N'PRJ321', CAST(N'2021-02-02' AS Date), CAST(3.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (44, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(4.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (45, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(2.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (46, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-02' AS Date), CAST(6.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (47, N'thanhhuyssx123@gmail.com', N'PRJ321', CAST(N'2021-02-04' AS Date), CAST(2.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (48, N'thanhhuyssx123@gmail.com', N'PRJ321', CAST(N'2021-02-04' AS Date), CAST(6.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (49, N'thanhhuyssx123@gmail.com', N'PRJ321', CAST(N'2021-02-04' AS Date), CAST(4.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (50, N'thanhhuyssx123@gmail.com', N'PRJ321', CAST(N'2021-02-04' AS Date), CAST(6.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (51, N'thanhhuyssx123@gmail.com', N'PRJ321', CAST(N'2021-02-04' AS Date), CAST(10.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (52, N'thanhhuyssx123@gmail.com', N'PRJ321', CAST(N'2021-02-04' AS Date), CAST(10.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (53, N'thanhhuyssx123@gmail.com', N'PRJ321', CAST(N'2021-02-04' AS Date), CAST(8.33 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (54, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-06' AS Date), CAST(5.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (55, N'thanhhuyssx123@gmail.com', N'PRJ321', CAST(N'2021-02-06' AS Date), CAST(10.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (56, N'thanhhuyssx123@gmail.com', N'PRJ321', CAST(N'2021-02-06' AS Date), CAST(3.33 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (57, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-06' AS Date), CAST(5.00 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (58, N'thanhhuyssx123@gmail.com', N'PRJ321', CAST(N'2021-02-06' AS Date), CAST(8.33 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (59, N'thanhhuyssx123@gmail.com', N'PRJ321', CAST(N'2021-02-06' AS Date), CAST(6.67 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (60, N'thanhhuyssx123@gmail.com', N'PRJ321', CAST(N'2021-02-06' AS Date), CAST(3.33 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (61, N'thanhhuyssx123@gmail.com', N'PRJ321', CAST(N'2021-02-06' AS Date), CAST(1.67 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (62, N'thanhhuyssx123@gmail.com', N'PRJ311', CAST(N'2021-02-06' AS Date), CAST(2.50 AS Decimal(6, 2)))
INSERT [dbo].[quiz] ([quiz_id], [user_id], [subject_id], [quiz_date], [total_score]) VALUES (63, N'thanhhuyssx1234@gmail.com', N'PRJ321', CAST(N'2021-02-07' AS Date), CAST(5.00 AS Decimal(6, 2)))
SET IDENTITY_INSERT [dbo].[quiz] OFF
GO
SET IDENTITY_INSERT [dbo].[quiz_detail] ON 

INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (6, 2, 4, 0, CAST(0.00 AS Decimal(6, 2)), 16)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (7, 2, 6, 0, CAST(0.00 AS Decimal(6, 2)), 24)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (8, 2, 9, 0, CAST(0.00 AS Decimal(6, 2)), 34)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (9, 2, 10, 0, CAST(0.00 AS Decimal(6, 2)), 40)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (10, 2, 13, 1, CAST(2.00 AS Decimal(6, 2)), 53)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (11, 3, 1, 0, CAST(0.00 AS Decimal(6, 2)), 2)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (12, 3, 2, 0, CAST(0.00 AS Decimal(6, 2)), 6)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (13, 3, 5, 1, CAST(2.00 AS Decimal(6, 2)), 21)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (14, 3, 7, 1, CAST(2.00 AS Decimal(6, 2)), 29)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (15, 3, 8, 0, CAST(0.00 AS Decimal(6, 2)), 32)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (16, 4, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (17, 4, 2, 0, CAST(0.00 AS Decimal(6, 2)), 8)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (18, 4, 5, 0, CAST(0.00 AS Decimal(6, 2)), 20)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (19, 4, 7, 1, CAST(2.00 AS Decimal(6, 2)), 29)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (20, 4, 8, 0, CAST(0.00 AS Decimal(6, 2)), 30)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (21, 5, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (22, 5, 2, 0, CAST(0.00 AS Decimal(6, 2)), 6)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (23, 5, 5, 0, CAST(0.00 AS Decimal(6, 2)), 18)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (24, 5, 7, 0, CAST(0.00 AS Decimal(6, 2)), 28)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (25, 5, 8, 1, CAST(2.00 AS Decimal(6, 2)), 31)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (26, 6, 1, 1, CAST(2.00 AS Decimal(6, 2)), 3)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (27, 6, 2, 0, CAST(0.00 AS Decimal(6, 2)), 7)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (28, 6, 5, 1, CAST(2.00 AS Decimal(6, 2)), 21)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (29, 6, 7, 0, CAST(0.00 AS Decimal(6, 2)), 26)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (30, 6, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (31, 7, 1, 1, CAST(2.00 AS Decimal(6, 2)), 3)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (32, 7, 2, 0, CAST(0.00 AS Decimal(6, 2)), 8)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (33, 7, 5, 0, CAST(0.00 AS Decimal(6, 2)), 18)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (34, 7, 7, 1, CAST(2.00 AS Decimal(6, 2)), 29)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (35, 7, 8, 1, CAST(2.00 AS Decimal(6, 2)), 31)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (36, 8, 1, 0, CAST(0.00 AS Decimal(6, 2)), 2)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (37, 8, 2, 0, CAST(0.00 AS Decimal(6, 2)), 7)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (38, 8, 5, 1, CAST(2.00 AS Decimal(6, 2)), 21)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (39, 8, 7, 0, CAST(0.00 AS Decimal(6, 2)), 26)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (40, 8, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (41, 9, 1, 0, CAST(0.00 AS Decimal(6, 2)), 1)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (42, 9, 2, 0, CAST(0.00 AS Decimal(6, 2)), 7)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (43, 9, 5, 1, CAST(2.00 AS Decimal(6, 2)), 21)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (44, 9, 7, 0, CAST(0.00 AS Decimal(6, 2)), 28)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (45, 9, 8, 1, CAST(2.00 AS Decimal(6, 2)), 31)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (46, 10, 1, 0, CAST(0.00 AS Decimal(6, 2)), 2)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (47, 10, 2, 0, CAST(0.00 AS Decimal(6, 2)), 7)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (48, 10, 5, 1, CAST(2.00 AS Decimal(6, 2)), 21)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (49, 10, 7, 0, CAST(0.00 AS Decimal(6, 2)), 27)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (50, 10, 8, 0, CAST(0.00 AS Decimal(6, 2)), 30)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (51, 11, 1, 0, CAST(0.00 AS Decimal(6, 2)), 2)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (52, 11, 2, 0, CAST(0.00 AS Decimal(6, 2)), 7)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (53, 11, 5, 1, CAST(2.00 AS Decimal(6, 2)), 21)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (54, 11, 7, 0, CAST(0.00 AS Decimal(6, 2)), 26)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (55, 11, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (56, 12, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (57, 12, 2, 0, CAST(0.00 AS Decimal(6, 2)), 7)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (58, 12, 5, 0, CAST(0.00 AS Decimal(6, 2)), 18)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (59, 12, 7, 0, CAST(0.00 AS Decimal(6, 2)), 27)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (60, 12, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (61, 13, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (62, 13, 2, 0, CAST(0.00 AS Decimal(6, 2)), 7)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (63, 13, 5, 0, CAST(0.00 AS Decimal(6, 2)), 18)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (64, 13, 7, 0, CAST(0.00 AS Decimal(6, 2)), 27)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (65, 13, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (66, 14, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (67, 14, 2, 0, CAST(0.00 AS Decimal(6, 2)), 7)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (68, 14, 5, 0, CAST(0.00 AS Decimal(6, 2)), 18)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (69, 14, 7, 0, CAST(0.00 AS Decimal(6, 2)), 27)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (70, 14, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (71, 15, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (72, 15, 2, 0, CAST(0.00 AS Decimal(6, 2)), 7)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (73, 15, 5, 0, CAST(0.00 AS Decimal(6, 2)), 18)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (74, 15, 7, 0, CAST(0.00 AS Decimal(6, 2)), 27)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (75, 15, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (76, 16, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (77, 16, 2, 0, CAST(0.00 AS Decimal(6, 2)), 7)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (78, 16, 5, 0, CAST(0.00 AS Decimal(6, 2)), 18)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (79, 16, 7, 0, CAST(0.00 AS Decimal(6, 2)), 27)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (80, 16, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (81, 17, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (82, 17, 2, 0, CAST(0.00 AS Decimal(6, 2)), 7)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (83, 17, 5, 0, CAST(0.00 AS Decimal(6, 2)), 18)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (84, 17, 7, 0, CAST(0.00 AS Decimal(6, 2)), 27)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (85, 17, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (86, 18, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (87, 18, 2, 0, CAST(0.00 AS Decimal(6, 2)), 7)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (88, 18, 5, 0, CAST(0.00 AS Decimal(6, 2)), 18)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (89, 18, 7, 0, CAST(0.00 AS Decimal(6, 2)), 27)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (90, 18, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (91, 19, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (92, 19, 2, 0, CAST(0.00 AS Decimal(6, 2)), 7)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (93, 19, 5, 0, CAST(0.00 AS Decimal(6, 2)), 18)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (94, 19, 7, 0, CAST(0.00 AS Decimal(6, 2)), 27)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (95, 19, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (96, 20, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (97, 20, 2, 0, CAST(0.00 AS Decimal(6, 2)), 7)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (98, 20, 5, 0, CAST(0.00 AS Decimal(6, 2)), 18)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (99, 20, 7, 0, CAST(0.00 AS Decimal(6, 2)), 27)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (100, 20, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (101, 21, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (102, 21, 2, 0, CAST(0.00 AS Decimal(6, 2)), 7)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (103, 21, 5, 0, CAST(0.00 AS Decimal(6, 2)), 18)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (104, 21, 7, 0, CAST(0.00 AS Decimal(6, 2)), 27)
GO
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (105, 22, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (106, 21, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (107, 22, 2, 0, CAST(0.00 AS Decimal(6, 2)), 7)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (108, 25, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (109, 22, 5, 0, CAST(0.00 AS Decimal(6, 2)), 18)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (110, 23, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (111, 25, 2, 0, CAST(0.00 AS Decimal(6, 2)), 7)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (112, 22, 7, 0, CAST(0.00 AS Decimal(6, 2)), 27)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (113, 24, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (114, 23, 2, 0, CAST(0.00 AS Decimal(6, 2)), 7)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (115, 25, 5, 0, CAST(0.00 AS Decimal(6, 2)), 18)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (116, 26, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (117, 22, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (118, 23, 5, 0, CAST(0.00 AS Decimal(6, 2)), 18)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (119, 27, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (120, 24, 2, 0, CAST(0.00 AS Decimal(6, 2)), 7)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (121, 25, 7, 0, CAST(0.00 AS Decimal(6, 2)), 27)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (122, 26, 2, 0, CAST(0.00 AS Decimal(6, 2)), 7)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (123, 24, 5, 0, CAST(0.00 AS Decimal(6, 2)), 18)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (124, 23, 7, 0, CAST(0.00 AS Decimal(6, 2)), 27)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (125, 27, 2, 0, CAST(0.00 AS Decimal(6, 2)), 7)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (126, 26, 5, 0, CAST(0.00 AS Decimal(6, 2)), 18)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (127, 24, 7, 0, CAST(0.00 AS Decimal(6, 2)), 27)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (128, 27, 5, 0, CAST(0.00 AS Decimal(6, 2)), 18)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (129, 23, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (130, 27, 7, 0, CAST(0.00 AS Decimal(6, 2)), 27)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (131, 24, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (132, 25, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (133, 27, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (134, 26, 7, 0, CAST(0.00 AS Decimal(6, 2)), 27)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (135, 26, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (136, 28, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (137, 28, 2, 0, CAST(0.00 AS Decimal(6, 2)), 7)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (138, 28, 5, 0, CAST(0.00 AS Decimal(6, 2)), 18)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (139, 28, 7, 1, CAST(2.00 AS Decimal(6, 2)), 29)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (140, 28, 8, 1, CAST(2.00 AS Decimal(6, 2)), 31)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (141, 29, 1, 0, CAST(0.00 AS Decimal(6, 2)), 2)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (142, 29, 2, 1, CAST(2.00 AS Decimal(6, 2)), 5)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (143, 29, 5, 1, CAST(2.00 AS Decimal(6, 2)), 21)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (144, 29, 7, 1, CAST(2.00 AS Decimal(6, 2)), 29)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (145, 29, 8, 1, CAST(2.00 AS Decimal(6, 2)), 31)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (146, 30, 1, 1, CAST(2.00 AS Decimal(6, 2)), 3)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (147, 30, 2, 0, CAST(0.00 AS Decimal(6, 2)), 8)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (148, 30, 5, 0, CAST(0.00 AS Decimal(6, 2)), 18)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (149, 30, 7, 0, CAST(0.00 AS Decimal(6, 2)), 27)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (150, 30, 8, 0, CAST(0.00 AS Decimal(6, 2)), 32)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (151, 31, 1, 1, CAST(2.00 AS Decimal(6, 2)), 3)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (152, 31, 2, 1, CAST(2.00 AS Decimal(6, 2)), 5)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (153, 31, 5, 0, CAST(0.00 AS Decimal(6, 2)), 20)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (154, 31, 7, 0, CAST(0.00 AS Decimal(6, 2)), 28)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (155, 31, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (156, 32, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (157, 32, 2, 0, CAST(0.00 AS Decimal(6, 2)), 8)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (158, 32, 5, 0, CAST(0.00 AS Decimal(6, 2)), 18)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (159, 32, 7, 1, CAST(2.00 AS Decimal(6, 2)), 29)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (160, 32, 8, 1, CAST(2.00 AS Decimal(6, 2)), 31)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (161, 33, 1, 1, CAST(2.00 AS Decimal(6, 2)), 3)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (162, 33, 2, 0, CAST(0.00 AS Decimal(6, 2)), 6)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (163, 33, 5, 1, CAST(2.00 AS Decimal(6, 2)), 21)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (164, 33, 7, 0, CAST(0.00 AS Decimal(6, 2)), 26)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (165, 33, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (166, 34, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (167, 34, 2, 0, CAST(0.00 AS Decimal(6, 2)), 8)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (168, 34, 5, 0, CAST(0.00 AS Decimal(6, 2)), 20)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (169, 34, 7, 0, CAST(0.00 AS Decimal(6, 2)), 27)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (170, 34, 8, 0, CAST(0.00 AS Decimal(6, 2)), 30)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (171, 35, 1, 0, CAST(0.00 AS Decimal(6, 2)), 2)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (172, 35, 2, 0, CAST(0.00 AS Decimal(6, 2)), 6)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (173, 35, 5, 0, CAST(0.00 AS Decimal(6, 2)), 20)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (174, 35, 7, 0, CAST(0.00 AS Decimal(6, 2)), 26)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (175, 35, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (176, 36, 1, 1, CAST(2.00 AS Decimal(6, 2)), 3)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (177, 36, 2, 0, CAST(0.00 AS Decimal(6, 2)), 8)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (178, 36, 5, 1, CAST(2.00 AS Decimal(6, 2)), 21)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (179, 36, 7, 0, CAST(0.00 AS Decimal(6, 2)), 28)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (180, 36, 8, 1, CAST(2.00 AS Decimal(6, 2)), 31)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (181, 37, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (182, 37, 2, 0, CAST(0.00 AS Decimal(6, 2)), 8)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (183, 37, 5, 1, CAST(2.00 AS Decimal(6, 2)), 21)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (184, 37, 7, 1, CAST(2.00 AS Decimal(6, 2)), 29)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (185, 37, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (186, 38, 1, 1, CAST(2.00 AS Decimal(6, 2)), 3)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (187, 38, 2, 0, CAST(0.00 AS Decimal(6, 2)), 6)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (188, 38, 5, 0, CAST(0.00 AS Decimal(6, 2)), 20)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (189, 38, 7, 1, CAST(2.00 AS Decimal(6, 2)), 29)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (190, 38, 8, 0, CAST(0.00 AS Decimal(6, 2)), 30)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (191, 39, 1, 0, CAST(0.00 AS Decimal(6, 2)), 2)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (192, 39, 2, 0, CAST(0.00 AS Decimal(6, 2)), 8)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (193, 39, 5, 0, CAST(0.00 AS Decimal(6, 2)), 20)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (194, 39, 7, 1, CAST(2.00 AS Decimal(6, 2)), 29)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (195, 39, 8, 1, CAST(2.00 AS Decimal(6, 2)), 31)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (196, 40, 4, 0, CAST(0.00 AS Decimal(6, 2)), 16)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (197, 40, 6, 0, CAST(0.00 AS Decimal(6, 2)), 24)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (198, 40, 9, 0, CAST(0.00 AS Decimal(6, 2)), 35)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (199, 40, 10, 0, CAST(0.00 AS Decimal(6, 2)), 38)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (200, 40, 13, 1, CAST(2.00 AS Decimal(6, 2)), 53)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (201, 41, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (202, 41, 2, 0, CAST(0.00 AS Decimal(6, 2)), 8)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (203, 41, 5, 1, CAST(2.00 AS Decimal(6, 2)), 21)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (204, 41, 7, 0, CAST(0.00 AS Decimal(6, 2)), 28)
GO
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (205, 41, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (206, 42, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (207, 42, 5, 1, CAST(2.00 AS Decimal(6, 2)), 21)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (208, 42, 7, 0, CAST(0.00 AS Decimal(6, 2)), 27)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (209, 42, 8, 0, CAST(0.00 AS Decimal(6, 2)), 32)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (210, 43, 4, 1, CAST(1.00 AS Decimal(6, 2)), 17)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (211, 43, 6, 0, CAST(0.00 AS Decimal(6, 2)), 23)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (212, 43, 9, 1, CAST(1.00 AS Decimal(6, 2)), 37)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (213, 43, 10, 1, CAST(1.00 AS Decimal(6, 2)), 41)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (214, 43, 13, 0, CAST(0.00 AS Decimal(6, 2)), 52)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (215, 43, 15, 0, CAST(0.00 AS Decimal(6, 2)), 58)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (216, 44, 1, 0, CAST(0.00 AS Decimal(6, 2)), 2)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (217, 44, 5, 1, CAST(2.00 AS Decimal(6, 2)), 21)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (218, 44, 7, 0, CAST(0.00 AS Decimal(6, 2)), 28)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (219, 44, 8, 1, CAST(2.00 AS Decimal(6, 2)), 31)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (220, 45, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (221, 45, 5, 0, CAST(0.00 AS Decimal(6, 2)), 19)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (222, 45, 7, 0, CAST(0.00 AS Decimal(6, 2)), 28)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (223, 45, 8, 1, CAST(2.00 AS Decimal(6, 2)), 31)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (224, 46, 1, 1, CAST(2.00 AS Decimal(6, 2)), 3)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (225, 46, 5, 1, CAST(2.00 AS Decimal(6, 2)), 21)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (226, 46, 7, 1, CAST(2.00 AS Decimal(6, 2)), 29)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (227, 46, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (228, 47, 4, 0, CAST(0.00 AS Decimal(6, 2)), 14)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (229, 47, 6, 0, CAST(0.00 AS Decimal(6, 2)), 23)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (230, 47, 9, 1, CAST(1.00 AS Decimal(6, 2)), 37)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (231, 47, 10, 1, CAST(1.00 AS Decimal(6, 2)), 41)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (232, 47, 13, 0, CAST(0.00 AS Decimal(6, 2)), 52)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (233, 47, 15, 0, CAST(0.00 AS Decimal(6, 2)), 60)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (234, 48, 4, 1, CAST(1.00 AS Decimal(6, 2)), 17)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (235, 48, 6, 1, CAST(1.00 AS Decimal(6, 2)), 25)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (236, 48, 9, 1, CAST(1.00 AS Decimal(6, 2)), 37)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (237, 48, 10, 1, CAST(1.00 AS Decimal(6, 2)), 41)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (238, 48, 13, 1, CAST(1.00 AS Decimal(6, 2)), 53)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (239, 48, 15, 1, CAST(1.00 AS Decimal(6, 2)), 61)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (240, 49, 4, 1, CAST(1.00 AS Decimal(6, 2)), 17)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (241, 49, 6, 0, CAST(0.00 AS Decimal(6, 2)), 23)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (242, 49, 9, 1, CAST(1.00 AS Decimal(6, 2)), 37)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (243, 49, 10, 1, CAST(1.00 AS Decimal(6, 2)), 41)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (244, 49, 13, 1, CAST(1.00 AS Decimal(6, 2)), 53)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (245, 49, 15, 0, CAST(0.00 AS Decimal(6, 2)), 58)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (246, 50, 4, 1, CAST(1.00 AS Decimal(6, 2)), 17)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (247, 50, 6, 1, CAST(1.00 AS Decimal(6, 2)), 25)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (248, 50, 9, 1, CAST(1.00 AS Decimal(6, 2)), 37)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (249, 50, 10, 1, CAST(1.00 AS Decimal(6, 2)), 41)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (250, 50, 13, 1, CAST(1.00 AS Decimal(6, 2)), 53)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (251, 50, 15, 1, CAST(1.00 AS Decimal(6, 2)), 61)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (252, 51, 4, 1, CAST(1.00 AS Decimal(6, 2)), 17)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (253, 51, 6, 1, CAST(1.00 AS Decimal(6, 2)), 25)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (254, 51, 9, 1, CAST(1.00 AS Decimal(6, 2)), 37)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (255, 51, 10, 1, CAST(1.00 AS Decimal(6, 2)), 41)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (256, 51, 13, 1, CAST(1.00 AS Decimal(6, 2)), 53)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (257, 51, 15, 1, CAST(1.00 AS Decimal(6, 2)), 61)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (258, 52, 4, 1, CAST(1.00 AS Decimal(6, 2)), 17)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (259, 52, 6, 1, CAST(1.00 AS Decimal(6, 2)), 25)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (260, 52, 9, 1, CAST(1.00 AS Decimal(6, 2)), 37)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (261, 52, 10, 1, CAST(1.00 AS Decimal(6, 2)), 41)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (262, 52, 13, 1, CAST(1.00 AS Decimal(6, 2)), 53)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (263, 52, 15, 1, CAST(1.00 AS Decimal(6, 2)), 61)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (264, 53, 4, 1, CAST(1.00 AS Decimal(6, 2)), 17)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (265, 53, 6, 1, CAST(1.00 AS Decimal(6, 2)), 25)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (266, 53, 9, 1, CAST(1.00 AS Decimal(6, 2)), 37)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (267, 53, 10, 0, CAST(0.00 AS Decimal(6, 2)), 40)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (268, 53, 13, 1, CAST(1.00 AS Decimal(6, 2)), 53)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (269, 53, 15, 1, CAST(1.00 AS Decimal(6, 2)), 61)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (270, 54, 1, 0, CAST(0.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (271, 54, 5, 0, CAST(0.00 AS Decimal(6, 2)), 20)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (272, 54, 7, 1, CAST(2.00 AS Decimal(6, 2)), 29)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (273, 54, 8, 1, CAST(2.00 AS Decimal(6, 2)), 31)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (274, 55, 4, 1, CAST(1.00 AS Decimal(6, 2)), 17)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (275, 55, 6, 1, CAST(1.00 AS Decimal(6, 2)), 25)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (276, 55, 9, 1, CAST(1.00 AS Decimal(6, 2)), 37)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (277, 55, 10, 1, CAST(1.00 AS Decimal(6, 2)), 41)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (278, 55, 13, 1, CAST(1.00 AS Decimal(6, 2)), 53)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (279, 55, 15, 1, CAST(1.00 AS Decimal(6, 2)), 61)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (280, 56, 4, 1, CAST(1.00 AS Decimal(6, 2)), 17)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (281, 56, 6, 0, CAST(0.00 AS Decimal(6, 2)), 22)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (282, 56, 9, 1, CAST(1.00 AS Decimal(6, 2)), 37)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (283, 56, 10, 0, CAST(0.00 AS Decimal(6, 2)), 40)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (284, 56, 13, 0, CAST(0.00 AS Decimal(6, 2)), 51)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (285, 56, 15, 0, CAST(0.00 AS Decimal(6, 2)), 59)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (286, 57, 1, 0, CAST(0.00 AS Decimal(6, 2)), 2)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (287, 57, 5, 1, CAST(2.00 AS Decimal(6, 2)), 21)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (288, 57, 7, 1, CAST(2.00 AS Decimal(6, 2)), 29)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (289, 57, 8, 0, CAST(0.00 AS Decimal(6, 2)), 32)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (290, 58, 4, 1, CAST(1.00 AS Decimal(6, 2)), 17)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (291, 58, 6, 1, CAST(1.00 AS Decimal(6, 2)), 25)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (292, 58, 9, 1, CAST(1.00 AS Decimal(6, 2)), 37)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (293, 58, 10, 1, CAST(1.00 AS Decimal(6, 2)), 41)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (294, 58, 13, 0, CAST(0.00 AS Decimal(6, 2)), 50)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (295, 58, 15, 1, CAST(1.00 AS Decimal(6, 2)), 61)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (296, 59, 4, 0, CAST(0.00 AS Decimal(6, 2)), 15)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (297, 59, 6, 1, CAST(1.00 AS Decimal(6, 2)), 25)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (298, 59, 9, 1, CAST(1.00 AS Decimal(6, 2)), 37)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (299, 59, 10, 0, CAST(0.00 AS Decimal(6, 2)), 39)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (300, 59, 13, 1, CAST(1.00 AS Decimal(6, 2)), 53)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (301, 59, 15, 1, CAST(1.00 AS Decimal(6, 2)), 61)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (302, 60, 4, 1, CAST(1.00 AS Decimal(6, 2)), 17)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (303, 60, 6, 0, CAST(0.00 AS Decimal(6, 2)), 23)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (304, 60, 9, 0, CAST(0.00 AS Decimal(6, 2)), 34)
GO
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (305, 60, 10, 0, CAST(0.00 AS Decimal(6, 2)), 40)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (306, 60, 13, 1, CAST(1.00 AS Decimal(6, 2)), 53)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (307, 60, 15, 0, CAST(0.00 AS Decimal(6, 2)), 58)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (308, 61, 4, 0, CAST(0.00 AS Decimal(6, 2)), 14)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (309, 61, 6, 0, CAST(0.00 AS Decimal(6, 2)), 22)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (310, 61, 9, 0, CAST(0.00 AS Decimal(6, 2)), 36)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (311, 61, 10, 1, CAST(1.00 AS Decimal(6, 2)), 41)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (312, 61, 13, 0, CAST(0.00 AS Decimal(6, 2)), 50)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (313, 61, 15, 0, CAST(0.00 AS Decimal(6, 2)), 58)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (314, 62, 1, 0, CAST(0.00 AS Decimal(6, 2)), 1)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (315, 62, 5, 0, CAST(0.00 AS Decimal(6, 2)), 19)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (316, 62, 7, 1, CAST(2.00 AS Decimal(6, 2)), 29)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (317, 62, 8, 0, CAST(0.00 AS Decimal(6, 2)), 33)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (318, 63, 4, 0, CAST(0.00 AS Decimal(6, 2)), 15)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (319, 63, 6, 1, CAST(1.00 AS Decimal(6, 2)), 25)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (320, 63, 9, 0, CAST(0.00 AS Decimal(6, 2)), 35)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (321, 63, 10, 1, CAST(1.00 AS Decimal(6, 2)), 41)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (322, 63, 13, 0, CAST(0.00 AS Decimal(6, 2)), 52)
INSERT [dbo].[quiz_detail] ([id], [quiz_id], [question_id], [is_right], [score], [answer_id]) VALUES (323, 63, 15, 1, CAST(1.00 AS Decimal(6, 2)), 61)
SET IDENTITY_INSERT [dbo].[quiz_detail] OFF
GO
INSERT [dbo].[subjects] ([subject_id], [subject_name]) VALUES (N'PRJ311', N'Java Desktop')
INSERT [dbo].[subjects] ([subject_id], [subject_name]) VALUES (N'PRJ321', N'Java Web')
GO
INSERT [dbo].[users] ([user_id], [user_name], [is_admin], [password]) VALUES (N'admin3342@gmail.com', N'John San', 1, N'b79ea17b7c5ca8fe9cccd8cdba6e8f8ed0b3c948f9f709ed0f47d2fd47fcba82')
INSERT [dbo].[users] ([user_id], [user_name], [is_admin], [password]) VALUES (N'lamtinhtri@gmail.com', N'Lam Tri Han', 0, N'5f6121bc06e18e209920d57d2f16b17cc82dfc2ade1d375d6951b99c65d1b89d')
INSERT [dbo].[users] ([user_id], [user_name], [is_admin], [password]) VALUES (N'lamtinhtrxxi@gmail.com', N'Lam Tri Han', 0, N'5f6121bc06e18e209920d57d2f16b17cc82dfc2ade1d375d6951b99c65d1b89d')
INSERT [dbo].[users] ([user_id], [user_name], [is_admin], [password]) VALUES (N'lamvanti@gmail.com', N'Lam Van Ti', 0, N'123456')
INSERT [dbo].[users] ([user_id], [user_name], [is_admin], [password]) VALUES (N'richard123@gmail.com', N'richarc mainly', 0, N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225')
INSERT [dbo].[users] ([user_id], [user_name], [is_admin], [password]) VALUES (N'thanhhuy123@gmail.com', N'thanh huy', 0, N'b79ea17b7c5ca8fe9cccd8cdba6e8f8ed0b3c948f9f709ed0f47d2fd47fcba82')
INSERT [dbo].[users] ([user_id], [user_name], [is_admin], [password]) VALUES (N'thanhhuyssx123@gmail.com', N'nguyen lam ngoc hai', 0, N'b79ea17b7c5ca8fe9cccd8cdba6e8f8ed0b3c948f9f709ed0f47d2fd47fcba82')
INSERT [dbo].[users] ([user_id], [user_name], [is_admin], [password]) VALUES (N'thanhhuyssx1234@gmail.com', N'idhkjhsda', 0, N'b79ea17b7c5ca8fe9cccd8cdba6e8f8ed0b3c948f9f709ed0f47d2fd47fcba82')
INSERT [dbo].[users] ([user_id], [user_name], [is_admin], [password]) VALUES (N'vochaudsay@gmail.com', N'long caca', 0, N'b79ea17b7c5ca8fe9cccd8cdba6e8f8ed0b3c948f9f709ed0f47d2fd47fcba82')
INSERT [dbo].[users] ([user_id], [user_name], [is_admin], [password]) VALUES (N'vochauthanhhu22y@gmail.com', N'vo chau thanh huy', 0, N'b79ea17b7c5ca8fe9cccd8cdba6e8f8ed0b3c948f9f709ed0f47d2fd47fcba82')
INSERT [dbo].[users] ([user_id], [user_name], [is_admin], [password]) VALUES (N'vochauthanhhuy@gmail.com', N'thanhhuy', 0, N'b79ea17b7c5ca8fe9cccd8cdba6e8f8ed0b3c948f9f709ed0f47d2fd47fcba82')
GO
ALTER TABLE [dbo].[answer]  WITH CHECK ADD  CONSTRAINT [FK_answer_questions] FOREIGN KEY([question_id])
REFERENCES [dbo].[questions] ([question_id])
GO
ALTER TABLE [dbo].[answer] CHECK CONSTRAINT [FK_answer_questions]
GO
ALTER TABLE [dbo].[questions]  WITH CHECK ADD  CONSTRAINT [FK_questions_subjects] FOREIGN KEY([subject_id])
REFERENCES [dbo].[subjects] ([subject_id])
GO
ALTER TABLE [dbo].[questions] CHECK CONSTRAINT [FK_questions_subjects]
GO
ALTER TABLE [dbo].[quiz]  WITH CHECK ADD  CONSTRAINT [FK_quiz_subjects] FOREIGN KEY([subject_id])
REFERENCES [dbo].[subjects] ([subject_id])
GO
ALTER TABLE [dbo].[quiz] CHECK CONSTRAINT [FK_quiz_subjects]
GO
ALTER TABLE [dbo].[quiz]  WITH CHECK ADD  CONSTRAINT [FK_quiz_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[quiz] CHECK CONSTRAINT [FK_quiz_users]
GO
ALTER TABLE [dbo].[quiz_detail]  WITH CHECK ADD  CONSTRAINT [FK_quiz_detail_questions] FOREIGN KEY([answer_id])
REFERENCES [dbo].[answer] ([answer_id])
GO
ALTER TABLE [dbo].[quiz_detail] CHECK CONSTRAINT [FK_quiz_detail_questions]
GO
ALTER TABLE [dbo].[quiz_detail]  WITH CHECK ADD  CONSTRAINT [FK_quiz_detail_quiz] FOREIGN KEY([quiz_id])
REFERENCES [dbo].[quiz] ([quiz_id])
GO
ALTER TABLE [dbo].[quiz_detail] CHECK CONSTRAINT [FK_quiz_detail_quiz]
GO
USE [master]
GO
ALTER DATABASE [quiz_online] SET  READ_WRITE 
GO
