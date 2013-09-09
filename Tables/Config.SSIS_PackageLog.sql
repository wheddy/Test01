CREATE TABLE [Config].[SSIS_PackageLog]
(
[PackageLogID] [int] NOT NULL IDENTITY(1, 1),
[ETLControlID] [int] NOT NULL,
[PackageVersionID] [int] NOT NULL,
[ExecutionInstanceID] [uniqueidentifier] NOT NULL,
[MachineName] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UserName] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[StartDateTime] [datetime] NOT NULL,
[EndDateTime] [datetime] NULL,
[SourceRowCount] [int] NULL,
[InsertRowCount] [int] NULL,
[UpdateRowCount] [int] NULL,
[DataTableName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DataLoadWindow] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Status] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[InsertDateTime] [datetime] NULL,
[UpdateDateTime] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Config].[SSIS_PackageLog] ADD CONSTRAINT [PK_SSIS_PackageLog] PRIMARY KEY CLUSTERED  ([PackageLogID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SSIS_PackageLog] ON [Config].[SSIS_PackageLog] ([ETLControlID]) ON [PRIMARY]
GO
ALTER TABLE [Config].[SSIS_PackageLog] ADD CONSTRAINT [FK_SSIS_PackageLog_PackageVersioID_SSIS_PackageVersion] FOREIGN KEY ([PackageVersionID]) REFERENCES [Config].[SSIS_PackageVersion] ([PackageVersionID]) ON DELETE CASCADE
GO
