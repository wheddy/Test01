CREATE TABLE [dbo].[tTraceApplicationName]
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
[InsertDateTime] [datetime] NOT NULL CONSTRAINT [DF_tTraceApplicationName_InsertDateTime] DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tTraceApplicationName] ADD CONSTRAINT [PK_tTraceApplicationName_RowID] PRIMARY KEY NONCLUSTERED  ([RowID]) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_tTraceApplicationName_ApplicationName] ON [dbo].[tTraceApplicationName] ([ApplicationName] DESC) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceApplicationName_DatabaseName] ON [dbo].[tTraceApplicationName] ([DatabaseName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceApplicationName_HostName] ON [dbo].[tTraceApplicationName] ([HostName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceApplicationName_InsertDateTime] ON [dbo].[tTraceApplicationName] ([InsertDateTime]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceApplicationName_LoginName] ON [dbo].[tTraceApplicationName] ([LoginName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceApplicationName_ObjectName] ON [dbo].[tTraceApplicationName] ([ObjectName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceApplicationName_ServerName] ON [dbo].[tTraceApplicationName] ([ServerName]) ON [PRIMARY]
GO
