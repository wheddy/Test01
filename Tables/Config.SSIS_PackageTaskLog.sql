CREATE TABLE [Config].[SSIS_PackageTaskLog]
(
[PackageTaskLogID] [int] NOT NULL IDENTITY(1, 1),
[PackageLogID] [int] NOT NULL,
[SourceName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SourceGUID] [uniqueidentifier] NOT NULL,
[StartDateTime] [datetime] NOT NULL,
[EndDateTime] [datetime] NULL,
[InsertDateTime] [datetime] NULL,
[UpdateDateTime] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Config].[SSIS_PackageTaskLog] ADD CONSTRAINT [PK_SSIS_PackageTaskLog] PRIMARY KEY CLUSTERED  ([PackageTaskLogID]) ON [PRIMARY]
GO
ALTER TABLE [Config].[SSIS_PackageTaskLog] ADD CONSTRAINT [FK_SSIS_PackageTaskLog_PackageLogID_SSIS_PackageLog] FOREIGN KEY ([PackageLogID]) REFERENCES [Config].[SSIS_PackageLog] ([PackageLogID]) ON DELETE CASCADE
GO
