CREATE TABLE [dbo].[trace]
(
[RowNumber] [int] NOT NULL IDENTITY(0, 1),
[EventClass] [int] NULL,
[TextData] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ApplicationName] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NTUserName] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LoginName] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CPU] [int] NULL,
[Reads] [bigint] NULL,
[Writes] [bigint] NULL,
[Duration] [bigint] NULL,
[ClientProcessID] [int] NULL,
[SPID] [int] NULL,
[StartTime] [datetime] NULL,
[EndTime] [datetime] NULL,
[BinaryData] [image] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[trace] ADD CONSTRAINT [PK__trace__24927208] PRIMARY KEY CLUSTERED  ([RowNumber]) ON [PRIMARY]
GO
