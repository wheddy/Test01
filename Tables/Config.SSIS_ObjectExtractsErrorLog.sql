CREATE TABLE [Config].[SSIS_ObjectExtractsErrorLog]
(
[ExtractErrorLogID] [int] NOT NULL IDENTITY(1, 1),
[ExtractID] [int] NOT NULL,
[SourceName] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SourceGUID] [uniqueidentifier] NOT NULL,
[ErrorCode] [int] NOT NULL,
[ErrorDescription] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETLControlID] [int] NOT NULL,
[InsertDateTime] [datetime] NOT NULL,
[UpdateDateTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Config].[SSIS_ObjectExtractsErrorLog] ADD CONSTRAINT [PK_Config.SSIS_ObjectExtractsErrorLog] PRIMARY KEY CLUSTERED  ([ExtractErrorLogID]) ON [PRIMARY]
GO
ALTER TABLE [Config].[SSIS_ObjectExtractsErrorLog] ADD CONSTRAINT [FK_Config_SSIS_ObjectExtractsErrorLog_ExtractID] FOREIGN KEY ([ExtractID]) REFERENCES [Config].[SSIS_ObjectExtracts] ([ExtractID])
GO
EXEC sp_addextendedproperty N'Database Schema', N'Config', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', NULL, NULL
GO
EXEC sp_addextendedproperty N'Display Name', N'SSIS_ObjectExtractsErrorLog', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', NULL, NULL
GO
EXEC sp_addextendedproperty N'Table Description', N'ChildTableName has lots of facts', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', NULL, NULL
GO
EXEC sp_addextendedproperty N'Table Name', N'SSIS_ObjectExtractsErrorLog', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', NULL, NULL
GO
EXEC sp_addextendedproperty N'Table Type', N'Child', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', NULL, NULL
GO
EXEC sp_addextendedproperty N'Used In Models', N'Request', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', NULL, NULL
GO
EXEC sp_addextendedproperty N'View Name', N'SSIS_ObjectExtractsErrorLogView', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', NULL, NULL
GO
EXEC sp_addextendedproperty N'Description', N'Task Error Code', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', 'COLUMN', N'ErrorCode'
GO
EXEC sp_addextendedproperty N'Display Name', N'Error Code', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', 'COLUMN', N'ErrorCode'
GO
EXEC sp_addextendedproperty N'Description', N'Task Error Code Description', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', 'COLUMN', N'ErrorDescription'
GO
EXEC sp_addextendedproperty N'Display Name', N'Error Description', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', 'COLUMN', N'ErrorDescription'
GO
EXEC sp_addextendedproperty N'Description', N'Audit key for this process', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', 'COLUMN', N'ETLControlID'
GO
EXEC sp_addextendedproperty N'Display Name', N'ETL Control Key', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', 'COLUMN', N'ETLControlID'
GO
EXEC sp_addextendedproperty N'Example Values', N'1, 2, 3', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', 'COLUMN', N'ETLControlID'
GO
EXEC sp_addextendedproperty N'Source System', N'ETL Process', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', 'COLUMN', N'ETLControlID'
GO
EXEC sp_addextendedproperty N'Description', N'primary surrogate key', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', 'COLUMN', N'ExtractErrorLogID'
GO
EXEC sp_addextendedproperty N'Display Name', N'Extract Error Log ID', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', 'COLUMN', N'ExtractErrorLogID'
GO
EXEC sp_addextendedproperty N'Description', N'Extract ID caused this error', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', 'COLUMN', N'ExtractID'
GO
EXEC sp_addextendedproperty N'Display Name', N'Extract ID', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', 'COLUMN', N'ExtractID'
GO
EXEC sp_addextendedproperty N'Example Values', N'1, 2, 3', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', 'COLUMN', N'ExtractID'
GO
EXEC sp_addextendedproperty N'FK To', N'SSIS_ObjectExtracts.ExtractID', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', 'COLUMN', N'ExtractID'
GO
EXEC sp_addextendedproperty N'Source System', N'ETL Process', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', 'COLUMN', N'ExtractID'
GO
EXEC sp_addextendedproperty N'Description', N'Insert time stamp', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Display Name', N'Insert Date Time', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Example Values', N'1, 2, 3', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Source System', N'ETL Process', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Description', N'Task Source GUID', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', 'COLUMN', N'SourceGUID'
GO
EXEC sp_addextendedproperty N'Display Name', N'Source GUID', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', 'COLUMN', N'SourceGUID'
GO
EXEC sp_addextendedproperty N'Description', N'Task Source Name', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', 'COLUMN', N'SourceName'
GO
EXEC sp_addextendedproperty N'Display Name', N'Source Name', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', 'COLUMN', N'SourceName'
GO
EXEC sp_addextendedproperty N'Description', N'Update time stamp', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Display Name', N'Update Date Time', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtractsErrorLog', 'COLUMN', N'UpdateDateTime'
GO
