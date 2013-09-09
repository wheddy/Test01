CREATE TABLE [Config].[SSIS_PackageErrorLog]
(
[PackageErrorLogID] [int] NOT NULL IDENTITY(1, 1),
[PackageLogID] [int] NOT NULL,
[SourceName] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SourceGUID] [uniqueidentifier] NOT NULL,
[ErrorCode] [int] NULL,
[ErrorDescription] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LogDateTime] [datetime] NOT NULL,
[InsertDateTime] [datetime] NULL,
[UpdateDateTime] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Config].[SSIS_PackageErrorLog] ADD CONSTRAINT [PK_SSIS_PackageErrorLog] PRIMARY KEY CLUSTERED  ([PackageErrorLogID]) ON [PRIMARY]
GO
ALTER TABLE [Config].[SSIS_PackageErrorLog] ADD CONSTRAINT [FK_SSIS_PackageErrorLog_PackageLogID_SSIS_PackageLog] FOREIGN KEY ([PackageLogID]) REFERENCES [Config].[SSIS_PackageLog] ([PackageLogID]) ON DELETE CASCADE
GO
