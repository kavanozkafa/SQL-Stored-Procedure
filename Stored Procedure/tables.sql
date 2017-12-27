USE [db_TheatreManager]
GO

/****** Object:  Table [dbo].[Company]    Script Date: 5.12.2016 16:38:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Company](
	[CName] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO









**********************************
USE [db_TheatreManager]
GO

/****** Object:  Table [dbo].[Production]    Script Date: 5.12.2016 16:39:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Production](
	[PName] [nvarchar](50) NOT NULL,
	[PDirector] [nvarchar](50) NOT NULL,
	[CName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Production] PRIMARY KEY CLUSTERED 
(
	[PName] ASC,
	[PDirector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Production]  WITH CHECK ADD  CONSTRAINT [FK_Production_Company] FOREIGN KEY([CName])
REFERENCES [dbo].[Company] ([CName])
GO

ALTER TABLE [dbo].[Production] CHECK CONSTRAINT [FK_Production_Company]
GO


*******************************
USE [db_TheatreManager]
GO

/****** Object:  Table [dbo].[Diary]    Script Date: 5.12.2016 16:39:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Diary](
	[Date] [datetime] NOT NULL,
	[Seats] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[PName] [nvarchar](50) NOT NULL,
	[PDirector] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Diary] PRIMARY KEY CLUSTERED 
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Diary]  WITH CHECK ADD  CONSTRAINT [FK_Diary_Production] FOREIGN KEY([PName], [PDirector])
REFERENCES [dbo].[Production] ([PName], [PDirector])
GO

ALTER TABLE [dbo].[Diary] CHECK CONSTRAINT [FK_Diary_Production]
GO

*****************************
