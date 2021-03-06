USE [master]
GO
/****** Object:  Database [Movie]    Script Date: 8.8.2016 21:28:31 ******/
CREATE DATABASE [Movie]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Movie', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Movie.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Movie_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Movie_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Movie] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Movie].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Movie] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Movie] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Movie] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Movie] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Movie] SET ARITHABORT OFF 
GO
ALTER DATABASE [Movie] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Movie] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Movie] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Movie] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Movie] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Movie] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Movie] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Movie] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Movie] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Movie] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Movie] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Movie] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Movie] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Movie] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Movie] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Movie] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Movie] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Movie] SET RECOVERY FULL 
GO
ALTER DATABASE [Movie] SET  MULTI_USER 
GO
ALTER DATABASE [Movie] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Movie] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Movie] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Movie] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Movie] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Movie]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8.8.2016 21:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Movie]    Script Date: 8.8.2016 21:28:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Movie](
	[MovieId] [int] IDENTITY(1,1) NOT NULL,
	[MovieName] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Duration] [int] NULL,
	[Week] [char](3) NULL,
	[WeekFirsDay] [datetime] NULL,
	[WeekLastDay] [datetime] NULL,
	[ContinuationOf] [int] NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Movie_Category]    Script Date: 8.8.2016 21:28:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie_Category](
	[CategoryId] [int] NOT NULL,
	[MovieId] [int] NOT NULL,
 CONSTRAINT [PK_Movie_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC,
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Movie_Saloons]    Script Date: 8.8.2016 21:28:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie_Saloons](
	[SaloonsId] [int] NOT NULL,
	[MovieId] [int] NOT NULL,
 CONSTRAINT [PK_Movie_Saloons] PRIMARY KEY CLUSTERED 
(
	[SaloonsId] ASC,
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Movie_Session]    Script Date: 8.8.2016 21:28:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie_Session](
	[SessionId] [int] NOT NULL,
	[MovieId] [int] NOT NULL,
 CONSTRAINT [PK_Movie_Session] PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC,
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Saloons]    Script Date: 8.8.2016 21:28:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Saloons](
	[SaloonsId] [int] IDENTITY(1,1) NOT NULL,
	[SaloonsAdı] [nvarchar](27) NOT NULL,
	[SalonCapacity] [int] NOT NULL,
 CONSTRAINT [PK_Saloons] PRIMARY KEY CLUSTERED 
(
	[SaloonsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Session]    Script Date: 8.8.2016 21:28:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[SessionId] [int] IDENTITY(1,1) NOT NULL,
	[SessionTime] [time](7) NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vw_BuHaftaFilmleri]    Script Date: 8.8.2016 21:28:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_BuHaftaFilmleri]
AS
	SELECT DISTINCT m.MovieName,s.SessionTime,sa.SaloonsAdı FROM Movie m
		JOIN Movie_Session ms ON m.MovieId = ms.MovieId
		JOIN Session s ON s.SessionId = ms.SessionId
		JOIN Movie_Saloons msa ON  msa.MovieId = m.MovieId
		JOIN Saloons sa ON sa.SaloonsId = msa.SaloonsId
		WHERE GETDATE() <= WeekLastDay AND GETDATE() >= WeekFirsDay 
