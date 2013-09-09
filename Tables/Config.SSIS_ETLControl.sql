CREATE TABLE [Config].[SSIS_ETLControl]
(
[ETLControlID] [int] NOT NULL,
[WindowDateFrom] [datetime] NOT NULL,
[WindowDateTo] [datetime] NOT NULL,
[InsertDateTime] [datetime] NOT NULL,
[UpdateDateTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Config].[SSIS_ETLControl] ADD CONSTRAINT [PK_Config.SSIS_ETLControl] PRIMARY KEY CLUSTERED  ([ETLControlID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'Database Schema', N'Config', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', NULL, NULL
GO
EXEC sp_addextendedproperty N'Display Name', N'SSIS_ETLControl', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', NULL, NULL
GO
EXEC sp_addextendedproperty N'Table Description', N'Object Setting tables', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', NULL, NULL
GO
EXEC sp_addextendedproperty N'Table Name', N'SSIS_ETLControl', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', NULL, NULL
GO
EXEC sp_addextendedproperty N'Table Type', N'Child', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', NULL, NULL
GO
EXEC sp_addextendedproperty N'Used In Models', N'Configurations', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', NULL, NULL
GO
EXEC sp_addextendedproperty N'View Name', N'SSIS_ETLControlView', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', NULL, NULL
GO
EXEC sp_addextendedproperty N'Description', N'Primary key', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', 'COLUMN', N'ETLControlID'
GO
EXEC sp_addextendedproperty N'Display Name', N'ETL Control ID', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', 'COLUMN', N'ETLControlID'
GO
EXEC sp_addextendedproperty N'Example Values', N'1, 2, 3…', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', 'COLUMN', N'ETLControlID'
GO
EXEC sp_addextendedproperty N'Source System', N'Derived in ETL', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', 'COLUMN', N'ETLControlID'
GO
EXEC sp_addextendedproperty N'Comments', N'source insert time stamp', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Description', N'Row insertion time stamp', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Display Name', N'Row Insert Date and Time', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Example Values', N'2011-01-01 00:00:00.000', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Source Datatype', N'datetime', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Source Field Name', N'InsertDateTime', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Source System', N'Derived in ETL', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Source Table', N'tMortgageRefinancePurpose', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Comments', N'source update time stamp', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Description', N'Row update time stamp', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Display Name', N'Row update date and time', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Example Values', N'2011-01-01 00:00:00.000', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Source Datatype', N'datetime', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Source Field Name', N'UpdateDateTime', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Source System', N'Derived in ETL', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Source Table', N'tMortgageRefinancePurpose', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ETLControl', 'COLUMN', N'UpdateDateTime'
GO
