SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Depart]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Depart](
	[departID] [int] IDENTITY(1,1) NOT NULL,
	[departName] [varchar](100) NULL,
 CONSTRAINT [PK_Depart] PRIMARY KEY CLUSTERED 
(
	[departID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Users](
	[adminName] [varchar](20) NOT NULL,
	[adminPwd] [varchar](20) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[adminName] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Teacher]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Teacher](
	[teaID] [varchar](20) NOT NULL,
	[teaPwd] [varchar](20) NULL,
	[teaName] [varchar](50) NOT NULL,
	[teaDepart] [int] NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[teaID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[Student](
	[stuID] [varchar](20) NOT NULL,
	[stuPwd] [varchar](20) NULL,
	[stuName] [varchar](10) NOT NULL,
	[stuDepart] [int] NULL,
	[stuGrade] [int] NULL,
	[stuClass] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[stuID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cource]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[Cource](
	[courceID] [varchar](20) NOT NULL,
	[teaID] [varchar](20) NOT NULL,
	[courceName] [varchar](100) NOT NULL,
	[courceTime] [varchar](20) NULL,
	[courceAddress] [varchar](50) NULL,
	[courceInfo] [text] NULL,
 CONSTRAINT [PK_Cource_1] PRIMARY KEY CLUSTERED 
(
	[courceID] ASC,
	[teaID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Elect]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[Elect](
	[stuID] [varchar](20) NOT NULL,
	[courceID] [varchar](20) NOT NULL,
	[teaID] [varchar](20) NOT NULL,
	[Score] [int] NULL,
 CONSTRAINT [PK_Elect] PRIMARY KEY CLUSTERED 
(
	[stuID] ASC,
	[courceID] ASC,
	[teaID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Teacher_Depart]') AND parent_object_id = OBJECT_ID(N'[dbo].[Teacher]'))
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Depart] FOREIGN KEY([teaDepart])
REFERENCES [dbo].[Depart] ([departID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student_Depart]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student]'))
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Depart] FOREIGN KEY([stuDepart])
REFERENCES [dbo].[Depart] ([departID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cource_Teacher]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cource]'))
ALTER TABLE [dbo].[Cource]  WITH CHECK ADD  CONSTRAINT [FK_Cource_Teacher] FOREIGN KEY([teaID])
REFERENCES [dbo].[Teacher] ([teaID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Elect_Cource]') AND parent_object_id = OBJECT_ID(N'[dbo].[Elect]'))
ALTER TABLE [dbo].[Elect]  WITH CHECK ADD  CONSTRAINT [FK_Elect_Cource] FOREIGN KEY([courceID], [teaID])
REFERENCES [dbo].[Cource] ([courceID], [teaID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Elect_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[Elect]'))
ALTER TABLE [dbo].[Elect]  WITH CHECK ADD  CONSTRAINT [FK_Elect_Student] FOREIGN KEY([stuID])
REFERENCES [dbo].[Student] ([stuID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Elect_Teacher]') AND parent_object_id = OBJECT_ID(N'[dbo].[Elect]'))
ALTER TABLE [dbo].[Elect]  WITH CHECK ADD  CONSTRAINT [FK_Elect_Teacher] FOREIGN KEY([teaID])
REFERENCES [dbo].[Teacher] ([teaID])