GO
/****** Object:  View [dbo].[vw_GelecekHaftaFilmi]    Script Date: 8.8.2016 21:28:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_GelecekHaftaFilmi]
AS
	SELECT DATEADD(week,1,GETDATE()) GelecekHaftaFilmleri ,MovieName gelecekHafta FROM Movie WHERE DATEADD(week,1,GETDATE()) >= WeekFirsDay
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'Crime')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'Drama')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (3, N'Adventure')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (4, N'Comedy')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (5, N'Animation')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (6, N'Action')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (7, N'Sci-Fi')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (8, N'Fantasy')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Movie] ON 

INSERT [dbo].[Movie] ([MovieId], [MovieName], [Description], [Duration], [Week], [WeekFirsDay], [WeekLastDay], [ContinuationOf]) VALUES (1, N'The Shawshank Redemption', N'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 142, N'w32', CAST(N'2016-08-08 00:00:00.000' AS DateTime), CAST(N'2016-08-14 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Description], [Duration], [Week], [WeekFirsDay], [WeekLastDay], [ContinuationOf]) VALUES (2, N'Back to the Future', N'Marty McFly, a 17-year-old high school student, is accidentally sent 30 years into the past in a time-traveling DeLorean invented by his close friend, the maverick scientist Doc Brown.', 114, N'w32', CAST(N'2016-08-08 00:00:00.000' AS DateTime), CAST(N'2016-08-14 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Description], [Duration], [Week], [WeekFirsDay], [WeekLastDay], [ContinuationOf]) VALUES (3, N'Forrest Gump', N'Forrest Gump, while not intelligent, has accidentally been present at many historic moments, but his true love, Jenny Curran, eludes him.', 142, N'w32', CAST(N'2016-08-08 00:00:00.000' AS DateTime), CAST(N'2016-08-14 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Description], [Duration], [Week], [WeekFirsDay], [WeekLastDay], [ContinuationOf]) VALUES (4, N'Fight Club', N'An insomniac office worker, looking for a way to change his life, crosses paths with a devil-may-care soap maker, forming an underground fight club that evolves into something much, much more.', 140, N'w32', CAST(N'2016-08-08 00:00:00.000' AS DateTime), CAST(N'2016-08-14 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Description], [Duration], [Week], [WeekFirsDay], [WeekLastDay], [ContinuationOf]) VALUES (5, N'The Lion King', N'Lion cub and future king Simba searches for his identity. His eagerness to please others and penchant for testing his boundaries sometimes gets him into trouble.', 90, N'w32', CAST(N'2016-08-08 00:00:00.000' AS DateTime), CAST(N'2016-08-14 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Description], [Duration], [Week], [WeekFirsDay], [WeekLastDay], [ContinuationOf]) VALUES (6, N'The Shawshank Redemption', N'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 142, N'w33', CAST(N'2016-08-15 00:00:00.000' AS DateTime), CAST(N'2016-08-21 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Description], [Duration], [Week], [WeekFirsDay], [WeekLastDay], [ContinuationOf]) VALUES (7, N'Back to the Future 2', N'After visiting 2015, Marty McFly must repeat his visit to 1955 to prevent disastrous changes to 1985...without interfering with his first trip.', 110, N'w33', CAST(N'2016-08-15 00:00:00.000' AS DateTime), CAST(N'2016-08-14 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Description], [Duration], [Week], [WeekFirsDay], [WeekLastDay], [ContinuationOf]) VALUES (8, N'The Truman Show', N'An insurance salesman/adjuster discovers his entire life is actually a television show.', 105, N'w33', CAST(N'2016-08-15 00:00:00.000' AS DateTime), CAST(N'2016-08-14 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Description], [Duration], [Week], [WeekFirsDay], [WeekLastDay], [ContinuationOf]) VALUES (9, N'Fight Club', N'An insomniac office worker, looking for a way to change his life, crosses paths with a devil-may-care soap maker, forming an underground fight club that evolves into something much, much more.', 140, N'w33', CAST(N'2016-08-15 00:00:00.000' AS DateTime), CAST(N'2016-08-14 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Description], [Duration], [Week], [WeekFirsDay], [WeekLastDay], [ContinuationOf]) VALUES (10, N'Ice Age', N'Set during the Ice Age, a sabertooth tiger, a sloth, and a wooly mammoth find a lost human infant, and they try to return him to his tribe.', 81, N'w33', CAST(N'2016-08-15 00:00:00.000' AS DateTime), CAST(N'2016-08-14 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Description], [Duration], [Week], [WeekFirsDay], [WeekLastDay], [ContinuationOf]) VALUES (11, N'The Green Mile', N'The lives of guards on Death Row are affected by one of their charges: a black man accused of child murder and rape, yet who has a mysterious gift.', 190, N'w34', CAST(N'2016-08-22 00:00:00.000' AS DateTime), CAST(N'2016-08-28 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Description], [Duration], [Week], [WeekFirsDay], [WeekLastDay], [ContinuationOf]) VALUES (12, N'Back to the Future 3', N'Enjoying a peaceable existence in 1885, Doctor Emmet Brown is about to be killed by Buford "Mad Dog" Tannen. Marty McFly travels back in time to save his friend.', 120, N'w34', CAST(N'2016-08-22 00:00:00.000' AS DateTime), CAST(N'2016-08-14 00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Description], [Duration], [Week], [WeekFirsDay], [WeekLastDay], [ContinuationOf]) VALUES (13, N'The Truman Show', N'An insurance salesman/adjuster discovers his entire life is actually a television show.', 105, N'w34', CAST(N'2016-08-22 00:00:00.000' AS DateTime), CAST(N'2016-08-14 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Description], [Duration], [Week], [WeekFirsDay], [WeekLastDay], [ContinuationOf]) VALUES (14, N'The Matrix', N'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', 105, N'w34', CAST(N'2016-08-22 00:00:00.000' AS DateTime), CAST(N'2016-08-14 00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Movie] OFF
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (1, 1)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (1, 6)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (1, 11)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (2, 1)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (2, 3)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (2, 5)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (2, 6)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (2, 8)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (2, 9)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (2, 10)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (2, 11)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (2, 13)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (3, 2)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (3, 4)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (3, 5)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (3, 7)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (3, 10)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (3, 12)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (4, 2)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (4, 3)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (4, 7)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (4, 8)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (4, 12)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (4, 13)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (5, 5)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (5, 10)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (6, 14)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (7, 2)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (7, 7)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (7, 8)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (7, 12)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (7, 13)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (7, 14)
INSERT [dbo].[Movie_Category] ([CategoryId], [MovieId]) VALUES (8, 11)
INSERT [dbo].[Movie_Saloons] ([SaloonsId], [MovieId]) VALUES (1, 1)
INSERT [dbo].[Movie_Saloons] ([SaloonsId], [MovieId]) VALUES (1, 6)
INSERT [dbo].[Movie_Saloons] ([SaloonsId], [MovieId]) VALUES (1, 11)
INSERT [dbo].[Movie_Saloons] ([SaloonsId], [MovieId]) VALUES (2, 1)
INSERT [dbo].[Movie_Saloons] ([SaloonsId], [MovieId]) VALUES (2, 2)
INSERT [dbo].[Movie_Saloons] ([SaloonsId], [MovieId]) VALUES (2, 7)
INSERT [dbo].[Movie_Saloons] ([SaloonsId], [MovieId]) VALUES (2, 12)
INSERT [dbo].[Movie_Saloons] ([SaloonsId], [MovieId]) VALUES (3, 3)
INSERT [dbo].[Movie_Saloons] ([SaloonsId], [MovieId]) VALUES (3, 8)
INSERT [dbo].[Movie_Saloons] ([SaloonsId], [MovieId]) VALUES (3, 11)
INSERT [dbo].[Movie_Saloons] ([SaloonsId], [MovieId]) VALUES (3, 13)
INSERT [dbo].[Movie_Saloons] ([SaloonsId], [MovieId]) VALUES (4, 4)
INSERT [dbo].[Movie_Saloons] ([SaloonsId], [MovieId]) VALUES (4, 5)
INSERT [dbo].[Movie_Saloons] ([SaloonsId], [MovieId]) VALUES (4, 9)
INSERT [dbo].[Movie_Saloons] ([SaloonsId], [MovieId]) VALUES (4, 10)
INSERT [dbo].[Movie_Saloons] ([SaloonsId], [MovieId]) VALUES (4, 14)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (2, 1)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (2, 2)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (2, 3)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (2, 6)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (2, 7)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (2, 8)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (2, 11)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (2, 12)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (2, 13)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (2, 14)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (3, 5)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (3, 10)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (4, 2)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (4, 7)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (4, 8)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (4, 12)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (4, 13)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (5, 1)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (5, 3)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (5, 5)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (5, 6)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (5, 10)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (5, 14)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (6, 11)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (7, 2)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (7, 5)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (7, 7)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (7, 8)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (7, 10)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (7, 11)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (7, 12)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (8, 1)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (8, 3)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (8, 6)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (8, 14)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (9, 1)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (9, 4)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (9, 7)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (9, 8)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (9, 9)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (9, 12)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (10, 11)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (11, 1)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (11, 3)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (11, 6)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (11, 11)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (12, 7)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (12, 8)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (12, 12)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (12, 14)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (13, 1)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (13, 4)
INSERT [dbo].[Movie_Session] ([SessionId], [MovieId]) VALUES (13, 9)
SET IDENTITY_INSERT [dbo].[Saloons] ON 

INSERT [dbo].[Saloons] ([SaloonsId], [SaloonsAdı], [SalonCapacity]) VALUES (1, N'A', 40)
INSERT [dbo].[Saloons] ([SaloonsId], [SaloonsAdı], [SalonCapacity]) VALUES (2, N'B', 58)
INSERT [dbo].[Saloons] ([SaloonsId], [SaloonsAdı], [SalonCapacity]) VALUES (3, N'C', 94)
INSERT [dbo].[Saloons] ([SaloonsId], [SaloonsAdı], [SalonCapacity]) VALUES (4, N'D', 72)
SET IDENTITY_INSERT [dbo].[Saloons] OFF
SET IDENTITY_INSERT [dbo].[Session] ON 

INSERT [dbo].[Session] ([SessionId], [SessionTime]) VALUES (2, CAST(N'11:00:00' AS Time))
INSERT [dbo].[Session] ([SessionId], [SessionTime]) VALUES (3, CAST(N'12:00:00' AS Time))
INSERT [dbo].[Session] ([SessionId], [SessionTime]) VALUES (4, CAST(N'13:30:00' AS Time))
INSERT [dbo].[Session] ([SessionId], [SessionTime]) VALUES (5, CAST(N'14:00:00' AS Time))
INSERT [dbo].[Session] ([SessionId], [SessionTime]) VALUES (6, CAST(N'15:00:00' AS Time))
INSERT [dbo].[Session] ([SessionId], [SessionTime]) VALUES (7, CAST(N'16:00:00' AS Time))
INSERT [dbo].[Session] ([SessionId], [SessionTime]) VALUES (8, CAST(N'17:00:00' AS Time))
INSERT [dbo].[Session] ([SessionId], [SessionTime]) VALUES (9, CAST(N'18:30:00' AS Time))
INSERT [dbo].[Session] ([SessionId], [SessionTime]) VALUES (10, CAST(N'19:00:00' AS Time))
INSERT [dbo].[Session] ([SessionId], [SessionTime]) VALUES (11, CAST(N'20:00:00' AS Time))
INSERT [dbo].[Session] ([SessionId], [SessionTime]) VALUES (12, CAST(N'21:00:00' AS Time))
INSERT [dbo].[Session] ([SessionId], [SessionTime]) VALUES (13, CAST(N'21:30:00' AS Time))
SET IDENTITY_INSERT [dbo].[Session] OFF
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Movie] FOREIGN KEY([ContinuationOf])
REFERENCES [dbo].[Movie] ([MovieId])
GO
ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [FK_Movie_Movie]
GO
ALTER TABLE [dbo].[Movie_Category]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Category_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Movie_Category] CHECK CONSTRAINT [FK_Movie_Category_Category]
GO
ALTER TABLE [dbo].[Movie_Category]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Category_Movie] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Movie] ([MovieId])
GO
ALTER TABLE [dbo].[Movie_Category] CHECK CONSTRAINT [FK_Movie_Category_Movie]
GO
ALTER TABLE [dbo].[Movie_Saloons]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Saloons_Movie] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movie] ([MovieId])
GO
ALTER TABLE [dbo].[Movie_Saloons] CHECK CONSTRAINT [FK_Movie_Saloons_Movie]
GO
ALTER TABLE [dbo].[Movie_Saloons]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Saloons_Saloons] FOREIGN KEY([SaloonsId])
REFERENCES [dbo].[Saloons] ([SaloonsId])
GO
ALTER TABLE [dbo].[Movie_Saloons] CHECK CONSTRAINT [FK_Movie_Saloons_Saloons]
GO
ALTER TABLE [dbo].[Movie_Session]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Session_Movie] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movie] ([MovieId])
GO
ALTER TABLE [dbo].[Movie_Session] CHECK CONSTRAINT [FK_Movie_Session_Movie]
GO
ALTER TABLE [dbo].[Movie_Session]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Session_Session] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Session] ([SessionId])
GO
ALTER TABLE [dbo].[Movie_Session] CHECK CONSTRAINT [FK_Movie_Session_Session]
GO
USE [master]
GO
ALTER DATABASE [Movie] SET  READ_WRITE 
GO
