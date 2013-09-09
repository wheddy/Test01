CREATE TABLE [dbo].[tTraceCPU]
(
[RowID] [bigint] NOT NULL IDENTITY(1, 1),
[TextData] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DatabaseID] [int] NULL,
[TransactionID] [bigint] NULL,
[NTUserName] [nvarchar] (448) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NTDomainName] [nvarchar] (448) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HostName] [nvarchar] (448) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ClientProcessID] [nvarchar] (448) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ApplicationName] [nvarchar] (448) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LoginName] [nvarchar] (448) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SPID] [int] NULL,
[Duration] [bigint] NULL,
[StartTime] [datetime] NULL,
[EndTime] [datetime] NULL,
[Reads] [bigint] NULL,
[Writes] [bigint] NULL,
[CPU] [int] NULL,
[EventSubClass] [int] NULL,
[ObjectID] [int] NULL,
[IndexID] [int] NULL,
[ServerName] [nvarchar] (448) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EventClass] [int] NULL,
[ObjectType] [int] NULL,
[NestLevel] [int] NULL,
[State] [int] NULL,
[Error] [int] NULL,
[ObjectName] [nvarchar] (448) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DatabaseName] [nvarchar] (448) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DBUserName] [nvarchar] (448) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InsertDateTime] [datetime] NOT NULL CONSTRAINT [DF_tTraceCPU_InsertDateTime] DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tTraceCPU] ADD CONSTRAINT [PK_tTraceCPU_RowID] PRIMARY KEY NONCLUSTERED  ([RowID]) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_tTraceCPU_CPU] ON [dbo].[tTraceCPU] ([CPU] DESC) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceCPU_DatabaseName] ON [dbo].[tTraceCPU] ([DatabaseName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceCPU_HostName] ON [dbo].[tTraceCPU] ([HostName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceCPU_InsertDateTime] ON [dbo].[tTraceCPU] ([InsertDateTime]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceCPU_LoginName] ON [dbo].[tTraceCPU] ([LoginName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceCPU_ObjectName] ON [dbo].[tTraceCPU] ([ObjectName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceCPU_ServerName] ON [dbo].[tTraceCPU] ([ServerName]) ON [PRIMARY]
GO
