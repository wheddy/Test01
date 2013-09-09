CREATE TABLE [dbo].[tTraceArchiveApplicationName]
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
[InsertDateTime] [datetime] NOT NULL CONSTRAINT [DF_tTraceArchiveApplicationName_InsertDateTime] DEFAULT (getdate()),
[UpdateDateTime] [datetime] NOT NULL CONSTRAINT [DF_tTraceArchiveApplicationName_UpdateDateTime] DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tTraceArchiveApplicationName] ADD CONSTRAINT [PK_tTraceArchiveApplicationName_RowID] PRIMARY KEY NONCLUSTERED  ([RowID]) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_tTraceArchiveApplicationName_ApplicationName] ON [dbo].[tTraceArchiveApplicationName] ([ApplicationName] DESC) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceArchiveApplicationName_DatabaseName] ON [dbo].[tTraceArchiveApplicationName] ([DatabaseName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceArchiveApplicationName_HostName] ON [dbo].[tTraceArchiveApplicationName] ([HostName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceArchiveApplicationName_InsertDateTime] ON [dbo].[tTraceArchiveApplicationName] ([InsertDateTime]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceArchiveApplicationName_LoginName] ON [dbo].[tTraceArchiveApplicationName] ([LoginName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceArchiveApplicationName_ObjectName] ON [dbo].[tTraceArchiveApplicationName] ([ObjectName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceArchiveApplicationName_ServerName] ON [dbo].[tTraceArchiveApplicationName] ([ServerName]) ON [PRIMARY]
GO
