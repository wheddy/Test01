CREATE TABLE [temp].[VisualSite]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[DMA] [int] NULL,
[VisitDate] [datetime] NULL,
[ESource] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RepeatVisitor] [int] NULL
) ON [PRIMARY]
GO
