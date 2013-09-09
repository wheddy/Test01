CREATE TABLE [Config].[SSIS_ObjectExtracts]
(
[ExtractID] [int] NOT NULL IDENTITY(1, 1),
[StageID] [int] NOT NULL,
[ETLControlID] [int] NOT NULL,
[ExtractDescription] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DataLoadWindow] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DataTableName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LoadType] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SourceCount] [int] NULL,
[InsertCount] [int] NULL,
[UpdateCount] [int] NULL,
[StartDateTime] [datetime] NOT NULL,
[EndDateTime] [datetime] NULL,
[Status] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MachineName] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UserName] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[InsertDateTime] [datetime] NOT NULL,
[UpdateDateTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Config].[SSIS_ObjectExtracts] ADD CONSTRAINT [PK_Config.SSIS_ObjectExtracts] PRIMARY KEY CLUSTERED  ([ExtractID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SSIS_ObjectExtracts] ON [Config].[SSIS_ObjectExtracts] ([ETLControlID]) ON [PRIMARY]
GO
ALTER TABLE [Config].[SSIS_ObjectExtracts] ADD CONSTRAINT [FK_Config_SSIS_ObjectExtracts_StageID] FOREIGN KEY ([StageID]) REFERENCES [Config].[SSIS_ObjectStages] ([StageID])
GO
EXEC sp_addextendedproperty N'Database Schema', N'Config', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', NULL, NULL
GO
EXEC sp_addextendedproperty N'Display Name', N'SSIS_ObjectExtracts', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', NULL, NULL
GO
EXEC sp_addextendedproperty N'Table Description', N'Object Setting tables', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', NULL, NULL
GO
EXEC sp_addextendedproperty N'Table Name', N'SSIS_ObjectExtracts', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', NULL, NULL
GO
EXEC sp_addextendedproperty N'Table Type', N'Child', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', NULL, NULL
GO
EXEC sp_addextendedproperty N'Used In Models', N'Configurations', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', NULL, NULL
GO
EXEC sp_addextendedproperty N'View Name', N'SSIS_ObjectExtractsView', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', NULL, NULL
GO
EXEC sp_addextendedproperty N'Comments', N'FK to Parent table', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'ETLControlID'
GO
EXEC sp_addextendedproperty N'Description', N'Foreign key to SSIS ETL Control table', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'ETLControlID'
GO
EXEC sp_addextendedproperty N'Display Name', N'ETL Control ID', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'ETLControlID'
GO
EXEC sp_addextendedproperty N'FK To', N'SSIS_ETLControl.ETLControlID', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'ETLControlID'
GO
EXEC sp_addextendedproperty N'Source Datatype', N'int', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'ETLControlID'
GO
EXEC sp_addextendedproperty N'Source Field Name', N'ETLControlID', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'ETLControlID'
GO
EXEC sp_addextendedproperty N'Source Schema', N'DBA', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'ETLControlID'
GO
EXEC sp_addextendedproperty N'Source Table', N'SSIS_ETLControl', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'ETLControlID'
GO
EXEC sp_addextendedproperty N'Description', N'Primary key', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'ExtractID'
GO
EXEC sp_addextendedproperty N'Display Name', N'Extract ID', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'ExtractID'
GO
EXEC sp_addextendedproperty N'Example Values', N'1, 2, 3…', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'ExtractID'
GO
EXEC sp_addextendedproperty N'Source System', N'Derived in ETL', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'ExtractID'
GO
EXEC sp_addextendedproperty N'Description', N'Insert Row Count', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'InsertCount'
GO
EXEC sp_addextendedproperty N'Display Name', N'Insert Row Count', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'InsertCount'
GO
EXEC sp_addextendedproperty N'Example Values', N'1200,1300', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'InsertCount'
GO
EXEC sp_addextendedproperty N'Comments', N'source insert time stamp', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Description', N'Row insertion time stamp', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Display Name', N'Row Insert Date and Time', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Example Values', N'2011-01-01 00:00:00.000', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Source Datatype', N'datetime', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Source Field Name', N'InsertDateTime', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Source System', N'Derived in ETL', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Source Table', N'tMortgageRefinancePurpose', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Description', N'Source Row Counts', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'SourceCount'
GO
EXEC sp_addextendedproperty N'Display Name', N'Source Row Counts', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'SourceCount'
GO
EXEC sp_addextendedproperty N'Example Values', N'1200,1300', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'SourceCount'
GO
EXEC sp_addextendedproperty N'Description', N'enable / disable flag', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'Display Name', N'Enabled Flag', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'Example Values', N'Y, N', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'Description', N'Update Row Count', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'UpdateCount'
GO
EXEC sp_addextendedproperty N'Display Name', N'Update Row Count', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'UpdateCount'
GO
EXEC sp_addextendedproperty N'Example Values', N'1200,1300', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'UpdateCount'
GO
EXEC sp_addextendedproperty N'Comments', N'source update time stamp', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Description', N'Row update time stamp', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Display Name', N'Row update date and time', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Example Values', N'2011-01-01 00:00:00.000', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Source Datatype', N'datetime', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Source Field Name', N'UpdateDateTime', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Source System', N'Derived in ETL', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Source Table', N'tMortgageRefinancePurpose', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectExtracts', 'COLUMN', N'UpdateDateTime'
GO
